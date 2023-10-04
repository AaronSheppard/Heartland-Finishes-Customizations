// report 50006 "HF Stored Mat. Packing List HL"
// {
//     // version AI13.00,HL

//     DefaultLayout = RDLC;
//     RDLCLayout = '.vscode/src/Reports/Layouts/Stored Mat. Packing List HL.rdlc';

//     dataset
//     {
//         dataitem(iLocation; Integer)
//         {
//             DataItemTableView = SORTING(Number);
//             PrintOnlyIfDetail = true;
//             dataitem(iSalesInvHeader; Integer)
//             {
//                 DataItemTableView = SORTING(Number);
//                 PrintOnlyIfDetail = true;
//                 dataitem(DataItem1570; Table113)
//                 {
//                     DataItemTableView = SORTING(Document No., "Line No.")
//                                         WHERE(Material Stored=CONST(Yes),
//                                               Stored Material Qty. to Ship=FILTER(<>0));
//                     RequestFilterFields = "Document No.";
//                     column(Contract_Description; SalesInvHeader."Contract Description")
//                     {
//                     }
//                     column(ContractChangeOrderNo; SalesInvHeader."Contract No.")
//                     {
//                     }
//                     column(ShipToAddress1; ShipToAddress[1])
//                     {
//                     }
//                     column(ShipToAddress2; ShipToAddress[2])
//                     {
//                     }
//                     column(ShipToAddress3; ShipToAddress[3])
//                     {
//                     }
//                     column(ShipToAddress4; ShipToAddress[4])
//                     {
//                     }
//                     column(ShipToAddress5; ShipToAddress[5])
//                     {
//                     }
//                     column(ShipToAddress6; ShipToAddress[6])
//                     {
//                     }
//                     column(ShipToAddress7; ShipToAddress[7])
//                     {
//                     }
//                     column(Address1; Address[1])
//                     {
//                     }
//                     column(Address2; Address[2])
//                     {
//                     }
//                     column(Address3; Address[3])
//                     {
//                     }
//                     column(Address4; Address[4])
//                     {
//                     }
//                     column(Address5; Address[5])
//                     {
//                     }
//                     column(Address6; Address[6])
//                     {
//                     }
//                     column(Address7; Address[7])
//                     {
//                     }
//                     column(CompanyAddress1; CompanyAddress[1])
//                     {
//                     }
//                     column(CompanyAddress2; CompanyAddress[2])
//                     {
//                     }
//                     column(CompanyAddress3; CompanyAddress[3])
//                     {
//                     }
//                     column(CompanyAddress4; CompanyAddress[4])
//                     {
//                     }
//                     column(CompanyAddress5; CompanyAddress[5])
//                     {
//                     }
//                     column(CompanyAddress6; CompanyAddress[6])
//                     {
//                     }
//                     column(CompanyAddress7; CompanyAddress[7])
//                     {
//                     }
//                     column(External_Document_No; SalesInvHeader."External Document No.")
//                     {
//                     }
//                     column(ProjMgr; ProjMgr)
//                     {
//                     }
//                     column(SalesPurchPerson_Name; SalesPurchPerson.Name)
//                     {
//                     }
//                     column(CompanyInformation_Picture; CompanyInformation.Picture)
//                     {
//                     }
//                     column(WORKDATE; WORKDATE)
//                     {
//                     }
//                     column(Sell_to_Customer_No; SalesInvHeader."Sell-to Customer No.")
//                     {
//                     }
//                     column(TempLoc_Code; TempLoc.Code)
//                     {
//                     }
//                     column(Order_Date; SalesInvHeader."Order Date")
//                     {
//                     }
//                     column(Order_No; SalesInvHeader."Order No.")
//                     {
//                     }
//                     column(Sales_Invoice_Line_No; "No.")
//                     {
//                     }
//                     column(Shipping_Agent_Code; SalesInvHeader."Shipping Agent Code")
//                     {
//                     }
//                     column(Description;"Submittal Description" + ' '+DescToPrint)
//                     {
//                     }
//                     column(Unit_of_Measure; "Unit of Measure")
//                     {
//                     }
//                     column(Stored_Material_Qty_to_Ship; "Sales Invoice Line"."Stored Material Qty. to Ship")
//                     {
//                     }
//                     column(FooterNote;'ONCE PACKING LIST IS SIGNED, ' + CompanyInformation.Name + ' IS NOT RESPONSIBLE FOR ANY SHORTAGES OR DAMAGE.')
//                     {
//                     }
//                     column(Document_No; "Document No.")
//                     {
//                     }
//                     column(AssignmentList;AssignmentListByReport(REPORT::"CD Packing List",TRUE))
//                     {
//                     }

