// report 50007 "Stored Mat. Picking Ticket HL"
// {
//     // version AI13.00,HL

//     DefaultLayout = RDLC;
//     RDLCLayout = '.vscode/src/Reports/Layouts/Stored Mat. Picking Ticket HL.rdlc';

//     dataset
//     {
//         dataitem(DataItem1570; Table113)
//         {
//             DataItemTableView = SORTING(Document No., "Line No.")
//                                 WHERE(Stored Material Qty. to Ship=FILTER(<>0));
//             RequestFilterFields = "Document No.";
//             column(CompanyInformation_Picture; CompanyInformation.Picture)
//             {
//             }
//             column(CompanyAddress_1; CompanyAddress[1])
//             {
//             }
//             column(CompanyAddress_2; CompanyAddress[2])
//             {
//             }
//             column(CompanyAddress_3; CompanyAddress[3])
//             {
//             }
//             column(CompanyAddress_4; CompanyAddress[4])
//             {
//             }
//             column(CompanyAddress_5; CompanyAddress[5])
//             {
//             }
//             column(CompanyAddress_6; CompanyAddress[6])
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
//             column(SalesInvoiceHeader_No; SalesInvoiceHeader."No.")
//             {
//             }
//             column(SalesInvoiceHeader_Order_No; SalesInvoiceHeader."Order No.")
//             {
//             }
//             column(SalesInvoiceHeader_Order_Date; SalesInvoiceHeader."Order Date")
//             {
//             }
//             column(SalesInvoiceHeader_Sell_to_Customer_No; SalesInvoiceHeader."Sell-to Customer No.")
//             {
//             }
//             column(SalesPurchPerson_Name; SalesPurchPerson.Name)
//             {
//             }
//             column(ProjMgr; ProjMgr)
//             {
//             }
//             column(SalesInvoiceHeader_Shipment_Date; FORMAT(SalesInvoiceHeader."Shipment Date"))
//             {
//             }
//             column(SalesInvoiceHeader_Shipping_Agent_Code; SalesInvoiceHeader."Shipping Agent Code")
//             {
//             }
//             column(SalesInvoiceHeader_External_Document_No; SalesInvoiceHeader."External Document No.")
//             {
//             }
//             column(SalesInvoiceHeader_Contract_No_And_Change_Order_No; SalesInvoiceHeader."Contract No.")
//             {
//             }
//             column(SalesInvoiceHeader_Contract_Description; SalesInvoiceHeader."Contract Description")
//             {
//             }
//             column("USERID"; USERID)
//             {
//             }
//             column(Sell_to_Customer_No; "Sell-to Customer No.")
//             {
//                 IncludeCaption = true;
//             }
//             column(Type; Type)
//             {
//                 IncludeCaption = true;
//             }
//             column(No; "No.")
//             {
//                 IncludeCaption = true;
//             }
//             column(Description;"Submittal Description" + ' ' + DescToPrint)
//             {
//             }
//             column(Unit_of_Measure; "Unit of Measure")
//             {
//                 IncludeCaption = true;
//             }
//             column(Stored_Material_Qty__to_Ship; "Stored Material Qty. to Ship")
//             {
//             }
//             column(Location_Code; "Location Code")
//             {
//                 IncludeCaption = true;
//             }
//             column(Staging_Location; "Staging Location")
//             {
//                 IncludeCaption = true;
//             }
//             column(Sales_Invoice_Line_Document_No_; "Document No.")
//             {
//             }
//             column(Sales_Invoice_Line_Line_No_; "Line No.")
//             {
//             }
//             column(AssignmentList;AssignmentListByReport(REPORT::"CD Picking Ticket",TRUE))
//             {
//             }
//             column(Item_Shelf_No; Item."Shelf No.")
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 CheckAssignQtyToShip;
//                 // Angelo Begin
//                 //IF PrevContract = 'ZZZZZZZ' THEN
//                 //  BEGIN
//                 //   PrevContract := "Contract No.";
//                 //   PrevChangeOrder := "Change Order No.";
//                 //  END;
//                 //IF (PrevContract <> "Contract No.") OR (PrevChangeOrder <> "Change Order No.") THEN
//                 //  ERROR('Only One Contract And Change Order Can Be Selected At One Time');
//                 SalesInvoiceHeader.GET("Document No.");
//                 FormatAddress.SalesInvBillTo(Address,SalesInvoiceHeader);
//                 FormatAddress.SalesInvShipTo(ShipToAddress,Address,SalesInvoiceHeader);
//                 IF SalesInvoiceHeader."Project Manager" = '' THEN
//                   CLEAR(ProjMgr)
//                 ELSE
//                   BEGIN
//                     SalesPurchPerson.GET(SalesInvoiceHeader."Project Manager");
//                     ProjMgr := SalesPurchPerson.Name;
//                   END;

