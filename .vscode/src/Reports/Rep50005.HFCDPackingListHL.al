// report 50005 "HF CD Packing List HL"
// {
//     // version AI13.01,HL

//     // 06/03 SMS ADDED CODE TO PRINT SHELF/BIN OR COMMON ITEM NO FROM ITEM CARD BASED ON LOCATION CODE ON SALES LINE
//     //           ALSO NOT PRINTING SHELF/BIN IF LINE IS SPECIAL ORDER OR DROP SHIP
//     DefaultLayout = RDLC;
//     RDLCLayout = '.vscode/src/Reports/Layouts/CD Packing List HL.rdlc';

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
//             column(Document_Type; "Document Type")
//             {
//             }
//             column(Document_No; "No.")
//             {
//             }
//             column(Order_Date; "Order Date")
//             {
//             }
//             column(Sell_to_Customer_No; "Sell-to Customer No.")
//             {
//             }
//             column(Shipment_Date; ShipDate)
//             {
//             }
//             column(CompanyInformation_Picture; CompanyInformation.Picture)
//             {
//             }
//             column(SalesPurchPerson_Name; SalesPurchPerson.Name)
//             {
//             }
//             column(ShipToAddress_1; ShipToAddress[1])
//             {
//             }
//             column(ShipToAddress_2; ShipToAddress[2])
//             {
//             }
//             column(ShipToAddress_3; ShipToAddress[3])
//             {
//             }
//             column(ShipToAddress_4; ShipToAddress[4])
//             {
//             }
//             column(ShipToAddress_5; ShipToAddress[5])
//             {
//             }
//             column(ShipToAddress_6; ShipToAddress[6])
//             {
//             }
//             column(ShipToAddress_7; ShipToAddress[7])
//             {
//             }
//             column(Address_1; Address[1])
//             {
//             }
//             column(Address_2; Address[2])
//             {
//             }
//             column(Address_3; Address[3])
//             {
//             }
//             column(Address_4; Address[4])
//             {
//             }
//             column(Address_5; Address[5])
//             {
//             }
//             column(Address_6; Address[6])
//             {
//             }
//             column(Address_7; Address[7])
//             {
//             }
//             column(LocationCode; "Sales Header"."Location Code")
//             {
//             }
//             column(ShippingAgentName; ShippingAgent.Name)
//             {
//             }
//             column(ShippingAgentServiceCode; ShippingAgentService.Code)
//             {
//             }
//             column(Contract_Change_Order_No; "Contract No.")
//             {
//             }
//             column(Contract_Description; "Contract Description")
//             {
//             }
//             column(External_Document_No; "External Document No.")
//             {
//             }
//             column(ProjMgr; ProjMgr)
//             {
//             }
//             column(ONCE_PACKING_LIST_IS_SIGNED; 'ONCE PACKING LIST IS SIGNED, ' + CompanyInformation.Name + ' IS NOT RESPONSIBLE FOR ANY SHORTAGES OR DAMAGE.')
//             {
//             }
//             column(SchGroupAndRoute; "Sales Header".GETFILTER("Sch. Code Filter") + ' ' + "Sales Header".GETFILTER("Sch. Route Filter"))
//             {
//             }
//             column(OrderBarcode; OrderBarcode)
//             {
//             }
//             column(RouteLbl; RouteLbl)
//             {
//             }
//             column(PrimaryQty; PrimaryQty)
//             {
//             }
//             column(NoPrinted; "Sales Header"."No. Printed On Pack")
//             {
//             }
//             column(TotalAmountDue; TotalAmountDue)
//             {
//             }
//             column(IsCOD; IsCOD)
//             {
//             }
//             dataitem(LocationLoop; Integer)
//             {
//                 DataItemTableView = SORTING(Number);
//                 dataitem(CopyLoop; Integer)
//                 {
//                     DataItemTableView = SORTING(Number);
//                     column(CopyRec; 'True')
//                     {
//                     }
//                     column(CopyNo; CopyNo)
//                     {
//                     }
//                     column(CopyTxt; CopyTxt)
//                     {
//                     }
//                     dataitem(PageLoop; Integer)
//                     {
//                         DataItemTableView = SORTING(Number)
//                                             WHERE(Number = CONST(1));
//                         column(TempLocation_Code; TempLocation.Code)
//                         {
//                         }
//                         column(PageLoop_Number; Number)
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
//                         column(CompanyAddress_7; CompanyAddress[7])
//                         {
//                         }
//                         column(CompanyAddress_8; CompanyAddress[8])
//                         {
//                         }
//                         dataitem("Sales Line"; "Sales Line")
//                         {
//                             CalcFields = Assignments;
//                             DataItemLink = "Document Type" = FIELD("Document Type"),
//                                            "Document No." = FIELD("No.");
//                             DataItemLinkReference = "Sales Header";
//                             DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")
//                                                 WHERE(Type = FILTER(' ' | Item | Resource | G/L Account));
//                             RequestFilterFields = "Shipment Date";
//                             column(SalesLineRec; 'True')
//                             {
//                             }
//                             column(Sales_Line_Type; Type)
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
//                             }
//                             column(Sales_Line_Variant_Code; "Variant Code")
//                             {
//                             }
//                             column(Sales_Line_Description; "Submittal Description" + ' ' + DescToPrint)
//                             {
//                             }
//                             column(Sales_Line_BackorderedQty; Quantity - "Qty. to Ship" - "Quantity Shipped")
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(Sales_Line_Quantity_Shipped; "Quantity Shipped")
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(Sales_Line_Line_No; "Line No.")
//                             {
//                             }
//                             column(AssignmentList; tAssignList)
//                             {
//                             }
//                             dataitem(SalesLineComment; "Sales Comment Line")
//                             {
//                                 DataItemLink = "Document Type" = FIELD("Document Type"),
//                                                "No." = FIELD("Document No."),
//                                                "Document Line No." = FIELD("Line No.");
//                                 DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.")
//                                                     WHERE(Print On Shipment=CONST(Yes));
//                                 column(SalesLineCommentRec; 'True')
//                                 {
//                                 }
//                                 column(SalesLineComment_Comment; Comment)
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
//                                 column(SerialNoRec;'True')
//                                 {
//                                 }
//                                 column(SerialNo1;Addr[1][1])
//                                 {
//                                 }
//                                 column(SerialNo2;Addr[2][1])
//                                 {
//                                 }
//                                 column(SerialNo3;Addr[3][1])
//                                 {
//                                 }
//                                 column(SerialNo4;Addr[4][1])
//                                 {
//                                 }
//                                 column(ColumnNo; ColumnNo)
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
//                                 column(ComponentRec;'True')
//                                 {
//                                 }
//                                 column(Component_Qty_Per;'Qty. Per:' + FORMAT("Qty. Per"))
//                                 {
//                                 }
//                                 column(Component_No; "No.")
//                                 {
//                                 }
//                                 column(Component_Description;Description + ' ' + "Description 2")
//                                 {
//                                 }
//                                 column(Component_QtyToShip; ("Sales Line"."Qty. to Ship") * "Qty. Per")
//                                 {
//                                     DecimalPlaces = 0:5;
//                                 }
//                                 column(Component_Backordered_Qty; ("Sales Line".Quantity - "Sales Line"."Qty. to Ship" - "Sales Line"."Quantity Shipped")  * "Qty. Per")
//                                 {
//                                     DecimalPlaces = 0:5;
//                                 }
//                                 column(Component_QtyShipped;"Sales Line"."Quantity Shipped"  * "Qty. Per")
//                                 {
//                                     DecimalPlaces = 0:5;
//                                 }
//                                 column(Component_Component_Line_No; "Component Line No.")
//                                 {
//                                 }