//                     trigger OnAfterGetRecord()
//                     begin
//                         CheckAssignQtyToShip;
//                     end;

//                     trigger OnPreDataItem()
//                     begin
//                         SETRANGE("Document No.",TempInv."No.");
//                         IF PerLocation
//                           THEN SETRANGE("Location Code",TempLoc.Code);
//                     end;
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     IF Number = 1
//                       THEN TempInv.FINDFIRST
//                       ELSE TempInv.NEXT;

//                     SalesInvHeader.GET(TempInv."No.");
//                     cERP.SetCompInfoToLocationInfo(TempLoc.Code,CompanyInformation);
//                     FormatAddress.Company(CompanyAddress,CompanyInformation);
//                     FormatAddress.AddToArray(CompanyAddress,'Phone: ' + CompanyInformation."Phone No.");
//                     FormatAddress.AddToArray(CompanyAddress,'Fax: ' + CompanyInformation."Fax No.");

//                     // 08-12-03 Begin
//                     IF SalesInvHeader."Project Manager" = '' THEN
//                       CLEAR(ProjMgr)
//                     ELSE
//                       BEGIN
//                         SalesPurchPerson.GET(SalesInvHeader."Project Manager");
//                         ProjMgr := SalesPurchPerson.Name;
//                       END;
//                     // 08-12-03 End

//                     IF SalesInvHeader."Salesperson Code" = '' THEN
//                       CLEAR(SalesPurchPerson)
//                     ELSE
//                       SalesPurchPerson.GET(SalesInvHeader."Salesperson Code");

//                     IF SalesInvHeader."Shipment Method Code" = '' THEN
//                       CLEAR(ShipmentMethod)
//                     ELSE
//                       ShipmentMethod.GET(SalesInvHeader."Shipment Method Code");

//                     IF SalesInvHeader."Payment Terms Code" = '' THEN
//                       CLEAR(PaymentTerms)
//                     ELSE
//                       PaymentTerms.GET(SalesInvHeader."Payment Terms Code");

//                     FormatAddress.SalesInvBillTo(Address,SalesInvHeader);
//                     FormatAddress.SalesInvShipTo(ShipToAddress,Address,SalesInvHeader);
//                     FormatAddress.AddToArray(ShipToAddress,SalesInvHeader."Ship-to Phone No."); //AI4.07
//                     CurrReport.NEWPAGE;
//                     CurrReport.PAGENO := 1;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     SETRANGE(Number,1,TempInv.COUNT);
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 IF Number = 1
//                   THEN TempLoc.FINDFIRST
//                   ELSE TempLoc.NEXT;
//             end;

//             trigger OnPreDataItem()
//             begin
//                 CompanyInformation.GET('');
//                 CompanyInformation.CALCFIELDS(CompanyInformation.Picture);
//                 FormatAddress.Company(CompanyAddress,CompanyInformation);

//                 IF NOT PerLocation
//                   THEN
//                     BEGIN
//                       TempLoc.Code := '';
//                       TempLoc.INSERT;
//                     END;

//                 SalesInvLine.SETRANGE("Material Stored",TRUE);
//                 SalesInvLine.SETFILTER("Stored Material Qty. to Ship",'<>0');
//                 IF SalesInvLine.FINDFIRST
//                   THEN
//                     REPEAT
//                       IF PerLocation
//                         THEN
//                           IF NOT TempLoc.GET(SalesInvLine."Location Code")
//                             THEN
//                               BEGIN
//                                 TempLoc.Code := SalesInvLine."Location Code";
//                                 TempLoc.INSERT;
//                               END;
//                       IF NOT TempInv.GET(SalesInvLine."Document No.")
//                         THEN
//                           BEGIN
//                             TempInv."No." := SalesInvLine."Document No.";
//                             TempInv.INSERT;
//                           END;

//                     UNTIL SalesInvLine.NEXT = 0
//                   ELSE
//                     ERROR('No lines are set to ship.');
//                 SETRANGE(Number,1,TempLoc.COUNT);
//             end;
//         }
//     }

