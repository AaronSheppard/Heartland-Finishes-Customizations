// report 50002 "HF Sales Quote HL"
// {
//     // version NAVNA13.00,AI13.01,HL

//     DefaultLayout = RDLC;
//     RDLCLayout = '.vscode/src/Reports/Layouts/Sales Quote HL.rdlc';
//     Caption = 'Sales - Quote';

//     dataset
//     {
//         dataitem("Sales Header"; "Sales Header")
//         {
//             DataItemTableView = SORTING("Document Type", "No.")
//                                 WHERE("Document Type" = CONST(Quote));
//             PrintOnlyIfDetail = true;
//             RequestFilterFields = "No.", "Sell-to Customer No.", "Bill-to Customer No.", "Ship-to Code", "No. Printed";
//             RequestFilterHeading = 'Sales Order';
//             column(DocType_SalesHeader; "Document Type")
//             {
//             }
//             column(No_SalesHeader; "No.")
//             {
//             }
//             dataitem("Sales Line"; "Sales Line")
//             {
//                 DataItemLink = "Document No." = FIELD("No.");
//                 DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")
//                                     WHERE("Document Type" = CONST(Quote));
//                 dataitem(SalesLineComments; "Sales Comment Line")
//                 {
//                     DataItemLink = "No." = FIELD("Document No."),
//                                    "Document Line No." = FIELD("Line No.");
//                     DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.")
//                                         WHERE("Document Type" = CONST(Quote),
//                                               "Print On Quote" = CONST(true));

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
//                     IF CheckPackageSaleSkip THEN
//                         CurrReport.SKIP;  //AI13.00 CERP-449 SLB 08/15/18
//                     TempSalesLine := "Sales Line";
//                     TempSalesLine.INSERT;
//                     HighestLineNo := "Line No.";
//                     IF ("Sales Header"."Tax Area Code" <> '') AND NOT UseExternalTaxEngine THEN
//                         SalesTaxCalc.AddSalesLine(TempSalesLine);
//                 end;

