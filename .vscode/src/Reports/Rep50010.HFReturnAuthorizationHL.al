// report 50010 "HF Return Authorization HL"
// {
//     // version NAVNA13.00,AI13.00,HL

//     DefaultLayout = RDLC;
//     RDLCLayout = '.vscode/src/Reports/Layouts/Return Authorization HL.rdlc';
//     ApplicationArea = #Basic,#Suite;
//     Caption = 'Return Authorization';
//     UsageCategory = Documents;

//     dataset
//     {
//         dataitem("Sales Header"; "Sales Header")
//         {
//             DataItemTableView = SORTING("Document Type", "No.")
//                                 WHERE("Document Type" = CONST(Return Order));
//             PrintOnlyIfDetail = true;
//             RequestFilterFields = "No.", "Sell-to Customer No.", "Bill-to Customer No.", "Ship-to Code", "No. Printed";
//             RequestFilterHeading = 'Return Order';
//             column(Sales_Header_Document_Type; "Document Type")
//             {
//             }
//             column(Sales_Header_No_; "No.")
//             {
//             }
//             column(CompanyInfoPicture; CompanyInformation.Picture)
//             {
//             }
//             dataitem("Sales Line"; "Sales Line")
//             {
//                 DataItemLink = "Document No." = FIELD("No.");
//                 DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")
//                                     WHERE("Document Type" = CONST(Return Order));
//                 dataitem(SalesLineComments; "Sales Comment Line")
//                 {
//                     DataItemLink = "No." = FIELD("Document No."),
//                                    "Document Line No." = FIELD("Line No.");
//                     DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.")
//                                         WHERE("Document Type" = CONST(Return Order),
//                                               Print On Return Authorization=CONST(Yes));

//                     trigger OnAfterGetRecord()
//                     begin
//                         WITH TempSalesLine DO BEGIN
//                             INIT;
//                             "Document Type" := "Sales Header"."Document Type";
//                             "Document No." := "Sales Header"."No.";
//                             "Line No." := HighestLineNo + 10;
//                             HighestLineNo := "Line No.";
//                         END;
//                         IF STRLEN(Comment) <= MAXSTRLEN(TempSalesLine.Description) THEN BEGIN
//                             TempSalesLine.Description := Comment;
//                             TempSalesLine."Description 2" := '';
//                         END ELSE BEGIN
//                             SpacePointer := MAXSTRLEN(TempSalesLine.Description) + 1;
//                             WHILE (SpacePointer > 1) AND (Comment[SpacePointer] <> ' ') DO
//                                 SpacePointer := SpacePointer - 1;
//                             IF SpacePointer = 1 THEN
//                                 SpacePointer := MAXSTRLEN(TempSalesLine.Description) + 1;
//                             TempSalesLine.Description := COPYSTR(Comment, 1, SpacePointer - 1);
//                             TempSalesLine."Description 2" := COPYSTR(COPYSTR(Comment, SpacePointer + 1), 1, MAXSTRLEN(TempSalesLine."Description 2"));
//                         END;
//                         TempSalesLine.INSERT;
//                     end;
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     TempSalesLine := "Sales Line";
//                     TempSalesLine.INSERT;
//                     HighestLineNo := "Line No.";
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     TempSalesLine.RESET;
//                     TempSalesLine.DELETEALL;
//                 end;
//             }
//             dataitem(DataItem8541; "Sales Comment Line")
//             {
//                 DataItemLink = "No." = FIELD("No.");
//                 DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.")
//                                     WHERE("Document Type" = CONST(Return Order),
//                                           Print On Return Authorization=CONST(Yes),
//                                           "Document Line No."=CONST(0));

