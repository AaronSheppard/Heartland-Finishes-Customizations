// report 50004 "HF CD Picking Ticket HL"
// {
//     // version AI13.00,HL

//     // 06/03 SMS ADDED CODE TO PRINT SHELF/BIN OR COMMON ITEM NO FROM ITEM CARD BASED ON LOCATION CODE ON SALES LINE
//     //           ALSO NOT PRINTING SHELF/BIN IF LINE IS SPECIAL ORDER OR DROP SHIP
//     // 07/05 SMS CHANGED LOCATION LOOP 'NEW PAGE PER RECORD' PROPERTY TO 'YES'
//     DefaultLayout = RDLC;
//     RDLCLayout = '.vscode/src/Reports/Layouts/CD Picking Ticket HL.rdlc';

//     dataset
//     {
//         dataitem(DataItem6004; Table14)
//         {
//             DataItemTableView = SORTING(Code);

//             trigger OnAfterGetRecord()
//             begin
//                 TempLocation := Location;
//                 TempLocation.INSERT;
//             end;

//             trigger OnPreDataItem()
//             begin
//                 CompanyInformation.GET('');
//                 CompanyInformation.CALCFIELDS(CompanyInformation.Picture);
//                 FormatAddress.Company(CompanyAddress, CompanyInformation);
//                 FormatAddress.AddToArray(CompanyAddress, 'Phone: ' + CompanyInformation."Phone No.");
//                 FormatAddress.AddToArray(CompanyAddress, 'Fax: ' + CompanyInformation."Fax No.");

