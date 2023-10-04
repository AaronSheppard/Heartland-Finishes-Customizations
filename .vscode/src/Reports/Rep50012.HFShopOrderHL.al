// report 50012 "HF Shop Order HL"
// {
//     // version AI13.00,HL

//     DefaultLayout = RDLC;
//     RDLCLayout = '.vscode/src/Reports/Layouts/Shop Order HL.rdlc';

//     dataset
//     {
//         dataitem(DataItem8539; Table37004576)
//         {
//             CalcFields = Start By Date, Due Date, Contract Description;
//             DataItemTableView = WHERE(Type = CONST(Shop));
//             RequestFilterFields = "No.";
//             column(CompanyInfoPicture; CompanyInformation.Picture)
//             {
//             }
//             column(CompanyAddress1; CompanyAddress[1])
//             {
//             }
//             column(CompanyAddress2; CompanyAddress[2])
//             {
//             }
//             column(CompanyAddress3; CompanyAddress[3])
//             {
//             }
//             column(CompanyAddress4; CompanyAddress[4])
//             {
//             }
//             column(CompanyAddress5; CompanyAddress[5])
//             {
//             }
//             column(CompanyAddress6; CompanyAddress[6])
//             {
//             }
//             column(Shop_Work_Order_Type; Type)
//             {
//             }
//             column(Shop_Work_Order_No; "No.")
//             {
//             }
//             column(Shop_Work_Order_Start_Date; "Start By Date")
//             {
//             }
//             column(Shop_Work_Order_Description; Description)
//             {
//             }
//             column(Shop_Work_Order_Due_Date; "Due Date")
//             {
//             }
//             column(Shop_Work_Contract_Description; JobDescription)
//             {
//             }
//             column(Shop_Work_Contract_ChangeOrder_No; ConERPMgmt.ContractChangeOrderNo("Contract No.", "Change Order No."))
//             {
//             }
//             column(COMPANYNAME; COMPANYNAME)
//             {
//             }
//             column("USERID"; USERID)
//             {
//             }
//             column(OrderBarcode; OrderBarcode)
//             {
//             }
//             column(Salespersoncode; SalespersonCode)
//             {
//             }
//             dataitem(HeaderComment; Table37004582)
//             {
//                 DataItemLink = Order Type=FIELD(Type),
//                                Order No.=FIELD("No.");
//                 DataItemTableView = SORTING(Order Type,Order No.,Order Line No.,Line No.)
//                                     WHERE(Print=CONST(Yes),
//                                           Order Line No.=CONST(0));
//                 column(Comment_HeaderComment; HeaderComment.Comment)
//                 {
//                 }
//             }
//             dataitem(DataItem4252;Table37004577)
//             {
//                 CalcFields = Assignments;
//                 DataItemLink = Order Type=FIELD(Type),
//                                Order No.=FIELD("No.");
//                 DataItemTableView = SORTING(Order Type,Order No.,Line No.);
//                 column(ShopWorkOrderLineRec;'True')
//                 {
//                 }
//                 column(Shop_Work_Order_Line_Contract_No; "Contract No.")
//                 {
//                     IncludeCaption = true;
//                 }
//                 column(Shop_Work_Order_Line_Contract_Description; "Contract Description")
//                 {
//                 }
//                 column(OutputNo; OutputNo)
//                 {
//                 }
//                 column(Shop_Work_Order_Line_Start_By_Date; FORMAT("Start By Date"))
//                 {
//                 }
//                 column(Shop_Work_Order_Line_Due_Date; FORMAT("Due Date"))
//                 {
//                 }
//                 column(Shop_Work_Order_Line_Item_No; "Item No.")
//                 {
//                     IncludeCaption = true;
//                 }
//                 column(Shop_Work_Order_Line_Description;Description + ' ' + "Description 2")
//                 {
//                 }
//                 column(Shop_Work_Order_Line_Quantity; Quantity)
//                 {
//                 }
//                 column(Shop_Work_Order_Line_Qty__Finished; "Qty. Finished")
//                 {
//                     IncludeCaption = false;
//                 }
//                 column(Shop_Work_Order_Line_Component_Doc_No; "Component Doc. No.")
//                 {
//                 }
//                 column(Shop_Work_Order_Line_Sell_to_Customer_Name; "Sell-to Customer Name")
//                 {
//                 }
//                 column(Shop_Work_Order_Line_Order_Type; "Order Type")
//                 {
//                 }
//                 column(Shop_Work_Order_Line_Order_No; "Order No.")
//                 {
//                 }
//                 column(Shop_Work_Order_Line_Line_No; "Line No.")
//                 {
//                 }
//                 column(Shop_Work_Order_Line_Component_Doc_Type; "Component Doc. Type")
//                 {
//                 }
//                 column(Shop_Work_Order_Line_Component_Line_No; "Component Line No.")
//                 {
//                 }
//                 column(AssignmentList; tAssignList)
//                 {
//                 }
//                 column(Barcode; Barcode)
//                 {
//                 }
//                 column(StagingOrStorageLocCaption; StagingOrStorageLocCaption)
//                 {
//                 }
//                 dataitem(AttributeArray1;Integer)
//                 {
//                     DataItemTableView = SORTING(Number);
//                     MaxIteration = 1;
//                     column(aAttributeColumn1Rec;'True')
//                     {
//                     }
//                     column(aAttributeHeader8; aAttributeHeader[8])
//                     {
//                     }
//                     column(aAttributeHeader7; aAttributeHeader[7])
//                     {
//                     }
//                     column(aAttributeHeader6; aAttributeHeader[6])
//                     {
//                     }
//                     column(aAttributeHeader5; aAttributeHeader[5])
//                     {
//                     }
//                     column(aAttributeHeader4; aAttributeHeader[4])
//                     {
//                     }
//                     column(aAttributeHeader3; aAttributeHeader[3])
//                     {
//                     }
//                     column(aAttributeHeader2; aAttributeHeader[2])
//                     {
//                     }
//                     column(aAttributeHeader1; aAttributeHeader[1])
//                     {
//                     }
//                     column(aAttribute8; aAttribute[8])
//                     {
//                     }
//                     column(aAttribute7; aAttribute[7])
//                     {
//                     }
//                     column(aAttribute6; aAttribute[6])
//                     {
//                     }
//                     column(aAttribute5; aAttribute[5])
//                     {
//                     }
//                     column(aAttribute4; aAttribute[4])
//                     {
//                     }
//                     column(aAttribute3; aAttribute[3])
//                     {
//                     }
//                     column(aAttribute2; aAttribute[2])
//                     {
//                     }
//                     column(aAttribute1; aAttribute[1])
//                     {
//                     }

