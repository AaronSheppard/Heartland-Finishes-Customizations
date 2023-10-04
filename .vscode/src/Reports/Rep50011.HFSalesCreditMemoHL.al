// report 50011 "HF Sales Credit Memo HL"
// {
//     // version NAVNA13.00,AI13.00,HL

//     DefaultLayout = RDLC;
//     RDLCLayout = '.vscode/src/Reports/Layouts/Sales Credit Memo HL.rdlc';
//     Caption = 'Sales Credit Memo';

//     dataset
//     {
//         dataitem(DataItem8098; Table114)
//         {
//             DataItemTableView = SORTING("No.");
//             PrintOnlyIfDetail = true;
//             RequestFilterFields = "No.", "Sell-to Customer No.", "Bill-to Customer No.", "Ship-to Code", "No. Printed";
//             RequestFilterHeading = 'Sales Credit Memo';
//             column(No_SalesCrMemoHeader; "No.")
//             {
//             }
//             column(SuppressItemPrices_SalesCrMemoHeader; "Suppress Item Prices")
//             {
//             }
//             column(PrintDetail; "Print Detail")
//             {
//             }
//             dataitem(DataItem3364; Table115)
//             {
//                 DataItemLink = "Document No." = FIELD("No.");
//                 DataItemTableView = SORTING(Document No., "Line No.")
//                                     WHERE(Contract Expense Item=CONST(No));
//                 dataitem(SalesLineComments; "Sales Comment Line")
//                 {
//                     DataItemLink = "No." = FIELD("Document No."),
//                                    "Document Line No." = FIELD("Line No.");
//                     DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.")
//                                         WHERE("Document Type" = CONST(Posted Credit Memo),
//                                               Print On Credit Memo=CONST(Yes));

//                     trigger OnAfterGetRecord()
//                     begin
//                         WITH TempSalesCrMemoLine DO BEGIN
//                             INIT;
//                             "Document No." := "Sales Cr.Memo Header"."No.";
//                             "Line No." := HighestLineNo + 10;
//                             HighestLineNo := "Line No.";
//                         END;
//                         IF STRLEN(Comment) <= MAXSTRLEN(TempSalesCrMemoLine.Description) THEN BEGIN
//                             TempSalesCrMemoLine.Description := Comment;
//                             TempSalesCrMemoLine."Description 2" := '';
//                         END ELSE BEGIN
//                             SpacePointer := MAXSTRLEN(TempSalesCrMemoLine.Description) + 1;
//                             WHILE (SpacePointer > 1) AND (Comment[SpacePointer] <> ' ') DO
//                                 SpacePointer := SpacePointer - 1;
//                             IF SpacePointer = 1 THEN
//                                 SpacePointer := MAXSTRLEN(TempSalesCrMemoLine.Description) + 1;
//                             TempSalesCrMemoLine.Description := COPYSTR(Comment, 1, SpacePointer - 1);
//                             TempSalesCrMemoLine."Description 2" :=
//                               COPYSTR(COPYSTR(Comment, SpacePointer + 1), 1, MAXSTRLEN(TempSalesCrMemoLine."Description 2"));
//                         END;
//                         TempSalesCrMemoLine.INSERT;
//                     end;
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     TempSalesCrMemoLine := "Sales Cr.Memo Line";
//                     TempSalesCrMemoLine.INSERT;
//                     HighestLineNo := "Line No.";

//                     //AI9.00 JPU 01252016 BEGIN
//                     IF NOT tempSalesCRCat.GET("Document No.", "Item Category Code")
//                       THEN BEGIN
//                         tempSalesCRCat.INIT;
//                         tempSalesCRCat."No." := "Document No.";
//                         tempSalesCRCat."Item Category Code" := "Item Category Code";
//                         tempSalesCRCat.INSERT;
//                     END;

//                     tempSalesCRCat."Order Lump Sum Value" := tempSalesCRCat."Order Lump Sum Value" + Amount;
//                     tempSalesCRCat.MODIFY;
//                     //AI9.00 JPU 01252016 END
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     TempSalesCrMemoLine.RESET;
//                     TempSalesCrMemoLine.DELETEALL;
//                     //AI9.00 JPU 01252016 BEGIN
//                     tempSalesCRCat.RESET;
//                     tempSalesCRCat.DELETEALL;
//                     //AI9.00 JPU 01252016 END
//                 end;
//             }
//             dataitem(DataItem8541; "Sales Comment Line")
//             {
//                 DataItemLink = "No." = FIELD("No.");
//                 DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.")
//                                     WHERE("Document Type" = CONST(Posted Credit Memo),
//                                           Print On Credit Memo=CONST(Yes),
//                                           "Document Line No."=CONST(0));

