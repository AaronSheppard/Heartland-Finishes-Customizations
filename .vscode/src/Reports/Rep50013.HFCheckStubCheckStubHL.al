// report 50013 "HF Check (Stub/Check/Stub) HL"
// {
//     // version NAVNA13.00,AI13.00

//     DefaultLayout = RDLC;
//     RDLCLayout = '.vscode/src/Reports/Layouts/Check (StubCheckStub) HL.rdlc';
//     Caption = 'Check (Stub/Check/Stub)';
//     Permissions = TableData 270 = m;

//     dataset
//     {
//         dataitem(VoidGenJnlLine; Table81)
//         {
//             DataItemTableView = SORTING(Journal Template Name, Journal Batch Name, Posting Date, Document No.);
//             RequestFilterFields = "Journal Template Name", "Journal Batch Name", "Posting Date";

//             trigger OnAfterGetRecord()
//             begin
//                 CheckManagement.VoidCheck(VoidGenJnlLine);
//             end;

//             trigger OnPreDataItem()
//             begin
//                 IF CurrReport.PREVIEW THEN
//                     ERROR(Text000);

//                 IF UseCheckNo = '' THEN
//                     ERROR(Text001);

//                 IF INCSTR(UseCheckNo) = '' THEN
//                     ERROR(USText004);

//                 IF TestPrint THEN
//                     CurrReport.BREAK;

//                 IF NOT ReprintChecks THEN
//                     CurrReport.BREAK;

//                 IF (GETFILTER("Line No.") <> '') OR (GETFILTER("Document No.") <> '') THEN
//                     ERROR(
//                       Text002, FIELDCAPTION("Line No."), FIELDCAPTION("Document No."));
//                 SETRANGE("Bank Payment Type", "Bank Payment Type"::"Computer Check");
//                 SETRANGE("Check Printed", TRUE);
//             end;
//         }
//         dataitem(TestGenJnlLine; Table81)
//         {
//             DataItemTableView = SORTING(Journal Template Name, Journal Batch Name, "Line No.");

//             trigger OnAfterGetRecord()
//             begin
//                 IF Amount = 0 THEN
//                     CurrReport.SKIP;

//                 TESTFIELD("Bal. Account Type", "Bal. Account Type"::"Bank Account");
//                 IF "Bal. Account No." <> BankAcc2."No." THEN
//                     CurrReport.SKIP;
//                 CASE "Account Type" OF
//                     "Account Type"::"G/L Account":
//                         BEGIN
//                             IF BankAcc2."Check Date Format" = BankAcc2."Check Date Format"::" " THEN
//                                 ERROR(USText006, BankAcc2.FIELDCAPTION("Check Date Format"), BankAcc2.TABLECAPTION, BankAcc2."No.");
//                             IF BankAcc2."Bank Communication" = BankAcc2."Bank Communication"::"S Spanish" THEN
//                                 ERROR(USText007, BankAcc2.FIELDCAPTION("Bank Communication"), BankAcc2.TABLECAPTION, BankAcc2."No.");
//                         END;
//                     "Account Type"::Customer:
//                         BEGIN
//                             Cust.GET("Account No.");
//                             IF Cust."Check Date Format" = Cust."Check Date Format"::" " THEN
//                                 ERROR(USText006, Cust.FIELDCAPTION("Check Date Format"), Cust.TABLECAPTION, "Account No.");
//                             IF Cust."Bank Communication" = Cust."Bank Communication"::"S Spanish" THEN
//                                 ERROR(USText007, Cust.FIELDCAPTION("Bank Communication"), Cust.TABLECAPTION, "Account No.");
//                         END;
//                     "Account Type"::Vendor:
//                         BEGIN
//                             Vend.GET("Account No.");
//                             IF Vend."Check Date Format" = Vend."Check Date Format"::" " THEN
//                                 ERROR(USText006, Vend.FIELDCAPTION("Check Date Format"), Vend.TABLECAPTION, "Account No.");
//                             IF Vend."Bank Communication" = Vend."Bank Communication"::"S Spanish" THEN
//                                 ERROR(USText007, Vend.FIELDCAPTION("Bank Communication"), Vend.TABLECAPTION, "Account No.");
//                         END;
//                     "Account Type"::"Bank Account":
//                         BEGIN
//                             BankAcc.GET("Account No.");
//                             IF BankAcc."Check Date Format" = BankAcc."Check Date Format"::" " THEN
//                                 ERROR(USText006, BankAcc.FIELDCAPTION("Check Date Format"), BankAcc.TABLECAPTION, "Account No.");
//                             IF BankAcc."Bank Communication" = BankAcc."Bank Communication"::"S Spanish" THEN
//                                 ERROR(USText007, BankAcc.FIELDCAPTION("Bank Communication"), BankAcc.TABLECAPTION, "Account No.");
//                         END;
//                 END;
//             end;

//             trigger OnPreDataItem()
//             begin
//                 IF TestPrint THEN BEGIN
//                     CompanyInfo.GET;
//                     BankAcc2.GET(BankAcc2."No.");
//                     BankCurrencyCode := BankAcc2."Currency Code";
//                 END;

//                 IF TestPrint THEN
//                     CurrReport.BREAK;
//                 CompanyInfo.GET;
//                 BankAcc2.GET(BankAcc2."No.");
//                 BankCurrencyCode := BankAcc2."Currency Code";

//                 IF BankAcc2."Country/Region Code" <> 'CA' THEN
//                     CurrReport.BREAK;
//                 BankAcc2.TESTFIELD(Blocked, FALSE);
//                 COPY(VoidGenJnlLine);
//                 BankAcc2.GET(BankAcc2."No.");
//                 BankAcc2.TESTFIELD(Blocked, FALSE);
//                 SETRANGE("Bank Payment Type", "Bank Payment Type"::"Computer Check");
//                 SETRANGE("Check Printed", FALSE);
//             end;
//         }
//         dataitem(GenJnlLine; Table81)
//         {
//             DataItemTableView = SORTING(Journal Template Name, Journal Batch Name, Posting Date, Document No.);
//             column(GenJnlLine_Journal_Template_Name; "Journal Template Name")
//             {
//             }
//             column(GenJnlLine_Journal_Batch_Name; "Journal Batch Name")
//             {
//             }
//             column(GenJnlLine_Line_No_; "Line No.")
//             {
//             }
//             dataitem(CheckPages; Integer)
//             {
//                 DataItemTableView = SORTING(Number);
//                 column(CheckToAddr_1_; CheckToAddr[1])
//                 {
//                 }
//                 column(CheckDateText; CheckDateText)
//                 {
//                 }
//                 column(CheckNoText; CheckNoText)
//                 {
//                 }
//                 column(PageNo; PageNo)
//                 {
//                 }
//                 column(CheckPages_Number; Number)
//                 {
//                 }
//                 column(CheckNoTextCaption; CheckNoTextCaptionLbl)
//                 {
//                 }
//                 dataitem(PrintSettledLoop; Integer)
//                 {
//                     DataItemTableView = SORTING(Number);
//                     column(PreprintedStub; PreprintedStub)
//                     {
//                     }
//                     column(LineAmount; LineAmount)
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(LineDiscount; LineDiscount)
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(LineAmount___LineDiscount; LineAmount + LineDiscount)
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(DocNo; DocNo)
//                     {
//                     }
//                     column(DocDate; DocDate)
//                     {
//                     }
//                     column(PostingDesc; PostingDesc)
//                     {
//                     }
//                     column(PrintSettledLoop_Number; Number)
//                     {
//                     }
//                     column(LineAmountCaption; LineAmountCaptionLbl)
//                     {
//                     }
//                     column(LineDiscountCaption; LineDiscountCaptionLbl)
//                     {
//                     }
//                     column(DocNoCaption; DocNoCaptionLbl)
//                     {
//                     }
//                     column(DocDateCaption; DocDateCaptionLbl)
//                     {
//                     }
//                     column(Posting_DescriptionCaption; Posting_DescriptionCaptionLbl)
//                     {
//                     }
//                     column(AmountCaption; AmountCaptionLbl)
//                     {
//                     }
//                     column(PrintExtendStub; PrintExtendStub)
//                     {
//                     }
//                     column(FirstLine; FirstLine)
//                     {
//                     }

//                     trigger OnAfterGetRecord()
//                     begin
//                         //AI9.00 Start
//                         IF NOT PrintExtendStub THEN BEGIN
//                             IF StubLineCount >= MaxStubLine THEN
//                                 CurrReport.BREAK;
//                         END;
//                         //AI9.00 end
//                         IF NOT TestPrint THEN BEGIN
//                             IF FoundLast THEN BEGIN
//                                 IF RemainingAmount <> 0 THEN BEGIN
//                                     DocNo := '';
//                                     ExtDocNo := '';
//                                     LineAmount := RemainingAmount;
//                                     LineAmount2 := RemainingAmount;
//                                     CurrentLineAmount := LineAmount2;
//                                     LineDiscount := 0;
//                                     RemainingAmount := 0;

//                                     PostingDesc := CheckToAddr[1];
//                                 END ELSE
//                                     CurrReport.BREAK;
//                                 //  END ELSE                                                 //AI9.00
//                             END ELSE BEGIN                                             //AI9.00
//                                 CASE ApplyMethod OF
//                                     ApplyMethod::OneLineOneEntry:
//                                         BEGIN
//                                             CASE BalancingType OF
//                                                 BalancingType::Customer:
//                                                     PrintOneLineOneEntryOnAfterGetRecordForCustomer(CustLedgEntry);
//                                                 BalancingType::Vendor:
//                                                     PrintOneLineOneEntryOnAfterGetRecordForVendor(VendLedgEntry);
//                                                 BalancingType::Employee:
//                                                     PrintOneLineOneEntryOnAfterGetRecordForEmployee(EmployeeLedgerEntry);
//                                             END;
//                                             RemainingAmount := RemainingAmount - LineAmount2;
//                                             CurrentLineAmount := LineAmount2;
//                                             FoundLast := TRUE;
//                                         END;
//                                     ApplyMethod::OneLineID:
//                                         BEGIN
//                                             CASE BalancingType OF
//                                                 BalancingType::Customer:
//                                                     BEGIN
//                                                         CustUpdateAmounts(CustLedgEntry, RemainingAmount);
//                                                         FoundLast := (CustLedgEntry.NEXT = 0) OR (RemainingAmount <= 0);
//                                                         IF FoundLast AND NOT FoundNegative THEN BEGIN
//                                                             CustLedgEntry.SETRANGE(Positive, FALSE);
//                                                             FoundLast := NOT CustLedgEntry.FIND('-');
//                                                             FoundNegative := TRUE;
//                                                         END;
//                                                     END;
//                                                 BalancingType::Vendor:
//                                                     BEGIN
//                                                         VendUpdateAmounts(VendLedgEntry, RemainingAmount);
//                                                         FoundLast := (VendLedgEntry.NEXT = 0) OR (RemainingAmount <= 0);
//                                                         IF FoundLast AND NOT FoundNegative THEN BEGIN
//                                                             VendLedgEntry.SETRANGE(Positive, FALSE);
//                                                             FoundLast := NOT VendLedgEntry.FIND('-');
//                                                             FoundNegative := TRUE;
//                                                         END;
//                                                     END;
//                                             END;
//                                             RemainingAmount := RemainingAmount - LineAmount2;
//                                             CurrentLineAmount := LineAmount2
//                                         END;
//                                     ApplyMethod::MoreLinesOneEntry:
//                                         BEGIN
//                                             CurrentLineAmount := GenJnlLine2.Amount;
//                                             LineAmount2 := CurrentLineAmount;
//                                             IF GenJnlLine2."Applies-to ID" <> '' THEN
//                                                 ERROR(
//                                                   Text016 +
//                                                   Text017);
//                                             GenJnlLine2.TESTFIELD("Check Printed", FALSE);
//                                             GenJnlLine2.TESTFIELD("Bank Payment Type", GenJnlLine2."Bank Payment Type"::"Computer Check");