//                     trigger OnAfterGetRecord()
//                     begin
//                         IF LastAttColumn = 0
//                           THEN CurrReport.SKIP;
//                     end;
//                 }
//                 dataitem(AttributeArray2;Integer)
//                 {
//                     DataItemTableView = SORTING(Number);
//                     MaxIteration = 1;
//                     column(aAttributeColumn2Rec;'True')
//                     {
//                     }
//                     column(aAttributeHeader16; aAttributeHeader[16])
//                     {
//                     }
//                     column(aAttributeHeader15; aAttributeHeader[15])
//                     {
//                     }
//                     column(aAttributeHeader14; aAttributeHeader[14])
//                     {
//                     }
//                     column(aAttributeHeader13; aAttributeHeader[13])
//                     {
//                     }
//                     column(aAttributeHeader12; aAttributeHeader[12])
//                     {
//                     }
//                     column(aAttributeHeader11; aAttributeHeader[11])
//                     {
//                     }
//                     column(aAttributeHeader10; aAttributeHeader[10])
//                     {
//                     }
//                     column(aAttributeHeader9; aAttributeHeader[9])
//                     {
//                     }
//                     column(aAttribute16; aAttribute[16])
//                     {
//                     }
//                     column(aAttribute15; aAttribute[15])
//                     {
//                     }
//                     column(aAttribute14; aAttribute[14])
//                     {
//                     }
//                     column(aAttribute13; aAttribute[13])
//                     {
//                     }
//                     column(aAttribute12; aAttribute[12])
//                     {
//                     }
//                     column(aAttribute11; aAttribute[11])
//                     {
//                     }
//                     column(aAttribute10; aAttribute[10])
//                     {
//                     }
//                     column(aAttribute9; aAttribute[9])
//                     {
//                     }

//                     trigger OnAfterGetRecord()
//                     begin
//                         IF LastAttColumn < 9
//                           THEN CurrReport.SKIP;
//                     end;
//                 }
//                 dataitem(DataItem5531;Table37004582)
//                 {
//                     DataItemLink = Order Type=FIELD(Order Type),
//                                    Order No.=FIELD(Order No.),
//                                    Order Line No.=FIELD("Line No.");
//                     DataItemTableView = SORTING(Order Type,Order No.,Order Line No.,Line No.)
//                                         WHERE(Print=CONST(Yes));
//                     column(Comment_Comment; Comment)
//                     {
//                     }
//                 }
//                 dataitem(DataItem3908;Table37012850)
//                 {
//                     DataItemLink = "Document Type"=FIELD(Order Type),
//                                    "Document No."=FIELD(Order No.),
//                                    "Document Line No."=FIELD("Line No.");
//                     DataItemTableView = SORTING(Table ID,Document Type,Template Name,Document No.,Document Line No.,Component Line No.,Line No.)
//                                         WHERE(Table ID=CONST(37004577),
//                                               Template Name=FILTER(''),
//                                               Component Line No.=CONST(0));
//                     column(SerialNoRec;'True')
//                     {
//                     }
//                     column(Serial_No1;Addr[1][1])
//                     {
//                     }
//                     column(Serial_No2;Addr[2][1])
//                     {
//                     }
//                     column(Serial_No3;Addr[3][1])
//                     {
//                     }
//                     column(Serial_No4;Addr[4][1])
//                     {
//                     }
//                     column(Serial_No_ColumnNo; ColumnNo)
//                     {
//                     }