//                 trigger OnAfterGetRecord()
//                 begin
//                     WITH TempSalesCrMemoLine DO BEGIN
//                         INIT;
//                         "Document No." := "Sales Cr.Memo Header"."No.";
//                         "Line No." := HighestLineNo + 1000;
//                         HighestLineNo := "Line No.";
//                     END;
//                     IF STRLEN(Comment) <= MAXSTRLEN(TempSalesCrMemoLine.Description) THEN BEGIN
//                         TempSalesCrMemoLine.Description := Comment;
//                         TempSalesCrMemoLine."Description 2" := '';
//                     END ELSE BEGIN
//                         SpacePointer := MAXSTRLEN(TempSalesCrMemoLine.Description) + 1;
//                         WHILE (SpacePointer > 1) AND (Comment[SpacePointer] <> ' ') DO
//                             SpacePointer := SpacePointer - 1;
//                         IF SpacePointer = 1 THEN
//                             SpacePointer := MAXSTRLEN(TempSalesCrMemoLine.Description) + 1;
//                         TempSalesCrMemoLine.Description := COPYSTR(Comment, 1, SpacePointer - 1);
//                         TempSalesCrMemoLine."Description 2" :=
//                           COPYSTR(COPYSTR(Comment, SpacePointer + 1), 1, MAXSTRLEN(TempSalesCrMemoLine."Description 2"));
//                     END;
//                     TempSalesCrMemoLine.INSERT;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     WITH TempSalesCrMemoLine DO BEGIN
//                         INIT;
//                         "Document No." := "Sales Cr.Memo Header"."No.";
//                         "Line No." := HighestLineNo + 1000;
//                         HighestLineNo := "Line No.";
//                     END;
//                     TempSalesCrMemoLine.INSERT;
//                 end;
//             }
//             dataitem(CopyLoop; Integer)
//             {
//                 DataItemTableView = SORTING(Number);
//                 dataitem(PageLoop; Integer)
//                 {
//                     DataItemTableView = SORTING(Number)
//                                         WHERE(Number = CONST(1));
//                     column(CompanyInfo3Picture; CompanyInfo3.Picture)
//                     {
//                     }
//                     column(CompanyInfo2Picture; CompanyInfo2.Picture)
//                     {
//                     }
//                     column(CompanyInfo1Picture; CompanyInfo1.Picture)
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
//                     column(CopyTxt; CopyTxt)
//                     {
//                     }
//                     column(BillToAddress1; BillToAddress[1])
//                     {
//                     }
//                     column(BillToAddress2; BillToAddress[2])
//                     {
//                     }
//                     column(BillToAddress3; BillToAddress[3])
//                     {
//                     }
//                     column(BillToAddress4; BillToAddress[4])
//                     {
//                     }
//                     column(BillToAddress5; BillToAddress[5])
//                     {
//                     }
//                     column(BillToAddress6; BillToAddress[6])
//                     {
//                     }
//                     column(BillToAddress7; BillToAddress[7])
//                     {
//                     }
//                     column(ShptDate_SalesCrMemoHeader; "Sales Cr.Memo Header"."Shipment Date")
//                     {
//                     }
//                     column(ApplDocType_SalesCrMemoHeader; "Sales Cr.Memo Header"."Applies-to Doc. Type")
//                     {
//                     }
//                     column(ApplDocNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."Applies-to Doc. No.")
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
//                     column(BilltoCustNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to Customer No.")
//                     {
//                     }
//                     column(ExtDocNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."External Document No.")
//                     {
//                     }
//                     column(SalesPurchPersonName; SalesPurchPerson.Name)
//                     {
//                     }
//                     column(DocDate_SalesCrMemoHeader; "Sales Cr.Memo Header"."Document Date")
//                     {
//                     }
//                     column(CompanyAddress7; CompanyAddress[7])
//                     {
//                     }
//                     column(CompanyAddress8; CompanyAddress[8])
//                     {
//                     }
//                     column(BillToAddress8; BillToAddress[8])
//                     {
//                     }
//                     column(ShipToAddress8; ShipToAddress[8])
//                     {
//                     }
//                     column(TaxRegLabel; TaxRegLabel)
//                     {
//                     }
//                     column(TaxRegNo; TaxRegNo)
//                     {
//                     }
//                     column(PrintFooter; PrintFooter)
//                     {
//                     }
//                     column(CopyNo; CopyNo)
//                     {
//                     }
//                     column(TaxIdentType_Cust; FORMAT(Cust."Tax Identification Type"))
//                     {
//                     }
//                     column(CreditCaption; CreditCaptionLbl)
//                     {
//                     }
//                     column(ShipDateCaption; ShipDateCaptionLbl)
//                     {
//                     }
//                     column(ApplytoTypeCaption; ApplytoTypeCaptionLbl)
//                     {
//                     }
//                     column(ApplytoNumberCaption; ApplytoNumberCaptionLbl)
//                     {
//                     }
//                     column(CustomerIDCaption; CustomerIDCaptionLbl)
//                     {
//                     }
//                     column(PONumberCaption; PONumberCaptionLbl)
//                     {
//                     }
//                     column(SalesPersonCaption; SalesPersonCaptionLbl)
//                     {
//                     }
//                     column(ShipCaption; ShipCaptionLbl)
//                     {
//                     }
//                     column(CreditMemoCaption; CreditMemoCaptionLbl)
//                     {
//                     }
//                     column(CreditMemoNumberCaption; CreditMemoNumberCaptionLbl)
//                     {
//                     }
//                     column(CreditMemoDateCaption; CreditMemoDateCaptionLbl)
//                     {
//                     }
//                     column(PageCaption; PageCaptionLbl)
//                     {
//                     }
//                     column(TaxIdentTypeCaption; TaxIdentTypeCaptionLbl)
//                     {
//                     }
//                     column(ToCaption; ToCaptionLbl)
//                     {
//                     }
//                     column(ItemNoCaption; ItemNoCaptionLbl)
//                     {
//                     }
//                     column(UnitCaption; UnitCaptionLbl)
//                     {
//                     }
//                     column(DescriptionCaption; DescriptionCaptionLbl)
//                     {
//                     }
//                     column(QuantityCaption; QuantityCaptionLbl)
//                     {
//                     }
//                     column(SubtotalCaption; SubtotalCaptionLbl)
//                     {
//                     }
//                     column(InvoiceDiscountCaption; InvoiceDiscountCaptionLbl)
//                     {
//                     }
//                     column(TotalCaption; TotalCaptionLbl)
//                     {
//                     }
//                     column(AmountSubjecttoSalesTaxCaption; AmountSubjecttoSalesTaxCaptionLbl)
//                     {
//                     }
//                     column(AmountExemptfromSalesTaxCaption; AmountExemptfromSalesTaxCaptionLbl)
//                     {
//                     }
//                     column(BreakdownTitle; BreakdownTitle)
//                     {
//                     }
//                     column(BreakdownLabel1; BreakdownLabel[1])
//                     {
//                     }
//                     column(BreakdownLabel2; BreakdownLabel[2])
//                     {
//                     }
//                     column(BreakdownAmt1; BreakdownAmt[1])
//                     {
//                     }
//                     column(BreakdownAmt2; BreakdownAmt[2])
//                     {
//                     }
//                     column(BreakdownAmt3; BreakdownAmt[3])
//                     {
//                     }
//                     column(BreakdownLabel3; BreakdownLabel[3])
//                     {
//                     }
//                     column(BreakdownAmt4; BreakdownAmt[4])
//                     {
//                     }
//                     column(BreakdownLabel4; BreakdownLabel[4])
//                     {
//                     }
//                     column(TotalTaxLabel; TotalTaxLabel)
//                     {
//                     }
//                     dataitem(SalesCRCat; Integer)
//                     {
//                         DataItemTableView = SORTING(Number);
//                         column(CategoryRec; 'True')
//                         {
//                         }
//                         column(Category_Code; tempSalesCRCat."Item Category Code")
//                         {
//                         }
//                         column(Category_Amount; AmountExclInvDisc)
//                         {
//                         }
//                         column(SalesCrCat_Number; Number)
//                         {
//                         }