//                                             IF GenJnlLine2."Applies-to Doc. No." = '' THEN BEGIN
//                                                 DocNo := '';
//                                                 ExtDocNo := '';
//                                                 LineAmount := CurrentLineAmount;
//                                                 LineDiscount := 0;
//                                                 PostingDesc := GenJnlLine2.Description;
//                                             END ELSE
//                                                 CASE BalancingType OF
//                                                     BalancingType::"G/L Account":
//                                                         BEGIN
//                                                             DocNo := GenJnlLine2."Document No.";
//                                                             ExtDocNo := GenJnlLine2."External Document No.";
//                                                             LineAmount := CurrentLineAmount;
//                                                             LineDiscount := 0;
//                                                             PostingDesc := GenJnlLine2.Description;
//                                                         END;
//                                                     BalancingType::Customer:
//                                                         BEGIN
//                                                             CustLedgEntry.RESET;
//                                                             CustLedgEntry.SETCURRENTKEY("Document No.");
//                                                             CustLedgEntry.SETRANGE("Document Type", GenJnlLine2."Applies-to Doc. Type");
//                                                             CustLedgEntry.SETRANGE("Document No.", GenJnlLine2."Applies-to Doc. No.");
//                                                             CustLedgEntry.SETRANGE("Customer No.", BalancingNo);
//                                                             CustLedgEntry.FIND('-');
//                                                             CustUpdateAmounts(CustLedgEntry, CurrentLineAmount);
//                                                             LineAmount := CurrentLineAmount;
//                                                         END;
//                                                     BalancingType::Vendor:
//                                                         BEGIN
//                                                             VendLedgEntry.RESET;
//                                                             VendLedgEntry.SETCURRENTKEY("Document No.");
//                                                             VendLedgEntry.SETRANGE("Document Type", GenJnlLine2."Applies-to Doc. Type");
//                                                             VendLedgEntry.SETRANGE("Document No.", GenJnlLine2."Applies-to Doc. No.");
//                                                             VendLedgEntry.SETRANGE("Vendor No.", BalancingNo);
//                                                             VendLedgEntry.FIND('-');
//                                                             VendUpdateAmounts(VendLedgEntry, CurrentLineAmount);
//                                                             LineAmount := CurrentLineAmount;
//                                                         END;
//                                                     BalancingType::"Bank Account":
//                                                         BEGIN
//                                                             DocNo := GenJnlLine2."Document No.";
//                                                             ExtDocNo := GenJnlLine2."External Document No.";
//                                                             LineAmount := CurrentLineAmount;
//                                                             LineDiscount := 0;
//                                                             PostingDesc := GenJnlLine2.Description;
//                                                         END;
//                                                     BalancingType::Employee:
//                                                         BEGIN
//                                                             EmployeeLedgerEntry.RESET;
//                                                             IF GenJnlLine2."Source Line No." <> 0 THEN
//                                                                 EmployeeLedgerEntry.SETRANGE("Entry No.", GenJnlLine2."Source Line No.")
//                                                             ELSE BEGIN
//                                                                 EmployeeLedgerEntry.SETCURRENTKEY("Document No.");
//                                                                 EmployeeLedgerEntry.SETRANGE("Document Type", GenJnlLine2."Applies-to Doc. Type");
//                                                                 EmployeeLedgerEntry.SETRANGE("Document No.", GenJnlLine2."Applies-to Doc. No.");
//                                                                 EmployeeLedgerEntry.SETRANGE("Employee No.", BalancingNo);
//                                                             END;
//                                                             EmployeeLedgerEntry.FINDFIRST;
//                                                             EmployeeUpdateAmounts(EmployeeLedgerEntry, CurrentLineAmount);
//                                                             LineAmount := CurrentLineAmount;
//                                                         END;
//                                                 END;

//                                             FoundLast := GenJnlLine2.NEXT = 0;
//                                         END;
//                                 END;                                 //AI9.00
//                                 StubLineCount := StubLineCount + 1;  //AI9.00
//                             END;

//                             TotalLineAmount := TotalLineAmount + CurrentLineAmount;
//                             TotalLineDiscount := TotalLineDiscount + LineDiscount;

//                             //AI9.00 Begin
//                             IF PrintExtendStub THEN BEGIN
//                                 IF PrintSettledLoop.Number = 1 THEN
//                                     FirstLine := TRUE
//                                 ELSE
//                                     FirstLine := FALSE;
//                                 ExtendCheckStub.RESET;
//                                 ExtendCheckStub.LOCKTABLE;
//                                 IF ExtendCheckStub.FIND('+') THEN
//                                     NextEntryNo := ExtendCheckStub."Entry No"
//                                 ELSE
//                                     NextEntryNo := 0;
//                                 ExtendCheckStub."Entry No" := NextEntryNo + 1;
//                                 ExtendCheckStub."Journal Template Name" := GenJnlLine."Journal Template Name";
//                                 ExtendCheckStub."Journal Batch Name" := GenJnlLine."Journal Batch Name";
//                                 ExtendCheckStub."Check No" := UseCheckNo;
//                                 ExtendCheckStub."Vendor No" := GenJnlLine."Account No.";
//                                 ExtendCheckStub."Vendor Name" := CheckToAddr[1];
//                                 ExtendCheckStub.Description := PostingDesc;
//                                 ExtendCheckStub."Check Date" := GenJnlLine."Posting Date";
//                                 ExtendCheckStub."Document No" := DocNo;
//                                 ExtendCheckStub."Document  Date" := DocDate;
//                                 ExtendCheckStub."Gross Amount" := LineDiscount + LineAmount;
//                                 ExtendCheckStub."Discount Amount" := LineDiscount;
//                                 ExtendCheckStub."Net Amount" := LineAmount;
//                                 ExtendCheckStub.INSERT;
//                                 NextEntryNo := NextEntryNo + 1;
//                             END;
//                             //AI9.00 end

//                         END ELSE BEGIN
//                             IF FoundLast THEN
//                                 CurrReport.BREAK;
//                             FoundLast := TRUE;
//                             DocNo := Text010;
//                             ExtDocNo := Text010;
//                             LineAmount := 0;
//                             LineDiscount := 0;
//                             PostingDesc := '';
//                         END;

//                         IF DocNo = '' THEN
//                             CurrencyCode2 := GenJnlLine."Currency Code";

//                         IF NOT PrintExtendStub THEN                               //AI9.00
//                          BEGIN                                                    //AI9.00
//                             Stub2LineNo := Stub2LineNo + 1;
//                             Stub2DocNo[Stub2LineNo] := DocNo;
//                             Stub2DocDate[Stub2LineNo] := DocDate;
//                             Stub2LineAmount[Stub2LineNo] := LineAmount;
//                             Stub2LineDiscount[Stub2LineNo] := LineDiscount;
//                             Stub2PostingDesc[Stub2LineNo] := PostingDesc;
//                         END;                                                     //AI9.00
//                     end;

//                     trigger OnPreDataItem()
//                     begin
//                         PrintSettledLoop.SETRANGE(Number, 1, 10000);                 //AI9.00
//                         MaxStubLine := 10;                                         //AI9.00
//                         PrintCheckHelper.PrintSettledLoopHelper(CustLedgEntry, VendLedgEntry, GenJnlLine, BalancingType, BalancingNo,
//                         //  FoundLast,TestPrint,FirstPage,FoundNegative,ApplyMethod);                                            //AI9.00
//                           FoundLast, TestPrint, FirstPage, FoundNegative, ApplyMethod, PrintExtendStub, MaxStubLine);                  //AI9.00