//                                 trigger OnAfterGetRecord()
//                                 begin
//                                     IF ("Sales Line"."Manufacturing Code" <> "Sales Line"."Manufacturing Code"::Kit) OR
//                                             ("Sales Line"."Packaged Sale")  //AI13.00 SLB 03/14/18 - added second condition
//                                       THEN CurrReport.SKIP;
//                                     // Angelo Begin
//                                     CLEAR(ProductGroup);
//                                     IF ProductGroup.GET("Sales Line"."Item Category Code","Sales Line"."Product Group Code") THEN;
//                                     IF ProductGroup."Hide Kit Comp On Packing Slip" THEN
//                                       CurrReport.SKIP;
//                                     // Angelo End
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
//                                 column(AttributeCompRec;'True')
//                                 {
//                                 }
//                                 column(AttributeComps_Attribute_Code; "Attribute Code")
//                                 {
//                                 }
//                                 column(AttributeComps_No; "No.")
//                                 {
//                                 }
//                                 column(AttributeComps_DescToPrint; DescToPrint)
//                                 {
//                                 }
//                                 column(AttributeComps_Component_Line_No; "Component Line No.")
//                                 {
//                                 }

//                                 trigger OnAfterGetRecord()
//                                 begin
//                                     IF NOT cERP.PrintAttribute("Attribute Code","Sales Line"."Item Category Code",
//                                                                      "Sales Line"."Product Group Code",PrintOn::"Packing Slip")
//                                       THEN CurrReport.SKIP;
//                                 end;
//                             }