//                 TempLocation.Code := '';
//                 TempLocation.Name := Text000;
//                 TempLocation.INSERT;
//                 IF NOT READPERMISSION THEN
//                     CurrReport.BREAK;
//             end;
//         }
//         dataitem("Sales Header"; "Sales Header")
//         {
//             DataItemTableView = SORTING("Document Type", "No.")
//                                 WHERE("Document Type" = CONST(Order));
//             RequestFilterFields = "No.", "Sell-to Customer No.";
//             column(Sales_Header_Document_Type; "Document Type")
//             {
//             }
//             column(Sales_Header_No_; "No.")
//             {
//             }
//             column(RouteLbl; RouteLbl)
//             {
//             }
//             column(NoPrinted; "Sales Header"."No. Printed On Pick")
//             {
//             }
//             column(CompanyInformation_Picture; CompanyInformation.Picture)
//             {
//             }
//             dataitem(LocationLoop; Integer)
//             {
//                 DataItemTableView = SORTING(Number);
//                 PrintOnlyIfDetail = true;
//                 dataitem(CopyNo; Integer)
//                 {
//                     DataItemTableView = SORTING(Number);
//                     column(CopyRec; 'True')
//                     {
//                     }
//                     column(CopyNo; OutputNo)
//                     {
//                     }
//                     column(CopyTxt; CopyTxt)
//                     {
//                     }
//                     dataitem(PageLoop; Integer)
//                     {
//                         DataItemTableView = SORTING(Number)
//                                             WHERE(Number = CONST(1));
//                         PrintOnlyIfDetail = true;
//                         column(Sales_Header_No; "Sales Header"."No.")
//                         {
//                         }
//                         column(Sales_Header_Order_Date; "Sales Header"."Order Date")
//                         {
//                         }
//                         column(Sales_Header_Sell_to_Customer_No; "Sales Header"."Sell-to Customer No.")
//                         {
//                         }
//                         column(SalesPurchPerson_Name; SalesPurchPerson.Name)
//                         {
//                         }
//                         column(ShipToAddress_1; ShipToAddress[1])
//                         {
//                         }
//                         column(ShipToAddress_2; ShipToAddress[2])
//                         {
//                         }
//                         column(ShipToAddress_3; ShipToAddress[3])
//                         {
//                         }
//                         column(ShipToAddress_4; ShipToAddress[4])
//                         {
//                         }
//                         column(ShipToAddress_5; ShipToAddress[5])
//                         {
//                         }
//                         column(ShipToAddress_6; ShipToAddress[6])
//                         {
//                         }
//                         column(Sales_Header_Shipment_Date; ShipDate)
//                         {
//                         }
//                         column(Address_1; Address[1])
//                         {
//                         }
//                         column(Address_2; Address[2])
//                         {
//                         }
//                         column(Address_3; Address[3])
//                         {
//                         }
//                         column(Address_4; Address[4])
//                         {
//                         }
//                         column(Address_5; Address[5])
//                         {
//                         }
//                         column(Address_6; Address[6])
//                         {
//                         }
//                         column(ShippingAgentName; ShippingAgent.Name)
//                         {
//                         }
//                         column(ShippingAgentServiceCode; ShippingAgentService.Code)
//                         {
//                         }
//                         column(TempLocation_Code; TempLocation.Code)
//                         {
//                         }
//                         column(Sales_Header_Contract_No_And_Change_Order_No; "Sales Header"."Contract No.")
//                         {
//                         }
//                         column(Sales_Header_Contract_Description; "Sales Header"."Contract Description")
//                         {
//                         }
//                         column(Sales_Header_External_Document_No; "Sales Header"."External Document No.")
//                         {
//                         }
//                         column(ProjMgr; ProjMgr)
//                         {
//                         }
//                         column(CompanyAddress_1; CompanyAddress[1])
//                         {
//                         }
//                         column(CompanyAddress_2; CompanyAddress[2])
//                         {
//                         }
//                         column(CompanyAddress_3; CompanyAddress[3])
//                         {
//                         }
//                         column(CompanyAddress_4; CompanyAddress[4])
//                         {
//                         }
//                         column(CompanyAddress_5; CompanyAddress[5])
//                         {
//                         }
//                         column(CompanyAddress_6; CompanyAddress[6])
//                         {
//                         }
//                         column(OutputNo; OutputNo)
//                         {
//                         }
//                         column(PageLoop_Number; Number)
//                         {
//                         }
//                         column(SchGroupAndRoute; "Sales Header".GETFILTER("Sch. Code Filter") + ' ' + "Sales Header".GETFILTER("Sch. Route Filter"))
//                         {
//                         }
//                         column(OrderBarcode; OrderBarcode)
//                         {
//                         }
//                         column(PrimaryQty; PrimaryQty)
//                         {
//                         }
//                         column(StagingOrStorageLocCaption; StagingOrStorageLocCaption)
//                         {
//                         }
//                         dataitem("Sales Line"; "Sales Line")
//                         {
//                             CalcFields = Assignments;
//                             DataItemLink = "Document Type" = FIELD("Document Type"),
//                                            "Document No." = FIELD("No.");
//                             DataItemLinkReference = "Sales Header";
//                             DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")
//                                                 WHERE(Type = FILTER(' ' | Item | Resource | G/L Account),
//                                                       Drop Shipment=CONST(No));
//                             RequestFilterFields = "Shipment Date";
//                             column(Item_Shelf_No; Item."Shelf No.")
//                             {
//                             }
//                             column(Sales_Line_No; "No.")
//                             {
//                             }
//                             column(Sales_Line_Unit_of_Measure; "Unit of Measure")
//                             {
//                                 IncludeCaption = true;
//                             }
//                             column(Sales_Line_Quantity; Quantity)
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(Sales_Line_Qty_to_Ship; QtyToShip)
//                             {
//                                 DecimalPlaces = 0 : 5;
//                                 IncludeCaption = false;
//                             }
//                             column(Sales_Line_Quantity_Shipped; "Quantity Shipped")
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(Sales_Line_Variant_Code; "Variant Code")
//                             {
//                             }
//                             column(StagingOrStorageLoc; StagingOrStorageLocations)
//                             {
//                                 DecimalPlaces = 2 : 5;
//                             }
//                             column(Submittal_Description_And_DescToPrint; "Submittal Description" + ' ' + DescToPrint)
//                             {
//                             }
//                             column(Sales_Line_Type; Type)
//                             {
//                             }
//                             column(Sales_Line_Document_Type; "Document Type")
//                             {
//                             }
//                             column(Sales_Line_Document_No; "Document No.")
//                             {
//                             }
//                             column(Sales_Line_Line_No; "Line No.")
//                             {
//                             }
//                             dataitem(SalesLineComment; "Sales Comment Line")
//                             {
//                                 DataItemLink = "Document Type" = FIELD("Document Type"),
//                                                "No." = FIELD("Document No."),
//                                                "Document Line No." = FIELD("Line No.");
//                                 DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.")
//                                                     WHERE(Print On Pick Ticket=CONST(Yes));
//                                 column(SalesLineComment_Comment; Comment)
//                                 {
//                                 }
//                                 column(SalesLineComment_Document_Type; "Document Type")
//                                 {
//                                 }
//                                 column(SalesLineComment_No; "No.")
//                                 {
//                                     IncludeCaption = true;
//                                 }
//                                 column(SalesLineComment_Document_Line_No; "Document Line No.")
//                                 {
//                                 }
//                                 column(SalesLineComment_Line_No; "Line No.")
//                                 {
//                                 }
//                             }
//                             dataitem("Serial No. Transaction"; "CERP Serial No. Transaction")
//                             {
//                                 DataItemLink = "Document Type" = FIELD("Document Type"),
//                                                "Document No." = FIELD("Document No."),
//                                                "Document Line No." = FIELD("Line No.");
//                                 DataItemTableView = SORTING("Table ID", "Document Type", "Template Name", "Document No.", "Document Line No.", "Component Line No.", "Line No.")
//                                                     WHERE(Table ID=CONST(37),
//                                                           Template Name=FILTER(''),
//                                                           Component Line No.=CONST(0),
//                                                           Handle on Next Post=CONST(Yes));
//                                 column(Serial_No_Addr_4_1;Addr[4][1])
//                                 {
//                                 }
//                                 column(Serial_No_Addr_3_1;Addr[3][1])
//                                 {
//                                 }
//                                 column(Serial_No_Addr_2_1;Addr[2][1])
//                                 {
//                                 }
//                                 column(Serial_No_Addr_1_1;Addr[1][1])
//                                 {
//                                 }
//                                 column(Serial_No_ColumnNo; ColumnNo)
//                                 {
//                                 }
//                                 column(Serial_No_Transaction_Table_ID; "Table ID")
//                                 {
//                                 }
//                                 column(Serial_No_Transaction_Document_Type; "Document Type")
//                                 {
//                                 }
//                                 column(Serial_No_Transaction_Template_Name; "Template Name")
//                                 {
//                                 }
//                                 column(Serial_No_Transaction_Document_No; "Document No.")
//                                 {
//                                 }
//                                 column(Serial_No_Transaction_Document_Line_No; "Document Line No.")
//                                 {
//                                 }
//                                 column(Serial_No_Transaction_Component_Line_No; "Component Line No.")
//                                 {
//                                 }
//                                 column(Serial_No_Transaction_Line_No; "Line No.")
//                                 {
//                                 }