//                     trigger OnAfterGetRecord()
//                     begin
//                         RecordNo := RecordNo + 1;
//                         ColumnNo := ColumnNo + 1;

//                         Addr[ColumnNo][1] := FORMAT("Serial No.");

//                         COMPRESSARRAY(Addr[ColumnNo]);

//                         IF RecordNo = NoOfRecords THEN BEGIN
//                           FOR i := ColumnNo + 1 TO NoOfColumns DO
//                             CLEAR(Addr[i]);
//                           ColumnNo := 0;
//                         END ELSE BEGIN
//                           IF ColumnNo = NoOfColumns THEN
//                             ColumnNo := 0;
//                         END;
//                     end;

//                     trigger OnPreDataItem()
//                     begin
//                         NoOfRecords := COUNT;
//                         NoOfColumns := 4;
//                         RecordNo := 0;
//                     end;
//                 }
//                 dataitem(DataItem9527;"CERP Component")
//                 {
//                     DataItemLink = "Document Type"=FIELD(Component Doc. Type),
//                                    "Document No."=FIELD(Component Doc. No.),
//                                    Line No.=FIELD(Component Line No.),
//                                    Parent Component Line No.=FIELD(Component Parent Line No.);
//                     DataItemTableView = SORTING("Document Type",Document No.,Line No.,Component Line No.)
//                                         WHERE(Blocked=CONST(No));
//                     column(ComponentRec;'True')
//                     {
//                     }
//                     column(Component_Type; Type)
//                     {
//                         IncludeCaption = true;
//                     }
//                     column(Component_No; "No.")
//                     {
//                         IncludeCaption = true;
//                     }
//                     column(Component_Description; Component.DescToPrint())
//                     {
//                     }
//                     column(Component_Qty_Per; "Qty. Per")
//                     {
//                         IncludeCaption = true;
//                     }
//                     column(Component_StagingOrStorageLoc; StagingOrStorageLocations)
//                     {
//                         DecimalPlaces = 2:5;
//                     }
//                     column(Component_Attribute_Code; "Attribute Code")
//                     {
//                     }
//                     column(Component_Component_Line_No; "Component Line No.")
//                     {
//                     }
//                     dataitem(CompSerialNoTransaction;Table37012850)
//                     {
//                         DataItemLink = "Document Type"=FIELD("Document Type"),
//                                        "Document No."=FIELD("Document No."),
//                                        "Document Line No."=FIELD("Line No."),
//                                        Component Line No.=FIELD(Component Line No.);
//                         DataItemTableView = SORTING(Table ID,Document Type,Template Name,Document No.,Document Line No.,Component Line No.,Line No.)
//                                             WHERE(Table ID=CONST(37004575),
//                                                   Template Name=FILTER(''));
//                         column(CompSerialNoRec;'True')
//                         {
//                         }
//                         column(CompSerialNoTrans4;Addr[4][1])
//                         {
//                         }
//                         column(CompSerialNoTrans3;Addr[3][1])
//                         {
//                         }
//                         column(CompSerialNoTrans2;Addr[2][1])
//                         {
//                         }
//                         column(CompSerialNoTrans1;Addr[1][1])
//                         {
//                         }
//                         column(CompSerialNoTrans_ColumnNo; ColumnNo)
//                         {
//                         }

//                         trigger OnAfterGetRecord()
//                         begin
//                             RecordNo := RecordNo + 1;
//                             ColumnNo := ColumnNo + 1;

//                             Addr[ColumnNo][1] := FORMAT("Serial No.");

//                             COMPRESSARRAY(Addr[ColumnNo]);

//                             IF RecordNo = NoOfRecords THEN BEGIN
//                               FOR i := ColumnNo + 1 TO NoOfColumns DO
//                                 CLEAR(Addr[i]);
//                               ColumnNo := 0;
//                             END ELSE BEGIN
//                               IF ColumnNo = NoOfColumns THEN
//                                 ColumnNo := 0;
//                             END;
//                         end;