//                         trigger OnAfterGetRecord()
//                         begin
//                             IF SalesCRCat.Number = 1
//                               THEN
//                                 tempSalesCRCat.FINDFIRST
//                             ELSE
//                                 tempSalesCRCat.NEXT;

//                             IF "Sales Cr.Memo Header"."Suppress Item Prices"
//                               THEN
//                                 AmountExclInvDisc := 0
//                             ELSE
//                                 AmountExclInvDisc := tempSalesCRCat."Order Lump Sum Value";
//                         end;

//                         trigger OnPreDataItem()
//                         begin
//                             SalesCRCat.SETRANGE(Number, 1, tempSalesCRCat.COUNT);
//                         end;
//                     }
//                     dataitem(SalesCrMemoLine; Integer)
//                     {
//                         DataItemTableView = SORTING(Number);
//                         column(SalesCRLineRec; 'True')
//                         {
//                         }
//                         column(TempSalesCrMemoLineLineNo; TempSalesCrMemoLine."Line No.")
//                         {
//                         }
//                         column(AmountExclInvDisc; AmountExclInvDisc)
//                         {
//                         }
//                         column(TempSalesCrMemoLineNo; TempSalesCrMemoLine."No.")
//                         {
//                         }
//                         column(TempSalesCrMemoLineUOM; TempSalesCrMemoLine."Unit of Measure")
//                         {
//                         }
//                         column(TempSalesCrMemoLineQty; TempSalesCrMemoLine.Quantity)
//                         {
//                             DecimalPlaces = 0 : 5;
//                         }
//                         column(UnitPriceToPrint; UnitPriceToPrint)
//                         {
//                             DecimalPlaces = 2 : 5;
//                         }
//                         column(TempSalesCrMemoLineDesc; TempSalesCrMemoLine.Description + ' ' + TempSalesCrMemoLine."Description 2")
//                         {
//                         }
//                         column(TaxLiable; TaxLiable)
//                         {
//                         }
//                         column(TempSalesCrMemoLineAmtTaxLiable; TempSalesCrMemoLine.Amount - TaxLiable)
//                         {
//                         }
//                         column(TempSalesCrMemoLineAmtAmtExclInvDisc; TempSalesCrMemoLine.Amount - AmountExclInvDisc)
//                         {
//                         }
//                         column(TempSalesCrMemoLineAmtInclVATAmt; TempSalesCrMemoLine."Amount Including VAT" - TempSalesCrMemoLine.Amount)
//                         {
//                         }
//                         column(TempSalesCrMemoLineAmtInclVAT; TempSalesCrMemoLine."Amount Including VAT")
//                         {
//                         }
//                         column(PricingUOMCode; TempSalesCrMemoLine."Pricing UOM Code")
//                         {
//                         }
//                         column(UOMPrice; TempSalesCrMemoLine."Pricing UOM Unit Price")
//                         {
//                         }
//                         column(QuantityUOM; QtyUOM)
//                         {
//                         }
//                         dataitem(DataItem1000000005; Table37012852)
//                         {
//                             DataItemTableView = SORTING(Table ID, "Document No.", Document Line No., Component Line No., Line No.);
//                             column(SerialNo1; Addr[1] [1])
//                             {
//                             }
//                             column(SerialNo2; Addr[2] [1])
//                             {
//                             }
//                             column(SerialNo3; Addr[3] [1])
//                             {
//                             }
//                             column(SerialNo4; Addr[4] [1])
//                             {
//                             }
//                             column(ColumnNo; ColumnNo)
//                             {
//                             }