//                                 trigger OnAfterGetRecord()
//                                 begin
//                                     RecordNo := RecordNo + 1;
//                                     ColumnNo := ColumnNo + 1;

//                                     Addr[ColumnNo][1] := FORMAT("Serial No.");

//                                     COMPRESSARRAY(Addr[ColumnNo]);

//                                     IF RecordNo = NoOfRecords THEN BEGIN
//                                       FOR i := ColumnNo + 1 TO NoOfColumns DO
//                                         CLEAR(Addr[i]);
//                                       ColumnNo := 0;
//                                     END ELSE BEGIN
//                                       IF ColumnNo = NoOfColumns THEN
//                                         ColumnNo := 0;
//                                     END;
//                                 end;

//                                 trigger OnPreDataItem()
//                                 begin
//                                     NoOfRecords := COUNT;
//                                     NoOfColumns := 4;
//                                     RecordNo := 0;
//                                 end;
//                             }
//                             dataitem(DataItem9527;"CERP Component")
//                             {
//                                 DataItemLink = "Document Type"=FIELD("Document Type"),
//                                                "Document No."=FIELD("Document No."),
//                                                Line No.=FIELD("Line No.");
//                                 DataItemTableView = SORTING("Document Type",Document No.,Line No.,Type)
//                                                     WHERE(Type=CONST(Item),
//                                                           Blocked=CONST(No));
//                                 column(Component_No; "No.")
//                                 {
//                                 }
//                                 column(Component_DescToPrint; DescToPrint)
//                                 {
//                                 }
//                                 column(Component_Qty_Per;'Qty. Per: ' + FORMAT("Qty. Per"))
//                                 {
//                                     DecimalPlaces = 0:5;
//                                 }
//                                 column(Component_Total_Qty;"Sales Line"."Qty. to Ship" * "Qty. Per")
//                                 {
//                                     DecimalPlaces = 0:5;
//                                 }
//                                 column(Component_Qty_Shipped;"Sales Line"."Quantity Shipped" * "Qty. Per")
//                                 {
//                                     DecimalPlaces = 0:5;
//                                 }
//                                 column(Component_StagingOrStorageLoc; StagingOrStorageLocations)
//                                 {
//                                     DecimalPlaces = 2:5;
//                                 }
//                                 column(Component_Document_Type; "Document Type")
//                                 {
//                                 }
//                                 column(Component_Document_No; "Document No.")
//                                 {
//                                 }
//                                 column(Component_Line_No; "Line No.")
//                                 {
//                                 }
//                                 column(Component_Component_Line_No; "Component Line No.")
//                                 {
//                                 }