//                         trigger OnPreDataItem()
//                         begin
//                             NoOfRecords := COUNT;
//                             NoOfColumns := 4;
//                             RecordNo := 0;
//                         end;
//                     }
//                     dataitem(POs;Integer)
//                     {
//                         DataItemTableView = SORTING(Number);
//                         column(CompPONo; CompPOTemp."Document No.")
//                         {
//                         }
//                         column(CompPOQuantity; CompPOTemp.Quantity)
//                         {
//                             DecimalPlaces = 0:5;
//                         }
//                         column(CompPOTemp_Number; Number)
//                         {
//                         }

//                         trigger OnAfterGetRecord()
//                         begin
//                             IF Number = 1
//                               THEN CompPOTemp.FINDFIRST
//                               ELSE CompPOTemp.NEXT;
//                         end;

//                         trigger OnPreDataItem()
//                         var
//                             AssignTran: Record "37004541";
//                             ReceivedAssignTran: Record "37004544";
//                             POAssignTran: Record "37004541";
//                             PurchLine: Record "39";
//                             PurchRcptLine: Record "121";
//                             PurchRcptHeader: Record "120";
//                         begin
//                             IF NOT cERP.NonStock(Component."Purchasing Code")
//                               THEN
//                                 BEGIN
//                                   POs.SETRANGE(Number,1,0);
//                                   EXIT;
//                                 END;

//                             CompPOTemp.DELETEALL;

//                             IF "Shop/Work Order Line".Assignments
//                               THEN
//                                 BEGIN
//                                   AssignTran.SETRANGE("Table ID",DATABASE::"Shop/Work Order Line");
//                                   AssignTran.SETRANGE("Document Type",0);
//                                   AssignTran.SETRANGE("Template Name",'');
//                                   AssignTran.SETRANGE("Document No.","Shop/Work Order Line"."Order No.");
//                                   AssignTran.SETRANGE("Document Line No.","Shop/Work Order Line"."Line No.");
//                                   IF AssignTran.FINDFIRST
//                                     THEN
//                                       REPEAT
//                                         POAssignTran.SETRANGE("Table ID",DATABASE::"Purchase Line");
//                                         POAssignTran.SETRANGE("Contract No.",AssignTran."Contract No.");
//                                         POAssignTran.SETRANGE("Change Order No.",AssignTran."Change Order No.");
//                                         POAssignTran.SETRANGE("Material Entry No.",AssignTran."Material Entry No.");
//                                         POAssignTran.SETRANGE("Material Component Line No.",Component."Material Comp. No.");
//                                         POAssignTran.SETRANGE("Assignment Level 1",AssignTran."Assignment Level 1");
//                                         POAssignTran.SETRANGE("Assignment Level 2",AssignTran."Assignment Level 2");
//                                         POAssignTran.SETRANGE("Assignment Level 3",AssignTran."Assignment Level 3");
//                                         IF POAssignTran.FINDFIRST
//                                           THEN
//                                             REPEAT
//                                               UpdateCompPOTemp(POAssignTran."Document No.",0);
//                                             UNTIL POAssignTran.NEXT = 0;

//                                         ReceivedAssignTran.SETRANGE("Table ID",DATABASE::"Purch. Rcpt. Line");
//                                         ReceivedAssignTran.SETRANGE("Contract No.",AssignTran."Contract No.");
//                                         ReceivedAssignTran.SETRANGE("Change Order No.",AssignTran."Change Order No.");
//                                         ReceivedAssignTran.SETRANGE("Material Entry No.",AssignTran."Material Entry No.");
//                                         ReceivedAssignTran.SETRANGE("Material Component Line No.",Component."Material Comp. No.");
//                                         ReceivedAssignTran.SETRANGE("Assignment Level 1",AssignTran."Assignment Level 1");
//                                         ReceivedAssignTran.SETRANGE("Assignment Level 2",AssignTran."Assignment Level 2");
//                                         ReceivedAssignTran.SETRANGE("Assignment Level 3",AssignTran."Assignment Level 3");
//                                         IF ReceivedAssignTran.FINDFIRST
//                                           THEN
//                                             REPEAT
//                                               UpdateCompPOTemp(ReceivedAssignTran."Order No.",ReceivedAssignTran.Quantity);
//                                             UNTIL ReceivedAssignTran.NEXT = 0;
//                                       UNTIL AssignTran.NEXT = 0;
//                                 END
//                               ELSE
//                                 BEGIN
//                                   Component.SetAssocPurchLineFilters(PurchLine);
//                                   IF PurchLine.FINDFIRST
//                                     THEN
//                                       REPEAT
//                                         UpdateCompPOTemp(PurchLine."Document No.",0);
//                                       UNTIL PurchLine.NEXT = 0;

//                                   Component.SetAssocPurchRcptLineFilters(PurchRcptLine);
//                                   IF PurchRcptLine.FINDFIRST
//                                     THEN
//                                       REPEAT
//                                         PurchRcptHeader.GET(PurchRcptLine."Document No.");
//                                         UpdateCompPOTemp(PurchRcptLine."Order No.",PurchRcptLine.Quantity);
//                                       UNTIL PurchRcptLine.NEXT = 0;
//                                 END;