//                             trigger OnAfterGetRecord()
//                             var
//                                 ProductGroup: Record "5723";
//                             begin
//                                 IF CheckPackageSaleSkip THEN
//                                     CurrReport.SKIP;  //AI13.00 CERP-449 SLB 08/15/18
//                                 //AI9.01.01 JPU 02222018 BEGIN
//                                 IF HasProcessed1stLine THEN
//                                   CLEAR(CompanyInformation)
//                                 ELSE
//                                   HasProcessed1stLine := TRUE;
//                                 //AI9.01.01 JPU 02222018 END

//                                 QtyToShip := 0; //AI9.00.02 JPU 08192016

//                                 IF PerLocation AND ("Location Code" <> TempLocation.Code)
//                                   THEN CurrReport.SKIP;

//                                 tAssignList := '';

//                                 IF Type = Type::" "
//                                   THEN EXIT;

//                                 IF "Outstanding Quantity" = 0
//                                     THEN EXIT;

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

//                                 // "Default Front Load Billing %" is used to total quantities in the Temp Table.
//                                 IF tempProductGroup.GET("Item Category Code","Product Group Code")
//                                   THEN
//                                     BEGIN
//                                       tempProductGroup."Default Front Load Billing %" := tempProductGroup."Default Front Load Billing %" + "Qty. to Ship";
//                                       tempProductGroup.MODIFY;
//                                     END
//                                   ELSE
//                                     BEGIN
//                                       tempProductGroup."Item Category Code" := "Item Category Code";
//                                       tempProductGroup.Code := "Product Group Code";
//                                       IF ProductGroup.GET("Item Category Code","Product Group Code")
//                                         THEN tempProductGroup.Description := ProductGroup.Description;
//                                       tempProductGroup."Default Front Load Billing %" := "Qty. to Ship";
//                                       tempProductGroup.INSERT;
//                                     END;

//                                 IF Assignments
//                                 //  THEN tAssignList := AssignmentListByReport(REPORT::"CD Packing List");                // Angelo
//                                   THEN tAssignList := AssignmentListByReport(REPORT::"CD Packing List",TRUE);             // Angelo
//                             end;

//                             trigger OnPreDataItem()
//                             begin
//                                 //SETRANGE("Location Code",TempLocation.Code);  //NAVFIX
//                                 tempProductGroup.DELETEALL;
//                                 IF NOT IncludeCostOnlyItems
//                                   THEN SETRANGE("Contract Cost Only Item",FALSE);
//                             end;
//                         }
//                         dataitem(DataItem8541;"Sales Comment Line")
//                         {
//                             DataItemLink = "No."=FIELD("No.");
//                             DataItemLinkReference = "Sales Header";
//                             DataItemTableView = SORTING("Document Type",No.,Document Line No.,Line No.)
//                                                 WHERE("Document Type"=CONST(Order),
//                                                       Print On Shipment=CONST(Yes),
//                                                       "Document Line No."=CONST(0));
//                             column(SalesCommentLineRec;'True')
//                             {
//                             }
//                             column(Sales_Comment_Line_Comment; Comment)
//                             {
//                             }
//                             column(Sales_Comment_Line_Line_No; "Line No.")
//                             {
//                             }
//                         }
//                         dataitem(DataItem6030;Table5723)
//                         {
//                             DataItemTableView = SORTING(Item Category Code,Code);
//                             column(ProductGroupRec;'True')
//                             {
//                             }
//                             column(Product_Group_Description; Description)
//                             {
//                             }
//                             column(Product_Group_Qty_Shipped; tempProductGroup."Default Front Load Billing %")
//                             {
//                                 DecimalPlaces = 0:5;
//                             }
//                             column(Product_Group_Item_Category_Code; "Item Category Code")
//                             {
//                             }
//                             column(Product_Group_Code; Code)
//                             {
//                             }