//                             trigger OnAfterGetRecord()
//                             begin
//                                 RecordNo := RecordNo + 1;
//                                 ColumnNo := ColumnNo + 1;

//                                 Addr[ColumnNo] [1] := FORMAT("Serial No.");

//                                 COMPRESSARRAY(Addr[ColumnNo]);

//                                 IF RecordNo = NoOfRecords THEN BEGIN
//                                     FOR i := ColumnNo + 1 TO NoOfColumns DO
//                                         CLEAR(Addr[i]);
//                                     ColumnNo := 0;
//                                 END ELSE BEGIN
//                                     IF ColumnNo = NoOfColumns THEN
//                                         ColumnNo := 0;
//                                 END;

//                                 IF FirstOne
//                                   THEN
//                                     FirstOne := FALSE
//                                 ELSE BEGIN
//                                     TempSalesCrMemoLine.Amount := 0;
//                                     TaxLiable := 0;
//                                     //TaxAmount := 0;
//                                     AmountExclInvDisc := 0;
//                                     TempSalesCrMemoLine."Inv. Discount Amount" := 0;
//                                     TempSalesCrMemoLine."Amount Including VAT" := 0;
//                                 END;
//                             end;

//                             trigger OnPreDataItem()
//                             begin
//                                 SETRANGE("Table ID", DATABASE::"Sales Cr.Memo Line");
//                                 SETRANGE("Document No.", TempSalesCrMemoLine."Document No.");
//                                 SETRANGE("Document Line No.", TempSalesCrMemoLine."Line No.");
//                                 SETRANGE("Component Line No.", 0);