//                 trigger OnAfterGetRecord()
//                 begin
//                     WITH TempSalesLine DO BEGIN
//                         INIT;
//                         "Document Type" := "Sales Header"."Document Type";
//                         "Document No." := "Sales Header"."No.";
//                         "Line No." := HighestLineNo + 1000;
//                         HighestLineNo := "Line No.";
//                     END;
//                     IF STRLEN(Comment) <= MAXSTRLEN(TempSalesLine.Description) THEN BEGIN
//                         TempSalesLine.Description := Comment;
//                         TempSalesLine."Description 2" := '';
//                     END ELSE BEGIN
//                         SpacePointer := MAXSTRLEN(TempSalesLine.Description) + 1;
//                         WHILE (SpacePointer > 1) AND (Comment[SpacePointer] <> ' ') DO
//                             SpacePointer := SpacePointer - 1;
//                         IF SpacePointer = 1 THEN
//                             SpacePointer := MAXSTRLEN(TempSalesLine.Description) + 1;
//                         TempSalesLine.Description := COPYSTR(Comment, 1, SpacePointer - 1);
//                         TempSalesLine."Description 2" := COPYSTR(COPYSTR(Comment, SpacePointer + 1), 1, MAXSTRLEN(TempSalesLine."Description 2"));
//                     END;
//                     TempSalesLine.INSERT;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     WITH TempSalesLine DO BEGIN
//                         INIT;
//                         "Document Type" := "Sales Header"."Document Type";
//                         "Document No." := "Sales Header"."No.";
//                         "Line No." := HighestLineNo + 1000;
//                         HighestLineNo := "Line No.";
//                     END;
//                 end;
//             }
//             dataitem(CopyLoop; Integer)
//             {
//                 DataItemTableView = SORTING(Number);
//                 dataitem(PageLoop; Integer)
//                 {
//                     DataItemTableView = SORTING(Number)
//                                         WHERE(Number = CONST(1));
//                     column(CompanyAddress_1_; CompanyAddress[1])
//                     {
//                     }
//                     column(CompanyAddress_2_; CompanyAddress[2])
//                     {
//                     }
//                     column(CompanyAddress_3_; CompanyAddress[3])
//                     {
//                     }
//                     column(CompanyAddress_4_; CompanyAddress[4])
//                     {
//                     }
//                     column(CompanyAddress_5_; CompanyAddress[5])
//                     {
//                     }
//                     column(CompanyAddress_6_; CompanyAddress[6])
//                     {
//                     }
//                     column(CopyTxt; CopyTxt)
//                     {
//                     }
//                     column(BillToAddress_1_; BillToAddress[1])
//                     {
//                     }
//                     column(BillToAddress_2_; BillToAddress[2])
//                     {
//                     }
//                     column(BillToAddress_3_; BillToAddress[3])
//                     {
//                     }
//                     column(BillToAddress_4_; BillToAddress[4])
//                     {
//                     }
//                     column(BillToAddress_5_; BillToAddress[5])
//                     {
//                     }
//                     column(BillToAddress_6_; BillToAddress[6])
//                     {
//                     }
//                     column(BillToAddress_7_; BillToAddress[7])
//                     {
//                     }
//                     column(Sales_Header___Shipment_Date_; "Sales Header"."Shipment Date")
//                     {
//                     }
//                     column(ShipToAddress_1_; ShipToAddress[1])
//                     {
//                     }
//                     column(ShipToAddress_2_; ShipToAddress[2])
//                     {
//                     }
//                     column(ShipToAddress_3_; ShipToAddress[3])
//                     {
//                     }
//                     column(ShipToAddress_4_; ShipToAddress[4])
//                     {
//                     }
//                     column(ShipToAddress_5_; ShipToAddress[5])
//                     {
//                     }
//                     column(ShipToAddress_6_; ShipToAddress[6])
//                     {
//                     }
//                     column(ShipToAddress_7_; ShipToAddress[7])
//                     {
//                     }
//                     column(Sales_Header___Bill_to_Customer_No__; "Sales Header"."Bill-to Customer No.")
//                     {
//                     }
//                     column(Sales_Header___Your_Reference_; "Sales Header"."Your Reference")
//                     {
//                     }
//                     column(SalesPurchPerson_Name; SalesPurchPerson.Name)
//                     {
//                     }
//                     column(Sales_Header___No__; "Sales Header"."No.")
//                     {
//                     }
//                     column(Sales_Header___Document_Date_; "Sales Header"."Document Date")
//                     {
//                     }
//                     column(CurrReport_PAGENO; CurrReport.PAGENO)
//                     {
//                     }
//                     column(CompanyAddress_7_; CompanyAddress[7])
//                     {
//                     }
//                     column(CompanyAddress_8_; CompanyAddress[8])
//                     {
//                     }
//                     column(BillToAddress_8_; BillToAddress[8])
//                     {
//                     }
//                     column(ShipToAddress_8_; ShipToAddress[8])
//                     {
//                     }
//                     column(ShipmentMethod_Description; ShipmentMethod.Description)
//                     {
//                     }
//                     column(ShippingAgentName; ShippingAgent.Name)
//                     {
//                     }
//                     column(Sales_Header___Order_Date_; "Sales Header"."Order Date")
//                     {
//                     }
//                     column(TaxRegLabel; TaxRegLabel)
//                     {
//                     }
//                     column(TaxRegNo; TaxRegNo)
//                     {
//                     }
//                     column(CopyNo; CopyNo)
//                     {
//                     }
//                     column(PageLoop_Number; Number)
//                     {
//                     }
//                     column(SalesHeaderExDocNo; "Sales Header"."External Document No.")
//                     {
//                     }
//                     column(SoldCaption; SoldCaptionLbl)
//                     {
//                     }
//                     column(To_Caption; To_CaptionLbl)
//                     {
//                     }
//                     column(Ship_DateCaption; Ship_DateCaptionLbl)
//                     {
//                     }
//                     column(Customer_IDCaption; Customer_IDCaptionLbl)
//                     {
//                     }
//                     column(P_O__NumberCaption; P_O__NumberCaptionLbl)
//                     {
//                     }
//                     column(SalesPersonCaption; SalesPersonCaptionLbl)
//                     {
//                     }
//                     column(ShipCaption; ShipCaptionLbl)
//                     {
//                     }
//                     column(To_Caption_Control89; To_Caption_Control89Lbl)
//                     {
//                     }
//                     column(RETURN_AUTHORIZATIONCaption; RETURN_AUTHORIZATIONCaptionLbl)
//                     {
//                     }
//                     column(Return_Authorization_Number_Caption; Return_Authorization_Number_CaptionLbl)
//                     {
//                     }
//                     column(Return_Authorization_Date_Caption; Return_Authorization_Date_CaptionLbl)
//                     {
//                     }
//                     column(Page_Caption; Page_CaptionLbl)
//                     {
//                     }
//                     column(Ship_ViaCaption; Ship_ViaCaptionLbl)
//                     {
//                     }
//                     column(P_O__DateCaption; P_O__DateCaptionLbl)
//                     {
//                     }
//                     column(OrderBarcode; OrderBarcode)
//                     {
//                     }
//                     dataitem(SalesLine; Integer)
//                     {
//                         DataItemTableView = SORTING(Number);
//                         column(TempSalesLine__No__; TempSalesLine."No.")
//                         {
//                         }
//                         column(TempSalesLine__Unit_of_Measure_; TempSalesLine."Unit of Measure")
//                         {
//                         }
//                         column(TempSalesLine_Quantity; TempSalesLine.Quantity)
//                         {
//                             DecimalPlaces = 0 : 5;
//                         }
//                         column(TempSalesLine_Description_________TempSalesLine__Description_2_; TempSalesLine.Description + ' ' + TempSalesLine."Description 2")
//                         {
//                         }
//                         column(SalesLine_Number; Number)
//                         {
//                         }
//                         column(Item_No_Caption; Item_No_CaptionLbl)
//                         {
//                         }
//                         column(UnitCaption; UnitCaptionLbl)
//                         {
//                         }
//                         column(DescriptionCaption; DescriptionCaptionLbl)
//                         {
//                         }
//                         column(QuantityCaption; QuantityCaptionLbl)
//                         {
//                         }
//                         column(AssignmentList; tAssignList)
//                         {
//                         }