//     requestpage
//     {
//         layout
//         {
//             area(content)
//             {
//                 field(PerLocation; PerLocation)
//                 {
//                     Caption = 'Per Location';
//                 }
//             }
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//         Quantity_ShippedCaptionLbl = 'Quantity Shipped';
//         UnitCaptionLbl = 'Unit';
//         DescriptionCaptionLbl = 'Description';
//         Item_No_CaptionLbl = 'Item No.';
//         Job_Name_CaptionLbl = 'Job Name:';
//         ContractNoCaptionLbl = 'Contract No.:';
//         Ship_To_CaptionLbl = 'Ship To:';
//         Cust_PO_No_CaptionLbl = 'Cust PO No:';
//         STORED_MATERIAL_PACKING_LISTCaptionLbl = 'STORED MAT''L PACKING LIST';
//         Project_Mgr_CaptionLbl = 'Project Mgr:';
//         SalesPurchPerson_NameCaptionLbl = 'Salesperson:';
//         Ship_Date_CaptionLbl = 'Ship Date:';
//         Customer_No_CaptionLbl = 'Customer No:';
//         TempLoc_CodeCaptionLbl = 'Location:';
//         Order_Date_CaptionLbl = 'Order Date:';
//         Sold_To_CaptionLbl = 'Sold To:';
//         Order_No_CaptionLbl = 'Order Number:';
//         Page_CaptionLbl = 'Page:';
//         DEL_BY_DEL_DATE_CaptionLbl = 'DEL BY:___________DEL DATE:________';
//         DEL_TIME_CaptionLbl = 'DEL TIME:_________';
//         Accepted_By_CaptionLbl = 'Accepted By___________________________________';
//         Underline_CaptionLbl = '| ___________________________________';
//         Date_CaptionLbl = 'Date______________________';
//         PrintedCaptionLbl = 'Printed';
//         SignedCaptionLbl = 'Signed';
//         Shipping_Agent_CodeCaptionLbl = 'Ship Via:';
//     }

//     var
//         CompanyInformation: Record "79";
//         Address: array [8] of Text[50];
//         ShipToAddress: array [8] of Text[50];
//         CompanyAddress: array [8] of Text[50];
//         SalesPurchPerson: Record "13";
//         FormatAddress: Codeunit "365";
//         ProjMgr: Text[50];
//         ShipmentMethod: Record "10";
//         PaymentTerms: Record "3";
//         ItemsPerPage: Integer;
//         TempInv: Record "112" temporary;
//         TempLoc: Record "14" temporary;
//         cERP: Codeunit "37004861";
//         SalesInvHeader: Record "112";
//         SalesInvLine: Record "113";
//         PerLocation: Boolean;
//         AssignArray: array [500] of Text[400];
//         Quantity_ShippedCaptionLbl: Label 'Quantity Shipped';
//         UnitCaptionLbl: Label 'Unit';
//         DescriptionCaptionLbl: Label 'Description';
//         Item_No_CaptionLbl: Label 'Item No.';
//         Job_Name_CaptionLbl: Label 'Job Name:';
//         SalesInvHeader__Contract_No___________SalesInvHeader__Change_Order_No__CaptionLbl: Label 'Contract No.:';
//         Ship_To_CaptionLbl: Label 'Ship To:';
//         Cust_PO_No_CaptionLbl: Label 'Cust PO No:';
//         STORED_MATERIAL_PACKING_LISTCaptionLbl: Label 'STORED MATERIAL PACKING LIST';
//         Project_Mgr_CaptionLbl: Label 'Project Mgr:';
//         SalesPurchPerson_NameCaptionLbl: Label 'Salesperson:';
//         Ship_Date_CaptionLbl: Label 'Ship Date:';
//         SalesInvHeader__Sell_to_Customer_No__CaptionLbl: Label 'Customer No:';
//         TempLoc_CodeCaptionLbl: Label 'Location:';
//         SalesInvHeader__Order_Date_CaptionLbl: Label 'Order Date:';
//         Sold_To_CaptionLbl: Label 'Sold To:';
//         SalesInvHeader__Order_No__CaptionLbl: Label 'Order Number:';
//         CurrReport_PAGENOCaptionLbl: Label 'Page:';
//         DEL_BY____________DEL_DATE_________CaptionLbl: Label 'DEL BY:___________DEL DATE:________';
//         DEL_TIME__________CaptionLbl: Label 'DEL TIME:_________';
//         Accepted_By___________________________________CaptionLbl: Label 'Accepted By___________________________________';
//         EmptyStringCaptionLbl: Label '| ___________________________________';
//         Date______________________CaptionLbl: Label 'Date______________________';
//         PrintedCaptionLbl: Label 'Printed';
//         SignedCaptionLbl: Label 'Signed';
// }