//                             POs.SETRANGE(Number,1,CompPOTemp.COUNT);
//                         end;
//                     }

//                     trigger OnAfterGetRecord()
//                     begin
//                         IF (Type = Type::Attribute) AND
//                           (("Attribute Value" IN ['', 'BLANK VALUE']) OR //AI9.01 JPU 11022017
//                            (NOT cERP.PrintAttribute("Attribute Code",Item."Item Category Code",Item."Product Group Code",PrintOn::ShopOrder))) THEN
//                           CurrReport.SKIP;
//                     end;
//                 }
//                 dataitem(DataItem9730;Table37004541)
//                 {
//                     DataItemLink = "Document No."=FIELD(Order No.),
//                                    "Document Line No."=FIELD("Line No.");
//                     DataItemTableView = SORTING(Table ID,Document Type,Template Name,Document No.,Document Line No.,Assignment Level 1,Assignment Level 2,Assignment Level 3)
//                                         WHERE(Table ID=CONST(37004577));
//                     column(AssignTransRec;'True')
//                     {
//                     }
//                     column(aAssignTrans_1_Assignment_Level_3;aAssignTrans[1]."Assignment Level 3")
//                     {
//                     }
//                     column(AssignTrans_1_Degree;aAssign3[1].Degree)
//                     {
//                         DecimalPlaces = 0:5;
//                     }
//                     column(AssignTrans_1_Heading;aAssign3[1]."Heading Code")
//                     {
//                         DecimalPlaces = 0:5;
//                     }
//                     column(aAssignTrans_1_Quantity;aAssignTrans[1].Quantity)
//                     {
//                         DecimalPlaces = 0:5;
//                     }
//                     column(aAssignTrans_2_Assignment_Level_3;aAssignTrans[2]."Assignment Level 3")
//                     {
//                     }
//                     column(AssignTrans_2_Degree;aAssign3[2].Degree)
//                     {
//                         DecimalPlaces = 0:5;
//                     }
//                     column(AssignTrans_2_Heading;aAssign3[2]."Heading Code")
//                     {
//                         DecimalPlaces = 0:5;
//                     }
//                     column(AssignTrans_2_Quantity;aAssignTrans[2].Quantity)
//                     {
//                         DecimalPlaces = 0:5;
//                     }
//                     column(aAssignTrans_3_Assignment_Level_3;aAssignTrans[3]."Assignment Level 3")
//                     {
//                     }
//                     column(AssignTrans_3_Degree;aAssign3[3].Degree)
//                     {
//                         DecimalPlaces = 0:5;
//                     }
//                     column(AssignTrans_3_Heading;aAssign3[3]."Heading Code")
//                     {
//                         DecimalPlaces = 0:5;
//                     }
//                     column(AssignTrans_3_Quantity;aAssignTrans[3].Quantity)
//                     {
//                         DecimalPlaces = 0:5;
//                     }
//                     column(AssignTrans_Assign3Caption;CAPTIONCLASSTRANSLATE('AL3'))
//                     {
//                     }
//                     column(AssignTrans_ColumnNo; ColumnNo)
//                     {
//                     }

//                     trigger OnAfterGetRecord()
//                     var
//                         i: Integer;
//                     begin
//                         AddToAssignSummary("Assignment Level 3");

//                         IF NOT AssignPrintDetail
//                           THEN CurrReport.SKIP;

//                         RecordNo := RecordNo + 1;
//                         ColumnNo := ColumnNo + 1;

//                         aAssignTrans[ColumnNo] := "Assignment Transactions";
//                         aAssign3[ColumnNo].GET("Contract No.","Assignment Level 1","Assignment Level 2","Assignment Level 3");

//                         IF RecordNo = AssignmentCount
//                           THEN
//                             BEGIN
//                               FOR i := ColumnNo + 1 TO 3 DO
//                                 BEGIN
//                                   CLEAR(aAssignTrans[i]);
//                                   CLEAR(aAssign3[i]);
//                                 END;
//                               ColumnNo := 0;
//                             END
//                           ELSE
//                             BEGIN
//                               IF ColumnNo = 3 THEN
//                                 ColumnNo := 0;
//                             END;
//                     end;

//                     trigger OnPreDataItem()
//                     begin
//                         AssignmentCount := COUNT;
//                         RecordNo := 0;
//                     end;
//                 }

//                 trigger OnAfterGetRecord()
//                 var
//                     AssignPrintOptions: Record "CERP Assignment Print Options";
//                     ProductGroup: Record "5723";
//                     BarcodeMgmt: Codeunit "CERP Barcode Management";
//                     rBarcode: Record "CERP Barcode";
//                     Loc: Record "14";
//                 begin
//                     IF Item.GET("Item No.") THEN;