//                         IF PreprintedStub THEN BEGIN
//                             TotalText := '';
//                         END ELSE BEGIN
//                             TotalText := Text019;
//                             Stub2DocNoHeader := USText011;
//                             Stub2DocDateHeader := USText012;
//                             Stub2AmountHeader := USText013;
//                             Stub2DiscountHeader := USText014;
//                             Stub2NetAmountHeader := USText015;
//                             Stub2PostingDescHeader := USText017;
//                         END;
//                         GLSetup.GET;
//                         PageNo := PageNo + 1;
//                         StubLineCount := 0;                                        //AI9.00
//                     end;
//                 }
//                 dataitem(PrintCheck; Integer)
//                 {
//                     DataItemTableView = SORTING(Number);
//                     MaxIteration = 1;
//                     column(PrnChkCheckToAddr_CheckStyle__CA_5_; PrnChkCheckToAddr[CheckStyle::CA, 5])
//                     {
//                     }
//                     column(PrnChkCheckToAddr_CheckStyle__CA_4_; PrnChkCheckToAddr[CheckStyle::CA, 4])
//                     {
//                     }
//                     column(PrnChkCheckToAddr_CheckStyle__CA_3_; PrnChkCheckToAddr[CheckStyle::CA, 3])
//                     {
//                     }
//                     column(PrnChkCheckToAddr_CheckStyle__CA_2_; PrnChkCheckToAddr[CheckStyle::CA, 2])
//                     {
//                     }
//                     column(PrnChkCheckToAddr_CheckStyle__CA_1_; PrnChkCheckToAddr[CheckStyle::CA, 1])
//                     {
//                     }
//                     column(PrnChkCheckAmountText_CheckStyle__US_; PrnChkCheckAmountText[CheckStyle::US])
//                     {
//                     }
//                     column(PrnChkCheckDateText_CheckStyle__US_; PrnChkCheckDateText[CheckStyle::US])
//                     {
//                     }
//                     column(PrnChkDescriptionLine_CheckStyle__US_2_; PrnChkDescriptionLine[CheckStyle::US, 2])
//                     {
//                     }
//                     column(PrnChkDescriptionLine_CheckStyle__US_1_; PrnChkDescriptionLine[CheckStyle::US, 1])
//                     {
//                     }
//                     column(PrnChkCheckToAddr_CheckStyle__US_1_; PrnChkCheckToAddr[CheckStyle::US, 1])
//                     {
//                     }
//                     column(PrnChkCheckToAddr_CheckStyle__US_2_; PrnChkCheckToAddr[CheckStyle::US, 2])
//                     {
//                     }
//                     column(PrnChkCheckToAddr_CheckStyle__US_4_; PrnChkCheckToAddr[CheckStyle::US, 4])
//                     {
//                     }
//                     column(PrnChkCheckToAddr_CheckStyle__US_3_; PrnChkCheckToAddr[CheckStyle::US, 3])
//                     {
//                     }
//                     column(PrnChkCheckToAddr_CheckStyle__US_5_; PrnChkCheckToAddr[CheckStyle::US, 5])
//                     {
//                     }
//                     column(PrnChkCompanyAddr_CheckStyle__US_4_; PrnChkCompanyAddr[CheckStyle::US, 4])
//                     {
//                     }
//                     column(PrnChkCompanyAddr_CheckStyle__US_6_; PrnChkCompanyAddr[CheckStyle::US, 6])
//                     {
//                     }
//                     column(PrnChkCompanyAddr_CheckStyle__US_5_; PrnChkCompanyAddr[CheckStyle::US, 5])
//                     {
//                     }
//                     column(PrnChkCompanyAddr_CheckStyle__US_3_; PrnChkCompanyAddr[CheckStyle::US, 3])
//                     {
//                     }
//                     column(PrnChkCheckNoText_CheckStyle__US_; PrnChkCheckNoText[CheckStyle::US])
//                     {
//                     }
//                     column(PrnChkCompanyAddr_CheckStyle__US_2_; PrnChkCompanyAddr[CheckStyle::US, 2])
//                     {
//                     }
//                     column(PrnChkCompanyAddr_CheckStyle__US_1_; PrnChkCompanyAddr[CheckStyle::US, 1])
//                     {
//                     }
//                     column(TotalLineAmount; TotalLineAmount)
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(TotalText; TotalText)
//                     {
//                     }
//                     column(PrnChkVoidText_CheckStyle__US_; PrnChkVoidText[CheckStyle::US])
//                     {
//                     }
//                     column(PrnChkCompanyAddr_CheckStyle__CA_1_; PrnChkCompanyAddr[CheckStyle::CA, 1])
//                     {
//                     }
//                     column(PrnChkCompanyAddr_CheckStyle__CA_2_; PrnChkCompanyAddr[CheckStyle::CA, 2])
//                     {
//                     }
//                     column(PrnChkCompanyAddr_CheckStyle__CA_3_; PrnChkCompanyAddr[CheckStyle::CA, 3])
//                     {
//                     }
//                     column(PrnChkCompanyAddr_CheckStyle__CA_4_; PrnChkCompanyAddr[CheckStyle::CA, 4])
//                     {
//                     }
//                     column(PrnChkCompanyAddr_CheckStyle__CA_5_; PrnChkCompanyAddr[CheckStyle::CA, 5])
//                     {
//                     }
//                     column(PrnChkCompanyAddr_CheckStyle__CA_6_; PrnChkCompanyAddr[CheckStyle::CA, 6])
//                     {
//                     }
//                     column(PrnChkDescriptionLine_CheckStyle__CA_1_; PrnChkDescriptionLine[CheckStyle::CA, 1])
//                     {
//                     }
//                     column(PrnChkDescriptionLine_CheckStyle__CA_2_; PrnChkDescriptionLine[CheckStyle::CA, 2])
//                     {
//                     }
//                     column(PrnChkCheckDateText_CheckStyle__CA_; PrnChkCheckDateText[CheckStyle::CA])
//                     {
//                     }
//                     column(PrnChkDateIndicator_CheckStyle__CA_; PrnChkDateIndicator[CheckStyle::CA])
//                     {
//                     }
//                     column(PrnChkCheckAmountText_CheckStyle__CA_; PrnChkCheckAmountText[CheckStyle::CA])
//                     {
//                     }
//                     column(PrnChkVoidText_CheckStyle__CA_; PrnChkVoidText[CheckStyle::CA])
//                     {
//                     }
//                     column(PrnChkCurrencyCode_CheckStyle__CA_; PrnChkCurrencyCode[CheckStyle::CA])
//                     {
//                     }
//                     column(PrnChkCurrencyCode_CheckStyle__US_; PrnChkCurrencyCode[CheckStyle::US])
//                     {
//                     }
//                     column(CheckNoText_Control1480000; CheckNoText)
//                     {
//                     }
//                     column(CheckDateText_Control1480021; CheckDateText)
//                     {
//                     }
//                     column(CheckToAddr_1__Control1480022; CheckToAddr[1])
//                     {
//                     }
//                     column(Stub2DocNoHeader; Stub2DocNoHeader)
//                     {
//                     }
//                     column(Stub2DocDateHeader; Stub2DocDateHeader)
//                     {
//                     }
//                     column(Stub2AmountHeader; Stub2AmountHeader)
//                     {
//                     }
//                     column(Stub2DiscountHeader; Stub2DiscountHeader)
//                     {
//                     }
//                     column(Stub2NetAmountHeader; Stub2NetAmountHeader)
//                     {
//                     }
//                     column(Stub2LineAmount_1_; Stub2LineAmount[1])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineDiscount_1_; Stub2LineDiscount[1])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineAmount_1____Stub2LineDiscount_1_; Stub2LineAmount[1] + Stub2LineDiscount[1])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2DocDate_1_; Stub2DocDate[1])
//                     {
//                     }
//                     column(Stub2DocNo_1_; Stub2DocNo[1])
//                     {
//                     }
//                     column(Stub2LineAmount_2_; Stub2LineAmount[2])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineDiscount_2_; Stub2LineDiscount[2])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineAmount_2____Stub2LineDiscount_2_; Stub2LineAmount[2] + Stub2LineDiscount[2])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2DocDate_2_; Stub2DocDate[2])
//                     {
//                     }
//                     column(Stub2DocNo_2_; Stub2DocNo[2])
//                     {
//                     }
//                     column(Stub2LineAmount_3_; Stub2LineAmount[3])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineDiscount_3_; Stub2LineDiscount[3])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineAmount_3____Stub2LineDiscount_3_; Stub2LineAmount[3] + Stub2LineDiscount[3])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2DocDate_3_; Stub2DocDate[3])
//                     {
//                     }
//                     column(Stub2DocNo_3_; Stub2DocNo[3])
//                     {
//                     }
//                     column(Stub2LineAmount_4_; Stub2LineAmount[4])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineDiscount_4_; Stub2LineDiscount[4])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineAmount_4____Stub2LineDiscount_4_; Stub2LineAmount[4] + Stub2LineDiscount[4])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2DocDate_4_; Stub2DocDate[4])
//                     {
//                     }
//                     column(Stub2DocNo_4_; Stub2DocNo[4])
//                     {
//                     }
//                     column(Stub2LineAmount_5_; Stub2LineAmount[5])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineDiscount_5_; Stub2LineDiscount[5])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineAmount_5____Stub2LineDiscount_5_; Stub2LineAmount[5] + Stub2LineDiscount[5])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2DocDate_5_; Stub2DocDate[5])
//                     {
//                     }
//                     column(Stub2DocNo_5_; Stub2DocNo[5])
//                     {
//                     }
//                     column(Stub2LineAmount_6_; Stub2LineAmount[6])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineDiscount_6_; Stub2LineDiscount[6])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineAmount_6____Stub2LineDiscount_6_; Stub2LineAmount[6] + Stub2LineDiscount[6])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2DocDate_6_; Stub2DocDate[6])
//                     {
//                     }
//                     column(Stub2DocNo_6_; Stub2DocNo[6])
//                     {
//                     }
//                     column(Stub2LineAmount_7_; Stub2LineAmount[7])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineDiscount_7_; Stub2LineDiscount[7])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineAmount_7____Stub2LineDiscount_7_; Stub2LineAmount[7] + Stub2LineDiscount[7])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2DocDate_7_; Stub2DocDate[7])
//                     {
//                     }
//                     column(Stub2DocNo_7_; Stub2DocNo[7])
//                     {
//                     }
//                     column(Stub2LineAmount_8_; Stub2LineAmount[8])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineDiscount_8_; Stub2LineDiscount[8])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineAmount_8____Stub2LineDiscount_8_; Stub2LineAmount[8] + Stub2LineDiscount[8])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2DocDate_8_; Stub2DocDate[8])
//                     {
//                     }
//                     column(Stub2DocNo_8_; Stub2DocNo[8])
//                     {
//                     }
//                     column(Stub2LineAmount_9_; Stub2LineAmount[9])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineDiscount_9_; Stub2LineDiscount[9])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineAmount_9____Stub2LineDiscount_9_; Stub2LineAmount[9] + Stub2LineDiscount[9])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2DocDate_9_; Stub2DocDate[9])
//                     {
//                     }
//                     column(Stub2DocNo_9_; Stub2DocNo[9])
//                     {
//                     }
//                     column(Stub2LineAmount_10_; Stub2LineAmount[10])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineDiscount_10_; Stub2LineDiscount[10])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2LineAmount_10____Stub2LineDiscount_10_; Stub2LineAmount[10] + Stub2LineDiscount[10])
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(Stub2DocDate_10_; Stub2DocDate[10])
//                     {
//                     }
//                     column(Stub2DocNo_10_; Stub2DocNo[10])
//                     {
//                     }
//                     column(TotalLineAmount_Control1480082; TotalLineAmount)
//                     {
//                         AutoFormatExpression = GenJnlLine."Currency Code";
//                         AutoFormatType = 1;
//                     }
//                     column(TotalText_Control1480083; TotalText)
//                     {
//                     }
//                     column(Stub2PostingDescHeader; Stub2PostingDescHeader)
//                     {
//                     }
//                     column(Stub2PostingDesc_1_; Stub2PostingDesc[1])
//                     {
//                     }
//                     column(Stub2PostingDesc_2_; Stub2PostingDesc[2])
//                     {
//                     }
//                     column(Stub2PostingDesc_4_; Stub2PostingDesc[4])
//                     {
//                     }
//                     column(Stub2PostingDesc_3_; Stub2PostingDesc[3])
//                     {
//                     }
//                     column(Stub2PostingDesc_8_; Stub2PostingDesc[8])
//                     {
//                     }
//                     column(Stub2PostingDesc_7_; Stub2PostingDesc[7])
//                     {
//                     }
//                     column(Stub2PostingDesc_6_; Stub2PostingDesc[6])
//                     {
//                     }
//                     column(Stub2PostingDesc_5_; Stub2PostingDesc[5])
//                     {
//                     }
//                     column(Stub2PostingDesc_10_; Stub2PostingDesc[10])
//                     {
//                     }
//                     column(Stub2PostingDesc_9_; Stub2PostingDesc[9])
//                     {
//                     }
//                     column(CheckToAddr_5_; CheckToAddr[5])
//                     {
//                     }
//                     column(CheckToAddr_4_; CheckToAddr[4])
//                     {
//                     }
//                     column(CheckToAddr_3_; CheckToAddr[3])
//                     {
//                     }
//                     column(CheckToAddr_2_; CheckToAddr[2])
//                     {
//                     }
//                     column(CheckToAddr_01_; CheckToAddr[1])
//                     {
//                     }
//                     column(VoidText; VoidText)
//                     {
//                     }
//                     column(BankCurrencyCode; BankCurrencyCode)
//                     {
//                     }
//                     column(DollarSignBefore_CheckAmountText_DollarSignAfter; DollarSignBefore + CheckAmountText + DollarSignAfter)
//                     {
//                     }
//                     column(DescriptionLine_1__; DescriptionLine[1])
//                     {
//                     }
//                     column(DescriptionLine_2__; DescriptionLine[2])
//                     {
//                     }
//                     column(DateIndicator; DateIndicator)
//                     {
//                     }
//                     column(CheckDateText_Control1020013; CheckDateText)
//                     {
//                     }
//                     column(CheckNoText_Control1020014; CheckNoText)
//                     {
//                     }
//                     column(CompanyAddr_6_; CompanyAddr[6])
//                     {
//                     }
//                     column(CompanyAddr_5_; CompanyAddr[5])
//                     {
//                     }
//                     column(CompanyAddr_4_; CompanyAddr[4])
//                     {
//                     }
//                     column(CompanyAddr_3_; CompanyAddr[3])
//                     {
//                     }
//                     column(CompanyAddr_2_; CompanyAddr[2])
//                     {
//                     }
//                     column(CompanyAddr_1_; CompanyAddr[1])
//                     {
//                     }
//                     column(CheckStyleIndex; CheckStyleIndex)
//                     {
//                     }
//                     column(CompanyAddr_7_; CompanyAddr[7])
//                     {
//                     }
//                     column(PrintCheck_Number; Number)
//                     {
//                     }
//                     column(CheckNoText_Control1480000Caption; CheckNoText_Control1480000CaptionLbl)
//                     {
//                     }

