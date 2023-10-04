tableextension 50003 "HF CERP Shop_Work Order" extends "CERP Shop/Work Order"
{
    // version AI13.00.02,HL

    fields
    {
        modify("Project Manager Code")
        {
            Description = 'CERP-607';
        }

        //Unsupported feature: Deletion (FieldCollection) on ""Contract High Focus Job"(Field 37004536)".

        //Unsupported feature: Deletion (FieldCollection) on ""Sch. Service Start Date/Time"(Field 37013612)".

        //Unsupported feature: Deletion (FieldCollection) on ""Sch. Service End Date/Time"(Field 37013613)".

        //Unsupported feature: Deletion (FieldCollection) on ""Total Duration (Hours)"(Field 37013614)".

        //Unsupported feature: Deletion (FieldCollection) on ""Requested Service Date/Time"(Field 37013615)".

        //Unsupported feature: Deletion (FieldCollection) on ""Primary Resource"(Field 37013616)".

        //Unsupported feature: Deletion (FieldCollection) on ""Original Capacity"(Field 37013617)".

        //Unsupported feature: Deletion (FieldCollection) on ""Original Duration (Hours)"(Field 37013618)".

        //Unsupported feature: Deletion (FieldCollection) on ""Next Service Start Date/Time"(Field 37013619)".

        //Unsupported feature: Deletion (FieldCollection) on ""Next Service End Date/Time"(Field 37013620)".

        //Unsupported feature: Deletion (FieldCollection) on ""No.of Resource Allocations"(Field 37013621)".

        //Unsupported feature: Deletion (FieldCollection) on ""Remaining Capacity"(Field 37013622)".

        field(50010; "HF Total Actual Time Entry Qty"; Decimal)
        {
            CalcFormula = Sum("CERP Posted Time Entry".Quantity WHERE("Document Type" = CONST("Shop Order"),
                                                                  "Document No." = FIELD("No.")));
            Caption = 'HF Total Actual Time Entry Qty';
            Description = 'CC-633';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    procedure GetRemainingPlannedShopTime(): Decimal
    var
        PostedComponent: Record "CERP Posted Component";
        PostedShopOrderLine: Record "CERP Posted Shop Order Line";
        TotalPosted: Decimal;
    begin
        //HL JPU CC-633 - Remaining Planned Shop Time = (Total Planned Resource Capacity - Posted Total Planned Resource Capacity)

        PostedComponent.SETCURRENTKEY("Unposted Shop/Work Order Type", "Unposted Shop/Work Order No.");
        PostedComponent.SETRANGE("Unposted Shop/Work Order Type", PostedComponent."Unposted Shop/Work Order Type"::Shop);
        PostedComponent.SETRANGE("Unposted Shop/Work Order No.", "No.");
        PostedComponent.SETRANGE(Type, PostedComponent.Type::Resource);
        PostedComponent.SETRANGE(Blocked, FALSE);
        PostedComponent.SETRANGE("Parent Component Line No.", 0);
        IF PostedComponent.FINDSET THEN
            REPEAT
                IF PostedShopOrderLine.GET(PostedComponent."Document No.", PostedComponent."Line No.") THEN;
                TotalPosted += PostedComponent.GetPlannedResourceCapacity * PostedShopOrderLine.Quantity;
            UNTIL PostedComponent.NEXT = 0;

        EXIT(GetTotalPlannedResCap - TotalPosted);
    end;

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CALCFIELDS("Qty. Remaining");
    IF "Qty. Remaining" <> 0
      THEN
        BEGIN
          LineQtyFinishedCheck.SETRANGE("Order Type",Type);
          LineQtyFinishedCheck.SETRANGE("Order No.","No.");
          LineQtyFinishedCheck.SETFILTER("Qty. Finished",'<>0');
          IF NOT LineQtyFinishedCheck.ISEMPTY
            THEN ERROR('Cannot delete %1 %2 because it is partially posted.',Type,"No.");
        END;

    // Angelo CERP-1565 Begin
    ShopOrderLines.SETRANGE("Order Type",Type);
    ShopOrderLines.SETRANGE("Order No.","No.");
    ShopOrderLines.SETFILTER("Component Parent Line No.", '<>%1',0);
    WHILE (ShopOrderLines.FINDFIRST) DO
      BEGIN
        ShopOrderLines.SetDeletingHeader(TRUE);
        ShopOrderLines.DELETE(TRUE);
      END;
    CLEAR(ShopOrderLines);
    // Angelo CERP-1565 end

    ShopOrderLines.SETRANGE("Order Type",Type);
    ShopOrderLines.SETRANGE("Order No.","No.");
    //ShopOrderLines.DELETEALL(TRUE);
    WHILE (ShopOrderLines.FINDFIRST) DO
      BEGIN
        ShopOrderLines.SetDeletingHeader(TRUE);
        ShopOrderLines.DELETE(TRUE);
      END;

    GlobalComp.SETRANGE("Shop/Work Order Type",Type);
    GlobalComp.SETRANGE("Shop/Work Order No.","No.");
    GlobalComp.SETRANGE("Shop/Work Order Line No.",0);
    WHILE GlobalComp.FINDFIRST DO
      BEGIN
        GlobalComp.SetDeletingHeader(TRUE);
        GlobalComp.DELETE(TRUE);
      END;

    // Angelo Begin
    ShopOrderComment.SETRANGE("Order Type",Type);
    ShopOrderComment.SETRANGE("Order No.","No.");
    ShopOrderComment.DELETEALL(TRUE);
    // Angelo end

    IF NOT PickWorksheetLine.ISEMPTY //AI13.00.02 Jim 6/11/19
      THEN PickWorksheetMgmt.PostLines(DATABASE::"Shop/Work Order Line",Type,"No.",0D,0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
    #24..49
    */
    //end;

    //Unsupported feature: Code Modification on "CreateShopOrderFromSO(PROCEDURE 1000000000)".

    //procedure CreateShopOrderFromSO();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    //AI6.01 Teming
    IF Cust.GET(SalesOrder."Sell-to Customer No.") AND (Cust.Blocked = Cust.Blocked::All) THEN
      ERROR(Text37012900,SalesOrder."Sell-to Customer No.");
    #4..40
                ShopOrder."Contract No." := SalesOrder."Contract No.";
                ShopOrder."Change Order No." := SalesLine."Change Order No.";
                ShopOrder."Capacity Group Code" := SalesLine."Capacity Group Code";
                //ShopOrder."Project Manager Code" := SalesOrder."Project Manager";  //AI13.00.04 02/21 Teming cERP-1533
                ShopOrder.INSERT(TRUE);

                IF FirstShopOrderNo = ''
    #48..51
                IF (SalesLine."Supply From Code" <> '')
                  THEN ShopOrder.VALIDATE("Location Code",SalesLine."Supply From Code")
                  ELSE ShopOrder.VALIDATE("Location Code",SalesLine."Location Code");

                //AI13.00.06 05/21 Teming cERP-1712
                OnBeforeModifyShopOrder(ShopOrder,SalesOrder);

                ShopOrder.MODIFY;
              END;
            CreateShopOrderLineFromSL(OrderType,ShopOrder."No.",SalesLine."Document No.",SalesLine."Line No.",TRUE);
    #62..67
    //ShopOrderLines.SETRANGE("Order No.",ShopOrder."No.");
    //IF NOT ShopOrderLines.FINDFIRST
    //  THEN ERROR('There is nothing to create.');
    IF (FirstShopOrderNo = '') AND (NOT aAutoCreateShopWorkOrder) THEN             //AI13.00.03 04/20 Teming QABC13-295 added 2nd condition
      ERROR('There is nothing to create.');

    IF (FirstShopOrderNo = LastShopOrderNo)
      THEN EXIT(FirstShopOrderNo)
      ELSE EXIT(FirstShopOrderNo + '..' + LastShopOrderNo);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..43
    #45..54
    #59..70
    IF (FirstShopOrderNo = '')
      THEN ERROR('There is nothing to create.');
    #73..76
    */
    //end;

    //Unsupported feature: Code Modification on "CreateShopOrderLineFromSL(PROCEDURE 1000000001)".

    //procedure CreateShopOrderLineFromSL();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesLine.GET(SalesLine."Document Type"::Order,SalesOrderNo,SalesOrderLineNo);
    IF NOT CanCreateShopWorkLineFromSL(SalesLine)
      THEN EXIT;
    #4..6

    //SalesLine."Shop Order No." := ShopOrderNo;
    //SalesLine.MODIFY;
    cERP.TestServiceableItemBlocked(SalesLine."Serviceable Item No.");             //AI6.01

    ShopOrderLines.INIT;
    ShopOrderLines."Order Type" := OrderType;
    #14..92
    //AI13.00 Teming 04/18 cERP-391
    IF SalesLine."Schedule in Dime" THEN
      BEGIN
        ShopOrderLines."Total Duration (Hours)" := SalesLine.Quantity * SalesLine."Total Unit Capacity";     //AI13.00.04 9/20 Teming cERP-1346
        IF (SalesLine."Start/Order By Date" = 0D) OR (SalesLine."Total Unit Capacity" = 0) THEN
          ERROR(Text37013610)
        ELSE
    #100..118
                                        ShopOrderLines."Order No.",ShopOrderLines."Line No.",0);

    EXIT(ShopOrderLines."Line No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9
    cERP.TestServiceableItemBlocked(SalesLine."Serviceable Item No."); //AI6.01
    #11..95
    #97..121
    */
    //end;

    //Unsupported feature: Code Modification on "CreateShopOrderLineFromSch(PROCEDURE 1102621001)".

    //procedure CreateShopOrderLineFromSch();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    MaterialList.GET(ShopSchLine."Contract No.",ShopSchLine."Change Order No.",ShopSchLine."Material Entry No.");
    IF ShopSchLine.Quantity = 0
      THEN EXIT;

    ShopOrderLines.INIT;
    ShopOrderLines."Order Type" := OrderType;
    ShopOrderLines."Order No." := OrderNo;
    ShopOrderLines.SetNextLineNo;
    ShopOrderLines.VALIDATE("Item No.",ShopSchLine."Item No.");
    ShopOrderLines.Description := ShopSchLine.Description;
    ShopOrderLines."Description 2" := ShopSchLine."Description 2";
    ShopOrderLines."Submittal ID" := ShopSchLine."Submittal ID";
    ShopOrderLines."Submittal Description" := ShopSchLine."Submittal Description";
    IF SchEntry."Line No." = 0
      THEN ShopOrderLines.VALIDATE(Quantity,ShopSchLine.Quantity)
      ELSE ShopOrderLines.VALIDATE(Quantity,SchEntry.Quantity);
    ShopOrderLines."Contract No." := ShopSchLine."Contract No.";
    ShopOrderLines."Change Order No." := ShopSchLine."Change Order No.";
    ShopOrderLines."Material Entry No." := ShopSchLine."Material Entry No.";
    ShopOrderLines."Mat. Component Line No." := ShopSchLine."Mat. Component Line No.";
    IF Contract.GET(ShopSchLine."Contract No.",ShopSchLine."Change Order No.")
      THEN
        BEGIN
          ShopOrderLines."Contract Description" := Contract.Description;
          ShopOrderLines."Sell-to Customer Name" := Contract.Name;
        END;
    ShopOrderLines."Item Category Code" := ShopSchLine."Item Category Code";
    ShopOrderLines."Product Group Code" := ShopSchLine."Product Group Code";
    ShopOrderLines."Location Code" := ShopSchLine."Location Code";
    ShopOrderLines."Transfer To Code" := ShopSchLine."Transfer To Code";
    ShopOrderLines."Variant Code" := ShopSchLine."Variant Code";
    ShopOrderLines.VALIDATE("Lead Time",ShopSchLine."Lead Time");
    IF (ShopSchLine."Due Date" <> 0D)
      THEN ShopOrderLines.VALIDATE("Due Date",ShopSchLine."Due Date");
    IF SchEntry."Line No." = 0
      THEN
        BEGIN
          IF (ShopSchLine."Start By Date" <> 0D)
            THEN ShopOrderLines.VALIDATE("Start By Date",ShopSchLine."Start By Date");
        END
      ELSE
        ShopOrderLines.VALIDATE("Start By Date",SchEntry.Date);
    //ShopOrderLines.VALIDATE("Start Time",ShopSchLine."Start Time");
    //ShopOrderLines.VALIDATE("End Time",ShopSchLine."End Time");
    ShopOrderLines."Order Group No." := ShopSchLine."Order Group No.";
    ShopOrderLines."Release No." := ShopSchLine."Release No.";
    ShopOrderLines."Component Doc. Type" := OrderType + 2;
    ShopOrderLines."Component Doc. No." := OrderNo;
    ShopOrderLines."Component Line No." := ShopOrderLines."Line No.";
    IF Customer.GET(Contract."Sell-to Customer No.")
      THEN ShopOrderLines."Gen. Bus. Posting Group" := Customer."Gen. Bus. Posting Group";
    ShopOrderLines."Configurator Setup No." := ShopSchLine."Configurator Setup No.";
    ShopOrderLines."Work Order Type" := ShopSchLine."Work Order Type";
    ShopOrderLines."Associated Document Type" := ShopSchLine."Associated Document Type";
    ShopOrderLines."Associated Document No." := ShopSchLine."Associated Document No.";
    ShopOrderLines."Associated Change Order No." := ShopSchLine."Associated Change Order No.";
    ShopOrderLines."Associated Contract Variant" := ShopSchLine."Associated Contract Variant";
    ShopOrderLines."Associated Line No." := ShopSchLine."Associated Line No.";
    ShopOrderLines."Associated Comp. Line No." := ShopSchLine."Associated Comp. Line No.";
    ShopOrderLines."Salesperson Code" := ShopSchLine."Salesperson Code";
    ShopOrderLines."Project Manager Code" := ShopSchLine."Project Manager Code";
    ShopOrderLines."Serviceable Item No." := ShopSchLine."Serviceable Item No.";
    ShopOrderLines."Requested Service Date/Time" := ShopSchLine."Requested Service Date/Time";
    ShopOrderLines."Sch. Service Start Date/Time" := ShopSchLine."Sch. Service Start Date/Time";
    ShopOrderLines."Service Duration" := ShopSchLine."Service Duration";
    ShopOrderLines."Sch. Service End Date/Time" := ShopSchLine."Sch. Service End Date/Time";
    ShopOrderLines."Capacity Group Code" := ShopSchLine."Capacity Group Code";

    //AI13.00 Teming 04/18 cERP-391
    ShopOrderLines."Schedule in Dime" := ShopSchLine."Schedule in Dime";
    ShopOrderLines."Capacity Group Unit of Measure" := ShopSchLine."Capacity Group Unit of Measure";

    //ShopOrderLines.VALIDATE("Unit Capacity",SalesLine."Total Unit Capacity");
    //AI13.00 Teming 04/18 cERP-391
    ShopOrderLines.VALIDATE("Requested Service Start Time",ShopSchLine."Requested Service Start Time");
    ShopOrderLines."Orig. Start By Date" := ShopSchLine."Orig. Start By Date";

    ShopOrderLines.VALIDATE("Unit Capacity",ShopSchLine."Unit Capacity");
    //ShopOrderLines."Work Center Sequence No." := ShopSchLine."Work Center Sequence No.";
    //ShopOrderLines."Delivery Route No." := ShopSchLine."Delivery Route No.";
    ShopOrderLines."Dimension Set ID" := MaterialList."Dimension Set ID";
    ShopOrderLines.DefaultStorageLocation;

    OnBeforeInsertShopOrderLine(ShopOrderLines, MaterialList); //AI13.00.06 CERP-1927 JPU

    ShopOrderLines.INSERT(TRUE);

    //AI13.00.04 10/20 Teming cERP-1346
    IF ShopOrderLines."Schedule in Dime" THEN
      BEGIN
        ShopOrderLines."Total Duration (Hours)" := ShopOrderLines.Quantity * ShopOrderLines."Unit Capacity";
        IF (ShopOrderLines."Start By Date" = 0D) OR (ShopOrderLines."Total Duration (Hours)" = 0) THEN
          ERROR(Text37013610)
        ELSE
          ShopOrderLines.MODIFY(TRUE);
      END;

    IF (ShopSchLine."Capacity Group Code" <> '') //AND NOT ShopOrderLines."Schedule in Dime"   //AI13.00 05/18 Teming Added 2nd condition
      //AI13.00.04 10/20 Teming cERP-1346 Deleted the 2nd condition
      THEN
        BEGIN
          //AI13.00.06 CERP-1840 JPU BEGIN - If line requires scheduling, Start By Date on the shop order line needs to be blank
          IF NOT SchEntryMgmt.HasScheduled(0,DATABASE::"Shop/Work Order Worksheet",0,ShopSchLine."Batch Name",'',ShopSchLine."Line No.",0,
                  DATABASE::"Shop/Work Order Line",ShopOrderLines."Component Doc. Type",ShopOrderLines."Component Doc. No.",'',ShopOrderLines."Component Line No.",ShopOrderLines."Component Parent Line No.") THEN
            BEGIN
              ShopOrderLines.VALIDATE("Start By Date", 0D);
              ShopOrderLines.MODIFY(TRUE);
            END;
          //AI13.00.06 CERP-1840 JPU END

          IF SchEntry."Line No." = 0
            THEN SchEntryMgmt.MoveEntries(0,DATABASE::"Shop/Work Order Worksheet",0,ShopSchLine."Batch Name",'',ShopSchLine."Line No.",0,
                  DATABASE::"Shop/Work Order Line",ShopOrderLines."Component Doc. Type",ShopOrderLines."Component Doc. No.",'',ShopOrderLines."Component Line No.",ShopOrderLines."Component Parent Line No.")
            ELSE SchEntry.RENAME(SchEntry.Type::"Production Line",DATABASE::"Shop/Work Order Line",ShopOrderLines."Component Doc. Type",ShopOrderLines."Component Doc. No.",'',ShopOrderLines."Component Line No.",
                                ShopOrderLines."Component Parent Line No.",10000);
        END;

    //AI13.00.03 02/20 Teming cERP-1071 Added the 9th parameter for DoNotUpdateParent
    //CERP-1403 jim 8/12/20 added Applied Components String parameter
    ShopOrderMgmt.CopyFromContract(ShopOrderLines."Component Doc. Type",OrderNo,ShopOrderLines."Line No.",
                                   ShopOrderLines."Contract No.",ShopOrderLines."Change Order No.",
                                   ShopOrderLines."Material Entry No.",ShopOrderLines."Mat. Component Line No.",FALSE,FALSE,ShopSchLine."Applied Components String");

    //AI4.00 begin
    ShopSchLine.CALCFIELDS("Assignments Exist");
    IF ShopSchLine."Assignments Exist"
      THEN
        BEGIN
          IF SchEntry."Line No." = 0
            THEN
              BEGIN
                AssignTrackMgmt.CopyAssignment(DATABASE::"Shop/Work Order Worksheet",'',0,ShopSchLine."Batch Name",
                           ShopSchLine."Line No.",DATABASE::"Shop/Work Order Line",'',OrderType,
                           OrderNo,ShopOrderLines."Line No.",0,'',0);
                AssignTrackMgmt.DeleteAssignments(DATABASE::"Shop/Work Order Worksheet",'',0,ShopSchLine."Batch Name",ShopSchLine."Line No.");
              END
            ELSE
              AssignTrackMgmt.CopyAndDeletetoMaxQty(DATABASE::"Shop/Work Order Worksheet",'',0,ShopSchLine."Batch Name",
                          ShopSchLine."Line No.",DATABASE::"Shop/Work Order Line",'',OrderType,
                          OrderNo,ShopOrderLines."Line No.",'',0,SchEntry.Quantity);
          ShopOrderMgmt.DefaultCompSerialNos(ShopOrderLines."Component Doc. Type",ShopOrderLines."Component Doc. No.",ShopOrderLines."Component Line No.");
        END;
    //AI4.00 end

    ShopOrderMgmt.CopyCommentsFromMatList(ShopSchLine."Contract No.",ShopSchLine."Change Order No.",ShopSchLine."Material Entry No.",
       ShopOrderLines."Order Type",ShopOrderLines."Order No.",ShopOrderLines."Line No.");

    //AI9.01 JPU 06132017 BEGIN - Copy comments from Release Schedule to shop/work order line
    ShopOrderMgmt.CopyCommentsFromReleaseSchedule(ShopSchLine."Contract No.",ShopSchLine."Change Order No.",ShopSchLine."Release No.",
       ShopOrderLines."Order Type",ShopOrderLines."Order No.",ShopOrderLines."Line No.");
    //AI9.01 JPU 06132017 END

    //AI13.00.06 CERP-1649 JPU BEGIN
    IF ConfigSetup.GET(ShopOrderLines."Configurator Setup No.") THEN
      BEGIN
        ConfigSetup.CALCFIELDS(Configurable);
        IF ConfigSetup.Configurable THEN
          ConfigSetup.CreateQuickEntryLinesSales(ShopOrderLines."Component Doc. Type", ShopOrderLines."Component Doc. No.", ShopOrderLines."Component Line No.", FALSE,0,0,0,0,0);
      END;
    //AI13.00.06 CERP-1649 JPU END
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..83
    ShopOrderLines.INSERT(TRUE);

    IF (ShopSchLine."Capacity Group Code" <> '') AND NOT ShopOrderLines."Schedule in Dime"   //AI13.00 05/18 Teming Added 2nd condition
    #127..129
    #112..117
    ShopOrderMgmt.CopyFromContract(ShopOrderLines."Component Doc. Type",OrderNo,ShopOrderLines."Line No.",
                                   ShopOrderLines."Contract No.",ShopOrderLines."Change Order No.",
                                   ShopOrderLines."Material Entry No.",ShopOrderLines."Mat. Component Line No.",FALSE);
    #123..151
    */
    //end;

    //Unsupported feature: Code Modification on "CreateShopOrderLineFromComp(PROCEDURE 1000000002)".

    //procedure CreateShopOrderLineFromComp();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Comp.GET(Comp."Document Type"::Order,SalesOrderNo,SalesOrderLineNo,CompLineNo);

    //Comp.CALCFIELDS("Sub-Components");
    //IF NOT Comp."Sub-Components"

    IF Comp."Manufacturing Code (Sub)" <> Comp."Manufacturing Code (Sub)"::"Shop Order"
      THEN EXIT;

    ShopOrderParentTemp.CreateCompParent(Comp."Document Type",Comp."Document No.",Comp."Line No.",Comp."Parent Component Line No.");
    SalesHeader.GET(SalesHeader."Document Type"::Order,SalesOrderNo);
    SalesHeader.TESTFIELD("Hold Order",FALSE);
    SalesLine.GET(SalesLine."Document Type"::Order,SalesOrderNo,SalesOrderLineNo);

    IF SalesLine.ContractBasedShopWorkOrder
      THEN EXIT;

    IF ShopOrderParentTemp.Quantity = 0
      THEN EXIT;

    IF ShopOrderMgmt.Exist(Comp."Document Type"::Order,SalesOrderNo,SalesOrderLineNo,CompLineNo)
      THEN EXIT;

    //cERP.TestServiceableItemBlocked(SalesLine."Serviceable Item No."); //AI6.01

    ShopOrderLines.INIT;
    ShopOrderLines."Order Type" := OrderType;
    ShopOrderLines."Order No." := OrderNo;
    ShopOrderLines.SetNextLineNo;
    ShopOrderLines.VALIDATE("Item No.",Comp."No.");
    ShopOrderLines.Description := Comp.Description;
    ShopOrderLines."Description 2" := Comp."Description 2";
    ShopOrderLines."Submittal ID" := Comp."Submittal ID";
    ShopOrderLines."Submittal Description" := Comp."Submittal Description";
    ShopOrderLines.VALIDATE(Quantity,Comp.TotalQty);
    ShopOrderLines."Component Doc. Type" := Comp."Document Type";
    ShopOrderLines."Component Doc. No." := Comp."Document No.";
    ShopOrderLines."Component Line No." := Comp."Line No.";
    ShopOrderLines."Component Parent Line No." := Comp."Component Line No.";
    ShopOrderLines."Contract No." := ShopOrderParentTemp."Contract No.";
    ShopOrderLines."Change Order No." := ShopOrderParentTemp."Change Order No.";
    ShopOrderLines."Material Entry No." := ShopOrderParentTemp."Material Entry No.";
    ShopOrderLines."Contract Description" := SalesHeader."Contract Description";
    ShopOrderLines."Sell-to Customer Name" := SalesHeader."Sell-to Customer Name";
    ShopOrderLines."Item Category Code" := Comp."Item Category Code";
    ShopOrderLines."Product Group Code" := Comp."Product Group Code";
    ShopOrderLines."Staging Location" := Comp."Staging Location";
    //AI13.00.04 CERP-1520 JPU BEGIN - Use Supply From if populated
    //AI13.00.06 CERP-1520 JPU BEGIN
    //IF Comp."Supply From Code" <> '' THEN
    Comp.CALCFIELDS("Sub-Components");
    IF (Comp."Supply From Code" <> '') AND (Comp."Sub-Components") THEN
    //AI13.00.06 CERP-1520 JPU END
      BEGIN
        ShopOrderLines."Location Code" := Comp."Supply From Code";
        ShopOrderLines."Transfer To Code" := Comp."Location Code";
      END
    ELSE
    //AI13.00.04 CERP-1520 JPU END
      ShopOrderLines."Location Code" := Comp."Location Code";
    ShopOrderLines."Variant Code" := Comp."Variant Code";
    ShopOrderLines."Start By Date" := Comp."Order By Date";
    ShopOrderLines."Due Date" := Comp."Due Date";
    ShopOrderLines."Lead Time" := Comp."Order By Lead Time";
    ShopOrderLines."Gen. Bus. Posting Group" := ShopOrderParentTemp."Gen. Bus. Posting Group";
    ShopOrderLines."Configurator Setup No." := Comp."Configurator Setup No. (Sub)";
    ShopOrderLines."Associated Document Type" := Comp."Associated Document Type";
    ShopOrderLines."Associated Document No." := Comp."Associated Document No.";
    ShopOrderLines."Associated Change Order No." := Comp."Associated Change Order No.";
    ShopOrderLines."Associated Contract Variant" := Comp."Associated Contract Variant";
    ShopOrderLines."Associated Line No." := Comp."Associated Line No.";
    ShopOrderLines."Associated Comp. Line No." := Comp."Associated Comp. Line No.";
    ShopOrderLines."Salesperson Code" := ShopOrderParentTemp."Salesperson Code";
    ShopOrderLines."Project Manager Code" := ShopOrderParentTemp."Project Manager Code";
    //ShopOrderLines."Serviceable Item No." := SalesLine."Serviceable Item No.";
    //ShopOrderLines."Requested Service Date/Time" := comp."Requested Service Date/Time";
    //ShopOrderLines."Scheduled Start Date/Time" := SalesLine."Scheduled Start Date/Time";
    //ShopOrderLines."Scheduled Duration" := SalesLine."Scheduled Duration";
    //ShopOrderLines."Scheduled End Date/Time" := SalesLine."Scheduled End Date/Time";
    //ShopOrderLines."Production Line Code" := comp."Production Line Code";
    //ShopOrderLines.VALIDATE("Production Line Qty. Per Piece",SalesLine."Production Line Qty. Per Piece");
    //ShopOrderLines."Work Center Sequence No." := SalesLine."Work Center Sequence No.";
    //ShopOrderLines."Delivery Route No." := SalesLine."Delivery Sch. Group Code";
    ShopOrderLines."Dimension Set ID" := ShopOrderParentTemp."Dimension Set ID";

    ShopOrderLines.INSERT(TRUE);

    ShopOrderMgmt.AssociateComponentsToShopOrder(ShopOrderLines,CreateLineForSubAssemblies);

    SalesLine.CALCFIELDS(Assignments);
    IF SalesLine.Assignments
      THEN AssignTrackMgmt.CopyAssignment(DATABASE::"Sales Line",'',SalesLine."Document Type",SalesLine."Document No.",
                                  SalesLine."Line No.",DATABASE::"Shop/Work Order Line",'',OrderType,
                                  OrderNo,ShopOrderLines."Line No.",0,'',0);

    ShopOrderMgmt.CopyCommentsFromSalesLine(SalesLine."Document No.",SalesLine."Line No.",ShopOrderLines."Order Type",
      ShopOrderLines."Order No.",ShopOrderLines."Line No.");

    IF cERP.SerialNosExist(DATABASE::"Sales Line",SalesLine."Document Type",'',
                           SalesLine."Document No.",SalesLine."Line No.",0)
      THEN SerialNoMgmt.CopySerialNos(DATABASE::"Sales Line",SalesLine."Document Type",'',
                                        SalesLine."Document No.",SalesLine."Line No.",0,
                                        DATABASE::"Shop/Work Order Line",ShopOrderLines."Order Type",'',
                                        ShopOrderLines."Order No.",ShopOrderLines."Line No.",0);

    EXIT(ShopOrderLines."Line No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..47
    ShopOrderLines."Location Code" := Comp."Location Code";
    #61..106
    */
    //end;

    //Unsupported feature: Code Modification on "CreateShopOrderLineFromReqLine(PROCEDURE 1102621009)".

    //procedure CreateShopOrderLineFromReqLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    //AI13.00 CERP-514 SLB 08/02/18
    ShopOrderLines.INIT;
    ShopOrderLines."Order Type" := OrderType;
    #4..83
    //    ELSE
    //      ShopOrderLines.MODIFY(TRUE);
    //  END;
    ShopOrderMgmt.CopyFromTemplate(2,ShopOrderLines."Order No.",ShopOrderLines."Line No.",0,
          SalesLine.Type::Item,ShopOrderLines."Item No.",FALSE,'');  //AI13.00.03 CERP-1026 SLB 09/18/19
    //ShopOrderMgmt.AssociateComponentsToShopOrder(ShopOrderLines,CreateLineForSubAssemblies);  //AI13.00.03 CERP-1026 SLB 09/18/19

    ReqLine.CALCFIELDS("Assignments Exist");
    IF ReqLine."Assignments Exist" THEN BEGIN
    #93..107
                                        ShopOrderLines."Order No.",ShopOrderLines."Line No.",0);

    EXIT(ShopOrderLines."Line No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..86

    ShopOrderMgmt.AssociateComponentsToShopOrder(ShopOrderLines,CreateLineForSubAssemblies);
    #90..110
    */
    //end;

    //Unsupported feature: ReturnValue Insertion (ReturnValue: <Blank>) (ReturnValueCollection) on "GetRemainingPlannedShopTime(PROCEDURE 1102621012)".

    //Unsupported feature: Variable Insertion (Variable: PostedComponent) (VariableCollection) on "GetRemainingPlannedShopTime(PROCEDURE 1102621012)".

    //Unsupported feature: Variable Insertion (Variable: PostedShopOrderLine) (VariableCollection) on "GetRemainingPlannedShopTime(PROCEDURE 1102621012)".

    //Unsupported feature: Variable Insertion (Variable: TotalPosted) (VariableCollection) on "GetRemainingPlannedShopTime(PROCEDURE 1102621012)".

    //Unsupported feature: Property Deletion (Attributes) on "OnBeforeInsertShopOrderLine(PROCEDURE 1102621012)".

    //Unsupported feature: Property Deletion (Local) on "OnBeforeInsertShopOrderLine(PROCEDURE 1102621012)".

    //Unsupported feature: Property Modification (Name) on "OnBeforeInsertShopOrderLine(PROCEDURE 1102621012)".

    //Unsupported feature: Code Modification on "OnBeforeInsertShopOrderLine(PROCEDURE 1102621012)".

    //procedure OnBeforeInsertShopOrderLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //HL JPU CC-633 - Remaining Planned Shop Time = (Total Planned Resource Capacity - Posted Total Planned Resource Capacity)

    PostedComponent.SETCURRENTKEY("Unposted Shop/Work Order Type","Unposted Shop/Work Order No.");
    PostedComponent.SETRANGE("Unposted Shop/Work Order Type", PostedComponent."Unposted Shop/Work Order Type"::Shop);
    PostedComponent.SETRANGE("Unposted Shop/Work Order No.", "No.");
    PostedComponent.SETRANGE(Type, PostedComponent.Type::Resource);
    PostedComponent.SETRANGE(Blocked, FALSE);
    PostedComponent.SETRANGE("Parent Component Line No.", 0);
    IF PostedComponent.FINDSET THEN
      REPEAT
        IF PostedShopOrderLine.GET(PostedComponent."Document No.", PostedComponent."Line No.") THEN;
          TotalPosted += PostedComponent.GetPlannedResourceCapacity * PostedShopOrderLine.Quantity;
      UNTIL PostedComponent.NEXT = 0;

    EXIT(GetTotalPlannedResCap - TotalPosted);
    */
    //end;

    procedure GetTotalPlannedResCap() Total: Decimal
    var
        Component: Record "CERP Component";
        ShopOrderLine: Record "CERP Shop/Work Order Line";
    begin
        //HL JPU CC-633

        ShopOrderLine.SETRANGE("Order Type", ShopOrderLine."Order Type"::Shop);
        ShopOrderLine.SETRANGE("Order No.", "No.");
        ShopOrderLine.SETFILTER(Quantity, '<>0');
        IF ShopOrderLine.FINDSET THEN
            REPEAT
                Total += ShopOrderLine.GetPlannedResCapacity;
            UNTIL ShopOrderLine.NEXT = 0;

        EXIT(Total);
    end;
}