//                             trigger OnAfterGetRecord()
//                             begin
//                                 IF NOT tempProductGroup.GET("Item Category Code",Code) OR (tempProductGroup."Default Front Load Billing %" = 0)
//                                   THEN CurrReport.SKIP;
//                             end;
//                         }
//                         dataitem(OrderFooter;Integer)
//                         {
//                             MaxIteration = 1;
//                             column(PrintFooter;'True')
//                             {
//                             }
//                         }
//                     }

//                     trigger OnAfterGetRecord()
//                     begin
//                         CurrReport.NEWPAGE;
//                         CurrReport.PAGENO := 1;
//                         CopyNo := CopyNo + 1;                         // Angelo
//                         IF CopyNo = 1 THEN // Original                // Angelo
//                           CLEAR(CopyTxt)                              // Angelo
//                         ELSE                                          // Angelo
//                           CopyTxt := 'COPY';                          // Angelo

//                         //CRY JPU 01122016 BEGIN - Increase custom field No. Printed on Packing list
//                         IF NOT CurrReport.PREVIEW THEN BEGIN
//                           "Sales Header"."No. Printed On Pack" += 1;
//                           "Sales Header".MODIFY;
//                         END;
//                         //CRY JPU 01122016 END
//                     end;

//                     trigger OnPreDataItem()
//                     begin
//                         SETRANGE(Number,1,1 + ABS(NoCopies));
//                         CopyNo := 0;                                 // Angelo
//                     end;
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     IF Number = 1 THEN
//                       TempLocation.FINDFIRST
//                     ELSE
//                       TempLocation.NEXT;

//                     IF PerLocation
//                       THEN
//                         IF NOT AnySalesLinesThisLocation(TempLocation.Code) THEN
//                           CurrReport.SKIP;
//                     // Angelo Begin
//                     IF NOT PerLocation THEN
//                       TempLocation.Code := "Sales Header"."Location Code";
//                     cERP.SetCompInfoToLocationInfo(TempLocation.Code,CompanyInformation);
//                     FormatAddress.Company(CompanyAddress,CompanyInformation);
//                     FormatAddress.AddToArray(CompanyAddress,'Phone: ' + CompanyInformation."Phone No.");
//                     FormatAddress.AddToArray(CompanyAddress,'Fax: ' + CompanyInformation."Fax No.");
//                     // Angelo End
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     IF PerLocation
//                       THEN SETRANGE(Number,1,TempLocation.COUNT)
//                       ELSE SETRANGE(Number,1);
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             var
//                 BarcodeMgmt: Codeunit "CERP Barcode Management";
//                 rBarcode: Record "CERP Barcode";
//                 DelMgmt: Codeunit "37013083";
//             begin
//                 //AI6.01 Teming
//                 IF (SalesSetup."Enable Mgmt. Approval") AND (SalesSetup."Approval Controls Picking") THEN
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

//                 cERP.SetCompInfoToLocationInfo("Location Code",CompanyInformation);
//                 FormatAddress.Company(CompanyAddress,CompanyInformation);
//                 FormatAddress.AddToArray(CompanyAddress,'Phone: ' + CompanyInformation."Phone No.");
//                 FormatAddress.AddToArray(CompanyAddress,'Fax: ' + CompanyInformation."Fax No.");

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
//                 //HL JPU 04182019 BEGIN
//                 //FormatAddress.SalesHeaderShipTo(ShipToAddress,Address,"Sales Header");
//                 SalesHeaderShipTo(ShipToAddress,Address,"Sales Header");
//                 //HL JPU 04182019 END
//                 FormatAddress.AddToArray(ShipToAddress,"Sales Header"."Ship-to Phone No."); //AI4.07
//                 FormatAddress.AddToArray(ShipToAddress,"Sales Header"."Ship-to Contact"); //HL JPU 04182019
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