//                     trigger OnAfterGetRecord()
//                     var
//                         CurrencySymbol: Code[5];
//                     begin
//                         IF NOT TestPrint THEN
//                             WITH GenJnlLine DO BEGIN
//                                 CheckLedgEntry.INIT;
//                                 CheckLedgEntry."Bank Account No." := BankAcc2."No.";
//                                 CheckLedgEntry."Posting Date" := "Posting Date";
//                                 CheckLedgEntry."Document Type" := "Document Type";
//                                 CheckLedgEntry."Document No." := UseCheckNo;
//                                 CheckLedgEntry.Description := CheckToAddr[1];
//                                 CheckLedgEntry."Bank Payment Type" := "Bank Payment Type";
//                                 CheckLedgEntry."Bal. Account Type" := BalancingType;
//                                 CheckLedgEntry."Bal. Account No." := BalancingNo;
//                                 IF FoundLast THEN BEGIN
//                                     IF TotalLineAmount < 0 THEN
//                                         ERROR(
//                                           Text020,
//                                           UseCheckNo, TotalLineAmount);
//                                     CheckLedgEntry."Entry Status" := CheckLedgEntry."Entry Status"::Printed;
//                                     CheckLedgEntry.Amount := TotalLineAmount;
//                                 END ELSE BEGIN
//                                     CheckLedgEntry."Entry Status" := CheckLedgEntry."Entry Status"::Voided;
//                                     CheckLedgEntry.Amount := 0;
//                                 END;
//                                 CheckLedgEntry."Check Date" := "Posting Date";
//                                 CheckLedgEntry."Check No." := UseCheckNo;
//                                 CheckManagement.InsertCheck(CheckLedgEntry, RECORDID);

//                                 IF FoundLast THEN BEGIN
//                                     CheckAmountText := CheckLedgEntry.GetCheckAmountText(BankAcc2."Currency Code", CurrencySymbol);
//                                     IF CheckLanguage = 3084 THEN BEGIN   // French
//                                         DollarSignBefore := '';
//                                         DollarSignAfter := CurrencySymbol;
//                                     END ELSE BEGIN
//                                         DollarSignBefore := CurrencySymbol;
//                                         DollarSignAfter := ' ';
//                                     END;
//                                     IF NOT ChkTransMgt.FormatNoText(DescriptionLine, CheckLedgEntry.Amount, CheckLanguage, BankAcc2."Currency Code") THEN
//                                         ERROR(DescriptionLine[1]);
//                                     VoidText := '';
//                                 END ELSE BEGIN
//                                     CLEAR(CheckAmountText);
//                                     CLEAR(DescriptionLine);
//                                     DescriptionLine[1] := Text021;
//                                     DescriptionLine[2] := DescriptionLine[1];
//                                     VoidText := Text022;
//                                 END;
//                             END
//                         ELSE
//                             WITH GenJnlLine DO BEGIN
//                                 CheckLedgEntry.INIT;
//                                 CheckLedgEntry."Bank Account No." := BankAcc2."No.";
//                                 CheckLedgEntry."Posting Date" := "Posting Date";
//                                 CheckLedgEntry."Document No." := UseCheckNo;
//                                 CheckLedgEntry.Description := Text023;
//                                 CheckLedgEntry."Bank Payment Type" := "Bank Payment Type"::"Computer Check";
//                                 CheckLedgEntry."Entry Status" := CheckLedgEntry."Entry Status"::"Test Print";
//                                 CheckLedgEntry."Check Date" := "Posting Date";
//                                 CheckLedgEntry."Check No." := UseCheckNo;
//                                 CheckManagement.InsertCheck(CheckLedgEntry, RECORDID);

//                                 CheckAmountText := Text024;
//                                 DescriptionLine[1] := Text025;
//                                 DescriptionLine[2] := DescriptionLine[1];
//                                 VoidText := Text022;
//                             END;

//                         ChecksPrinted := ChecksPrinted + 1;
//                         FirstPage := FALSE;

//                         CLEAR(PrnChkCompanyAddr);
//                         CLEAR(PrnChkCheckToAddr);
//                         CLEAR(PrnChkCheckNoText);
//                         CLEAR(PrnChkCheckDateText);
//                         CLEAR(PrnChkDescriptionLine);
//                         CLEAR(PrnChkVoidText);
//                         CLEAR(PrnChkDateIndicator);
//                         CLEAR(PrnChkCurrencyCode);
//                         CLEAR(PrnChkCheckAmountText);
//                         COPYARRAY(PrnChkCompanyAddr[CheckStyle], CompanyAddr, 1);
//                         COPYARRAY(PrnChkCheckToAddr[CheckStyle], CheckToAddr, 1);
//                         PrnChkCheckNoText[CheckStyle] := CheckNoText;
//                         PrnChkCheckDateText[CheckStyle] := CheckDateText;
//                         COPYARRAY(PrnChkDescriptionLine[CheckStyle], DescriptionLine, 1);
//                         PrnChkVoidText[CheckStyle] := VoidText;
//                         PrnChkDateIndicator[CheckStyle] := DateIndicator;
//                         PrnChkCurrencyCode[CheckStyle] := BankAcc2."Currency Code";
//                         StartingLen := STRLEN(CheckAmountText);
//                         IF CheckStyle = CheckStyle::US THEN
//                             ControlLen := 27
//                         ELSE
//                             ControlLen := 29;
//                         CheckAmountText := CheckAmountText + DollarSignBefore + DollarSignAfter;
//                         Index := 0;
//                         IF CheckAmountText = Text024 THEN BEGIN
//                             IF STRLEN(CheckAmountText) < (ControlLen - 12) THEN BEGIN
//                                 REPEAT
//                                     Index := Index + 1;
//                                     CheckAmountText := INSSTR(CheckAmountText, '*', STRLEN(CheckAmountText) + 1);
//                                 UNTIL (Index = ControlLen) OR (STRLEN(CheckAmountText) >= (ControlLen - 12))
//                             END;
//                         END ELSE
//                             IF STRLEN(CheckAmountText) < (ControlLen - 11) THEN BEGIN
//                                 REPEAT
//                                     Index := Index + 1;
//                                     CheckAmountText := INSSTR(CheckAmountText, '*', STRLEN(CheckAmountText) + 1);
//                                 UNTIL (Index = ControlLen) OR (STRLEN(CheckAmountText) >= (ControlLen - 11))
//                             END;
//                         CheckAmountText :=
//                           DELSTR(CheckAmountText, StartingLen + 1, STRLEN(DollarSignBefore + DollarSignAfter));
//                         NewLen := STRLEN(CheckAmountText);
//                         IF NewLen <> StartingLen THEN
//                             CheckAmountText :=
//                               COPYSTR(CheckAmountText, StartingLen + 1) +
//                               COPYSTR(CheckAmountText, 1, StartingLen);
//                         PrnChkCheckAmountText[CheckStyle] :=
//                           DollarSignBefore + CheckAmountText + DollarSignAfter;

//                         IF CheckStyle = CheckStyle::CA THEN
//                             CheckStyleIndex := 0
//                         ELSE
//                             CheckStyleIndex := 1;
//                     end;
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     IF FoundLast THEN
//                         CurrReport.BREAK;

//                     UseCheckNo := INCSTR(UseCheckNo);
//                     IF NOT TestPrint THEN
//                         CheckNoText := UseCheckNo
//                     ELSE
//                         CheckNoText := Text011;

//                     Stub2LineNo := 0;
//                     CLEAR(Stub2DocNo);
//                     CLEAR(Stub2DocDate);
//                     CLEAR(Stub2LineAmount);
//                     CLEAR(Stub2LineDiscount);
//                     CLEAR(Stub2PostingDesc);
//                     Stub2DocNoHeader := '';
//                     Stub2DocDateHeader := '';
//                     Stub2AmountHeader := '';
//                     Stub2DiscountHeader := '';
//                     Stub2NetAmountHeader := '';
//                     Stub2PostingDescHeader := '';
//                 end;

//                 trigger OnPostDataItem()
//                 var
//                     RecordRestrictionMgt: Codeunit "1550";
//                 begin
//                     IF NOT TestPrint THEN BEGIN
//                         IF UseCheckNo <> GenJnlLine."Document No." THEN BEGIN
//                             GenJnlLine3.RESET;
//                             GenJnlLine3.SETCURRENTKEY("Journal Template Name", "Journal Batch Name", "Posting Date", "Document No.");
//                             GenJnlLine3.SETRANGE("Journal Template Name", GenJnlLine."Journal Template Name");
//                             GenJnlLine3.SETRANGE("Journal Batch Name", GenJnlLine."Journal Batch Name");
//                             GenJnlLine3.SETRANGE("Posting Date", GenJnlLine."Posting Date");
//                             GenJnlLine3.SETRANGE("Document No.", UseCheckNo);
//                             IF GenJnlLine3.FIND('-') THEN
//                                 GenJnlLine3.FIELDERROR("Document No.", STRSUBSTNO(Text013, UseCheckNo));
//                         END;