//                         trigger OnAfterGetRecord()
//                         begin
//                             OnLineNumber := OnLineNumber + 1;
//                             WITH TempSalesLine DO BEGIN
//                                 IF OnLineNumber = 1 THEN
//                                     FIND('-')
//                                 ELSE
//                                     NEXT;

//                                 IF Type = 0 THEN BEGIN
//                                     "No." := '';
//                                     "Unit of Measure" := '';
//                                     "Line Amount" := 0;
//                                     "Inv. Discount Amount" := 0;
//                                     Quantity := 0;
//                                 END ELSE
//                                     IF Type = Type::"G/L Account" THEN
//                                         "No." := '';
//                                 //AI Angelo Begin
//                                 TempSalesLine.CALCFIELDS(Assignments);
//                                 IF TempSalesLine.Assignments
//                                   THEN
//                                     tAssignList := TempSalesLine.AssignmentListByReport(REPORT::"Return Authorization", TRUE);
//                                 //AI Angelo end
//                             END;
//                         end;

//                         trigger OnPreDataItem()
//                         begin
//                             NumberOfLines := TempSalesLine.COUNT;
//                             SETRANGE(Number, 1, NumberOfLines);
//                             OnLineNumber := 0;
//                         end;
//                     }
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     CurrReport.PAGENO := 1;