//                 trigger OnPostDataItem()
//                 begin
//                     IF "Sales Header"."Tax Area Code" <> '' THEN BEGIN
//                         IF UseExternalTaxEngine THEN
//                             SalesTaxCalc.CallExternalTaxEngineForSales("Sales Header", TRUE)
//                         ELSE
//                             SalesTaxCalc.EndSalesTaxCalculation(UseDate);
//                         SalesTaxCalc.DistTaxOverSalesLines(TempSalesLine);
//                         SalesTaxCalc.GetSummarizedSalesTaxTable(TempSalesTaxAmtLine);
//                         BrkIdx := 0;
//                         PrevPrintOrder := 0;
//                         PrevTaxPercent := 0;
//                         WITH TempSalesTaxAmtLine DO BEGIN
//                             RESET;
//                             SETCURRENTKEY("Print Order", "Tax Area Code for Key", "Tax Jurisdiction Code");
//                             IF FIND('-') THEN
//                                 REPEAT
//                                     IF ("Print Order" = 0) OR
//                                        ("Print Order" <> PrevPrintOrder) OR
//                                        ("Tax %" <> PrevTaxPercent)
//                                     THEN BEGIN
//                                         BrkIdx := BrkIdx + 1;
//                                         IF BrkIdx > 1 THEN BEGIN
//                                             IF TaxArea."Country/Region" = TaxArea."Country/Region"::CA THEN
//                                                 BreakdownTitle := Text006
//                                             ELSE
//                                                 BreakdownTitle := Text003;
//                                         END;
//                                         IF BrkIdx > ARRAYLEN(BreakdownAmt) THEN BEGIN
//                                             BrkIdx := BrkIdx - 1;
//                                             BreakdownLabel[BrkIdx] := Text004;
//                                         END ELSE
//                                             BreakdownLabel[BrkIdx] := STRSUBSTNO("Print Description", "Tax %");
//                                     END;
//                                     BreakdownAmt[BrkIdx] := BreakdownAmt[BrkIdx] + "Tax Amount";
//                                 UNTIL NEXT = 0;
//                         END;
//                         IF BrkIdx = 1 THEN BEGIN
//                             CLEAR(BreakdownLabel);
//                             CLEAR(BreakdownAmt);
//                         END;
//                     END;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     TempSalesLine.RESET;
//                     TempSalesLine.DELETEALL;
//                 end;
//             }
//             dataitem("Sales Comment Line"; "Sales Comment Line")
//             {
//                 DataItemLink = "No." = FIELD("No.");
//                 DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.")
//                                     WHERE("Document Type" = CONST(Quote),
//                                           "Print On Quote" = CONST(true),
//                                           "Document Line No." = CONST(0));

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
//                     TempSalesLine.INSERT;
//                 end;
//             }
//             dataitem(CopyLoop; Integer)
//             {
//                 DataItemTableView = SORTING(Number);
//                 dataitem(PageLoop; Integer)
//                 {
//                     DataItemTableView = SORTING(Number)
//                                         WHERE(Number = CONST(1));
//                     column(CompanyInfo2Picture; CompanyInfo2.Picture)
//                     {
//                     }
//                     column(CompanyInfo1Picture; CompanyInfo1.Picture)
//                     {
//                     }
//                     column(CompanyInfoPicture; CompanyInfo3.Picture)
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
//                     column(BilltoCustNo_SalesHeader; "Sales Header"."Bill-to Customer No.")
//                     {
//                     }
//                     column(SalesPurchEMail; SalesPurchPerson."E-Mail")
//                     {
//                     }
//                     column(SalesPurchPhone; SalesPurchPerson."Phone No.")
//                     {
//                     }
//                     column(SalesPurchPersonName; SalesPurchPerson.Name)
//                     {
//                     }
//                     column(OrderDate_SalesHeader; "Sales Header"."Order Date")
//                     {
//                     }
//                     column(Contract_Description; "Sales Header"."Contract Description")
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
//                     column(ShippingAgentName; ShippingAgent.Name)
//                     {
//                     }
//                     column(ShippingAgentServiceCode; ShippingAgentService.Code)
//                     {
//                     }
//                     column(PaymentTermsDesc; PaymentTerms.Description)
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
//                     column(CustTaxIdentificationType; FORMAT(Cust."Tax Identification Type"))
//                     {
//                     }
//                     column(SellCaption; SellCaptionLbl)
//                     {
//                     }
//                     column(ToCaption; ToCaptionLbl)
//                     {
//                     }
//                     column(CustomerIDCaption; CustomerIDCaptionLbl)
//                     {
//                     }
//                     column(SalesPersonPhoneCaption; SalesPersonPhoneLabel)
//                     {
//                     }
//                     column(SalesPersonEMailLbl; SalesPersonEMailLbl)
//                     {
//                     }
//                     column(SalesPersonCaption; SalesPersonCaptionLbl)
//                     {
//                     }
//                     column(ShipCaption; ShipCaptionLbl)
//                     {
//                     }
//                     column(SalesQuoteCaption; SalesQuoteCaptionLbl)
//                     {
//                     }
//                     column(SalesQuoteNumberCaption; SalesQuoteNumberCaptionLbl)
//                     {
//                     }
//                     column(SalesQuoteDateCaption; SalesQuoteDateCaptionLbl)
//                     {
//                     }
//                     column(PageCaption; PageCaptionLbl)
//                     {
//                     }
//                     column(ShipViaCaption; ShipViaCaptionLbl)
//                     {
//                     }
//                     column(TermsCaption; TermsCaptionLbl)
//                     {
//                     }
//                     column(TaxIdentTypeCaption; TaxIdentTypeCaptionLbl)
//                     {
//                     }
//                     column(Job_Name_CaptionLbl; Job_Name_CaptionLbl)
//                     {
//                     }
//                     dataitem(SalesLine; Integer)
//                     {
//                         DataItemTableView = SORTING(Number);
//                         column(Number_IntegerLine; Number)
//                         {
//                         }
//                         column(AmountExclInvDisc; AmountExclInvDisc)
//                         {
//                         }
//                         column(TempSalesLineNo; TempSalesLine."No.")
//                         {
//                         }
//                         column(TempSalesLineUOM; TempSalesLine."Unit of Measure")
//                         {
//                         }
//                         column(TempSalesLineQuantity; TempSalesLine.Quantity)
//                         {
//                             DecimalPlaces = 0 : 5;
//                         }
//                         column(UnitPriceToPrint; UnitPriceToPrint)
//                         {
//                             DecimalPlaces = 2 : 5;
//                         }
//                         column(TempSalesLineDescription; TempSalesLine.Description + ' ' + TempSalesLine."Description 2")
//                         {
//                         }
//                         column(TaxLiable; TaxLiable)
//                         {
//                         }
//                         column(TempSalesLineLineAmtTaxLiable; TempSalesLine."Line Amount" - TaxLiable)
//                         {
//                         }
//                         column(TempSalesLineInvDiscAmt; TempSalesLine."Inv. Discount Amount")
//                         {
//                         }
//                         column(TaxAmount; TaxAmount)
//                         {
//                         }
//                         column(TempSalesLineLineAmtTaxAmtInvDiscAmt; TempSalesLine."Line Amount" + TaxAmount - TempSalesLine."Inv. Discount Amount")
//                         {
//                         }
//                         column(BreakdownTitle; BreakdownTitle)
//                         {
//                         }
//                         column(BreakdownLabel1; BreakdownLabel[1])
//                         {
//                         }
//                         column(BreakdownLabel2; BreakdownLabel[2])
//                         {
//                         }
//                         column(BreakdownAmt1; BreakdownAmt[1])
//                         {
//                         }
//                         column(BreakdownAmt2; BreakdownAmt[2])
//                         {
//                         }
//                         column(BreakdownLabel3; BreakdownLabel[3])
//                         {
//                         }
//                         column(BreakdownAmt3; BreakdownAmt[3])
//                         {
//                         }
//                         column(BreakdownAmt4; BreakdownAmt[4])
//                         {
//                         }
//                         column(BreakdownLabel4; BreakdownLabel[4])
//                         {
//                         }
//                         column(TotalTaxLabel; TotalTaxLabel)
//                         {
//                         }
//                         column(ItemNoCaption; ItemNoCaptionLbl)
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
//                         column(UnitPriceCaption; UnitPriceHeader)
//                         {
//                         }
//                         column(TotalPriceCaption; TotalPriceHeader)
//                         {
//                         }
//                         column(SubtotalCaption; SubtotalCaptionLbl)
//                         {
//                         }
//                         column(InvoiceDiscountCaption; InvoiceDiscountCaptionLbl)
//                         {
//                         }
//                         column(TotalCaption; TotalCaptionLbl)
//                         {
//                         }
//                         column(AmtSubjecttoSalesTaxCptn; AmtSubjecttoSalesTaxCptnLbl)
//                         {
//                         }
//                         column(AmtExemptfromSalesTaxCptn; AmtExemptfromSalesTaxCptnLbl)
//                         {
//                         }
//                         column(AmtToPrint; AmtToPrint)
//                         {
//                         }
//                         column(PricingUOMCode; TempSalesLine."Pricing UOM Code")
//                         {
//                         }
//                         column(UOMPrice; TempSalesLine."Pricing UOM Unit Price")
//                         {
//                         }
//                         column(UOMQuantity; QtyUOM)
//                         {
//                         }
//                         column(TempSalesLineLineNo; TempSalesLine."Line No.")
//                         {
//                         }
//                         dataitem(Attribute_Component; "CERP Component")
//                         {
//                             DataItemTableView = SORTING("Document Type", "Document No.", "Line No.", "Component Line No.")
//                                                 WHERE(Attribute Value=FILTER(<>''&<>BLANK VALUE),
//                                                       Blocked=CONST(No));
//                             column(Attribute_AttributeCode; "Attribute Code")
//                             {
//                             }
//                             column(Attribute_No; "No.")
//                             {
//                             }
//                             column(Attribute_Description; DescToPrint)
//                             {
//                             }
//                             column(Attribute_ComponenLineNo; "Component Line No.")
//                             {
//                             }