//                 //AI13.00 JPU CERP-305 06182018 BEGIN
//                 CLEAR(TotalAmountDue);
//                 IF "Sales Header".IsCOD THEN
//                   BEGIN
//                     "Sales Header".CALCFIELDS("Amount Received");
//                     IF "Tax Area Code" = '' THEN
//                       TotalAmountDue := CalcTotalAmountDueWithoutTaxArea("No.") - "Sales Header"."Amount Received"
//                     ELSE
//                       TotalAmountDue := CalcTotalAmountDueWithTaxArea("No.") - "Sales Header"."Amount Received";
//                   END;
//                 //AI13.00 JPU CERP-305 06182018 END

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
//                       SchCode := GETFILTER("Sales Header"."Sch. Code Filter");
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
//                     field("Number of Copies"; NoCopies)
//                     {
//                     }
//                     field("Per Location"; PerLocation)
//                     {
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
//         Order_Date_CaptionLbl = 'Order Date:';
//         Order_No_CaptionLbl = 'Order Number:';
//         PAGENOCaptionLbl = 'Page:';
//         Quantity_ShippedCaptionLbl = 'Quantity Shipped';
//         Sell_to_Customer_NoCaptionLbl = 'Customer No:';
//         Ship_Date_CaptionLbl = 'Ship Date:';
//         SalesPurchPerson_NameCaptionLbl = 'Salesperson:';
//         QuantityOrderedCaptionLbl = 'Quantity Ordered';
//         Ship_To_CaptionLbl = 'Ship To:';
//         PACKING_LISTCaptionLbl = 'PACKING LIST';
//         Item_No_Spec_InstCaptionLbl = 'Item No./Spec Inst.';
//         Shipping_Agent_CodeCaptionLbl = 'Ship Via:';
//         Location_CodeCaptionLbl = 'Location:';
//         Sold_To_CaptionLbl = 'Sold To:';
//         Contract_NoCaptionLbl = 'Contract No.:';
//         Job_NameCaptionLbl = 'Job Name:';
//         Cust_PO_NoCaptionLbl = 'Cust PO No:';
//         Project_Mgr_CaptionLbl = 'Project Mgr:';
//         Back_OrderedCaptionLbl = 'Back Ordered';
//         Previously_ShippedCaptionLbl = 'Previously Shipped';
//         Accepted_ByCaptionLbl = 'Accepted By';
//         PrintedCaptionLbl = 'Printed';
//         SignedCaptionLbl = 'Signed';
//         DateCaptionLbl = 'Date';
//         DEL_BYCaptionLbl = 'DEL BY:';
//         DEL_DATECaptionLbl = 'DEL DATE:';
//         DEL_TIMECaptionLbl = 'DEL TIME:';
//         Serial_NosCaptionLbl = 'Serial Nos.';
//         SummaryCaptionLbl = 'Summary';
//         QtyShippedCaptionLbl = 'Qty. Shipped';
//         PrimaryQtyLbl = 'Primary Qty:';
//         CopyNoLbl = 'Copy #:';
//         ShippingAgentServiceCaption = 'Ship. Agent Service:';
//         TotalAmountDueCaptionLbl = 'Total Amount Due:';
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
//         Text001: Label 'Transferred from page %1';
//         Text002: Label 'Transferred to page %1';
//         ProjMgr: Text[50];
//         PrintOn: Option ShopOrder,PurchaseOrder,"Picking Ticket","Packing Slip";
//         CompanyAddress: array [8] of Text[50];
//         AssignArray: array [500] of Text[400];
//         ConERPMgmt: Codeunit "37004501";
//         cERP: Codeunit "37004861";
//         tempProductGroup: Record "5723" temporary;
//         PerLocation: Boolean;
//         Addr: array [8,1] of Text[250];
//         NoOfRecords: Integer;
//         RecordNo: Integer;
//         NoOfColumns: Integer;
//         ColumnNo: Integer;
//         i: Integer;
//         Text37012900: Label '%1 %2 needs Mgmt. Approval';
//         SalesSetup: Record "311";
//         Text37012901: Label 'Please release %1 %2 ';
//         IncludeCostOnlyItems: Boolean;
//         Sales_Header___Order_Date_CaptionLbl: Label 'Order Date:';
//         Sales_Header___No__CaptionLbl: Label 'Order Number:';
//         CurrReport_PAGENOCaptionLbl: Label 'Page:';
//         Quantity_ShippedCaptionLbl: Label 'Quantity Shipped';
//         Sales_Header___Sell_to_Customer_No__CaptionLbl: Label 'Customer No:';
//         Ship_Date_CaptionLbl: Label 'Ship Date:';
//         SalesPurchPerson_NameCaptionLbl: Label 'Salesperson:';
//         Sales_Line_QuantityCaptionLbl: Label 'Quantity Ordered';
//         Ship_To_CaptionLbl: Label 'Ship To:';
//         PACKING_LISTCaptionLbl: Label 'PACKING LIST';
//         Item_No__Spec_Inst_CaptionLbl: Label 'Item No./Spec Inst.';
//         Sales_Header___Shipping_Agent_Code_CaptionLbl: Label 'Ship Via:';
//         TempLocation_CodeCaptionLbl: Label 'Location:';
//         Sold_To_CaptionLbl: Label 'Sold To:';
//         Sales_Header___Contract_No____________Sales_Header___Change_Order_No__CaptionLbl: Label 'Contract No.:';
//         Job_Name_CaptionLbl: Label 'Job Name:';
//         Cust_PO_No_CaptionLbl: Label 'Cust PO No:';
//         Project_Mgr_CaptionLbl: Label 'Project Mgr:';
//         Back_OrderedCaptionLbl: Label 'Back Ordered';
//         Previously_ShippedCaptionLbl: Label 'Previously Shipped';
//         Accepted_By___________________________________CaptionLbl: Label 'Accepted By___________________________________';
//         PrintedCaptionLbl: Label 'Printed';
//         EmptyStringCaptionLbl: Label '| ___________________________________';
//         SignedCaptionLbl: Label 'Signed';
//         Date______________________CaptionLbl: Label 'Date______________________';
//         DEL_BY____________DEL_DATE_________CaptionLbl: Label 'DEL BY:___________DEL DATE:________';
//         DEL_TIME__________CaptionLbl: Label 'DEL TIME:_________';
//         Serial_Nos_CaptionLbl: Label 'Serial Nos.';
//         SummaryCaptionLbl: Label 'Summary';
//         Qty__ShippedCaptionLbl: Label 'Qty. Shipped';
//         tAssignList: Text;
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
//         CopyTxt: Text[10];
//         CopyNo: Integer;
//         ShippingAgent: Record "Shipping Agent";
//         ShippingAgentService: Record "5790";
//         ProductGroup: Record "5723";
//         HasProcessed1stLine: Boolean;
//         TotalAmountDue: Decimal;

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