//                 IF SalesInvoiceHeader."Salesperson Code" = '' THEN
//                   CLEAR(SalesPurchPerson)
//                 ELSE
//                   SalesPurchPerson.GET(SalesInvoiceHeader."Salesperson Code");

//                 IF (Type = Type::Item)
//                   THEN Item.GET("No.");
//                 IF (Type = Type::Item) THEN
//                   IF StockkeepingUnit.GET("Location Code","No.","Variant Code") THEN
//                     IF StockkeepingUnit."Shelf No." <> '' THEN
//                       Item."Shelf No." := StockkeepingUnit."Shelf No.";

//                 // Angelo End
//             end;

//             trigger OnPreDataItem()
//             begin
//                 PrevContract := 'ZZZZZZZ';           // Angelo
//             end;
//         }
//     }

//     requestpage
//     {
//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//         Stored_Material_Picking_TicketCaptionLbl = 'STORED MAT''L PICKING';
//         PAGENOCaptionLbl = 'Page';
//         Stored_Material_Qty_to_Ship_CaptionLbl = 'Quantity';
//         Qty__PickedCaptionLbl = 'Qty. Picked';
//         Order_Date_CaptionLbl = 'Order Date:';
//         OrderNoCaptionLbl = 'Order Number:';
//         Customer_No_CaptionLbl = 'Customer No:';
//         Ship_Date_CaptionLbl = 'Ship Date:';
//         SalesPerson_CaptionLbl = 'Salesperson:';
//         Ship_To_CaptionLbl = 'Ship To:';
//         Shipping_Agent_Code_CaptionLbl = 'Ship Via:';
//         pLocation_CodeCaptionLbl = 'Location:';
//         Sold_To_CaptionLbl = 'Sold To:';
//         ContractNo_CaptionLbl = 'Contract No.:';
//         Job_Name_CaptionLbl = 'Job Name:';
//         Cust_PO_No_CaptionLbl = 'Cust PO No:';
//         Project_Mgr_CaptionLbl = 'Project Mgr:';
//         Item_Shelf_No_CaptionLbl = 'Shelf No.';
//         DescriptionCaptionLbl = 'Description';
//     }

//     trigger OnPreReport()
//     begin
//         CompanyInformation.GET('');
//         CompanyInformation.CALCFIELDS(CompanyInformation.Picture);
//         FormatAddress.Company(CompanyAddress,CompanyInformation);
//         FormatAddress.AddToArray(CompanyAddress,'Phone: ' + CompanyInformation."Phone No.");
//         FormatAddress.AddToArray(CompanyAddress,'Fax: ' + CompanyInformation."Fax No.");
//     end;

//     var
//         AssignArray: array [500] of Text[400];
//         PrevContract: Code[20];
//         PrevChangeOrder: Code[10];
//         CompanyInformation: Record "79";
//         FormatAddress: Codeunit "365";
//         CompanyAddress: array [8] of Text[50];
//         Address: array [8] of Text[50];
//         ShipToAddress: array [8] of Text[50];
//         SalesInvoiceHeader: Record "112";
//         SalesPurchPerson: Record "13";
//         ProjMgr: Text[50];
//         Item: Record Item;
//         StockkeepingUnit: Record "5700";
// }