//                     fnPrintScannedDocs(DATABASE::"Shop/Work Order Line","Order No.","Line No.");

//                     AttributeMgmt.ShopCompAttributeArray("Component Doc. Type","Component Doc. No.","Component Line No.",aAttribute);

//                     AssignPrintDetail := AssignPrintOptions.GET(Item."Item Category Code",Item."Product Group Code",REPORT::"Shop Order") AND
//                                          (AssignPrintOptions.Print = AssignPrintOptions.Print::"Assignment Detail (PO & Shop Only)");

//                     // "Default Front Load Billing %" is used to total quantities in the Temp Table.
//                     IF tempProductGroup.GET(Item."Item Category Code",Item."Product Group Code")
//                       THEN
//                         BEGIN
//                           tempProductGroup."Default Front Load Billing %" := tempProductGroup."Default Front Load Billing %" + Quantity;
//                           tempProductGroup.MODIFY;
//                         END
//                       ELSE
//                         BEGIN
//                           tempProductGroup."Item Category Code" := Item."Item Category Code";
//                           tempProductGroup.Code := Item."Product Group Code";
//                           ProductGroup.GET(Item."Item Category Code",Item."Product Group Code");
//                           tempProductGroup.Description := ProductGroup.Description;
//                           tempProductGroup."Default Front Load Billing %" := Quantity;
//                           tempProductGroup.INSERT;
//                         END;

//                     IF NOT AssignPrintDetail
//                       THEN
//                         IF Assignments
//                           THEN tAssignList := AssignmentListByReport(REPORT::"Shop Order");

//                     IF PrintLineBarcodes
//                       THEN Barcode := BarcodeMgmt.GetBarcode(DATABASE::"Shop/Work Order Line","Order Type","Order No.",'',rBarcode.Level::Line,"Line No.",0,'','','','',0,0D,'',0,0,0,'','',0,0);

//                     IF Loc.GET("Location Code") AND Loc."Storage Location Tracking"
//                       THEN StagingOrStorageLocCaption := 'Storage Location'
//                       ELSE StagingOrStorageLocCaption := 'Staging Location';
//                 end;
//             }
//             dataitem(DataItem6030;Table5723)
//             {
//                 DataItemTableView = SORTING(Item Category Code,Code);
//                 column(ProdGroupRec;'True')
//                 {
//                 }
//                 column(Product_Group_Quantity; tempProductGroup."Default Front Load Billing %")
//                 {
//                     DecimalPlaces = 0:5;
//                 }
//                 column(Product_Group_Description; Description)
//                 {
//                 }
//                 column(Product_Group_Item_Category_Code; "Item Category Code")
//                 {
//                 }
//                 column(Product_Group_Code; Code)
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     IF NOT tempProductGroup.GET("Item Category Code",Code) OR (tempProductGroup."Default Front Load Billing %" = 0)
//                       THEN CurrReport.SKIP;
//                 end;
//             }
//             dataitem(AssignmentSummary;Integer)
//             {
//                 DataItemTableView = SORTING(Number);
//                 column(AssignSummary1_Assignment_Level_3;atempAssignComment[1]."Assignment Level 3")
//                 {
//                 }
//                 column(AssignSummary1_Comment;atempAssignComment[1].Comment)
//                 {
//                 }
//                 column(AssignSummary2_Comment;atempAssignComment[2].Comment)
//                 {
//                 }
//                 column(AssignSummary2_Assignment_Level_3;atempAssignComment[2]."Assignment Level 3")
//                 {
//                 }
//                 column(AssignSummary3_Comment;atempAssignComment[3].Comment)
//                 {
//                 }
//                 column(AssignSummary3_Assignment_Level_3;atempAssignComment[3]."Assignment Level 3")
//                 {
//                 }
//                 column(AssignSummary_Number; Number)
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 var
//                     i: Integer;
//                 begin
//                     IF Number = 1
//                       THEN tempAssignComment.FINDFIRST
//                       ELSE tempAssignComment.NEXT;

//                     RecordNo := RecordNo + 1;
//                     ColumnNo := ColumnNo + 1;

//                     atempAssignComment[ColumnNo] := tempAssignComment;

//                     IF RecordNo = AssignmentCount
//                       THEN
//                         BEGIN
//                           FOR i := ColumnNo + 1 TO 3 DO
//                               CLEAR(atempAssignComment[i]);
//                           ColumnNo := 0;
//                         END
//                       ELSE
//                         BEGIN
//                           IF ColumnNo = 3 THEN
//                             ColumnNo := 0;
//                         END;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     tempAssignComment.SETRANGE("Assignment Level 3");
//                     SETRANGE(Number,1,tempAssignComment.COUNT);