//                             trigger OnAfterGetRecord()
//                             var
//                                 PrintOn: Option ShopOrder,PurchaseOrder,"Picking Ticket","Packing Slip",SalesOrder,SalesInvoice,SalesCRMemo,Preinstall,SalesQuote;
//                             begin
//                                 IF NOT cERP.PrintAttribute("Attribute Code",TempSalesLine."Item Category Code",
//                                                                  TempSalesLine."Product Group Code",PrintOn::SalesQuote)
//                                   THEN CurrReport.SKIP;

//                                 //AI9.00.03 JPU 01082019 BEGIN
//                                 IF Processed1stAttribute THEN BEGIN
//                                   TaxLiable := 0;
//                                   TaxAmount := 0;
//                                   AmountExclInvDisc := 0;
//                                   TempSalesLine."Line Amount" := 0;
//                                   TempSalesLine."Inv. Discount Amount" := 0;
//                                 END ELSE
//                                   Processed1stAttribute := TRUE;
//                                 //AI9.00.03 JPU 01082019 END
//                             end;

//                             trigger OnPreDataItem()
//                             begin
//                                 IF TempSalesLine.Type = TempSalesLine.Type::" " THEN
//                                   CurrReport.BREAK;

//                                 SETRANGE("Document Type","Document Type"::Quote);
//                                 SETRANGE("Document No.",TempSalesLine."Document No.");
//                                 SETRANGE("Line No.",TempSalesLine."Line No.");