//                                 NoOfRecords := COUNT;
//                                 NoOfColumns := 4;
//                                 RecordNo := 0;

//                                 /*IF ISSERVICETIER
//                                   THEN
//                                     BEGIN
//                                       TempSalesCrMemoLine.Amount := 0;
//                                       TaxLiable := 0;
//                                       //TaxAmount := 0;
//                                       AmountExclInvDisc := 0;
//                                       TempSalesCrMemoLine."Inv. Discount Amount" := 0;
//                                       TempSalesCrMemoLine."Amount Including VAT" := 0;
//                                     END;
//                                 */

//                             end;
//                         }

//                         trigger OnAfterGetRecord()
//                         var
//                             "--cERP Locals--": Integer;
//                             ItemUOM: Record "Item Unit of Measure";
//                             Item: Record Item;
//                             Ratio: Decimal;
//                             cERPUOMMgmt: Codeunit "CERP UOM Management";
//                         begin
//                             OnLineNumber := OnLineNumber + 1;
//                             WITH TempSalesCrMemoLine DO BEGIN
//                                 IF OnLineNumber = 1 THEN
//                                     FIND('-')
//                                 ELSE
//                                     NEXT;

//                                 IF Type = 0 THEN BEGIN
//                                     "No." := '';
//                                     "Unit of Measure" := '';
//                                     Amount := 0;
//                                     "Amount Including VAT" := 0;
//                                     "Inv. Discount Amount" := 0;
//                                     Quantity := 0;
//                                 END ELSE
//                                     IF Type = Type::"G/L Account" THEN
//                                         "No." := '';

//                                 IF Amount <> "Amount Including VAT" THEN
//                                     TaxLiable := Amount
//                                 ELSE
//                                     TaxLiable := 0;

//                                 AmountExclInvDisc := Amount + "Inv. Discount Amount";

//                                 IF Quantity = 0 THEN
//                                     UnitPriceToPrint := 0 // so it won't print
//                                 ELSE
//                                     UnitPriceToPrint := ROUND(AmountExclInvDisc / Quantity, 0.00001);

//                                 //AI7.01 Begin
//                                 IF ("Pricing UOM Code" <> '') AND (Type = Type::Item) THEN BEGIN
//                                     ItemUOM.GET("No.", "Pricing UOM Code");
//                                     ItemUOM.TESTFIELD("Qty. per Unit of Measure");
//                                     //AI9.00 JPU 11052015 BEGIN - Calculate for Variable Dimension
//                                     //QtyUOM := Quantity / ItemUOM."Qty. per Unit of Measure";
//                                     IF Item.IsItemVariableDimensionUOM("No.") THEN BEGIN
//                                         IF "Dimensional Ratio" <> 0 THEN BEGIN
//                                             IF Item.GET("No.") THEN BEGIN
//                                                 Ratio := 1;
//                                                 IF "Dimensional UOM Code" <> Item."Pricing UOM Code" THEN
//                                                     Ratio := cERPUOMMgmt.GetRatio("Dimensional UOM Code", Item."Pricing UOM Code");
//                                                 QtyUOM := Quantity * "Dimensional Ratio" / Ratio;
//                                             END;
//                                         END ELSE
//                                             QtyUOM := 0;
//                                     END ELSE
//                                         IF Item.GET("No.") AND (Item."Base Unit of Measure" = "Unit of Measure Code") THEN
//                                             QtyUOM := Quantity / ItemUOM."Qty. per Unit of Measure"
//                                         ELSE BEGIN //Convert the Unit of Measure to the Base Unit of Measure, then from the Base Unit of Measure to the Pricing Unit of Measure
//                                             ItemUOM.GET("No.", "Unit of Measure Code");
//                                             ItemUOM.TESTFIELD("Qty. per Unit of Measure");
//                                             QtyUOM := Quantity * ItemUOM."Qty. per Unit of Measure";