//                     IF CopyNo = NoLoops THEN BEGIN
//                         IF NOT CurrReport.PREVIEW THEN
//                             SalesPrinted.RUN("Sales Header");
//                         CurrReport.BREAK;
//                     END;
//                     CopyNo := CopyNo + 1;
//                     IF CopyNo = 1 THEN // Original
//                         CLEAR(CopyTxt)
//                     ELSE
//                         CopyTxt := Text000;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     NoLoops := 1 + ABS(NoCopies);
//                     IF NoLoops <= 0 THEN
//                         NoLoops := 1;
//                     CopyNo := 0;
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             var
//                 BarcodeMgmt: Codeunit "CERP Barcode Management";
//                 rBarcode: Record "CERP Barcode";
//             begin
//                 cERP.SetCompInfoToLocationInfo("Location Code", CompanyInformation);                     //AI 7.01.02
//                 IF PrintCompany THEN BEGIN
//                     FormatAddress.Company(CompanyAddress, CompanyInformation);                             //AI 7.01.02
//                     FormatAddress.AddToArray(CompanyAddress, 'Phone: ' + CompanyInformation."Phone No.");  //AI 7.01.02
//                     FormatAddress.AddToArray(CompanyAddress, 'Fax: ' + CompanyInformation."Fax No.");      //AI 7.01.02
//                 END;
//                 IF RespCenter.GET("Responsibility Center") THEN BEGIN
//                     FormatAddress.RespCenter(CompanyAddress, RespCenter);
//                     CompanyInformation."Phone No." := RespCenter."Phone No.";
//                     CompanyInformation."Fax No." := RespCenter."Fax No.";
//                 END;
//                 CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

//                 IF "Salesperson Code" = '' THEN
//                     CLEAR(SalesPurchPerson)
//                 ELSE
//                     SalesPurchPerson.GET("Salesperson Code");

//                 IF "Payment Terms Code" = '' THEN
//                     CLEAR(PaymentTerms)
//                 ELSE
//                     PaymentTerms.GET("Payment Terms Code");

//                 //AI13.00 JPU 11132018 BEGIN - Show Shipping Agent
//                 /*
//                 IF "Shipment Method Code" = '' THEN
//                   CLEAR(ShipmentMethod)
//                 ELSE
//                   ShipmentMethod.GET("Shipment Method Code");
//                 */
//                 IF "Shipping Agent Code" = '' THEN
//                     CLEAR(ShippingAgent)
//                 ELSE
//                     ShippingAgent.GET("Shipping Agent Code");
//                 IF "Sales Header"."Shipping Agent Service Code" = '' THEN
//                     CLEAR(ShippingAgentService)
//                 ELSE
//                     IF ShippingAgentService.GET("Shipping Agent Code", "Shipping Agent Service Code") THEN;
//                 //AI13.00 JPU 11132018 END

//                 FormatAddress.SalesHeaderSellTo(BillToAddress, "Sales Header");
//                 FormatAddress.SalesHeaderShipTo(ShipToAddress, ShipToAddress, "Sales Header");

//                 IF LogInteraction THEN
//                     IF NOT CurrReport.PREVIEW THEN BEGIN
//                         IF "Bill-to Contact No." <> '' THEN
//                             SegManagement.LogDocument(
//                               18, "No.", 0, 0, DATABASE::Contact, "Bill-to Contact No.",
//                               "Salesperson Code", "Campaign No.", "Posting Description", '')
//                         ELSE
//                             SegManagement.LogDocument(
//                               18, "No.", 0, 0, DATABASE::Customer, "Bill-to Customer No.",
//                               "Salesperson Code", "Campaign No.", "Posting Description", '');
//                     END;

//                 //AI13.00 JPU 11292018 BEGIN
//                 CLEAR(OrderBarcode);
//                 IF PrintOrderBarcode
//                   THEN
//                     OrderBarcode := BarcodeMgmt.GetBarcode(DATABASE::"Sales Header", "Document Type", "No.", '', rBarcode.Level::Order, 0, 0, '', '', '', '', 0, 0D, '', 0, 0, 0, '', '', 0, 0);
//                 //AI13.00 JPU 11292018 END