//                                 Processed1stAttribute := FALSE; //AI9.00.03 JPU 01112019
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

//                             WITH TempSalesLine DO BEGIN
//                               IF OnLineNumber = 1 THEN
//                                 FIND('-')
//                               ELSE
//                                 NEXT;

//                               IF Type = 0 THEN BEGIN
//                                 "No." := '';
//                                 "Unit of Measure" := '';
//                                 "Line Amount" := 0;
//                                 "Inv. Discount Amount" := 0;
//                                 Quantity := 0;
//                               END ELSE
//                                 IF Type = Type::"G/L Account" THEN
//                                   "No." := '';

//                               IF "Tax Area Code" <> '' THEN
//                                 TaxAmount := "Amount Including VAT" - Amount
//                               ELSE
//                                 TaxAmount := 0;
//                               IF TaxAmount <> 0 THEN
//                                 TaxLiable := Amount
//                               ELSE
//                                 TaxLiable := 0;

//                               OnAfterCalculateSalesTax("Sales Header",TempSalesLine,TaxAmount,TaxLiable);

//                               AmountExclInvDisc := "Line Amount";

//                               IF Quantity = 0 THEN
//                                 UnitPriceToPrint := 0 // so it won't print
//                               ELSE
//                                 UnitPriceToPrint := ROUND(AmountExclInvDisc / Quantity,0.00001);

//                               //AI Begin
//                               IF ("Pricing UOM Code" <> '') AND (Type = Type::Item) THEN BEGIN
//                                 ItemUOM.GET("No.","Pricing UOM Code");
//                                 ItemUOM.TESTFIELD("Qty. per Unit of Measure");
//                                 //AI9.00 JPU 11052015 BEGIN - Calculate for Variable Dimension
//                                 //QtyUOM := Quantity / ItemUOM."Qty. per Unit of Measure";
//                                 IF Item.IsItemVariableDimensionUOM("No.") THEN BEGIN
//                                   IF "Dimensional Ratio" <> 0 THEN BEGIN
//                                     IF Item.GET("No.") THEN BEGIN
//                                       Ratio := 1;
//                                       IF "Dimensional UOM Code" <> Item."Pricing UOM Code" THEN
//                                         Ratio := cERPUOMMgmt.GetRatio("Dimensional UOM Code", Item."Pricing UOM Code");
//                                       //AI9.01 JPU 06212017 BEGIN - Rounded Dimensional Ratio is the value that's used in pricing calculation
//                                       //QtyUOM := Quantity * "Dimensional Ratio" / Ratio;
//                                       QtyUOM := Quantity * "Rounded Dimensional Ratio" / Ratio;
//                                       //AI9.01 JPU 06212017 END
//                                     END;
//                                   END ELSE
//                                     QtyUOM := 0;
//                                 END ELSE
//                                   IF Item.GET("No.") AND (Item."Base Unit of Measure" = "Unit of Measure Code") THEN
//                                     QtyUOM := Quantity / ItemUOM."Qty. per Unit of Measure"
//                                   ELSE BEGIN //Convert the Unit of Measure to the Base Unit of Measure, then from the Base Unit of Measure to the Pricing Unit of Measure
//                                     ItemUOM.GET("No.", "Unit of Measure Code");
//                                     ItemUOM.TESTFIELD("Qty. per Unit of Measure");
//                                     QtyUOM := Quantity * ItemUOM."Qty. per Unit of Measure";