//                         IF ApplyMethod <> ApplyMethod::MoreLinesOneEntry THEN BEGIN
//                             GenJnlLine3 := GenJnlLine;
//                             GenJnlLine3.TESTFIELD("Posting No. Series", '');
//                             GenJnlLine3."Document No." := UseCheckNo;
//                             GenJnlLine3."Check Printed" := TRUE;
//                             GenJnlLine3.MODIFY;
//                         END ELSE BEGIN
//                             "TotalLineAmount$" := 0;
//                             IF GenJnlLine2.FIND('-') THEN BEGIN
//                                 HighestLineNo := GenJnlLine2."Line No.";
//                                 REPEAT
//                                     RecordRestrictionMgt.CheckRecordHasUsageRestrictions(GenJnlLine2);
//                                     IF BankAcc2."Currency Code" <> GenJnlLine2."Currency Code" THEN
//                                         ERROR(Text005);
//                                     IF GenJnlLine2."Line No." > HighestLineNo THEN
//                                         HighestLineNo := GenJnlLine2."Line No.";
//                                     GenJnlLine3 := GenJnlLine2;
//                                     GenJnlLine3.TESTFIELD("Posting No. Series", '');
//                                     GenJnlLine3."Bal. Account No." := '';
//                                     GenJnlLine3."Bank Payment Type" := GenJnlLine3."Bank Payment Type"::" ";
//                                     GenJnlLine3."Document No." := UseCheckNo;
//                                     GenJnlLine3."Check Printed" := TRUE;
//                                     GenJnlLine3.VALIDATE(Amount);
//                                     "TotalLineAmount$" := "TotalLineAmount$" + GenJnlLine3."Amount (LCY)";
//                                     GenJnlLine3.MODIFY;
//                                 UNTIL GenJnlLine2.NEXT = 0;
//                             END;

//                             GenJnlLine3.RESET;
//                             GenJnlLine3 := GenJnlLine;
//                             GenJnlLine3.SETRANGE("Journal Template Name", GenJnlLine."Journal Template Name");
//                             GenJnlLine3.SETRANGE("Journal Batch Name", GenJnlLine."Journal Batch Name");
//                             GenJnlLine3."Line No." := HighestLineNo;
//                             IF GenJnlLine3.NEXT = 0 THEN
//                                 GenJnlLine3."Line No." := HighestLineNo + 10000
//                             ELSE BEGIN
//                                 WHILE GenJnlLine3."Line No." = HighestLineNo + 1 DO BEGIN
//                                     HighestLineNo := GenJnlLine3."Line No.";
//                                     IF GenJnlLine3.NEXT = 0 THEN
//                                         GenJnlLine3."Line No." := HighestLineNo + 20000;
//                                 END;
//                                 GenJnlLine3."Line No." := (GenJnlLine3."Line No." + HighestLineNo) DIV 2;
//                             END;
//                             GenJnlLine3.INIT;
//                             GenJnlLine3.VALIDATE("Posting Date", GenJnlLine."Posting Date");
//                             GenJnlLine3."Document Type" := GenJnlLine."Document Type";
//                             GenJnlLine3."Document No." := UseCheckNo;
//                             GenJnlLine3."Account Type" := GenJnlLine3."Account Type"::"Bank Account";
//                             GenJnlLine3.VALIDATE("Account No.", BankAcc2."No.");
//                             IF BalancingType <> BalancingType::"G/L Account" THEN
//                                 GenJnlLine3.Description := STRSUBSTNO(Text014, SELECTSTR(BalancingType + 1, Text062), BalancingNo);
//                             GenJnlLine3.VALIDATE(Amount, -TotalLineAmount);
//                             IF TotalLineAmount <> "TotalLineAmount$" THEN
//                                 GenJnlLine3.VALIDATE("Amount (LCY)", -"TotalLineAmount$");
//                             GenJnlLine3."Bank Payment Type" := GenJnlLine3."Bank Payment Type"::"Computer Check";
//                             GenJnlLine3."Check Printed" := TRUE;
//                             GenJnlLine3."Source Code" := GenJnlLine."Source Code";
//                             GenJnlLine3."Reason Code" := GenJnlLine."Reason Code";
//                             GenJnlLine3."Allow Zero-Amount Posting" := TRUE;
//                             GenJnlLine3."Shortcut Dimension 1 Code" := GenJnlLine."Shortcut Dimension 1 Code";
//                             GenJnlLine3."Shortcut Dimension 2 Code" := GenJnlLine."Shortcut Dimension 2 Code";
//                             GenJnlLine3."Dimension Set ID" := GenJnlLine."Dimension Set ID";
//                             GenJnlLine3.INSERT;
//                             IF CheckGenJournalBatchAndLineIsApproved(GenJnlLine) THEN
//                                 RecordRestrictionMgt.AllowRecordUsage(GenJnlLine3);
//                         END;
//                     END;

//                     BankAcc2."Last Check No." := UseCheckNo;
//                     BankAcc2.MODIFY;
//                     IF CommitEachCheck THEN BEGIN
//                         COMMIT;
//                         CLEAR(CheckManagement);
//                     END;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     FirstPage := TRUE;
//                     FoundLast := FALSE;
//                     TotalLineAmount := 0;
//                     TotalLineDiscount := 0;
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 IF OneCheckPrVendor AND ("Currency Code" <> '') AND
//                    ("Currency Code" <> Currency.Code)
//                 THEN BEGIN
//                     Currency.GET("Currency Code");
//                     Currency.TESTFIELD("Conv. LCY Rndg. Debit Acc.");
//                     Currency.TESTFIELD("Conv. LCY Rndg. Credit Acc.");
//                 END;

//                 IF NOT TestPrint THEN BEGIN
//                     IF Amount = 0 THEN
//                         CurrReport.SKIP;

//                     TESTFIELD("Bal. Account Type", "Bal. Account Type"::"Bank Account");
//                     IF "Bal. Account No." <> BankAcc2."No." THEN
//                         CurrReport.SKIP;

//                     IF ("Account No." <> '') AND ("Bal. Account No." <> '') THEN BEGIN
//                         BalancingType := "Account Type";
//                         BalancingNo := "Account No.";
//                         RemainingAmount := Amount;
//                         IF OneCheckPrVendor THEN BEGIN
//                             ApplyMethod := ApplyMethod::MoreLinesOneEntry;
//                             GenJnlLine2.RESET;
//                             GenJnlLine2.SETCURRENTKEY("Journal Template Name", "Journal Batch Name", "Posting Date", "Document No.");
//                             GenJnlLine2.SETRANGE("Journal Template Name", "Journal Template Name");
//                             GenJnlLine2.SETRANGE("Journal Batch Name", "Journal Batch Name");
//                             GenJnlLine2.SETRANGE("Posting Date", "Posting Date");
//                             GenJnlLine2.SETRANGE("Document No.", "Document No.");
//                             GenJnlLine2.SETRANGE("Account Type", "Account Type");
//                             GenJnlLine2.SETRANGE("Account No.", "Account No.");
//                             GenJnlLine2.SETRANGE("Bal. Account Type", "Bal. Account Type");
//                             GenJnlLine2.SETRANGE("Bal. Account No.", "Bal. Account No.");
//                             GenJnlLine2.SETRANGE("Bank Payment Type", "Bank Payment Type");
//                             GenJnlLine2.FIND('-');
//                             RemainingAmount := 0;
//                         END ELSE
//                             IF "Applies-to Doc. No." <> '' THEN
//                                 ApplyMethod := ApplyMethod::OneLineOneEntry
//                             ELSE
//                                 IF "Applies-to ID" <> '' THEN
//                                     ApplyMethod := ApplyMethod::OneLineID
//                                 ELSE
//                                     ApplyMethod := ApplyMethod::Payment;
//                     END ELSE
//                         IF "Account No." = '' THEN
//                             FIELDERROR("Account No.", Text004)
//                         ELSE
//                             FIELDERROR("Bal. Account No.", Text004);

//                     CLEAR(CheckToAddr);
//                     CLEAR(SalesPurchPerson);
//                     CASE BalancingType OF
//                         BalancingType::"G/L Account":
//                             BEGIN
//                                 CheckToAddr[1] := Description;
//                                 ChkTransMgt.SetCheckPrintParams(
//                                   BankAcc2."Check Date Format",
//                                   BankAcc2."Check Date Separator",
//                                   BankAcc2."Country/Region Code",
//                                   BankAcc2."Bank Communication",
//                                   CheckToAddr[1],
//                                   CheckDateFormat,
//                                   DateSeparator,
//                                   CheckLanguage,
//                                   CheckStyle);
//                             END;
//                         BalancingType::Customer:
//                             BEGIN
//                                 Cust.GET(BalancingNo);
//                                 IF Cust."Privacy Blocked" THEN
//                                     ERROR(PrivacyBlockedErr, Cust.TABLECAPTION, Cust."No.");
//                                 IF Cust.Blocked IN [Cust.Blocked::All] THEN
//                                     ERROR(Text064, Cust.FIELDCAPTION(Blocked), Cust.Blocked, Cust.TABLECAPTION, Cust."No.");
//                                 Cust.Contact := '';
//                                 FormatAddr.Customer(CheckToAddr, Cust);
//                                 IF BankAcc2."Currency Code" <> "Currency Code" THEN
//                                     ERROR(Text005);
//                                 IF Cust."Salesperson Code" <> '' THEN
//                                     SalesPurchPerson.GET(Cust."Salesperson Code");
//                                 ChkTransMgt.SetCheckPrintParams(
//                                   Cust."Check Date Format",
//                                   Cust."Check Date Separator",
//                                   BankAcc2."Country/Region Code",
//                                   Cust."Bank Communication",
//                                   CheckToAddr[1],
//                                   CheckDateFormat,
//                                   DateSeparator,
//                                   CheckLanguage,
//                                   CheckStyle);
//                             END;
//                         BalancingType::Vendor:
//                             BEGIN
//                                 Vend.GET(BalancingNo);
//                                 IF Vend."Privacy Blocked" THEN
//                                     ERROR(PrivacyBlockedErr, Vend.TABLECAPTION, Vend."No.");
//                                 IF Vend.Blocked IN [Vend.Blocked::All, Vend.Blocked::Payment] THEN
//                                     ERROR(Text064, Vend.FIELDCAPTION(Blocked), Vend.Blocked, Vend.TABLECAPTION, Vend."No.");
//                                 Vend.Contact := '';
//                                 FormatAddr.Vendor(CheckToAddr, Vend);
//                                 IF BankAcc2."Currency Code" <> "Currency Code" THEN
//                                     ERROR(Text005);
//                                 IF Vend."Purchaser Code" <> '' THEN
//                                     SalesPurchPerson.GET(Vend."Purchaser Code");
//                                 ChkTransMgt.SetCheckPrintParams(
//                                   Vend."Check Date Format",
//                                   Vend."Check Date Separator",
//                                   BankAcc2."Country/Region Code",
//                                   Vend."Bank Communication",
//                                   CheckToAddr[1],
//                                   CheckDateFormat,
//                                   DateSeparator,
//                                   CheckLanguage,
//                                   CheckStyle);
//                             END;
//                         BalancingType::"Bank Account":
//                             BEGIN
//                                 BankAcc.GET(BalancingNo);
//                                 BankAcc.TESTFIELD(Blocked, FALSE);
//                                 BankAcc.Contact := '';
//                                 FormatAddr.BankAcc(CheckToAddr, BankAcc);
//                                 IF BankAcc2."Currency Code" <> BankAcc."Currency Code" THEN
//                                     ERROR(Text008);
//                                 IF BankAcc."Our Contact Code" <> '' THEN
//                                     SalesPurchPerson.GET(BankAcc."Our Contact Code");
//                                 ChkTransMgt.SetCheckPrintParams(
//                                   BankAcc."Check Date Format",
//                                   BankAcc."Check Date Separator",
//                                   BankAcc2."Country/Region Code",
//                                   BankAcc."Bank Communication",
//                                   CheckToAddr[1],
//                                   CheckDateFormat,
//                                   DateSeparator,
//                                   CheckLanguage,
//                                   CheckStyle);
//                             END;
//                         BalancingType::Employee:
//                             BEGIN
//                                 Employee.GET(BalancingNo);
//                                 IF Employee."Privacy Blocked" THEN
//                                     ERROR(BlockedEmplForCheckErr, Employee."No.");
//                                 FormatAddr.Employee(CheckToAddr, Employee);
//                                 IF BankAcc2."Currency Code" <> "Currency Code" THEN
//                                     ERROR(Text005);
//                                 IF Employee."Salespers./Purch. Code" <> '' THEN
//                                     SalesPurchPerson.GET(Employee."Salespers./Purch. Code");
//                                 ChkTransMgt.SetCheckPrintParams(
//                                   BankAcc."Check Date Format",
//                                   BankAcc."Check Date Separator",
//                                   BankAcc."Country/Region Code",
//                                   BankAcc."Bank Communication",
//                                   CheckToAddr[1],
//                                   CheckDateFormat,
//                                   DateSeparator,
//                                   CheckLanguage,
//                                   CheckStyle);
//                             END;
//                     END;