//                     AssignmentCount := COUNT;
//                     RecordNo := 0;
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             var
//                 BarcodeMgmt: Codeunit "CERP Barcode Management";
//                 rBarcode: Record "CERP Barcode";
//                 SalesHeader: Record "36";
//                 Contract: Record "37004501";
//             begin
//                 cERP.SetCompInfoToLocationInfo("Location Code",CompanyInformation);
//                 BEGIN
//                   FormatAddress.Company(CompanyAddress,CompanyInformation);
//                   FormatAddress.AddToArray(CompanyAddress,'Phone: ' + CompanyInformation."Phone No.");
//                   FormatAddress.AddToArray(CompanyAddress,'Fax: ' + CompanyInformation."Fax No.");
//                 END;

//                 CurrReport.PAGENO := 1;
//                 fnPrintScannedDocs(DATABASE::"Shop/Work Order","No.",0);

//                 IF PrintOrderBarcode
//                   THEN OrderBarcode := BarcodeMgmt.GetBarcode(DATABASE::"Shop/Work Order",Type,"No.",'',rBarcode.Level::Order,0,0,'','','','',0,0D,'',0,0,0,'','',0,0);

//                 //AI13.00 JPU 01042019 BEGIN - Print Job Description from SO or Contract
//                 IF "Shop/Work Order"."Sales Order No." <> '' THEN
//                   BEGIN
//                     IF SalesHeader.GET(SalesHeader."Document Type"::Order, "Shop/Work Order"."Sales Order No.") THEN
//                       JobDescription := SalesHeader."Contract Description";
//                   END
//                 ELSE
//                   JobDescription := "Shop/Work Order"."Contract Description";
//                 //AI13.00 JPU 01042019 END

//                 // Angelo Heart begin
//                 SalespersonCode := '';
//                 IF "Shop/Work Order"."Contract No." <> '' THEN
//                   IF Contract.GET("Shop/Work Order"."Contract No.", "Shop/Work Order"."Change Order No.") THEN
//                     SalespersonCode := Contract."Salesperson Code";

//                 IF "Shop/Work Order"."Sales Order No." <> '' THEN
//                   IF SalesHeader.GET(SalesHeader."Document Type"::Order, "Shop/Work Order"."Sales Order No.") THEN
//                     SalespersonCode := SalesHeader."Salesperson Code";
//                 // Angelo Heart End
//             end;

//             trigger OnPostDataItem()
//             begin
//                 IF (NOT CurrReport.PREVIEW) AND (Status = Status::Open)
//                   THEN
//                     BEGIN
//                       Status := Status::"In Process";
//                       MODIFY;
//                     END;
//             end;

//             trigger OnPreDataItem()
//             begin
//                 LastAttColumn := AttributeMgmt.AttributeArrayHeader(aAttributeHeader);
//                  CompanyInformation.GET;
//                  CompanyInformation.CALCFIELDS(Picture);
//             end;
//         }
//     }

//     requestpage
//     {
//         SaveValues = true;

//         layout
//         {
//             area(content)
//             {
//                 group(Options)
//                 {
//                     Caption = 'Options';
//                     field(PrintScannedDoc; PrintScannedDoc)
//                     {
//                         Caption = 'Print Scanned Documents';
//                     }
//                     field(PrintOrderBarcode; PrintOrderBarcode)
//                     {
//                         Caption = 'Print Order Barcode';
//                     }
//                     field(PrintLineBarcodes; PrintLineBarcodes)
//                     {
//                         Caption = 'Print Barcodes on Line';
//                     }
//                 }
//             }
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//         PAGENOCaptionLbl = 'Page:';
//         Shop_OrderCaptionLbl = 'Shop Order';
//         Shop_Order_No_CaptionLbl = 'Shop Order No.:';
//         Start_DateCaptionLbl = 'Start Date:';
//         DescriptionCaptionLbl = 'Description:';
//         End_DateCaptionLbl = 'End Date:';
//         Contract_Description_CaptionLbl = 'Contract Desc.:';
//         Start_By_Date_CaptionLbl = 'Start By Date:';
//         Due_Date_CaptionLbl = 'Due Date:';
//         QuantityCaptionLbl = 'Quantity:';
//         S_O_No_CaptionLbl = 'S/O No.:';
//         CustomerCaptionLbl = 'Customer:';
//         Serial_Nos_CaptionLbl = 'Serial Nos.';
//         Qty_usedCaptionLbl = 'Qty. used';
//         ComponentsCaptionLbl = 'Components';
//         Purchase_Order_No_CaptionLbl = 'Purchase Order No.';
//         Qty__Received_As_Of_CaptionLbl = 'Qty. Received As Of:';
//         DegreeCaptionLbl = 'Degree';
//         HeadingCaptionLbl = 'Heading';
//         Qty_CaptionLbl = 'Qty.';
//         SummaryCaptionLbl = 'Summary';
//         Product_Group_NameCaptionLbl = 'Product Group Name';
//         ContractNoCaptionLbl = 'Contract No.';
//         Assignment_Level_3_CaptionLbl = 'Opening';
//         Pages_CaptionLbl = 'Pages';
//         Shop_Work_Order_Line_Qty__FinishedCaption = 'Qty. Finished:';
//         DescriptionNoSemiColon_Caption = 'Description';
//     }