//                                     ItemUOM.GET("No.","Pricing UOM Code");
//                                     ItemUOM.TESTFIELD("Qty. per Unit of Measure");
//                                     QtyUOM := QtyUOM / ItemUOM."Qty. per Unit of Measure";
//                                   END;
//                                 //AI9.00 JPU 11052015 END
//                               END ELSE
//                                 QtyUOM := 0;
//                             END;

//                             //IF "Sales Header"."Suppress Item Prices" THEN  //AI13.00 CERP-449 SLB 08/15/18
//                             IF ("Sales Header"."Suppress Item Prices") OR ((TempSalesLine."Package Line No." <> 0) AND (NOT PrintDetailPricing)) THEN  //AI13.00 CERP-449 SLB 08/15/18
//                               BEGIN
//                                 UnitPriceToPrint := 0;
//                                 AmtToPrint := 0;
//                               END
//                             ELSE
//                               AmtToPrint := AmountExclInvDisc;
//                             //AI end

//                             IF OnLineNumber = NumberOfLines THEN
//                               PrintFooter := TRUE;
//                         end;

//                         trigger OnPreDataItem()
//                         begin
//                             CurrReport.CREATETOTALS(TaxLiable,TaxAmount,AmountExclInvDisc,TempSalesLine."Line Amount",TempSalesLine."Inv. Discount Amount");
//                             NumberOfLines := TempSalesLine.COUNT;
//                             SETRANGE(Number,1,NumberOfLines);
//                             OnLineNumber := 0;
//                             PrintFooter := FALSE;
//                         end;
//                     }
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     CurrReport.PAGENO := 1;

//                     IF CopyNo = NoLoops THEN BEGIN
//                       IF NOT CurrReport.PREVIEW THEN
//                         SalesPrinted.RUN("Sales Header");
//                       CurrReport.BREAK;
//                     END;
//                     CopyNo := CopyNo + 1;
//                     IF CopyNo = 1 THEN // Original
//                       CLEAR(CopyTxt)
//                     ELSE
//                       CopyTxt := Text000;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     NoLoops := 1 + ABS(NoCopies);
//                     IF NoLoops <= 0 THEN
//                       NoLoops := 1;
//                     CopyNo := 0;
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             var
//                 cERP: Codeunit "37004861";
//             begin
//                 cERP.SetCompInfoToLocationInfo("Location Code",CompanyInformation); //AI5.04

//                 IF PrintCompany THEN BEGIN
//                   FormatAddress.Company(CompanyAddress,CompanyInformation); //AI5.04
//                   FormatAddress.AddToArray(CompanyAddress,'Phone: ' +  CompanyInformation."Phone No.");
//                   FormatAddress.AddToArray(CompanyAddress,'Fax: ' + CompanyInformation."Fax No.");
//                 END;
//                   IF RespCenter.GET("Responsibility Center") THEN BEGIN
//                     FormatAddress.RespCenter(CompanyAddress,RespCenter);
//                     CompanyInformation."Phone No." := RespCenter."Phone No.";
//                     CompanyInformation."Fax No." := RespCenter."Fax No.";
//                   END;
//                 CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

//                 IF "Salesperson Code" = '' THEN
//                   CLEAR(SalesPurchPerson)
//                 ELSE
//                   SalesPurchPerson.GET("Salesperson Code");