//                     CheckDateText :=
//                       ChkTransMgt.FormatDate("Posting Date", CheckDateFormat, DateSeparator, CheckLanguage, DateIndicator);
//                 END ELSE BEGIN
//                     IF ChecksPrinted > 0 THEN
//                         CurrReport.BREAK;
//                     ChkTransMgt.SetCheckPrintParams(
//                       BankAcc2."Check Date Format",
//                       BankAcc2."Check Date Separator",
//                       BankAcc2."Country/Region Code",
//                       BankAcc2."Bank Communication",
//                       CheckToAddr[1],
//                       CheckDateFormat,
//                       DateSeparator,
//                       CheckLanguage,
//                       CheckStyle);
//                     BalancingType := BalancingType::Vendor;
//                     BalancingNo := Text010;
//                     CLEAR(CheckToAddr);
//                     FOR i := 1 TO 5 DO
//                         CheckToAddr[i] := Text003;
//                     CLEAR(SalesPurchPerson);
//                     CheckNoText := Text011;
//                     IF CheckStyle = CheckStyle::CA THEN
//                         CheckDateText := DateIndicator
//                     ELSE
//                         CheckDateText := Text010;
//                 END;
//             end;

//             trigger OnPreDataItem()
//             begin
//                 COPY(VoidGenJnlLine);
//                 CompanyInfo.GET;
//                 IF NOT TestPrint THEN BEGIN
//                     FormatAddr.Company(CompanyAddr, CompanyInfo);
//                     BankAcc2.GET(BankAcc2."No.");
//                     BankAcc2.TESTFIELD(Blocked, FALSE);
//                     COPY(VoidGenJnlLine);
//                     SETRANGE("Bank Payment Type", "Bank Payment Type"::"Computer Check");
//                     SETRANGE("Check Printed", FALSE);
//                 END ELSE BEGIN
//                     CLEAR(CompanyAddr);
//                     FOR i := 1 TO 5 DO
//                         CompanyAddr[i] := Text003;
//                 END;
//                 ChecksPrinted := 0;

//                 SETRANGE("Account Type", "Account Type"::"Fixed Asset");
//                 IF FIND('-') THEN
//                     FIELDERROR("Account Type");
//                 SETRANGE("Account Type");
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
//                     field(BankAccount; BankAcc2."No.")
//                     {
//                         Caption = 'Bank Account';
//                         TableRelation = "Bank Account";

//                         trigger OnValidate()
//                         begin
//                             IF BankAcc2."No." <> '' THEN BEGIN
//                                 BankAcc2.GET(BankAcc2."No.");
//                                 BankAcc2.TESTFIELD("Last Check No.");
//                                 UseCheckNo := BankAcc2."Last Check No.";
//                             END;
//                         end;
//                     }
//                     field(UseCheckNo; UseCheckNo)
//                     {
//                         Caption = 'Last Check No.';
//                     }
//                     field(OneCheckPerVendorPerDocumentNo; OneCheckPrVendor)
//                     {
//                         Caption = 'One Check per Vendor per Document No.';
//                         MultiLine = true;
//                     }
//                     field(ReprintChecks; ReprintChecks)
//                     {
//                         Caption = 'Reprint Checks';
//                     }
//                     field(TestPrint; TestPrint)
//                     {
//                         Caption = 'Test Print';
//                     }
//                     field(PreprintedStub; PreprintedStub)
//                     {
//                         Caption = 'Preprinted Stub';
//                     }
//                     field(CommitEachCheck; CommitEachCheck)
//                     {
//                         Caption = 'Commit Each Check';
//                     }
//                 }
//             }
//         }

//         actions
//         {
//         }

//         trigger OnOpenPage()
//         begin
//             IF BankAcc2."No." <> '' THEN
//                 IF BankAcc2.GET(BankAcc2."No.") THEN
//                     UseCheckNo := BankAcc2."Last Check No."
//                 ELSE BEGIN
//                     BankAcc2."No." := '';
//                     UseCheckNo := '';
//                 END;
//         end;
//     }

//     labels
//     {
//     }

//     trigger OnPreReport()
//     begin
//         GenJnlTemplate.GET(VoidGenJnlLine.GETFILTER("Journal Template Name"));
//         IF NOT GenJnlTemplate."Force Doc. Balance" THEN
//             IF NOT CONFIRM(USText001, TRUE) THEN
//                 ERROR(USText002);

//         PageNo := 0;
//     end;

//     var
//         Text000: Label 'Preview is not allowed.';
//         Text001: Label 'Last Check No. must be filled in.';
//         Text002: Label 'Filters on %1 and %2 are not allowed.';
//         Text003: Label 'XXXXXXXXXXXXXXXX';
//         Text004: Label 'must be entered.';
//         Text005: Label 'The Bank Account and the General Journal Line must have the same currency.';
//         Text008: Label 'Both Bank Accounts must have the same currency.';
//         Text010: Label 'XXXXXXXXXX';
//         Text011: Label 'XXXX';
//         Text013: Label '%1 already exists.';
//         Text014: Label 'Check for %1 %2';
//         Text016: Label 'In the Check report, One Check per Vendor and Document No.\';
//         Text017: Label 'must not be activated when Applies-to ID is specified in the journal lines.';
//         Text019: Label 'Total';
//         Text020: Label 'The total amount of check %1 is %2. The amount must be positive.';
//         Text021: Label 'VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID';
//         Text022: Label 'NON-NEGOTIABLE';
//         Text023: Label 'Test print';
//         Text024: Label 'XXXX.XX';
//         Text025: Label 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
//         Text030: Label ' is already applied to %1 %2 for customer %3.';
//         Text031: Label ' is already applied to %1 %2 for vendor %3.';
//         CompanyInfo: Record "79";
//         SalesPurchPerson: Record "13";
//         GenJnlLine2: Record "81";
//         GenJnlLine3: Record "81";
//         Cust: Record "18";
//         CustLedgEntry: Record "21";
//         Vend: Record "23";
//         VendLedgEntry: Record "25";
//         BankAcc: Record "270";
//         BankAcc2: Record "270";
//         CheckLedgEntry: Record "272";
//         Currency: Record "4";
//         GenJnlTemplate: Record "80";
//         Employee: Record "5200";
//         EmployeeLedgerEntry: Record "5222";
//         WindowsLang: Record "2000000045";
//         FormatAddr: Codeunit "365";
//         CheckManagement: Codeunit "367";
//         PrintCheckHelper: Codeunit "10401";
//         ChkTransMgt: Report "10400";
//         CompanyAddr: array[8] of Text[50];
//         CheckToAddr: array[8] of Text[50];
//         BalancingType: Option "G/L Account",Customer,Vendor,"Bank Account",,,Employee;
//         BalancingNo: Code[20];
//         CheckNoText: Text[30];
//         CheckDateText: Text[30];
//         CheckAmountText: Text[30];
//         DescriptionLine: array[2] of Text[80];
//         DocNo: Text[30];
//         ExtDocNo: Text[30];
//         VoidText: Text[30];
//         LineAmount: Decimal;
//         LineDiscount: Decimal;
//         TotalLineAmount: Decimal;
//         "TotalLineAmount$": Decimal;
//         TotalLineDiscount: Decimal;
//         RemainingAmount: Decimal;
//         CurrentLineAmount: Decimal;
//         UseCheckNo: Code[20];
//         FoundLast: Boolean;
//         ReprintChecks: Boolean;
//         TestPrint: Boolean;
//         FirstPage: Boolean;
//         OneCheckPrVendor: Boolean;
//         FoundNegative: Boolean;
//         CommitEachCheck: Boolean;
//         ApplyMethod: Option Payment,OneLineOneEntry,OneLineID,MoreLinesOneEntry;
//         ChecksPrinted: Integer;
//         HighestLineNo: Integer;
//         PreprintedStub: Boolean;
//         TotalText: Text[10];
//         DocDate: Date;
//         i: Integer;
//         CurrencyCode2: Code[10];
//         CurrencyExchangeRate: Record "330";
//         LineAmount2: Decimal;
//         GLSetup: Record "98";
//         Text064: Label '%1 must not be %2 for %3 %4.';
//         PrivacyBlockedErr: Label '%1 %2 must not be blocked for privacy.', Comment = '%1 = customer or vendor, %2 = customer or vendor code.';
//         Text062: Label 'G/L Account,Customer,Vendor,Bank Account,,,Employee';
//         USText001: Label 'Warning:  Checks cannot be financially voided when Force Doc. Balance is set to No in the Journal Template.  Do you want to continue anyway?';
//         USText002: Label 'Process canceled at user request.';
//         USText004: Label 'Last Check No. must include at least one digit, so that it can be incremented.';
//         USText005: Label '%1 language is not enabled. %2 is set up for checks in %1.';
//         DateIndicator: Text[10];
//         CheckDateFormat: Option " ","MM DD YYYY","DD MM YYYY","YYYY MM DD";
//         CheckStyle: Option ,US,CA;
//         CheckLanguage: Integer;
//         DateSeparator: Option " ","-",".","/";
//         DollarSignBefore: Code[5];
//         DollarSignAfter: Code[5];
//         PrnChkCompanyAddr: array[2, 8] of Text[50];
//         PrnChkCheckToAddr: array[2, 8] of Text[50];
//         PrnChkCheckNoText: array[2] of Text[30];
//         PrnChkCheckDateText: array[2] of Text[30];
//         PrnChkCheckAmountText: array[2] of Text[30];
//         PrnChkDescriptionLine: array[2, 2] of Text[80];
//         PrnChkVoidText: array[2] of Text[30];
//         PrnChkDateIndicator: array[2] of Text[10];
//         PrnChkCurrencyCode: array[2] of Code[10];
//         USText006: Label 'You cannot use the <blank> %1 option with a Canadian style check. Please check %2 %3.';
//         USText007: Label 'You cannot use the Spanish %1 option with a Canadian style check. Please check %2 %3.';
//         Stub2LineNo: Integer;
//         Stub2DocNo: array[50] of Text[30];
//         Stub2DocDate: array[50] of Date;
//         Stub2LineAmount: array[50] of Decimal;
//         Stub2LineDiscount: array[50] of Decimal;
//         Stub2PostingDesc: array[50] of Text[50];
//         Stub2DocNoHeader: Text[30];
//         Stub2DocDateHeader: Text[30];
//         Stub2AmountHeader: Text[30];
//         Stub2DiscountHeader: Text[30];
//         Stub2NetAmountHeader: Text[30];
//         Stub2PostingDescHeader: Text[30];
//         USText011: Label 'Document No.';
//         USText012: Label 'Document Date';
//         USText013: Label 'Amount';
//         USText014: Label 'Discount';
//         USText015: Label 'Net Amount';
//         PostingDesc: Text[50];
//         USText017: Label 'Posting Description';
//         StartingLen: Integer;
//         ControlLen: Integer;
//         NewLen: Integer;
//         CheckStyleIndex: Integer;
//         Index: Integer;
//         BankCurrencyCode: Text[30];
//         PageNo: Integer;
//         CheckNoTextCaptionLbl: Label 'Check No.';
//         LineAmountCaptionLbl: Label 'Net Amount';
//         LineDiscountCaptionLbl: Label 'Discount';
//         DocNoCaptionLbl: Label 'Document No.';
//         DocDateCaptionLbl: Label 'Document Date';
//         Posting_DescriptionCaptionLbl: Label 'Posting Description';
//         AmountCaptionLbl: Label 'Amount';
//         CheckNoText_Control1480000CaptionLbl: Label 'Check No.';
//         AlreadyAppliedToEmployeeErr: Label ' is already applied to %1 %2 for employee %3.', Comment = '%1 = Document type, %2 = Document No., %3 = Employee No.';
//         BlockedEmplForCheckErr: Label 'You cannot print check because employee %1 is blocked due to privacy.', Comment = '%1 - Employee no.';
//         ExtendCheckStub: Record "37012951";
//         PrintExtendStub: Boolean;
//         NextEntryNo: Integer;
//         StubLineCount: Integer;
//         MaxStubLine: Integer;
//         FirstLine: Boolean;
//         PuchaseSetup: Record "312";