//                                 trigger OnAfterGetRecord()
//                                 var
//                                     ProdGroup: Record "5723";
//                                 begin
//                                     //AI13.00 JPU 01172019 BEGIN
//                                     //IF ("Sales Line"."Manufacturing Code" <> "Sales Line"."Manufacturing Code"::Kit) OR
//                                     IF (NOT (ProdGroup.GET(Component."Item Category Code", Component."Product Group Code") AND ProdGroup."Print Item Comp on Pick")) OR
//                                     //AI13.00 JPU 01172019 END
//                                        ("Sales Line"."Packaged Sale")  //AI13.00 SLB 03/14/18 - added second condition
//                                       THEN CurrReport.SKIP;
//                                 end;
//                             }
//                             dataitem(AttributeComps;"CERP Component")
//                             {
//                                 DataItemLink = "Document Type"=FIELD("Document Type"),
//                                                "Document No."=FIELD("Document No."),
//                                                Line No.=FIELD("Line No.");
//                                 DataItemTableView = SORTING("Document Type",Document No.,Line No.,Type)
//                                                     WHERE(Attribute Value=FILTER(<>''&<>BLANK VALUE),
//                                                           Blocked=CONST(No));
//                                 column(AttributeComps_Attribute_Code; "Attribute Code")
//                                 {
//                                 }
//                                 column(AttributeComps_No; "No.")
//                                 {
//                                 }
//                                 column(AttributeComps_DescToPrint; DescToPrint)
//                                 {
//                                 }
//                                 column(AttributeComps_Document_Type; "Document Type")
//                                 {
//                                 }
//                                 column(AttributeComps_Document_No; "Document No.")
//                                 {
//                                 }
//                                 column(AttributeComps_Line_No; "Line No.")
//                                 {
//                                 }
//                                 column(AttributeComps_Component_Line_No; "Component Line No.")
//                                 {
//                                 }

//                                 trigger OnAfterGetRecord()
//                                 begin
//                                     IF NOT cERP.PrintAttribute("Attribute Code","Sales Line"."Item Category Code",
//                                                                      "Sales Line"."Product Group Code",PrintOn::"Picking Ticket")
//                                       THEN CurrReport.SKIP;
//                                 end;
//                             }
//                             dataitem(Assignments;Integer)
//                             {
//                                 DataItemTableView = SORTING(Number);
//                                 column(AssignArray_Number;AssignArray[Number])
//                                 {
//                                 }
//                                 column(Assignments_Number; Number)
//                                 {
//                                 }

//                                 trigger OnAfterGetRecord()
//                                 begin
//                                     IF AssignArray[Number] = ''
//                                       THEN SETRANGE(Number,1,Number);
//                                 end;

//                                 trigger OnPreDataItem()
//                                 begin
//                                     CLEAR(AssignArray);
//                                     SETRANGE(Number,1,ARRAYLEN(AssignArray,1));
//                                     IF "Sales Line".Assignments
//                                       THEN "Sales Line".AssignmentArrayByReport(REPORT::"CD Picking Ticket",TRUE,120,AssignArray);
//                                 end;
//                             }