//                 IF "Payment Terms Code" = '' THEN
//                   CLEAR(PaymentTerms)
//                 ELSE
//                   PaymentTerms.GET("Payment Terms Code");

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

//                 IF NOT Cust.GET("Sell-to Customer No.") THEN
//                   CLEAR(Cust);

//                 FormatAddress.SalesHeaderSellTo(BillToAddress,"Sales Header");
//                 FormatAddress.SalesHeaderShipTo(ShipToAddress,ShipToAddress,"Sales Header");

//                 IF NOT CurrReport.PREVIEW THEN BEGIN
//                   IF ArchiveDocument THEN
//                     ArchiveManagement.StoreSalesDocument("Sales Header",LogInteraction);

//                   IF LogInteraction THEN BEGIN
//                     CALCFIELDS("No. of Archived Versions");
//                     IF "Bill-to Contact No." <> '' THEN
//                       SegManagement.LogDocument(
//                         1,"No.","Doc. No. Occurrence",
//                         "No. of Archived Versions",DATABASE::Contact,"Bill-to Contact No.",
//                         "Salesperson Code","Campaign No.","Posting Description","Opportunity No.")
//                     ELSE
//                       SegManagement.LogDocument(
//                         1,"No.","Doc. No. Occurrence",
//                         "No. of Archived Versions",DATABASE::Customer,"Bill-to Customer No.",
//                         "Salesperson Code","Campaign No.","Posting Description","Opportunity No.");
//                   END;
//                 END;

//                 CLEAR(BreakdownTitle);
//                 CLEAR(BreakdownLabel);
//                 CLEAR(BreakdownAmt);
//                 TotalTaxLabel := Text008;
//                 TaxRegNo := '';
//                 TaxRegLabel := '';
//                 IF "Tax Area Code" <> '' THEN BEGIN
//                   TaxArea.GET("Tax Area Code");
//                   CASE TaxArea."Country/Region" OF
//                     TaxArea."Country/Region"::US:
//                       TotalTaxLabel := Text005;
//                     TaxArea."Country/Region"::CA:
//                       BEGIN
//                         TotalTaxLabel := Text007;
//                         TaxRegNo := CompanyInformation."VAT Registration No.";
//                         TaxRegLabel := CompanyInformation.FIELDCAPTION("VAT Registration No.");
//                       END;
//                   END;
//                   UseExternalTaxEngine := TaxArea."Use External Tax Engine";
//                   SalesTaxCalc.StartSalesTaxCalculation;
//                 END;

//                 UseDate := WORKDATE;

//                 // AI4.00 Angelo Begin
//                 IF "Sales Header"."Suppress Item Prices" <> TRUE THEN
//                   BEGIN
//                     TotalPriceHeader := 'Total Price';
//                     UnitPriceHeader := 'Unit Price';
//                   END;
//                 // AI4.00 Angelo End

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
//                         ApplicationArea = Basic,Suite;
//                         Caption = 'Number of Copies';
//                         ToolTip = 'Specifies the number of copies of each document (in addition to the original) that you want to print.';
//                     }
//                     field(PrintCompanyAddress; PrintCompany)
//                     {
//                         ApplicationArea = Basic,Suite;
//                         Caption = 'Print Company Address';
//                         ToolTip = 'Specifies if your company address is printed at the top of the sheet, because you do not use pre-printed paper. Leave this check box blank to omit your company''s address.';
//                     }
//                     field(ArchiveDocument; ArchiveDocument)
//                     {
//                         ApplicationArea = Basic,Suite;
//                         Caption = 'Archive Document';
//                         Enabled = ArchiveDocumentEnable;
//                         ToolTip = 'Specifies if the document is archived after you preview or print it.';

//                         trigger OnValidate()
//                         begin
//                             IF NOT ArchiveDocument THEN
//                               LogInteraction := FALSE;
//                         end;
//                     }
//                     field(LogInteraction; LogInteraction)
//                     {
//                         ApplicationArea = Basic,Suite;
//                         Caption = 'Log Interaction';
//                         Enabled = LogInteractionEnable;
//                         ToolTip = 'Specifies if you want to record the related interactions with the involved contact person in the Interaction Log Entry table.';