//                                             ItemUOM.GET("No.", "Pricing UOM Code");
//                                             ItemUOM.TESTFIELD("Qty. per Unit of Measure");
//                                             QtyUOM := QtyUOM / ItemUOM."Qty. per Unit of Measure";
//                                         END;
//                                     //AI9.00 JPU 11052015 END

//                                 END ELSE
//                                     QtyUOM := 0;
//                                 //AI7.01 End
//                             END;

//                             //NA0007.begin
//                             PrintFooter := FALSE;
//                             IF OnLineNumber = NumberOfLines THEN
//                                 PrintFooter := TRUE;

//                             FirstOne := TRUE; //AI7
//                         end;

//                         trigger OnPreDataItem()
//                         begin
//                             CurrReport.CREATETOTALS(TaxLiable, AmountExclInvDisc, TempSalesCrMemoLine.Amount, TempSalesCrMemoLine."Amount Including VAT");
//                             NumberOfLines := TempSalesCrMemoLine.COUNT;
//                             SETRANGE(Number, 1, NumberOfLines);
//                             OnLineNumber := 0;

//                             PrintFooter := FALSE;
//                         end;
//                     }
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     CurrReport.PAGENO := 1;

//                     IF CopyNo = NoLoops THEN BEGIN
//                         IF NOT CurrReport.PREVIEW THEN
//                             SalesCrMemoPrinted.RUN("Sales Cr.Memo Header");
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
//             begin
//                 cERP.SetCompInfoToLocationInfo("Location Code", CompanyInformation);                     //AI 7.01.02
//                 IF PrintCompany THEN
//                     FormatAddress.Company(CompanyAddress, CompanyInformation);                             //AI 7.01.02
//                 FormatAddress.AddToArray(CompanyAddress, 'Phone: ' + CompanyInformation."Phone No.");  //AI 7.01.02
//                 FormatAddress.AddToArray(CompanyAddress, 'Fax: ' + CompanyInformation."Fax No.");      //AI 7.01.02
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

//                 IF "Bill-to Customer No." = '' THEN BEGIN
//                     "Bill-to Name" := Text009;
//                     "Ship-to Name" := Text009;
//                 END;

//                 FormatAddress.SalesCrMemoBillTo(BillToAddress, "Sales Cr.Memo Header");
//                 FormatAddress.SalesCrMemoShipTo(ShipToAddress, BillToAddress, "Sales Cr.Memo Header");

//                 IF LogInteraction THEN
//                     IF NOT CurrReport.PREVIEW THEN
//                         SegManagement.LogDocument(
//                           6, "No.", 0, 0, DATABASE::Customer, "Sell-to Customer No.", "Salesperson Code",
//                           "Campaign No.", "Posting Description", '');