//     local procedure CalcTotalAmountDueWithTaxArea(SalesOrderNo: Code[20]): Decimal
//     var
//         SalesHeader: Record "36";
//         SalesLine: Record "37";
//         TempSalesLine: Record "37" temporary;
//         SalesPostPrepmt: Codeunit "442";
//         TempSalesTaxAmtLine: Record "10011" temporary;
//         PrevPrintOrder: Integer;
//         PrevTaxPercent: Decimal;
//         TotalSalesLine: array [3] of Record "37";
//         TotalSalesLineLCY: array [3] of Record "37";
//         Cust: Record "18";
//         TempSalesTaxLine1: Record "10011" temporary;
//         TempSalesTaxLine2: Record "10011" temporary;
//         TempSalesTaxLine3: Record "10011" temporary;
//         TempVATAmountLine4: Record "290" temporary;
//         SalesTaxDifference: Record "10012";
//         SalesPost: Codeunit "80";
//         SalesTaxCalculate: Codeunit "398";
//         TotalAmount1: array [3] of Decimal;
//         TotalAmount2: array [3] of Decimal;
//         VATAmount: array [3] of Decimal;
//         VATAmountText: array [3] of Text[30];
//         ProfitLCY: array [3] of Decimal;
//         ProfitPct: array [3] of Decimal;
//         AdjProfitLCY: array [3] of Decimal;
//         AdjProfitPct: array [3] of Decimal;
//         TotalAdjCostLCY: array [3] of Decimal;
//         CreditLimitLCYExpendedPct: Decimal;
//         i: Integer;
//     begin
//         WITH SalesHeader DO BEGIN
//           SalesHeader.GET("Document Type"::Order, SalesOrderNo);
//           CLEAR(SalesLine);
//           CLEAR(TotalSalesLine);
//           CLEAR(TotalSalesLineLCY);

//           SalesLine.RESET;