//                         trigger OnValidate()
//                         begin
//                             IF LogInteraction THEN
//                               ArchiveDocument := ArchiveDocumentEnable;
//                         end;
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
//             ArchiveDocumentEnable := TRUE;
//         end;

//         trigger OnOpenPage()
//         begin
//             ArchiveDocument :=
//               (SalesSetup."Archive Quotes" = SalesSetup."Archive Quotes"::Question) OR
//               (SalesSetup."Archive Quotes" = SalesSetup."Archive Quotes"::Always);
//             LogInteraction := SegManagement.FindInteractTmplCode(1) <> '';

//             ArchiveDocumentEnable := ArchiveDocument;
//             LogInteractionEnable := LogInteraction;
//         end;
//     }

//     labels
//     {
//     }

//     trigger OnInitReport()
//     begin
//         //AI13.01 JPU 02072019
//         //CompanyInfo.GET;
//         CompanyInformation.GET;
//         //AI13.01 JPU 02072019
//         SalesSetup.GET;
//         FormatDocument.SetLogoPosition(SalesSetup."Logo Position on Documents",CompanyInfo1,CompanyInfo2,CompanyInfo3);
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
//         //END;
//     end;

//     trigger OnPreReport()
//     begin
//         IF PrintCompany THEN
//           FormatAddress.Company(CompanyAddress,CompanyInformation)
//         ELSE
//           CLEAR(CompanyAddress);
//     end;

//     var
//         TaxLiable: Decimal;
//         UnitPriceToPrint: Decimal;
//         AmountExclInvDisc: Decimal;
//         ShipmentMethod: Record "10";
//         PaymentTerms: Record "3";
//         SalesPurchPerson: Record "13";
//         CompanyInformation: Record "79";
//         CompanyInfo1: Record "79";
//         CompanyInfo2: Record "79";
//         CompanyInfo3: Record "79";
//         SalesSetup: Record "311";
//         TempSalesLine: Record "37" temporary;
//         RespCenter: Record "5714";
//         Language: Record "8";
//         TempSalesTaxAmtLine: Record "10011" temporary;
//         TaxArea: Record "318";
//         Cust: Record "18";
//         SalesPrinted: Codeunit "313";
//         FormatAddress: Codeunit "365";
//         FormatDocument: Codeunit "368";
//         SalesTaxCalc: Codeunit "398";
//         ArchiveManagement: Codeunit "5063";
//         SegManagement: Codeunit "5051";
//         CompanyAddress: array [8] of Text[50];
//         BillToAddress: array [8] of Text[50];
//         ShipToAddress: array [8] of Text[50];
//         CopyTxt: Text;
//         SalespersonText: Text[50];
//         PrintCompany: Boolean;
//         PrintFooter: Boolean;
//         NoCopies: Integer;
//         NoLoops: Integer;
//         CopyNo: Integer;
//         NumberOfLines: Integer;
//         OnLineNumber: Integer;
//         HighestLineNo: Integer;
//         SpacePointer: Integer;
//         TaxAmount: Decimal;
//         ArchiveDocument: Boolean;
//         LogInteraction: Boolean;
//         Text000: Label 'COPY';
//         TaxRegNo: Text;
//         TaxRegLabel: Text;
//         TotalTaxLabel: Text;
//         BreakdownTitle: Text;
//         BreakdownLabel: array [4] of Text;
//         BreakdownAmt: array [4] of Decimal;
//         BrkIdx: Integer;
//         PrevPrintOrder: Integer;
//         PrevTaxPercent: Decimal;
//         UseDate: Date;
//         Text003: Label 'Sales Tax Breakdown:';
//         Text004: Label 'Other Taxes';
//         Text005: Label 'Total Sales Tax:';
//         Text006: Label 'Tax Breakdown:';
//         Text007: Label 'Total Tax:';
//         Text008: Label 'Tax:';
//         UseExternalTaxEngine: Boolean;
//         [InDataSet]
//         ArchiveDocumentEnable: Boolean;
//         [InDataSet]
//         LogInteractionEnable: Boolean;
//         SellCaptionLbl: Label 'Sell';
//         ToCaptionLbl: Label 'To:';
//         CustomerIDCaptionLbl: Label 'Customer ID';
//         SalesPersonCaptionLbl: Label 'SalesPerson';
//         ShipCaptionLbl: Label 'Ship';
//         SalesQuoteCaptionLbl: Label 'Sales Quote';
//         SalesQuoteNumberCaptionLbl: Label 'Sales Quote Number:';
//         SalesQuoteDateCaptionLbl: Label 'Sales Quote Date:';
//         PageCaptionLbl: Label 'Page:';
//         ShipViaCaptionLbl: Label 'Ship Via';
//         TermsCaptionLbl: Label 'Terms';
//         TaxIdentTypeCaptionLbl: Label 'Tax Ident. Type';
//         ItemNoCaptionLbl: Label 'Item No.';
//         UnitCaptionLbl: Label 'Unit';
//         DescriptionCaptionLbl: Label 'Description';
//         QuantityCaptionLbl: Label 'Quantity';
//         UnitPriceCaptionLbl: Label 'Unit Price';
//         TotalPriceCaptionLbl: Label 'Total Price';
//         SubtotalCaptionLbl: Label 'Subtotal:';
//         InvoiceDiscountCaptionLbl: Label 'Invoice Discount:';
//         TotalCaptionLbl: Label 'Total:';
//         AmtSubjecttoSalesTaxCptnLbl: Label 'Amount Subject to Sales Tax';
//         AmtExemptfromSalesTaxCptnLbl: Label 'Amount Exempt from Sales Tax';
//         TotalPriceHeader: Text[30];
//         UnitPriceHeader: Text[30];
//         AmtToPrint: Decimal;
//         "--cERP Globals--": Integer;
//         QtyUOM: Decimal;
//         SalesPersonPhoneLabel: Label 'Phone #';
//         SalesPersonEMailLbl: Label 'Email';
//         Job_Name_CaptionLbl: Label 'Job Name:';
//         ShippingAgent: Record "Shipping Agent";
//         ShippingAgentService: Record "5790";
//         PrintDetailPricing: Boolean;
//         Processed1stAttribute: Boolean;
//         cERP: Codeunit "37004861";