//     var
//         AssignArray: array [500] of Text[400];
//         PrintOn: Option ShopOrder,PurchaseOrder,"Picking Ticket","Packing Slip";
//         ConERPMgmt: Codeunit "37004501";
//         Item: Record Item;
//         PrintScannedDoc: Boolean;
//         cERP: Codeunit "37004861";
//         aAttribute: array [16] of Code[20];
//         aAttributeHeader: array [16] of Code[20];
//         AttributeMgmt: Codeunit "37004505";
//         LastAttColumn: Integer;
//         ColumnNo: Integer;
//         RecordNo: Integer;
//         aAssignTrans: array [3] of Record "37004541";
//         aAssign3: array [3] of Record "37004511";
//         AssignmentCount: Integer;
//         AssignPrintDetail: Boolean;
//         tempProductGroup: Record "5723" temporary;
//         tempAssignComment: Record "37004521" temporary;
//         atempAssignComment: array [3] of Record "37004521" temporary;
//         CompPOTemp: Record "39" temporary;
//         Addr: array [8,1] of Text[250];
//         NoOfRecords: Integer;
//         NoOfColumns: Integer;
//         i: Integer;
//         OutputNo: Integer;
//         tAssignList: Text;
//         PrintLineBarcodes: Boolean;
//         PrintOrderBarcode: Boolean;
//         Barcode: Code[20];
//         OrderBarcode: Code[20];
//         CompanyInformation: Record "79";
//         FormatAddress: Codeunit "365";
//         CompanyAddress: array [8] of Text[50];
//         StagingOrStorageLocCaption: Text;
//         JobDescription: Text;
//         SalespersonCode: Code[20];

//     procedure fnPrintScannedDocs(TableID: Integer;ShopOrderNo: Code[20];LineNo: Integer)
//     var
//         ScannedDoc: Record "37004539";
//         ScannedDocMgmt: Codeunit "CERP Assignment";
//     begin
//         IF NOT PrintScannedDoc OR CurrReport.PREVIEW
//           THEN EXIT;

//         ScannedDoc.SETRANGE("Table ID",TableID);
//         ScannedDoc.SETRANGE("No.",ShopOrderNo);
//         ScannedDoc.SETRANGE("Document Line No.",LineNo);
//         IF ScannedDoc.FINDFIRST
//           THEN
//             REPEAT
//               ScannedDocMgmt.Print(ScannedDoc);
//             UNTIL ScannedDoc.NEXT = 0;
//     end;

//     procedure AddToAssignSummary(Assign3: Code[30])
//     var
//         NextLineNo: Integer;
//     begin

//         tempAssignComment.SETRANGE("Assignment Level 3",Assign3);
//         IF tempAssignComment.FINDLAST
//           THEN
//             BEGIN
//               IF STRLEN(tempAssignComment.Comment) + STRLEN(Assign3) + 2 < 30
//                 THEN
//                   BEGIN
//                     tempAssignComment.Comment := tempAssignComment.Comment + ', ' + FORMAT(CurrReport.PAGENO);
//                     tempAssignComment.MODIFY;
//                     EXIT;
//                   END
//                 ELSE
//                   NextLineNo := tempAssignComment."Line No." + 10000;
//             END
//           ELSE NextLineNo := 10000;

//         tempAssignComment.INIT;
//         tempAssignComment."Assignment Level 3" := Assign3;
//         tempAssignComment.Comment := FORMAT(CurrReport.PAGENO);
//         tempAssignComment."Line No." := NextLineNo;
//         tempAssignComment.INSERT;
//     end;

//     procedure UpdateCompPOTemp(OrderNo: Code[20];Qty: Decimal)
//     begin
//         IF NOT CompPOTemp.GET(CompPOTemp."Document Type"::Order,OrderNo,0)
//           THEN
//             BEGIN
//               CompPOTemp.INIT;
//               CompPOTemp."Document Type" := CompPOTemp."Document Type"::Order;
//               CompPOTemp."Document No." := OrderNo;
//               CompPOTemp.INSERT;
//             END;
//         CompPOTemp.Quantity := CompPOTemp.Quantity + Qty;
//         CompPOTemp.MODIFY;
//     end;
// }