//     local procedure CustUpdateAmounts(var CustLedgEntry2: Record "21"; RemainingAmount2: Decimal)
//     begin
//         IF (ApplyMethod = ApplyMethod::OneLineOneEntry) OR
//            (ApplyMethod = ApplyMethod::MoreLinesOneEntry)
//         THEN BEGIN
//             GenJnlLine3.RESET;
//             GenJnlLine3.SETCURRENTKEY("Account Type", "Account No.", "Applies-to Doc. Type", "Applies-to Doc. No.");
//             CheckGLEntriesForCustomers(CustLedgEntry2);
//         END;

//         DocNo := CustLedgEntry2."Document No.";
//         ExtDocNo := CustLedgEntry2."External Document No.";
//         DocDate := CustLedgEntry2."Document Date";
//         PostingDesc := CustLedgEntry2.Description;

//         CurrencyCode2 := CustLedgEntry2."Currency Code";
//         CustLedgEntry2.CALCFIELDS("Remaining Amount");

//         LineAmount := -(CustLedgEntry2."Remaining Amount" - CustLedgEntry2."Remaining Pmt. Disc. Possible" -
//                         CustLedgEntry2."Accepted Payment Tolerance");
//         LineAmount2 :=
//           ROUND(
//             ExchangeAmt(CustLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2, LineAmount),
//             Currency."Amount Rounding Precision");
//         IF ((((CustLedgEntry2."Document Type" = CustLedgEntry2."Document Type"::Invoice) AND
//               (LineAmount2 >= RemainingAmount2)) OR
//              ((CustLedgEntry2."Document Type" = CustLedgEntry2."Document Type"::"Credit Memo") AND
//               (LineAmount2 <= RemainingAmount2))) AND
//             (GenJnlLine."Posting Date" <= CustLedgEntry2."Pmt. Discount Date")) OR
//            CustLedgEntry2."Accepted Pmt. Disc. Tolerance"
//         THEN BEGIN
//             LineDiscount := -CustLedgEntry2."Remaining Pmt. Disc. Possible";
//             IF CustLedgEntry2."Accepted Payment Tolerance" <> 0 THEN
//                 LineDiscount := LineDiscount - CustLedgEntry2."Accepted Payment Tolerance";
//         END ELSE BEGIN
//             IF RemainingAmount2 >=
//                ROUND(
//                  -(ExchangeAmt(CustLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2,
//                      CustLedgEntry2."Remaining Amount")), Currency."Amount Rounding Precision")
//             THEN
//                 LineAmount2 :=
//                   ROUND(
//                     -(ExchangeAmt(CustLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2,
//                         CustLedgEntry2."Remaining Amount")), Currency."Amount Rounding Precision")
//             ELSE BEGIN
//                 LineAmount2 := RemainingAmount2;
//                 LineAmount :=
//                   ROUND(
//                     ExchangeAmt(CustLedgEntry2."Posting Date", CurrencyCode2, GenJnlLine."Currency Code",
//                       LineAmount2), Currency."Amount Rounding Precision");
//             END;
//             LineDiscount := 0;
//         END;
//     end;

//     local procedure VendUpdateAmounts(var VendLedgEntry2: Record "25"; RemainingAmount2: Decimal)
//     begin
//         IF (ApplyMethod = ApplyMethod::OneLineOneEntry) OR
//            (ApplyMethod = ApplyMethod::MoreLinesOneEntry)
//         THEN BEGIN
//             GenJnlLine3.RESET;
//             GenJnlLine3.SETCURRENTKEY("Account Type", "Account No.", "Applies-to Doc. Type", "Applies-to Doc. No.");
//             CheckGLEntiresForVendors(VendLedgEntry2);
//         END;

//         DocNo := VendLedgEntry2."Document No.";
//         ExtDocNo := VendLedgEntry2."External Document No.";
//         DocNo := ExtDocNo;
//         DocDate := VendLedgEntry2."Document Date";
//         CurrencyCode2 := VendLedgEntry2."Currency Code";
//         VendLedgEntry2.CALCFIELDS("Remaining Amount");
//         PostingDesc := VendLedgEntry2.Description;

//         LineAmount := -(VendLedgEntry2."Remaining Amount" - VendLedgEntry2."Remaining Pmt. Disc. Possible" -
//                         VendLedgEntry2."Accepted Payment Tolerance");

//         LineAmount2 :=
//           ROUND(
//             ExchangeAmt(VendLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2, LineAmount),
//             Currency."Amount Rounding Precision");

//         IF ((((VendLedgEntry2."Document Type" = VendLedgEntry2."Document Type"::Invoice) AND
//               (LineAmount2 <= RemainingAmount2)) OR
//              ((VendLedgEntry2."Document Type" = VendLedgEntry2."Document Type"::"Credit Memo") AND
//               (LineAmount2 <= RemainingAmount2))) AND
//             (GenJnlLine."Posting Date" <= VendLedgEntry2."Pmt. Discount Date")) OR
//            VendLedgEntry2."Accepted Pmt. Disc. Tolerance"
//         THEN BEGIN
//             LineDiscount := -VendLedgEntry2."Remaining Pmt. Disc. Possible";
//             IF VendLedgEntry2."Accepted Payment Tolerance" <> 0 THEN
//                 LineDiscount := LineDiscount - VendLedgEntry2."Accepted Payment Tolerance";
//         END ELSE BEGIN
//             IF RemainingAmount2 >=
//                ROUND(
//                  -(ExchangeAmt(VendLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2,
//                      VendLedgEntry2."Amount to Apply")), Currency."Amount Rounding Precision")
//             THEN BEGIN
//                 LineAmount2 :=
//                   ROUND(
//                     -(ExchangeAmt(VendLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2,
//                         VendLedgEntry2."Amount to Apply")), Currency."Amount Rounding Precision");
//                 LineAmount :=
//                   ROUND(
//                     ExchangeAmt(VendLedgEntry2."Posting Date", CurrencyCode2, GenJnlLine."Currency Code",
//                       LineAmount2), Currency."Amount Rounding Precision");
//             END ELSE BEGIN
//                 LineAmount2 := RemainingAmount2;
//                 LineAmount :=
//                   ROUND(
//                     ExchangeAmt(VendLedgEntry2."Posting Date", CurrencyCode2, GenJnlLine."Currency Code",
//                       LineAmount2), Currency."Amount Rounding Precision");
//             END;
//             LineDiscount := 0;
//         END;
//     end;

//     local procedure EmployeeUpdateAmounts(var EmployeeLedgerEntry2: Record "5222"; RemainingAmount2: Decimal)
//     begin
//         IF (ApplyMethod = ApplyMethod::OneLineOneEntry) OR
//            (ApplyMethod = ApplyMethod::MoreLinesOneEntry)
//         THEN BEGIN
//             GenJnlLine3.RESET;
//             GenJnlLine3.SETCURRENTKEY("Account Type", "Account No.", "Applies-to Doc. Type", "Applies-to Doc. No.");
//             CheckGLEntriesForEmployee(EmployeeLedgerEntry2);
//         END;

//         DocNo := EmployeeLedgerEntry2."Document No.";
//         DocDate := EmployeeLedgerEntry2."Posting Date";
//         PostingDesc := EmployeeLedgerEntry2.Description;