//     local procedure FormatDocumentFields(SalesHeader: Record "36")
//     begin
//         WITH SalesHeader DO BEGIN
//           FormatDocument.SetSalesPerson(SalesPurchPerson,"Salesperson Code",SalespersonText);
//           FormatDocument.SetPaymentTerms(PaymentTerms,"Payment Terms Code","Language Code");
//           FormatDocument.SetShipmentMethod(ShipmentMethod,"Shipment Method Code","Language Code");
//         END;
//     end;

//     [IntegrationEvent(false, false)]
//     local procedure OnAfterCalculateSalesTax(var SalesHeaderParm: Record "36";var SalesLineParm: Record "37";var TaxAmount: Decimal;var TaxLiable: Decimal)
//     begin
//     end;

//     local procedure CheckPackageSaleSkip(): Boolean
//     var
//         ConfigSetup: Record "CERP Configurator Setup";
//         PkgSaleMgmt: Codeunit "37013600";
//         ParentPkgLine: Record "37";
//     begin
//         //AI13.00 CERP-449 SLB 06/14/18
//         IF ("Sales Line"."Package Line No." <> 0) THEN BEGIN
//           PkgSaleMgmt.InitFiltersForParent("Sales Line"."Document Type","Sales Line"."Document No.","Sales Line"."Package Line No.",ParentPkgLine);
//           IF ParentPkgLine.FINDSET AND (NOT ParentPkgLine."Print Detail Lines on Sales") THEN
//             EXIT(TRUE);
//           //PrintDetailPricing := ConfigSetup."Print Detail Pricing on Sales";
//           PrintDetailPricing := ParentPkgLine."Print Detail Pricing on Sales";
//         END;
//         EXIT(FALSE);
//     end;
// }