//                 CLEAR(BreakdownTitle);
//                 CLEAR(BreakdownLabel);
//                 CLEAR(BreakdownAmt);
//                 TotalTaxLabel := Text008;
//                 TaxRegNo := '';
//                 TaxRegLabel := '';
//                 IF "Tax Area Code" <> '' THEN BEGIN
//                     TaxArea.GET("Tax Area Code");
//                     CASE TaxArea."Country/Region" OF
//                         TaxArea."Country/Region"::US:
//                             TotalTaxLabel := Text005;
//                         TaxArea."Country/Region"::CA:
//                             BEGIN
//                                 TotalTaxLabel := Text007;
//                                 TaxRegNo := CompanyInformation."VAT Registration No.";
//                                 TaxRegLabel := CompanyInformation.FIELDCAPTION("VAT Registration No.");
//                             END;
//                     END;
//                     SalesTaxCalc.StartSalesTaxCalculation;
//                     IF TaxArea."Use External Tax Engine" THEN
//                         SalesTaxCalc.CallExternalTaxEngineForDoc(DATABASE::"Sales Cr.Memo Header", 0, "No.")
//                     ELSE BEGIN
//                         SalesTaxCalc.AddSalesCrMemoLines("No.");
//                         SalesTaxCalc.EndSalesTaxCalculation("Posting Date");
//                     END;
//                     SalesTaxCalc.GetSummarizedSalesTaxTable(TempSalesTaxAmtLine);
//                     BrkIdx := 0;
//                     PrevPrintOrder := 0;
//                     PrevTaxPercent := 0;
//                     WITH TempSalesTaxAmtLine DO BEGIN
//                         RESET;
//                         SETCURRENTKEY("Print Order", "Tax Area Code for Key", "Tax Jurisdiction Code");
//                         IF FIND('-') THEN
//                             REPEAT
//                                 IF ("Print Order" = 0) OR
//                                    ("Print Order" <> PrevPrintOrder) OR
//                                    ("Tax %" <> PrevTaxPercent)
//                                 THEN BEGIN
//                                     BrkIdx := BrkIdx + 1;
//                                     IF BrkIdx > 1 THEN BEGIN
//                                         IF TaxArea."Country/Region" = TaxArea."Country/Region"::CA THEN
//                                             BreakdownTitle := Text006
//                                         ELSE
//                                             BreakdownTitle := Text003;
//                                     END;
//                                     IF BrkIdx > ARRAYLEN(BreakdownAmt) THEN BEGIN
//                                         BrkIdx := BrkIdx - 1;
//                                         BreakdownLabel[BrkIdx] := Text004;
//                                     END ELSE
//                                         BreakdownLabel[BrkIdx] := STRSUBSTNO("Print Description", "Tax %");
//                                 END;
//                                 BreakdownAmt[BrkIdx] := BreakdownAmt[BrkIdx] + "Tax Amount";
//                             UNTIL NEXT = 0;
//                     END;
//                     IF BrkIdx = 1 THEN BEGIN
//                         CLEAR(BreakdownLabel);
//                         CLEAR(BreakdownAmt);
//                     END;
//                 END;
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
//                     }
//                     field(PrintCompanyAddress; PrintCompany)
//                     {
//                         Caption = 'Print Company Address';
//                     }
//                     field(LogInteraction; LogInteraction)
//                     {
//                         Caption = 'Log Interaction';
//                         Enabled = LogInteractionEnable;
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
//             LogInteraction := SegManagement.FindInteractTmplCode(6) <> '';
//             LogInteractionEnable := LogInteraction;
//         end;
//     }

//     labels
//     {
//         SerialNosCaption = 'Serial Nos.';
//         DescriptionCaptionLbl = 'Description';
//         UnitPriceCaption = 'Unit Price';
//         TotalPriceCaption = 'Total Price';
//     }

//     trigger OnPreReport()
//     begin
//         CompanyInformation.GET;
//         SalesSetup.GET;

//         CompanyInfo3.GET;
//         CompanyInfo3.CALCFIELDS(Picture);

//         //CASE SalesSetup."Logo Position on Documents" OF
//         //  SalesSetup."Logo Position on Documents"::"No Logo":
//         //    ;
//         //  SalesSetup."Logo Position on Documents"::Left:
//         //    BEGIN
//         //      CompanyInfo3.GET;
//         //      CompanyInfo3.CALCFIELDS(Picture);
//         //    END;
//         //  SalesSetup."Logo Position on Documents"::Center:
//         //    BEGIN
//         //      CompanyInfo1.GET;
//         //      CompanyInfo1.CALCFIELDS(Picture);
//         //    END;
//         //  SalesSetup."Logo Position on Documents"::Right:
//         //    BEGIN
//         //      CompanyInfo2.GET;
//         //      CompanyInfo2.CALCFIELDS(Picture);
//         //    END;

//         CLEAR(CompanyAddress);
//         IF PrintCompany THEN BEGIN
//             FormatAddress.Company(CompanyAddress, CompanyInformation);
//             FormatAddress.AddToArray(CompanyAddress, 'Phone: ' + CompanyInformation."Phone No.");
//             FormatAddress.AddToArray(CompanyAddress, 'Fax: ' + CompanyInformation."Fax No.");

//         END;
//         //END;
//         // NA0003.end
//     end;