//         CurrencyCode2 := EmployeeLedgerEntry2."Currency Code";
//         EmployeeLedgerEntry2.CALCFIELDS("Remaining Amount");

//         LineAmount := -EmployeeLedgerEntry2."Remaining Amount";

//         LineAmount2 :=
//           ROUND(
//             ExchangeAmt(EmployeeLedgerEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2, LineAmount),
//             Currency."Amount Rounding Precision");

//         IF RemainingAmount2 >= ROUND(-ExchangeAmt(EmployeeLedgerEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2,
//                EmployeeLedgerEntry2."Amount to Apply"), Currency."Amount Rounding Precision")
//         THEN BEGIN
//             LineAmount2 := ROUND(-ExchangeAmt(EmployeeLedgerEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2,
//                   EmployeeLedgerEntry2."Amount to Apply"), Currency."Amount Rounding Precision");
//             LineAmount :=
//               ROUND(
//                 ExchangeAmt(EmployeeLedgerEntry2."Posting Date", CurrencyCode2, GenJnlLine."Currency Code",
//                   LineAmount2), Currency."Amount Rounding Precision");
//         END ELSE BEGIN
//             LineAmount2 := RemainingAmount2;
//             LineAmount :=
//               ROUND(
//                 ExchangeAmt(EmployeeLedgerEntry2."Posting Date", CurrencyCode2, GenJnlLine."Currency Code",
//                   LineAmount2), Currency."Amount Rounding Precision");
//         END;
//         LineDiscount := 0;
//     end;

//     procedure InitializeRequest(BankAcc: Code[20]; LastCheckNo: Code[20]; NewOneCheckPrVend: Boolean; NewReprintChecks: Boolean; NewTestPrint: Boolean; NewPreprintedStub: Boolean)
//     begin
//         IF BankAcc <> '' THEN
//             IF BankAcc2.GET(BankAcc) THEN BEGIN
//                 UseCheckNo := LastCheckNo;
//                 OneCheckPrVendor := NewOneCheckPrVend;
//                 ReprintChecks := NewReprintChecks;
//                 TestPrint := NewTestPrint;
//                 PreprintedStub := NewPreprintedStub;
//             END;
//     end;

//     procedure ExchangeAmt(PostingDate: Date; CurrencyCode: Code[10]; CurrencyCode2: Code[10]; Amount: Decimal) Amount2: Decimal
//     begin
//         IF (CurrencyCode <> '') AND (CurrencyCode2 = '') THEN
//             Amount2 :=
//               CurrencyExchangeRate.ExchangeAmtLCYToFCY(
//                 PostingDate, CurrencyCode, Amount, CurrencyExchangeRate.ExchangeRate(PostingDate, CurrencyCode))
//         ELSE
//             IF (CurrencyCode = '') AND (CurrencyCode2 <> '') THEN
//                 Amount2 :=
//                   CurrencyExchangeRate.ExchangeAmtFCYToLCY(
//                     PostingDate, CurrencyCode2, Amount, CurrencyExchangeRate.ExchangeRate(PostingDate, CurrencyCode2))
//             ELSE
//                 IF (CurrencyCode <> '') AND (CurrencyCode2 <> '') AND (CurrencyCode <> CurrencyCode2) THEN
//                     Amount2 := CurrencyExchangeRate.ExchangeAmtFCYToFCY(PostingDate, CurrencyCode2, CurrencyCode, Amount)
//                 ELSE
//                     Amount2 := Amount;
//     end;

//     local procedure CheckGenJournalBatchAndLineIsApproved(GenJournalLine: Record "81"): Boolean
//     var
//         GenJournalBatch: Record "232";
//     begin
//         GenJournalBatch.GET(GenJournalLine."Journal Template Name", GenJournalLine."Journal Batch Name");
//         EXIT(
//           VerifyRecordIdIsApproved(GenJournalBatch.RECORDID) OR
//           VerifyRecordIdIsApproved(GenJournalLine.RECORDID));
//     end;

//     local procedure VerifyRecordIdIsApproved(RecordID: RecordID): Boolean
//     var
//         ApprovalEntry: Record "454";
//     begin
//         ApprovalEntry.SETRANGE("Table ID", RecordID.TABLENO);
//         ApprovalEntry.SETRANGE("Record ID to Approve", RecordID);
//         ApprovalEntry.SETRANGE(Status, ApprovalEntry.Status::Approved);
//         ApprovalEntry.SETRANGE("Related to Change", FALSE);
//         IF ApprovalEntry.ISEMPTY THEN
//             EXIT(FALSE);

//         ApprovalEntry.SETFILTER(Status, '%1|%2', ApprovalEntry.Status::Open, ApprovalEntry.Status::Created);
//         EXIT(ApprovalEntry.ISEMPTY);
//     end;

//     local procedure PrintOneLineOneEntryOnAfterGetRecordForCustomer(var CustLedgEntry1: Record "21")
//     begin
//         CustLedgEntry1.RESET;
//         CustLedgEntry1.SETCURRENTKEY("Document No.");
//         CustLedgEntry1.SETRANGE("Document Type", GenJnlLine."Applies-to Doc. Type");
//         CustLedgEntry1.SETRANGE("Document No.", GenJnlLine."Applies-to Doc. No.");
//         CustLedgEntry1.SETRANGE("Customer No.", BalancingNo);
//         CustLedgEntry1.FIND('-');
//         CustUpdateAmounts(CustLedgEntry1, RemainingAmount);
//     end;

//     local procedure PrintOneLineOneEntryOnAfterGetRecordForVendor(var VendLedgEntry1: Record "25")
//     begin
//         VendLedgEntry1.RESET;
//         VendLedgEntry1.SETCURRENTKEY("Document No.");
//         VendLedgEntry1.SETRANGE("Document Type", GenJnlLine."Applies-to Doc. Type");
//         VendLedgEntry1.SETRANGE("Document No.", GenJnlLine."Applies-to Doc. No.");
//         VendLedgEntry1.SETRANGE("Vendor No.", BalancingNo);
//         VendLedgEntry1.FIND('-');
//         VendUpdateAmounts(VendLedgEntry1, RemainingAmount);
//     end;

//     local procedure PrintOneLineOneEntryOnAfterGetRecordForEmployee(var EmployeeLedgerEntry1: Record "5222")
//     begin
//         EmployeeLedgerEntry1.RESET;
//         EmployeeLedgerEntry1.SETCURRENTKEY("Document No.");
//         EmployeeLedgerEntry1.SETRANGE("Document Type", GenJnlLine."Applies-to Doc. Type");
//         EmployeeLedgerEntry1.SETRANGE("Document No.", GenJnlLine."Applies-to Doc. No.");
//         EmployeeLedgerEntry1.SETRANGE("Employee No.", BalancingNo);
//         EmployeeLedgerEntry1.FINDFIRST;
//         EmployeeUpdateAmounts(EmployeeLedgerEntry1, RemainingAmount);
//     end;

//     local procedure CheckGLEntriesForEmployee(var EmployeeLedgerEntry3: Record "5222")
//     begin
//         GenJnlLine3.SETRANGE("Account Type", GenJnlLine3."Account Type"::Employee);
//         GenJnlLine3.SETRANGE("Account No.", EmployeeLedgerEntry3."Employee No.");
//         GenJnlLine3.SETRANGE("Applies-to Doc. Type", EmployeeLedgerEntry3."Document Type");
//         GenJnlLine3.SETRANGE("Applies-to Doc. No.", EmployeeLedgerEntry3."Document No.");
//         IF ApplyMethod = ApplyMethod::OneLineOneEntry THEN
//             GenJnlLine3.SETFILTER("Line No.", '<>%1', GenJnlLine."Line No.")
//         ELSE
//             GenJnlLine3.SETFILTER("Line No.", '<>%1', GenJnlLine2."Line No.");
//         IF EmployeeLedgerEntry3."Document Type" <> EmployeeLedgerEntry3."Document Type"::" " THEN
//             IF GenJnlLine3.FIND('-') THEN
//                 GenJnlLine3.FIELDERROR(
//                   "Applies-to Doc. No.",
//                   STRSUBSTNO(
//                     AlreadyAppliedToEmployeeErr,
//                     EmployeeLedgerEntry3."Document Type", EmployeeLedgerEntry3."Document No.",
//                     EmployeeLedgerEntry3."Employee No."));
//     end;

//     local procedure CheckGLEntriesForCustomers(var CustLedgEntry3: Record "21")
//     begin
//         GenJnlLine3.SETRANGE("Account Type", GenJnlLine3."Account Type"::Customer);
//         GenJnlLine3.SETRANGE("Account No.", CustLedgEntry3."Customer No.");
//         GenJnlLine3.SETRANGE("Applies-to Doc. Type", CustLedgEntry3."Document Type");
//         GenJnlLine3.SETRANGE("Applies-to Doc. No.", CustLedgEntry3."Document No.");
//         IF ApplyMethod = ApplyMethod::OneLineOneEntry THEN
//             GenJnlLine3.SETFILTER("Line No.", '<>%1', GenJnlLine."Line No.")
//         ELSE
//             GenJnlLine3.SETFILTER("Line No.", '<>%1', GenJnlLine2."Line No.");
//         IF CustLedgEntry3."Document Type" <> CustLedgEntry3."Document Type"::" " THEN
//             IF GenJnlLine3.FIND('-') THEN
//                 GenJnlLine3.FIELDERROR(
//                   "Applies-to Doc. No.",
//                   STRSUBSTNO(
//                     Text030,
//                     CustLedgEntry3."Document Type", CustLedgEntry3."Document No.",
//                     CustLedgEntry3."Customer No."));
//     end;

//     local procedure CheckGLEntiresForVendors(var VendLedgEntry3: Record "25")
//     begin
//         GenJnlLine3.SETRANGE("Account Type", GenJnlLine3."Account Type"::Vendor);
//         GenJnlLine3.SETRANGE("Account No.", VendLedgEntry3."Vendor No.");
//         GenJnlLine3.SETRANGE("Applies-to Doc. Type", VendLedgEntry3."Document Type");
//         GenJnlLine3.SETRANGE("Applies-to Doc. No.", VendLedgEntry3."Document No.");
//         IF ApplyMethod = ApplyMethod::OneLineOneEntry THEN
//             GenJnlLine3.SETFILTER("Line No.", '<>%1', GenJnlLine."Line No.")
//         ELSE
//             GenJnlLine3.SETFILTER("Line No.", '<>%1', GenJnlLine2."Line No.");
//         IF VendLedgEntry3."Document Type" <> VendLedgEntry3."Document Type"::" " THEN
//             IF GenJnlLine3.FIND('-') THEN
//                 GenJnlLine3.FIELDERROR(
//                   "Applies-to Doc. No.",
//                   STRSUBSTNO(
//                     Text031,
//                     VendLedgEntry3."Document Type", VendLedgEntry3."Document No.",
//                     VendLedgEntry3."Vendor No."));
//     end;
// }