//                             trigger OnAfterGetRecord()
//                             var
//                                 Purchasing: Record "5721";
//                             begin
//                                 IF CheckPackageSaleSkip THEN
//                                     CurrReport.SKIP;  //AI13.00 CERP-449 SLB 08/15/18
//                                 //AI13.00 JPU 11192018 BEGIN - Moved in PageLoop dataitem
//                                 /*
//                                 //AI9.01.01 JPU 02222018 BEGIN
//                                 IF HasProcessed1stLine THEN
//                                   CLEAR(CompanyInformation)
//                                 ELSE
//                                   HasProcessed1stLine := TRUE;
//                                 //AI9.01.01 JPU 02222018 END
//                                 */
//                                 //AI13.00 JPU 11192018 END

//                                 QtyToShip := 0; //AI9.00.02 JPU 08192016

//                                 IF "Location Code" <> TempLocation.Code  //NAVFIX
//                                     THEN CurrReport.SKIP;

//                                 IF ("Purchasing Code" <> '')
//                                   THEN
//                                     IF Purchasing.GET("Purchasing Code") AND Purchasing."Direct Ship from Contract"
//                                       THEN CurrReport.SKIP;

//                                 CLEAR(Item);

//                                 IF Type = Type::" "
//                                   THEN EXIT;

//                                 IF "Outstanding Quantity" = 0
//                                   THEN EXIT;

//                                 IF GETFILTER("Sch. Route Filter") <> ''
//                                   THEN
//                                     BEGIN
//                                       CALCFIELDS("Delivery Route Qty.");
//                                       IF "Delivery Route Qty." = 0
//                                         THEN CurrReport.SKIP;
//                                       QtyToShip := "Delivery Route Qty.";
//                                     END
//                                   ELSE
//                                     QtyToShip := "Qty. to Ship";

//                                 IF (Type = Type::Item)
//                                   THEN Item.GET("No.");
//                                 // Angelo Begin
//                                 IF (Type = Type::Item) THEN
//                                   IF StockkeepingUnit.GET("Location Code","No.","Variant Code") THEN
//                                     IF StockkeepingUnit."Shelf No." <> '' THEN
//                                       Item."Shelf No." := StockkeepingUnit."Shelf No.";
//                                 // Angelo End

//                             end;

//                             trigger OnPreDataItem()
//                             begin
//                                 //SETRANGE("Location Code",TempLocation.Code);  //NAVFIX
//                                 IF NOT IncludeCostOnlyItems
//                                   THEN SETRANGE("Contract Cost Only Item",FALSE);

//                                 "Sales Header".COPYFILTER("Sch. Date Filter","Sch. Date Filter");
//                                 "Sales Header".COPYFILTER("Sch. Code Filter","Sch. Code Filter");
//                                 "Sales Header".COPYFILTER("Sch. Route Filter","Sch. Route Filter");
//                             end;
//                         }
//                         dataitem(DataItem8541;"Sales Comment Line")
//                         {
//                             DataItemLink = "No."=FIELD("No.");
//                             DataItemLinkReference = "Sales Header";
//                             DataItemTableView = SORTING("Document Type",No.,Document Line No.,Line No.)
//                                                 WHERE("Document Type"=CONST(Order),
//                                                       Print On Pick Ticket=CONST(Yes),
//                                                       "Document Line No."=CONST(0));
//                             column(SalesCommentLineRec;'True')
//                             {
//                             }
//                             column(Sales_Comment_Line_Comment; Comment)
//                             {
//                             }
//                             column(Sales_Comment_Line_Document_Type; "Document Type")
//                             {
//                             }
//                             column(Sales_Comment_Line_No; "No.")
//                             {
//                             }
//                             column(Sales_Comment_Line_Document_Line_No; "Document Line No.")
//                             {
//                             }
//                             column(Sales_Comment_Line_Line_No; "Line No.")
//                             {
//                             }
//                         }