//     var
//         TaxLiable: Decimal;
//         UnitPriceToPrint: Decimal;
//         AmountExclInvDisc: Decimal;
//         SalesPurchPerson: Record "13";
//         CompanyInformation: Record "79";
//         CompanyInfo1: Record "79";
//         CompanyInfo3: Record "79";
//         CompanyInfo2: Record "79";
//         SalesSetup: Record "311";
//         TempSalesCrMemoLine: Record "115" temporary;
//         RespCenter: Record "5714";
//         Language: Record "8";
//         TempSalesTaxAmtLine: Record "10011" temporary;
//         TaxArea: Record "318";
//         Cust: Record "18";
//         CompanyAddress: array[8] of Text[50];
//         BillToAddress: array[8] of Text[50];
//         ShipToAddress: array[8] of Text[50];
//         CopyTxt: Text[10];
//         PrintCompany: Boolean;
//         PrintFooter: Boolean;
//         NoCopies: Integer;
//         NoLoops: Integer;
//         CopyNo: Integer;
//         NumberOfLines: Integer;
//         OnLineNumber: Integer;
//         HighestLineNo: Integer;
//         SpacePointer: Integer;
//         SalesCrMemoPrinted: Codeunit "316";
//         FormatAddress: Codeunit "365";
//         SalesTaxCalc: Codeunit "398";
//         SegManagement: Codeunit "5051";
//         LogInteraction: Boolean;
//         Text000: Label 'COPY';
//         TaxRegNo: Text;
//         TaxRegLabel: Text;
//         TotalTaxLabel: Text;
//         BreakdownTitle: Text;
//         BreakdownLabel: array[4] of Text;
//         BreakdownAmt: array[4] of Decimal;
//         BrkIdx: Integer;
//         PrevPrintOrder: Integer;
//         PrevTaxPercent: Decimal;
//         Text003: Label 'Sales Tax Breakdown:';
//         Text004: Label 'Other Taxes';
//         Text005: Label 'Total Sales Tax:';
//         Text006: Label 'Tax Breakdown:';
//         Text007: Label 'Total Tax:';
//         Text008: Label 'Tax:';
//         Text009: Label 'VOID CREDIT MEMO';
//         [InDataSet]
//         LogInteractionEnable: Boolean;
//         CreditCaptionLbl: Label 'Credit';
//         ShipDateCaptionLbl: Label 'Ship Date';
//         ApplytoTypeCaptionLbl: Label 'Apply to Type';
//         ApplytoNumberCaptionLbl: Label 'Apply to Number';
//         CustomerIDCaptionLbl: Label 'Customer ID';
//         PONumberCaptionLbl: Label 'P.O. Number';
//         SalesPersonCaptionLbl: Label 'SalesPerson';
//         ShipCaptionLbl: Label 'Ship';
//         CreditMemoCaptionLbl: Label 'CREDIT MEMO';
//         CreditMemoNumberCaptionLbl: Label 'Credit Memo Number:';
//         CreditMemoDateCaptionLbl: Label 'Credit Memo Date:';
//         PageCaptionLbl: Label 'Page:';
//         TaxIdentTypeCaptionLbl: Label 'Tax Ident. Type';
//         ToCaptionLbl: Label 'To:';
//         ItemNoCaptionLbl: Label 'Item No.';
//         UnitCaptionLbl: Label 'Unit';
//         DescriptionCaptionLbl: Label 'Description';
//         QuantityCaptionLbl: Label 'Quantity';
//         UnitPriceCaptionLbl: Label 'Unit Price';
//         TotalPriceCaptionLbl: Label 'Total Price';
//         SubtotalCaptionLbl: Label 'Subtotal:';
//         InvoiceDiscountCaptionLbl: Label 'Invoice Discount:';
//         TotalCaptionLbl: Label 'Total:';
//         AmountSubjecttoSalesTaxCaptionLbl: Label 'Amount Subject to Sales Tax';
//         AmountExemptfromSalesTaxCaptionLbl: Label 'Amount Exempt from Sales Tax';
//         Addr: array[8, 1] of Text[250];
//         NoOfRecords: Integer;
//         RecordNo: Integer;
//         NoOfColumns: Integer;
//         [InDataSet]
//         ColumnNo: Integer;
//         i: Integer;
//         FirstOne: Boolean;
//         "--cERP Globals--": Integer;
//         QtyUOM: Decimal;
//         cERP: Codeunit "37004861";
//         tempSalesCRCat: Record "37004873" temporary;
// }