//           FOR i := 1 TO 3 DO BEGIN
//             TempSalesLine.DELETEALL;
//             CLEAR(TempSalesLine);
//             CLEAR(SalesPost);
//             SalesPost.GetSalesLines(SalesHeader,TempSalesLine,i - 1);
//             CLEAR(SalesPost);
//             SalesTaxCalculate.StartSalesTaxCalculation;
//             TempSalesLine.SETFILTER(Type,'>0');
//             TempSalesLine.SETFILTER(Quantity,'<>0');
//             IF TempSalesLine.FIND('-') THEN
//               REPEAT
//                 SalesTaxCalculate.AddSalesLine(TempSalesLine);
//               UNTIL TempSalesLine.NEXT = 0;
//             TempSalesLine.RESET;
//             CASE i OF
//               1:
//                 BEGIN
//                   TempSalesTaxLine1.DELETEALL;
//                   SalesTaxCalculate.EndSalesTaxCalculation("Posting Date");
//                   SalesTaxCalculate.GetSalesTaxAmountLineTable(TempSalesTaxLine1);
//                 END;
//               2:
//                 BEGIN
//                   TempSalesTaxLine2.DELETEALL;
//                   SalesTaxCalculate.EndSalesTaxCalculation("Posting Date");
//                   SalesTaxCalculate.GetSalesTaxAmountLineTable(TempSalesTaxLine2);
//                 END;
//               3:
//                 BEGIN
//                   TempSalesTaxLine3.DELETEALL;
//                   SalesTaxCalculate.EndSalesTaxCalculation("Posting Date");
//                   SalesTaxCalculate.GetSalesTaxAmountLineTable(TempSalesTaxLine3);
//                 END;
//             END;

//             IF Status = Status::Open THEN
//               SalesTaxCalculate.DistTaxOverSalesLines(TempSalesLine);
//             SalesPost.SumSalesLinesTemp(
//               SalesHeader,TempSalesLine,i - 1,TotalSalesLine[i],TotalSalesLineLCY[i],
//               VATAmount[i],VATAmountText[i],ProfitLCY[i],ProfitPct[i],TotalAdjCostLCY[i]);
//             IF i = 3 THEN
//               TotalAdjCostLCY[i] := TotalSalesLineLCY[i]."Unit Cost (LCY)";

//             AdjProfitLCY[i] := TotalSalesLineLCY[i].Amount - TotalAdjCostLCY[i];
//             IF TotalSalesLineLCY[i].Amount <> 0 THEN
//               AdjProfitPct[i] := ROUND(AdjProfitLCY[i] / TotalSalesLineLCY[i].Amount * 100,0.1);
//             TotalAmount1[i] := TotalSalesLine[i].Amount;
//             TotalAmount2[i] := TotalAmount1[i];
//             VATAmount[i] := 0;

//             SalesTaxCalculate.GetSummarizedSalesTaxTable(TempSalesTaxAmtLine);
//             WITH TempSalesTaxAmtLine DO BEGIN
//               RESET;
//               SETCURRENTKEY("Print Order","Tax Area Code for Key","Tax Jurisdiction Code");
//               IF FIND('-') THEN
//                 REPEAT
//                   VATAmount[i] := VATAmount[i] + "Tax Amount";
//                 UNTIL NEXT = 0;
//               TotalAmount2[i] := TotalAmount2[i] + VATAmount[i];
//             END;
//           END;
//         END;

//         EXIT(TotalAmount2[3]);
//     end;

//     local procedure CalcTotalAmountDueWithoutTaxArea(SalesOrderNo: Code[20]): Decimal
//     var
//         SalesHeader: Record "36";
//         TotalAmount1: array [3] of Decimal;
//         TotalAmount2: array [3] of Decimal;
//         SalesPost: Codeunit "80";
//         SalesLine: Record "37";
//         TempSalesLine: Record "37" temporary;
//         SalesPostPrepayments: Codeunit "442";
//         i: Integer;
//         TempVATAmountLine1: Record "290" temporary;
//         TempVATAmountLine2: Record "290" temporary;
//         TempVATAmountLine3: Record "290" temporary;
//         TempVATAmountLine4: Record "290" temporary;
//         SalesSetup: Record "311";
//         VATAmount: array [3] of Decimal;
//         TotalSalesLine: array [3] of Record "37";
//         TotalSalesLineLCY: array [3] of Record "37";
//         VATAmountText: array [3] of Text[30];
//         ProfitLCY: array [3] of Decimal;
//         ProfitPct: array [3] of Decimal;
//         AdjProfitLCY: array [3] of Decimal;
//         AdjProfitPct: array [3] of Decimal;
//         TotalAdjCostLCY: array [3] of Decimal;
//         CreditLimitLCYExpendedPct: Decimal;
//     begin
//         WITH SalesHeader DO BEGIN
//           SalesHeader.GET("Document Type"::Order,SalesOrderNo);