//                         trigger OnAfterGetRecord()
//                         begin
//                             //AI13.00 JPU 11192018 BEGIN
//                             IF HasProcessed1stLine THEN
//                               CLEAR(CompanyInformation)
//                             ELSE
//                               HasProcessed1stLine := TRUE;
//                             //AI13.00 JPU 11192018 END
//                         end;
//                     }

//                     trigger OnAfterGetRecord()
//                     begin
//                         CurrReport.PAGENO := 1;
//                         // >> CEL
//                         IF Number > 1 THEN
//                           IF ISSERVICETIER THEN
//                             OutputNo += 1;
//                         // << CEL

//                         //CRY JPU 01122016 BEGIN - Increase custom field No. Printed on Packing list
//                         IF NOT CurrReport.PREVIEW THEN BEGIN
//                           "Sales Header"."No. Printed On Pick" += 1;
//                           "Sales Header".MODIFY;
//                         END;
//                         //CRY JPU 01122016 END
//                     end;

//                     trigger OnPreDataItem()
//                     begin
//                         SETRANGE(Number,1,1 + ABS(NoCopies));
//                         // >> CEL
//                         IF ISSERVICETIER THEN
//                           OutputNo := 1;
//                         // << CEL
//                     end;
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     IF Number = 1 THEN
//                       TempLocation.FINDFIRST
//                     ELSE
//                       TempLocation.NEXT;

//                     IF NOT AnySalesLinesThisLocation(TempLocation.Code) THEN
//                       CurrReport.SKIP;
//                     // Angelo Begin
//                     cERP.SetCompInfoToLocationInfo(TempLocation.Code,CompanyInformation);
//                     FormatAddress.Company(CompanyAddress,CompanyInformation);
//                     FormatAddress.AddToArray(CompanyAddress,'Phone: ' + CompanyInformation."Phone No.");
//                     FormatAddress.AddToArray(CompanyAddress,'Fax: ' + CompanyInformation."Fax No.");
//                     // Angelo End

//                     IF TempLocation."Storage Location Tracking"
//                       THEN StagingOrStorageLocCaption := 'Storage Location'
//                       ELSE StagingOrStorageLocCaption := 'Staging Location';
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     SETRANGE(Number,1,TempLocation.COUNT);
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             var
//                 BarcodeMgmt: Codeunit "CERP Barcode Management";
//                 rBarcode: Record "CERP Barcode";
//                 DelMgmt: Codeunit "37013083";
//             begin
//                 //AI6.01 Teming
//                 IF SalesSetup."Enable Mgmt. Approval" AND SalesSetup."Approval Controls Picking" THEN
//                   BEGIN
//                     CALCFIELDS("Order Needs Approval");
//                     IF "Order Needs Approval" THEN
//                       BEGIN
//                         MESSAGE(Text37012900, "Document Type","No.");
//                         CurrReport.SKIP;
//                       END;
//                     IF Status = Status::Open THEN
//                       BEGIN
//                         MESSAGE(Text37012901, "Document Type","No.");
//                         CurrReport.SKIP;
//                       END;
//                   END;
//                 //AI6.01 end

//                 IF "Project Manager" = '' THEN
//                   CLEAR(ProjMgr)
//                 ELSE
//                   BEGIN
//                     SalesPurchPerson.GET("Project Manager");
//                     ProjMgr := SalesPurchPerson.Name;
//                   END;

//                 IF "Salesperson Code" = '' THEN
//                   CLEAR(SalesPurchPerson)
//                 ELSE
//                   SalesPurchPerson.GET("Salesperson Code");

//                 //AI9.01 JPU 07172017 BEGIN - Show Shipping Agent instead
//                 /*
//                 IF "Shipment Method Code" = '' THEN
//                   CLEAR(ShipmentMethod)
//                 ELSE
//                   ShipmentMethod.GET("Shipment Method Code");
//                 */
//                 IF "Shipping Agent Code" = '' THEN
//                   CLEAR(ShippingAgent)
//                 ELSE
//                   ShippingAgent.GET("Shipping Agent Code");

//                 IF "Sales Header"."Shipping Agent Service Code" = '' THEN
//                   CLEAR(ShippingAgentService)
//                 ELSE
//                   IF ShippingAgentService.GET("Shipping Agent Code", "Shipping Agent Service Code") THEN;
//                 //AI9.01 JPU 07172017 END