//             end;

//             trigger OnPreDataItem()
//             begin
//                 CompanyInformation.GET;
//                 CompanyInformation.CALCFIELDS(Picture);

//                 CLEAR(CompanyAddress);
//                 IF PrintCompany THEN
//                     FormatAddress.Company(CompanyAddress, CompanyInformation);
//                 FormatAddress.AddToArray(CompanyAddress, 'Phone: ' + CompanyInformation."Phone No.");
//                 FormatAddress.AddToArray(CompanyAddress, 'Fax: ' + CompanyInformation."Fax No.");
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
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Number of Copies';
//                         ToolTip = 'Specifies the number of copies of each document (in addition to the original) that you want to print.';
//                     }
//                     field(PrintCompany; PrintCompany)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Print Company Address';
//                         ToolTip = 'Specifies if your company address is printed at the top of the sheet, because you do not use pre-printed paper. Leave this check box blank to omit your company''s address.';
//                     }
//                     field(LogInteraction; LogInteraction)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Log Interaction';
//                         Enabled = LogInteractionEnable;
//                         ToolTip = 'Specifies if you want to record the related interactions with the involved contact person in the Interaction Log Entry table.';
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

//         trigger OnInit()
//         begin
//             LogInteractionEnable := TRUE;
//         end;

//         trigger OnOpenPage()
//         begin
//             /* reactivate when HQ comes up with a code number for return authorizations
//             LogInteraction := SegManagement.FindInteractTmplCode(2) <> '';
//             */
//             LogInteractionEnable := LogInteraction;

//         end;
//     }

//     labels
//     {
//     }

//     var
//         ShipmentMethod: Record "10";
//         PaymentTerms: Record "3";
//         SalesPurchPerson: Record "13";
//         CompanyInformation: Record "79";
//         TempSalesLine: Record "37" temporary;
//         RespCenter: Record "5714";
//         Language: Record "8";
//         CompanyAddress: array[8] of Text[50];
//         BillToAddress: array[8] of Text[50];
//         ShipToAddress: array[8] of Text[50];
//         CopyTxt: Text[10];
//         PrintCompany: Boolean;
//         NoCopies: Integer;
//         NoLoops: Integer;
//         CopyNo: Integer;
//         NumberOfLines: Integer;
//         OnLineNumber: Integer;
//         HighestLineNo: Integer;
//         SpacePointer: Integer;
//         SalesPrinted: Codeunit "313";
//         FormatAddress: Codeunit "365";
//         SegManagement: Codeunit "5051";
//         Text000: Label 'COPY';
//         LogInteraction: Boolean;
//         TaxRegNo: Text[30];
//         TaxRegLabel: Text[30];
//         [InDataSet]
//         LogInteractionEnable: Boolean;
//         SoldCaptionLbl: Label 'Sold';
//         To_CaptionLbl: Label 'To:';
//         Ship_DateCaptionLbl: Label 'Ship Date';
//         Customer_IDCaptionLbl: Label 'Customer ID';
//         P_O__NumberCaptionLbl: Label 'P.O. Number';
//         SalesPersonCaptionLbl: Label 'SalesPerson';
//         ShipCaptionLbl: Label 'Ship';
//         To_Caption_Control89Lbl: Label 'To:';
//         RETURN_AUTHORIZATIONCaptionLbl: Label 'RETURN AUTHORIZATION';
//         Return_Authorization_Number_CaptionLbl: Label 'Return Authorization Number:';
//         Return_Authorization_Date_CaptionLbl: Label 'Return Authorization Date:';
//         Page_CaptionLbl: Label 'Page:';
//         Ship_ViaCaptionLbl: Label 'Ship Via';
//         P_O__DateCaptionLbl: Label 'P.O. Date';
//         Item_No_CaptionLbl: Label 'Item No.';
//         UnitCaptionLbl: Label 'Unit';
//         DescriptionCaptionLbl: Label 'Description';
//         QuantityCaptionLbl: Label 'Quantity';
//         cERP: Codeunit "37004861";
//         tAssignList: Text;
//         ShippingAgent: Record "Shipping Agent";
//         ShippingAgentService: Record "5790";
//         OrderBarcode: Code[30];
//         PrintOrderBarcode: Boolean;
// }