//           CLEAR(SalesLine);
//           CLEAR(TotalSalesLine);
//           CLEAR(TotalSalesLineLCY);

//           FOR i := 1 TO 3 DO BEGIN
//             TempSalesLine.DELETEALL;
//             CLEAR(TempSalesLine);
//             CLEAR(SalesPost);
//             SalesPost.GetSalesLines(SalesHeader,TempSalesLine,i - 1);
//             CLEAR(SalesPost);
//             CASE i OF
//               1:
//                 SalesLine.CalcVATAmountLines(0,SalesHeader,TempSalesLine,TempVATAmountLine1);
//               2:
//                 SalesLine.CalcVATAmountLines(0,SalesHeader,TempSalesLine,TempVATAmountLine2);
//               3:
//                 SalesLine.CalcVATAmountLines(0,SalesHeader,TempSalesLine,TempVATAmountLine3);
//             END;

//             SalesPost.SumSalesLinesTemp(
//               SalesHeader,TempSalesLine,i - 1,TotalSalesLine[i],TotalSalesLineLCY[i],
//               VATAmount[i],VATAmountText[i],ProfitLCY[i],ProfitPct[i],TotalAdjCostLCY[i]);

//             IF i = 3 THEN
//               TotalAdjCostLCY[i] := TotalSalesLineLCY[i]."Unit Cost (LCY)";

//             AdjProfitLCY[i] := TotalSalesLineLCY[i].Amount - TotalAdjCostLCY[i];
//             IF TotalSalesLineLCY[i].Amount <> 0 THEN
//               AdjProfitPct[i] := ROUND(AdjProfitLCY[i] / TotalSalesLineLCY[i].Amount * 100,0.1);

//             IF "Prices Including VAT" THEN BEGIN
//               TotalAmount2[i] := TotalSalesLine[i].Amount;
//               TotalAmount1[i] := TotalAmount2[i] + VATAmount[i];
//               TotalSalesLine[i]."Line Amount" := TotalAmount1[i] + TotalSalesLine[i]."Inv. Discount Amount";
//             END ELSE BEGIN
//               TotalAmount1[i] := TotalSalesLine[i].Amount;
//               TotalAmount2[i] := TotalSalesLine[i]."Amount Including VAT";
//             END;
//           END;
//         END;

//         EXIT(TotalAmount2[3]);
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
//           IF ParentPkgLine.FINDSET AND (NOT ParentPkgLine."Print Detail Lines on Pack") THEN
//             EXIT(TRUE);
//         END;
//         EXIT(FALSE);
//     end;

//     procedure SalesHeaderShipTo(var AddrArray: array [8] of Text[90];CustAddr: array [8] of Text[90];var SalesHeader: Record "36"): Boolean
//     var
//         CountryRegion: Record "9";
//         SellToCountry: Code[50];
//     begin
//         //HL JPU 04182019 - Copy of same function in Format Address Codeunit but ship-to contact at the end
//         WITH SalesHeader DO BEGIN
//           FormatAddress.FormatAddr(
//             AddrArray,"Ship-to Name","Ship-to Name 2",'',"Ship-to Address","Ship-to Address 2",
//             "Ship-to City","Ship-to Post Code","Ship-to County","Ship-to Country/Region Code");
//           IF CountryRegion.GET("Sell-to Country/Region Code") THEN
//             SellToCountry := CountryRegion.Name;
//           IF "Sell-to Customer No." <> "Bill-to Customer No." THEN
//             EXIT(TRUE);
//           FOR i := 1 TO ARRAYLEN(AddrArray) DO
//             IF (AddrArray[i] <> CustAddr[i]) AND (AddrArray[i] <> '') AND (AddrArray[i] <> SellToCountry) THEN
//               EXIT(TRUE);
//         END;
//         EXIT(FALSE);
//     end;
// }