//                 IF "Payment Terms Code" = '' THEN
//                   CLEAR(PaymentTerms)
//                 ELSE
//                   PaymentTerms.GET("Payment Terms Code");

//                 FormatAddress.SalesHeaderBillTo(Address,"Sales Header");
//                 FormatAddress.SalesHeaderShipTo(ShipToAddress,Address,"Sales Header");
//                 PrintFooter := FALSE;
//                 CurrReport.PAGENO := 1;

//                 IF GETFILTER("Sch. Date Filter") <> ''
//                   THEN ShipDate := GETFILTER("Sch. Date Filter")
//                   ELSE ShipDate := FORMAT("Sales Header"."Shipment Date");

//                 IF PrintOrderBarcode
//                   THEN OrderBarcode := BarcodeMgmt.GetBarcode(DATABASE::"Sales Header","Document Type","No.",'',rBarcode.Level::Order,0,0,'','','','',0,SchDate,SchCode,SchRoute,0,0,'','',0,0);

//                 IF cERPSetup."Use Primary Qty."
//                   THEN
//                     BEGIN
//                       IF (GETFILTER("Sch. Code Filter") = '') AND (GETFILTER("Sch. Date Filter") = '') AND (GETFILTER("Sch. Route Filter") = '')
//                         THEN PrimaryQty := DelMgmt.PrimaryQtyToShip("Document Type","No.")
//                         ELSE PrimaryQty := DelMgmt.PrimaryQty(FORMAT("Document Type"),"No.",GETFILTER("Sch. Code Filter"),GETFILTER("Sch. Date Filter"),GETFILTER("Sch. Route Filter"));
//                     END;

//             end;

//             trigger OnPreDataItem()
//             begin
//                 SalesSetup.GET;
//                 cERPSetup.GET;

//                 IF GETFILTER("Sch. Route Filter") <> ''
//                   THEN
//                     BEGIN
//                       RouteLbl := 'Route:';
//                       EVALUATE(SchDate,GETFILTER("Sch. Date Filter"));
//                       SchCode := GETFILTER("Sch. Code Filter");
//                       EVALUATE(SchRoute,GETFILTER("Sch. Route Filter"));
//                     END;
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
//                     field(NoCopies; NoCopies)
//                     {
//                         Caption = 'Number of Copies';
//                         MaxValue = 9;
//                         MinValue = 0;
//                     }
//                     field(IncludeCostOnlyItems; IncludeCostOnlyItems)
//                     {
//                         Caption = 'Include Cost Only Items';
//                     }
//                     field(PrintOrderBarcode; PrintOrderBarcode)
//                     {
//                         Caption = 'Print Order Barcode';
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
//         PickedCaptionLbl = 'Picked';
//         Order_Date_CaptionLbl = 'Order Date:';
//         Order_No_CaptionLbl = 'Order Number:';
//         PAGENOCaptionLbl = 'Page:';
//         Quantity_ShippedCaptionLbl = 'Quantity Shipped';
//         Customer_No_CaptionLbl = 'Customer No:';
//         Ship_Date_CaptionLbl = 'Ship Date:';
//         SalesPerson_CaptionLbl = 'Salesperson:';
//         QuantityOrdered_CaptionLbl = 'Quantity Ordered';
//         Ship_To_CaptionLbl = 'Ship To:';
//         PICKING_TICKETCaptionLbl = 'PICKING TICKET';
//         Item_No_Spec_Inst_CaptionLbl = 'Item No./Special Inst.';
//         Shipping_Agent_Code_CaptionLbl = 'Ship Via:';
//         Item_Shelf_No_CaptionLbl = 'Shelf No.';
//         pLocation_CodeCaptionLbl = 'Location:';
//         Sold_To_CaptionLbl = 'Sold To:';
//         ContractNo_CaptionLbl = 'Contract No.:';
//         Staging_LocationCaptionLbl = 'Staging Location';
//         Job_Name_CaptionLbl = 'Job Name:';
//         Cust_PO_No_CaptionLbl = 'Cust PO No:';
//         Project_Mgr_CaptionLbl = 'Project Mgr:';
//         Serial_Nos_CaptionLbl = 'Serial Nos.';
//         ComponentCaptionLbl = 'Component';
//         AttributeCaptionLbl = 'Attribute';
//         AssignCaptionLbl = 'Assign';
//         QtyToShipLbl = 'Qty. to Ship';
//         PrimaryQtyLbl = 'Primary Qty:';
//         CopyNoLbl = 'Copy #:';
//         ShippingAgentServiceCaption = 'Ship. Agent Service:';
//     }

//     var
//         CompanyInformation: Record "79";
//         ShipmentMethod: Record "10";
//         PaymentTerms: Record "3";
//         Item: Record Item;
//         SalesPurchPerson: Record "13";
//         TempLocation: Record "14" temporary;
//         FormatAddress: Codeunit "365";
//         Address: array [8] of Text[50];
//         ShipToAddress: array [8] of Text[50];
//         SerialNoText: Text[30];
//         PrintFooter: Boolean;
//         NoCopies: Integer;
//         Text000: Label 'No Location Code';
//         ShelfNo: Code[20];
//         ProjMgr: Text[50];
//         AssignArray: array [500] of Text[400];
//         CompanyAddress: array [8] of Text[50];
//         ConERPMgmt: Codeunit "37004501";
//         PrintOn: Option ShopOrder,PurchaseOrder,"Picking Ticket","Packing Slip";
//         cERP: Codeunit "37004861";
//         Addr: array [8,1] of Text[250];
//         NoOfRecords: Integer;
//         RecordNo: Integer;
//         NoOfColumns: Integer;
//         ColumnNo: Integer;
//         i: Integer;
//         Text37012900: Label '%1 %2 needs Mgmt. Approval';
//         SalesSetup: Record "311";
//         Type: Option " ","G/L Account",Item,Resource,"Fixed Asset","Charge (Item)";
//         OutputNo: Integer;
//         Text37012901: Label 'Please release %1 %2';
//         IncludeCostOnlyItems: Boolean;
//         StockkeepingUnit: Record "5700";
//         QtyToShip: Decimal;
//         RouteLbl: Text;
//         ShipDate: Text;
//         OrderBarcode: Code[30];
//         PrintOrderBarcode: Boolean;
//         SchDate: Date;
//         SchCode: Code[20];
//         SchRoute: Integer;
//         PrimaryQty: Decimal;
//         cERPSetup: Record "37004502";
//         ShippingAgent: Record "Shipping Agent";
//         ShippingAgentService: Record "5790";
//         StagingOrStorageLocCaption: Text;
//         HasProcessed1stLine: Boolean;
//         CopyTxt: Text[10];

//     procedure AnySalesLinesThisLocation(LocationCode: Code[10]): Boolean
//     var
//         SalesLine2: Record "37";
//     begin
//         WITH SalesLine2 DO BEGIN
//           SETCURRENTKEY("Document Type",Type,"No.","Variant Code","Drop Shipment","Location Code");
//           SETRANGE("Document Type","Sales Header"."Document Type");
//           SETRANGE("Document No.","Sales Header"."No.");
//           //SETRANGE(Type,Type::Item);  //NAVFIX
//           SETRANGE("Location Code",LocationCode);
//           EXIT(FINDFIRST);
//         END;
//     end;

//     local procedure CheckPackageSaleSkip(): Boolean
//     var
//         ConfigSetup: Record "CERP Configurator Setup";
//         PkgSaleMgmt: Codeunit "37013600";
//         ParentPkgLine: Record "37";
//     begin
//         //AI13.00 CERP-449 SLB 08/15/18
//         IF ("Sales Line"."Package Line No." <> 0) THEN BEGIN
//           PkgSaleMgmt.InitFiltersForParent("Sales Line"."Document Type","Sales Line"."Document No.","Sales Line"."Package Line No.",ParentPkgLine);
//           IF ParentPkgLine.FINDSET AND (NOT ParentPkgLine."Print Detail Lines on Pick") THEN
//             EXIT(TRUE);
//         END;
//         EXIT(FALSE);
//     end;
// }
