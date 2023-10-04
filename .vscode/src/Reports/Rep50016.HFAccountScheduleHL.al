// report 50016 "HF Account Schedule HL"
// {
//     // version NAVW113.00,HL

//     DefaultLayout = RDLC;
//     RDLCLayout = '.vscode/src/Reports/Layouts/Account Schedule HL.rdlc';
//     ApplicationArea = #Basic,#Suite;
//     Caption = 'Account Schedule';
//     PreviewMode = PrintLayout;
//     UsageCategory = ReportsAndAnalysis;

//     dataset
//     {
//         dataitem(AccScheduleName; Table84)
//         {
//             DataItemTableView = SORTING(Name);
//             column(AccScheduleName_Name; Name)
//             {
//             }
//             dataitem(Heading; Integer)
//             {
//                 DataItemTableView = SORTING(Number)
//                                     WHERE(Number = CONST(1));
//                 column(ColumnLayoutName; ColumnLayoutName)
//                 {
//                 }
//                 column(FiscalStartDate; FORMAT(FiscalStartDate))
//                 {
//                 }
//                 column(PeriodText; PeriodText)
//                 {
//                 }
//                 column(COMPANYNAME; COMPANYPROPERTY.DISPLAYNAME)
//                 {
//                 }
//                 column(AccScheduleName_Description; AccScheduleName.Description)
//                 {
//                 }
//                 column(AnalysisView_Code; AnalysisView.Code)
//                 {
//                 }
//                 column(AnalysisView_Name; AnalysisView.Name)
//                 {
//                 }
//                 column(HeaderText; HeaderText)
//                 {
//                 }
//                 column(AccScheduleLineTABLECAPTION_AccSchedLineFilter; "Acc. Schedule Line".TABLECAPTION + ': ' + AccSchedLineFilter)
//                 {
//                 }
//                 column(AccSchedLineFilter; AccSchedLineFilter)
//                 {
//                 }
//                 column(ColumnLayoutNameCaption; ColumnLayoutNameCaptionLbl)
//                 {
//                 }
//                 column(AccScheduleName_Name_Caption; AccScheduleName_Name_CaptionLbl)
//                 {
//                 }
//                 column(FiscalStartDateCaption; FiscalStartDateCaptionLbl)
//                 {
//                 }
//                 column(PeriodTextCaption; PeriodTextCaptionLbl)
//                 {
//                 }
//                 column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
//                 {
//                 }
//                 column(Account_ScheduleCaption; Account_ScheduleCaptionLbl)
//                 {
//                 }
//                 column(AnalysisView_CodeCaption; AnalysisView_CodeCaptionLbl)
//                 {
//                 }
//                 column(RowNoCaption; RowNoCaption)
//                 {
//                 }
//                 column(ShowRowNo; ShowRowNo)
//                 {
//                 }
//                 column(ShowRoundingHeader; ShowRoundingHeader)
//                 {
//                 }
//                 column(ColumnHeader1; ColumnHeaderArrayText[1])
//                 {
//                 }
//                 column(ColumnHeader2; ColumnHeaderArrayText[2])
//                 {
//                 }
//                 column(ColumnHeader3; ColumnHeaderArrayText[3])
//                 {
//                 }
//                 column(ColumnHeader4; ColumnHeaderArrayText[4])
//                 {
//                 }
//                 column(ColumnHeader5; ColumnHeaderArrayText[5])
//                 {
//                 }
//                 dataitem(DataItem7769; Table85)
//                 {
//                     DataItemLink = Schedule Name=FIELD(Name);
//                     DataItemLinkReference = AccScheduleName;
//                     DataItemTableView = SORTING(Schedule Name, "Line No.");
//                     PrintOnlyIfDetail = true;
//                     column(NextPageGroupNo; NextPageGroupNo)
//                     {
//                     }
//                     column(Acc__Schedule_Line_Description; PADSTR('', Indentation * 2, PadString) + Description)
//                     {
//                     }
//                     column(Acc__Schedule_Line__Row_No; "Row No.")
//                     {
//                     }
//                     column(Acc__Schedule_Line_Line_No; "Line No.")
//                     {
//                     }
//                     column(Bold_control; Bold_control)
//                     {
//                     }
//                     column(Italic_control; Italic_control)
//                     {
//                     }
//                     column(Underline_control; Underline_control)
//                     {
//                     }
//                     column(DoubleUnderline_control; DoubleUnderline_control)
//                     {
//                     }
//                     column(LineShadowed; LineShadowed)
//                     {
//                     }
//                     column(LineSkipped; LineSkipped)
//                     {
//                     }
//                     dataitem(DataItem5937; Table334)
//                     {
//                         DataItemTableView = SORTING(Column Layout Name, "Line No.");
//                         column(ColumnNo; "Column No.")
//                         {
//                         }
//                         column(Header; Header)
//                         {
//                         }
//                         column(RoundingHeader; RoundingHeader)
//                         {
//                             AutoCalcField = false;
//                         }
//                         column(ColumnValuesAsText; ColumnValuesAsText)
//                         {
//                             AutoCalcField = false;
//                         }
//                         column(LineNo_ColumnLayout; "Line No.")
//                         {
//                         }

//                         trigger OnAfterGetRecord()
//                         begin
//                             IF Show = Show::Never THEN
//                                 CurrReport.SKIP;

//                             Header := "Column Header";
//                             RoundingHeader := '';

//                             IF "Rounding Factor" IN ["Rounding Factor"::"1000", "Rounding Factor"::"1000000"] THEN
//                                 CASE "Rounding Factor" OF
//                                     "Rounding Factor"::"1000":
//                                         RoundingHeader := Text000;
//                                     "Rounding Factor"::"1000000":
//                                         RoundingHeader := Text001;
//                                 END;

//                             ColumnValuesAsText := CalcColumnValueAsText("Acc. Schedule Line", "Column Layout");

//                             ColumnValuesArrayIndex += 1;
//                             IF ColumnValuesArrayIndex <= ARRAYLEN(ColumnValuesArrayText) THEN
//                                 ColumnValuesArrayText[ColumnValuesArrayIndex] := ColumnValuesAsText;

//                             IF (ColumnValuesAsText <> '') OR ("Acc. Schedule Line".Show = "Acc. Schedule Line".Show::Yes) THEN
//                                 LineSkipped := FALSE;
//                         end;

//                         trigger OnPreDataItem()
//                         begin
//                             SETRANGE("Column Layout Name", ColumnLayoutName);
//                             LineSkipped := TRUE;
//                             ColumnValuesArrayIndex := 0;
//                         end;
//                     }
//                     dataitem(FixedColumns; Integer)
//                     {
//                         DataItemTableView = SORTING(Number)
//                                             WHERE(Number = CONST(1));
//                         column(ColumnValue1; ColumnValuesArrayText[1])
//                         {
//                         }
//                         column(ColumnValue2; ColumnValuesArrayText[2])
//                         {
//                         }
//                         column(ColumnValue3; ColumnValuesArrayText[3])
//                         {
//                         }
//                         column(ColumnValue4; ColumnValuesArrayText[4])
//                         {
//                         }
//                         column(ColumnValue5; ColumnValuesArrayText[5])
//                         {
//                         }
//                     }

//                     trigger OnAfterGetRecord()
//                     begin
//                         IF (Show = Show::No) OR NOT ShowLine(Bold, Italic) THEN
//                             CurrReport.SKIP;

//                         PadChar := 160; // whitespace
//                         PadString[1] := PadChar;
//                         Bold_control := Bold;
//                         Italic_control := Italic;
//                         Underline_control := Underline;
//                         DoubleUnderline_control := "Double Underline";
//                         PageGroupNo := NextPageGroupNo;
//                         IF "New Page" THEN
//                             NextPageGroupNo := PageGroupNo + 1;

//                         LineShadowed := ShowAlternatingShading AND NOT LineShadowed;

//                         IF NOT ShowRowNo THEN
//                             "Row No." := '';
//                     end;

//                     trigger OnPreDataItem()
//                     begin
//                         PageGroupNo := NextPageGroupNo;

//                         SETFILTER("Date Filter", DateFilter);
//                         SETFILTER("G/L Budget Filter", GLBudgetFilter);
//                         SETFILTER("Cost Budget Filter", CostBudgetFilter);
//                         SETFILTER("Business Unit Filter", BusinessUnitFilter);
//                         SETFILTER("Dimension 1 Filter", Dim1Filter);
//                         SETFILTER("Dimension 2 Filter", Dim2Filter);
//                         SETFILTER("Dimension 3 Filter", Dim3Filter);
//                         SETFILTER("Dimension 4 Filter", Dim4Filter);
//                         SETFILTER("Cost Center Filter", CostCenterFilter);
//                         SETFILTER("Cost Object Filter", CostObjectFilter);
//                         SETFILTER("Cash Flow Forecast Filter", CashFlowFilter);
//                     end;
//                 }

//                 trigger OnPreDataItem()
//                 var
//                     ColumnLayout: Record "334";
//                     i: Integer;
//                 begin
//                     ColumnLayout.SETRANGE("Column Layout Name", ColumnLayoutName);
//                     IF ColumnLayout.FINDSET THEN
//                         REPEAT
//                             i += 1;
//                             ColumnHeaderArrayText[i] := ColumnLayout."Column Header";
//                         UNTIL (ColumnLayout.NEXT = 0) OR (i = ARRAYLEN(ColumnHeaderArrayText));
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 CurrReport.PAGENO := 1;
//                 GLSetup.GET;
//                 IF "Analysis View Name" <> '' THEN BEGIN
//                     AnalysisView.GET("Analysis View Name");
//                 END ELSE BEGIN
//                     AnalysisView.INIT;
//                     AnalysisView."Dimension 1 Code" := GLSetup."Global Dimension 1 Code";
//                     AnalysisView."Dimension 2 Code" := GLSetup."Global Dimension 2 Code";
//                 END;

//                 IF UseAmtsInAddCurr THEN
//                     HeaderText := STRSUBSTNO(Text003, GLSetup."Additional Reporting Currency")
//                 ELSE
//                     IF GLSetup."LCY Code" <> '' THEN
//                         HeaderText := STRSUBSTNO(Text003, GLSetup."LCY Code")
//                     ELSE
//                         HeaderText := '';
//             end;

//             trigger OnPreDataItem()
//             begin
//                 SETRANGE(Name, AccSchedName);

//                 PageGroupNo := 1;
//                 NextPageGroupNo := 1;
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
//                     group(Layout)
//                     {
//                         Caption = 'Layout';
//                         Visible = AccSchedNameEditable;
//                         field(AccSchedNam; AccSchedName)
//                         {
//                             ApplicationArea = Basic, Suite;
//                             Caption = 'Acc. Schedule Name';
//                             Editable = AccSchedNameEditable;
//                             Importance = Promoted;
//                             Lookup = true;
//                             ShowMandatory = true;
//                             TableRelation = "Acc. Schedule Name";
//                             ToolTip = 'Specifies the name of the account schedule.';

//                             trigger OnLookup(var Text: Text): Boolean
//                             begin
//                                 EXIT(AccSchedManagement.LookupName(AccSchedName, Text));
//                             end;

//                             trigger OnValidate()
//                             begin
//                                 ValidateAccSchedName;
//                                 AccSchedNameHidden := '';
//                                 SetBudgetFilterEnable;
//                                 RequestOptionsPage.UPDATE(FALSE);
//                             end;
//                         }
//                         field(ColumnLayoutNames; ColumnLayoutName)
//                         {
//                             ApplicationArea = Basic, Suite;
//                             Caption = 'Column Layout Name';
//                             Editable = AccSchedNameEditable;
//                             Importance = Promoted;
//                             Lookup = true;
//                             ShowMandatory = true;
//                             TableRelation = "Column Layout Name".Name;
//                             ToolTip = 'Specifies the name of the column layout that is used for the report.';

//                             trigger OnLookup(var Text: Text): Boolean
//                             begin
//                                 IF NOT AccSchedManagement.LookupColumnName(ColumnLayoutName, Text) THEN
//                                     EXIT(FALSE);
//                                 ColumnLayoutName := COPYSTR(Text, 1, MAXSTRLEN(ColumnLayoutName));
//                                 SetBudgetFilterEnable;
//                                 ColumnLayoutNameHidden := '';
//                                 RequestOptionsPage.UPDATE;
//                                 EXIT(TRUE);
//                             end;

//                             trigger OnValidate()
//                             begin
//                                 IF ColumnLayoutName = '' THEN
//                                     ERROR(Text006);
//                                 AccSchedManagement.CheckColumnName(ColumnLayoutName);
//                                 SetBudgetFilterEnable;
//                                 ColumnLayoutNameHidden := '';
//                                 RequestOptionsPage.UPDATE;
//                             end;
//                         }
//                     }
//                     group(Filters)
//                     {
//                         Caption = 'Filters';
//                         field(StartDate; StartDate)
//                         {
//                             ApplicationArea = Basic, Suite;
//                             Caption = 'Starting Date';
//                             Enabled = StartDateEnabled;
//                             ShowMandatory = true;
//                             ToolTip = 'Specifies the date from which the report or batch job processes information.';

//                             trigger OnValidate()
//                             begin
//                                 ValidateStartEndDate;
//                             end;
//                         }
//                         field(EndDate; EndDate)
//                         {
//                             ApplicationArea = Basic, Suite;
//                             Caption = 'Ending Date';
//                             ShowMandatory = true;
//                             ToolTip = 'Specifies the date to which the report or batch job processes information.';

//                             trigger OnValidate()
//                             begin
//                                 ValidateStartEndDate;
//                             end;
//                         }
//                         field(GLBudgetFilter; GLBudgetName)
//                         {
//                             ApplicationArea = Suite;
//                             Caption = 'G/L Budget';
//                             Enabled = BudgetFilterEnable;
//                             ShowMandatory = BudgetFilterEnable;
//                             TableRelation = "G/L Budget Name".Name;
//                             ToolTip = 'Specifies a general ledger budget filter for the report.';
//                             Width = 10;

//                             trigger OnValidate()
//                             begin
//                                 GLBudgetFilter := GLBudgetName;
//                                 "Acc. Schedule Line".SETRANGE("G/L Budget Filter", GLBudgetFilter);
//                                 GLBudgetFilter := "Acc. Schedule Line".GETFILTER("G/L Budget Filter");
//                             end;
//                         }
//                         field(CostBudgetFilter; CostBudgetFilter)
//                         {
//                             ApplicationArea = CostAccounting;
//                             Caption = 'Cost Budget Filter';
//                             Enabled = BudgetFilterEnable;
//                             Importance = Additional;
//                             TableRelation = "Cost Budget Name".Name;
//                             ToolTip = 'Specifies a code for a cost budget that the account schedule line will be filtered on.';

//                             trigger OnValidate()
//                             begin
//                                 "Acc. Schedule Line".SETFILTER("Cost Budget Filter", CostBudgetFilter);
//                                 CostBudgetFilter := "Acc. Schedule Line".GETFILTER("Cost Budget Filter");
//                             end;
//                         }
//                         field(BusinessUnitFilter; BusinessUnitFilter)
//                         {
//                             ApplicationArea = Basic, Suite;
//                             Caption = 'Business Unit Filter';
//                             Importance = Additional;
//                             LookupPageID = "Business Unit List";
//                             TableRelation = "Business Unit";
//                             ToolTip = 'Specifies the business unit filter for the account schedule.';
//                             Visible = BusinessUnitFilterVisible;

//                             trigger OnValidate()
//                             begin
//                                 "Acc. Schedule Line".SETFILTER("Business Unit Filter", BusinessUnitFilter);
//                                 BusinessUnitFilter := "Acc. Schedule Line".GETFILTER("Business Unit Filter");
//                             end;
//                         }
//                     }
//                     group("Dimension Filters")
//                     {
//                         Caption = 'Dimension Filters';
//                         field(Dim1Filter; Dim1Filter)
//                         {
//                             ApplicationArea = Dimensions;
//                             CaptionClass = FormGetCaptionClass(1);
//                             Caption = 'Dimension 1 Filter';
//                             Importance = Additional;
//                             ToolTip = 'Specifies a filter for dimension values within a dimension. The filter uses the dimension you have defined as dimension 1 for the analysis view selected in the Analysis View Code field.';
//                             Visible = Dim1FilterEnable;

//                             trigger OnLookup(var Text: Text): Boolean
//                             begin
//                                 EXIT(FormLookUpDimFilter(AnalysisView."Dimension 1 Code", Text));
//                             end;
//                         }
//                         field(Dim2Filter; Dim2Filter)
//                         {
//                             ApplicationArea = Dimensions;
//                             CaptionClass = FormGetCaptionClass(2);
//                             Caption = 'Dimension 2 Filter';
//                             Importance = Additional;
//                             ToolTip = 'Specifies a filter for dimension values within a dimension. The filter uses the dimension you have defined as dimension 2 for the analysis view selected in the Analysis View Code field.';
//                             Visible = Dim2FilterEnable;

//                             trigger OnLookup(var Text: Text): Boolean
//                             begin
//                                 EXIT(FormLookUpDimFilter(AnalysisView."Dimension 2 Code", Text));
//                             end;
//                         }
//                         field(Dim3Filter; Dim3Filter)
//                         {
//                             ApplicationArea = Dimensions;
//                             CaptionClass = FormGetCaptionClass(3);
//                             Caption = 'Dimension 3 Filter';
//                             Importance = Additional;
//                             ToolTip = 'Specifies a filter for dimension values within a dimension. The filter uses the dimension you have defined as dimension 3 for the analysis view selected in the Analysis View Code field.';
//                             Visible = Dim3FilterEnable;

//                             trigger OnLookup(var Text: Text): Boolean
//                             begin
//                                 EXIT(FormLookUpDimFilter(AnalysisView."Dimension 3 Code", Text));
//                             end;
//                         }
//                         field(Dim4Filter; Dim4Filter)
//                         {
//                             ApplicationArea = Dimensions;
//                             CaptionClass = FormGetCaptionClass(4);
//                             Caption = 'Dimension 4 Filter';
//                             Importance = Additional;
//                             ToolTip = 'Specifies a filter for dimension values within a dimension. The filter uses the dimension you have defined as dimension 4 for the analysis view selected in the Analysis View Code field.';
//                             Visible = Dim4FilterEnable;

//                             trigger OnLookup(var Text: Text): Boolean
//                             begin
//                                 EXIT(FormLookUpDimFilter(AnalysisView."Dimension 4 Code", Text));
//                             end;
//                         }
//                         field(CostCenterFilter; CostCenterFilter)
//                         {
//                             ApplicationArea = Dimensions;
//                             Caption = 'Cost Center Filter';
//                             Importance = Additional;
//                             ToolTip = 'Specifies a cost center filter for dimension values within a dimension. The filter uses the dimension you have defined as Dimension 1 for the Analysis View selected in the Analysis View Code field. If you have not defined a Dimension 1 for an analysis view, this field will be disabled. ';

//                             trigger OnLookup(var Text: Text): Boolean
//                             var
//                                 CostCenter: Record "1112";
//                             begin
//                                 EXIT(CostCenter.LookupCostCenterFilter(Text));
//                             end;
//                         }
//                         field(CostObjectFilter; CostObjectFilter)
//                         {
//                             ApplicationArea = CostAccounting;
//                             Caption = 'Cost Object Filter';
//                             Importance = Additional;
//                             ToolTip = 'Specifies the cost object filter that applies.';

//                             trigger OnLookup(var Text: Text): Boolean
//                             var
//                                 CostObject: Record "1113";
//                             begin
//                                 EXIT(CostObject.LookupCostObjectFilter(Text));
//                             end;
//                         }
//                         field(CashFlowFilter; CashFlowFilter)
//                         {
//                             ApplicationArea = Basic, Suite;
//                             Caption = 'Cash Flow Filter';
//                             Importance = Additional;
//                             ToolTip = 'Specifies a cash flow filter for the schedule.';

//                             trigger OnLookup(var Text: Text): Boolean
//                             var
//                                 CashFlowForecast: Record "840";
//                             begin
//                                 EXIT(CashFlowForecast.LookupCashFlowFilter(Text));
//                             end;
//                         }
//                     }
//                     group(Show)
//                     {
//                         Caption = 'Show';
//                         field(ShowError; ShowError)
//                         {
//                             ApplicationArea = Basic, Suite;
//                             Caption = 'Show Error';
//                             Importance = Additional;
//                             OptionCaption = 'None,Division by Zero,Period Error,Both';
//                             ToolTip = 'Specifies if the report shows error information.';
//                         }
//                         field(UseAmtsInAddCurr; UseAmtsInAddCurr)
//                         {
//                             ApplicationArea = Suite;
//                             Caption = 'Show Amounts in Add. Reporting Currency';
//                             Importance = Additional;
//                             MultiLine = true;
//                             ToolTip = 'Specifies if the reported amounts are shown in the additional reporting currency.';
//                             Visible = UseAmtsInAddCurrVisible;
//                         }
//                         field(ShowRowNo; ShowRowNo)
//                         {
//                             ApplicationArea = Basic, Suite;
//                             Caption = 'Show Row No.';
//                             Importance = Additional;
//                             ToolTip = 'Specifies if the report shows row numbers.';
//                         }
//                         field(ShowAlternatingShading; ShowAlternatingShading)
//                         {
//                             ApplicationArea = Basic, Suite;
//                             Caption = 'Print Alternating Shading';
//                             Importance = Additional;
//                             ToolTip = 'Specifies if you want every second row in the report to be shaded.';
//                         }
//                     }
//                 }
//             }
//         }

//         actions
//         {
//         }

//         trigger OnInit()
//         begin
//             Dim4FilterEnable := TRUE;
//             Dim3FilterEnable := TRUE;
//             Dim2FilterEnable := TRUE;
//             Dim1FilterEnable := TRUE;
//             AccSchedNameEditable := TRUE;
//         end;

//         trigger OnOpenPage()
//         begin
//             GLSetup.GET;
//             TransferValues;
//             IF AccSchedName <> '' THEN
//                 IF (ColumnLayoutName = '') OR NOT AccSchedNameEditable THEN
//                     ValidateAccSchedName;
//             SetBudgetFilterEnable;
//         end;
//     }

//     labels
//     {
//         AccSchedLineSpec_DescriptionCaptionLbl = 'Description';
//     }

//     trigger OnPreReport()
//     begin
//         TransferValues;
//         UpdateFilters;
//         InitAccSched;
//     end;

//     var
//         Text000: Label '(Thousands)';
//         Text001: Label '(Millions)';
//         Text002: Label '* ERROR *';
//         Text003: Label 'All amounts are in %1.';
//         AnalysisView: Record "363";
//         GLSetup: Record "98";
//         AccSchedManagement: Codeunit "8";
//         AccSchedName: Code[10];
//         AccSchedNameHidden: Code[10];
//         ColumnLayoutName: Code[10];
//         ColumnLayoutNameHidden: Code[10];
//         GLBudgetName: Code[10];
//         [InDataSet]
//         StartDateEnabled: Boolean;
//         StartDate: Date;
//         EndDate: Date;
//         ShowError: Option "None","Division by Zero","Period Error",Both;
//         ShowAlternatingShading: Boolean;
//         ShowRoundingHeader: Boolean;
//         DateFilter: Text;
//         UseHiddenFilters: Boolean;
//         DateFilterHidden: Text;
//         GLBudgetFilter: Text;
//         GLBudgetFilterHidden: Text;
//         CostBudgetFilter: Text;
//         CostBudgetFilterHidden: Text;
//         BusinessUnitFilter: Text;
//         BusinessUnitFilterHidden: Text;
//         Dim1Filter: Text;
//         Dim1FilterHidden: Text;
//         Dim2Filter: Text;
//         Dim2FilterHidden: Text;
//         Dim3Filter: Text;
//         Dim3FilterHidden: Text;
//         Dim4Filter: Text;
//         Dim4FilterHidden: Text;
//         CostCenterFilter: Text;
//         CostObjectFilter: Text;
//         CashFlowFilter: Text;
//         FiscalStartDate: Date;
//         ColumnHeaderArrayText: array[5] of Text[30];
//         ColumnValuesArrayText: array[5] of Text[30];
//         ColumnValuesArrayIndex: Integer;
//         ColumnValuesDisplayed: Decimal;
//         ColumnValuesAsText: Text[30];
//         PeriodText: Text;
//         AccSchedLineFilter: Text;
//         Header: Text[50];
//         RoundingHeader: Text[30];
//         [InDataSet]
//         BusinessUnitFilterVisible: Boolean;
//         [InDataSet]
//         BudgetFilterEnable: Boolean;
//         [InDataSet]
//         UseAmtsInAddCurrVisible: Boolean;
//         UseAmtsInAddCurr: Boolean;
//         ShowRowNo: Boolean;
//         RowNoCaption: Text;
//         HeaderText: Text[100];
//         Text004: Label 'Not Available';
//         Text005: Label '1,6,,Dimension %1 Filter';
//         Bold_control: Boolean;
//         Italic_control: Boolean;
//         Underline_control: Boolean;
//         DoubleUnderline_control: Boolean;
//         PageGroupNo: Integer;
//         NextPageGroupNo: Integer;
//         Text006: Label 'Enter the Column Layout Name.';
//         [InDataSet]
//         Dim1FilterEnable: Boolean;
//         [InDataSet]
//         Dim2FilterEnable: Boolean;
//         [InDataSet]
//         Dim3FilterEnable: Boolean;
//         [InDataSet]
//         Dim4FilterEnable: Boolean;
//         [InDataSet]
//         AccSchedNameEditable: Boolean;
//         LineShadowed: Boolean;
//         LineSkipped: Boolean;
//         ColumnLayoutNameCaptionLbl: Label 'Column Layout';
//         AccScheduleName_Name_CaptionLbl: Label 'Account Schedule';
//         FiscalStartDateCaptionLbl: Label 'Fiscal Start Date';
//         PeriodTextCaptionLbl: Label 'Period';
//         PeriodEndingTextCaptionLbl: Label 'Period Ending';
//         CurrReport_PAGENOCaptionLbl: Label 'Page';
//         Account_ScheduleCaptionLbl: Label 'Account Schedule';
//         AnalysisView_CodeCaptionLbl: Label 'Analysis View';
//         PadChar: Char;
//         PadString: Text;

//     local procedure CalcColumnValueAsText(var AccScheduleLine: Record "85"; var ColumnLayout: Record "334"): Text[30]
//     var
//         ColumnValuesAsText: Text[30];
//     begin
//         ColumnValuesAsText := '';

//         ColumnValuesDisplayed := AccSchedManagement.CalcCell(AccScheduleLine, ColumnLayout, UseAmtsInAddCurr);
//         IF AccSchedManagement.GetDivisionError THEN BEGIN
//             IF ShowError IN [ShowError::"Division by Zero", ShowError::Both] THEN
//                 ColumnValuesAsText := Text002;
//         END ELSE
//             IF AccSchedManagement.GetPeriodError THEN BEGIN
//                 IF ShowError IN [ShowError::"Period Error", ShowError::Both] THEN
//                     ColumnValuesAsText := Text004;
//             END ELSE BEGIN
//                 ColumnValuesAsText :=
//                   AccSchedManagement.FormatCellAsText(ColumnLayout, ColumnValuesDisplayed, UseAmtsInAddCurr);

//                 IF AccScheduleLine."Totaling Type" = AccScheduleLine."Totaling Type"::Formula THEN
//                     CASE AccScheduleLine.Show OF
//                         AccScheduleLine.Show::"When Positive Balance":
//                             IF ColumnValuesDisplayed < 0 THEN
//                                 ColumnValuesAsText := '';
//                         AccScheduleLine.Show::"When Negative Balance":
//                             IF ColumnValuesDisplayed > 0 THEN
//                                 ColumnValuesAsText := '';
//                         AccScheduleLine.Show::"If Any Column Not Zero":
//                             IF ColumnValuesDisplayed = 0 THEN
//                                 ColumnValuesAsText := '';
//                     END;
//             END;
//         EXIT(ColumnValuesAsText);
//     end;

//     procedure InitAccSched()
//     var
//         ColumnLayout: Record "334";
//         AccScheduleLine: Record "85";
//         AccountingPeriodMgt: Codeunit "360";
//     begin
//         AccScheduleName.SETRANGE(Name, AccSchedName);
//         "Acc. Schedule Line".SETFILTER("Date Filter", DateFilter);
//         "Acc. Schedule Line".SETFILTER("G/L Budget Filter", GLBudgetFilter);
//         "Acc. Schedule Line".SETFILTER("Cost Budget Filter", CostBudgetFilter);
//         "Acc. Schedule Line".SETFILTER("Business Unit Filter", BusinessUnitFilter);
//         "Acc. Schedule Line".SETFILTER("Dimension 1 Filter", Dim1Filter);
//         "Acc. Schedule Line".SETFILTER("Dimension 2 Filter", Dim2Filter);
//         "Acc. Schedule Line".SETFILTER("Dimension 3 Filter", Dim3Filter);
//         "Acc. Schedule Line".SETFILTER("Dimension 4 Filter", Dim4Filter);
//         "Acc. Schedule Line".SETFILTER("Cost Center Filter", CostCenterFilter);
//         "Acc. Schedule Line".SETFILTER("Cost Object Filter", CostObjectFilter);
//         "Acc. Schedule Line".SETFILTER("Cash Flow Forecast Filter", CashFlowFilter);

//         IF "Acc. Schedule Line".GETFILTER("Date Filter") <> '' THEN
//             EndDate := "Acc. Schedule Line".GETRANGEMAX("Date Filter");
//         FiscalStartDate := AccountingPeriodMgt.FindFiscalYear(EndDate);

//         AccScheduleLine.COPYFILTERS("Acc. Schedule Line");
//         AccScheduleLine.SETRANGE("Date Filter");
//         AccSchedLineFilter := AccScheduleLine.GETFILTERS;

//         IF StartDateEnabled THEN
//             PeriodText := PeriodTextCaptionLbl + ': ' + "Acc. Schedule Line".GETFILTER("Date Filter")
//         ELSE
//             PeriodText := PeriodEndingTextCaptionLbl + ' ' + FORMAT(EndDate);

//         IF ShowRowNo THEN
//             RowNoCaption := "Acc. Schedule Line".FIELDCAPTION("Row No.");

//         ColumnLayout.SETRANGE("Column Layout Name", ColumnLayoutName);
//         ColumnLayout.SETFILTER("Rounding Factor", '<>%1&<>%2', ColumnLayout."Rounding Factor"::None, ColumnLayout."Rounding Factor"::"1");
//         ShowRoundingHeader := NOT ColumnLayout.ISEMPTY;
//     end;

//     procedure SetAccSchedName(NewAccSchedName: Code[10])
//     begin
//         AccSchedNameHidden := NewAccSchedName;
//         AccSchedNameEditable := TRUE;
//     end;

//     procedure SetAccSchedNameNonEditable(NewAccSchedName: Code[10])
//     begin
//         SetAccSchedName(NewAccSchedName);
//         AccSchedNameEditable := FALSE;
//     end;

//     procedure SetColumnLayoutName(ColLayoutName: Code[10])
//     begin
//         ColumnLayoutNameHidden := ColLayoutName;
//     end;

//     procedure SetFilters(NewDateFilter: Text; NewBudgetFilter: Text; NewCostBudgetFilter: Text; NewBusUnitFilter: Text; NewDim1Filter: Text; NewDim2Filter: Text; NewDim3Filter: Text; NewDim4Filter: Text)
//     begin
//         DateFilterHidden := NewDateFilter;
//         GLBudgetFilterHidden := NewBudgetFilter;
//         CostBudgetFilterHidden := NewCostBudgetFilter;
//         BusinessUnitFilterHidden := NewBusUnitFilter;
//         Dim1FilterHidden := NewDim1Filter;
//         Dim2FilterHidden := NewDim2Filter;
//         Dim3FilterHidden := NewDim3Filter;
//         Dim4FilterHidden := NewDim4Filter;
//         UseHiddenFilters := TRUE;
//     end;

//     procedure ShowLine(Bold: Boolean; Italic: Boolean): Boolean
//     begin
//         IF "Acc. Schedule Line"."Totaling Type" = "Acc. Schedule Line"."Totaling Type"::"Set Base For Percent" THEN
//             EXIT(FALSE);
//         IF "Acc. Schedule Line".Show = "Acc. Schedule Line".Show::No THEN
//             EXIT(FALSE);
//         IF "Acc. Schedule Line".Bold <> Bold THEN
//             EXIT(FALSE);
//         IF "Acc. Schedule Line".Italic <> Italic THEN
//             EXIT(FALSE);

//         EXIT(TRUE);
//     end;

//     local procedure FormLookUpDimFilter(Dim: Code[20]; var Text: Text[1024]): Boolean
//     var
//         DimVal: Record "349";
//         DimValList: Page "560";
//     begin
//         IF Dim = '' THEN
//             EXIT(FALSE);
//         DimValList.LOOKUPMODE(TRUE);
//         DimVal.SETRANGE("Dimension Code", Dim);
//         DimValList.SETTABLEVIEW(DimVal);
//         IF DimValList.RUNMODAL = ACTION::LookupOK THEN BEGIN
//             DimValList.GETRECORD(DimVal);
//             Text := DimValList.GetSelectionFilter;
//             EXIT(TRUE);
//         END;
//         EXIT(FALSE)
//     end;

//     local procedure FormGetCaptionClass(DimNo: Integer): Text[250]
//     begin
//         CASE DimNo OF
//             1:
//                 BEGIN
//                     IF AnalysisView."Dimension 1 Code" <> '' THEN
//                         EXIT('1,6,' + AnalysisView."Dimension 1 Code");
//                     EXIT(STRSUBSTNO(Text005, DimNo));
//                 END;
//             2:
//                 BEGIN
//                     IF AnalysisView."Dimension 2 Code" <> '' THEN
//                         EXIT('1,6,' + AnalysisView."Dimension 2 Code");
//                     EXIT(STRSUBSTNO(Text005, DimNo));
//                 END;
//             3:
//                 BEGIN
//                     IF AnalysisView."Dimension 3 Code" <> '' THEN
//                         EXIT('1,6,' + AnalysisView."Dimension 3 Code");
//                     EXIT(STRSUBSTNO(Text005, DimNo));
//                 END;
//             4:
//                 BEGIN
//                     IF AnalysisView."Dimension 4 Code" <> '' THEN
//                         EXIT('1,6,' + AnalysisView."Dimension 4 Code");
//                     EXIT(STRSUBSTNO(Text005, DimNo));
//                 END;
//         END;
//     end;

//     local procedure TransferValues()
//     var
//         ColumnLayoutName2: Record "333";
//         BusinessUnit: Record "220";
//     begin
//         IF GLBudgetName <> '' THEN
//             GLBudgetFilter := GLBudgetName;
//         GLSetup.GET;
//         UseAmtsInAddCurrVisible := GLSetup."Additional Reporting Currency" <> '';
//         BusinessUnitFilterVisible := NOT BusinessUnit.ISEMPTY;
//         IF NOT UseAmtsInAddCurrVisible THEN
//             UseAmtsInAddCurr := FALSE;
//         IF AccSchedNameHidden <> '' THEN
//             AccSchedName := AccSchedNameHidden;
//         IF ColumnLayoutNameHidden <> '' THEN
//             ColumnLayoutName := ColumnLayoutNameHidden;
//         IF DateFilterHidden <> '' THEN
//             DateFilter := DateFilterHidden;
//         IF GLBudgetFilterHidden <> '' THEN
//             GLBudgetFilter := GLBudgetFilterHidden;
//         IF CostBudgetFilterHidden <> '' THEN
//             CostBudgetFilter := CostBudgetFilterHidden;
//         IF BusinessUnitFilterHidden <> '' THEN
//             BusinessUnitFilter := BusinessUnitFilterHidden;
//         IF Dim1FilterHidden <> '' THEN
//             Dim1Filter := Dim1FilterHidden;
//         IF Dim2FilterHidden <> '' THEN
//             Dim2Filter := Dim2FilterHidden;
//         IF Dim3FilterHidden <> '' THEN
//             Dim3Filter := Dim3FilterHidden;
//         IF Dim4FilterHidden <> '' THEN
//             Dim4Filter := Dim4FilterHidden;

//         IF AccSchedName <> '' THEN
//             IF NOT AccScheduleName.GET(AccSchedName) THEN
//                 AccSchedName := '';
//         IF AccSchedName = '' THEN
//             IF AccScheduleName.FINDFIRST THEN
//                 AccSchedName := AccScheduleName.Name;

//         IF NOT ColumnLayoutName2.GET(ColumnLayoutName) THEN
//             ColumnLayoutName := AccScheduleName."Default Column Layout";

//         IF AccScheduleName."Analysis View Name" <> '' THEN
//             AnalysisView.GET(AccScheduleName."Analysis View Name")
//         ELSE BEGIN
//             AnalysisView."Dimension 1 Code" := GLSetup."Global Dimension 1 Code";
//             AnalysisView."Dimension 2 Code" := GLSetup."Global Dimension 2 Code";
//         END;
//     end;

//     local procedure UpdateFilters()
//     begin
//         IF UseHiddenFilters THEN BEGIN
//             DateFilter := DateFilterHidden;
//             GLBudgetFilter := GLBudgetFilterHidden;
//             CostBudgetFilter := CostBudgetFilterHidden;
//             BusinessUnitFilter := BusinessUnitFilterHidden;
//             Dim1Filter := Dim1FilterHidden;
//             Dim2Filter := Dim2FilterHidden;
//             Dim3Filter := Dim3FilterHidden;
//             Dim4Filter := Dim4FilterHidden;
//         END ELSE BEGIN
//             IF EndDate = 0D THEN
//                 EndDate := WORKDATE;
//             IF StartDate = 0D THEN
//                 StartDate := CALCDATE('<CM-1M+1D>', EndDate);
//             ValidateStartEndDate;
//         END;

//         IF ColumnLayoutName = '' THEN
//             IF AccScheduleName.GET(AccSchedName) THEN
//                 ColumnLayoutName := AccScheduleName."Default Column Layout";
//     end;

//     local procedure SetBudgetFilterEnable()
//     var
//         ColumnLayout: Record "334";
//     begin
//         BudgetFilterEnable := TRUE;
//         StartDateEnabled := TRUE;
//         IF ColumnLayoutName = '' THEN
//             EXIT;
//         ColumnLayout.SETRANGE("Column Layout Name", ColumnLayoutName);
//         ColumnLayout.SETRANGE("Ledger Entry Type", ColumnLayout."Ledger Entry Type"::"Budget Entries");
//         BudgetFilterEnable := NOT ColumnLayout.ISEMPTY;
//         IF NOT BudgetFilterEnable THEN
//             GLBudgetFilter := '';
//         GLBudgetName := COPYSTR(GLBudgetFilter, 1, MAXSTRLEN(GLBudgetName));
//         ColumnLayout.SETRANGE("Ledger Entry Type");
//         ColumnLayout.SETFILTER("Column Type", '<>%1', ColumnLayout."Column Type"::"Balance at Date");
//         StartDateEnabled := NOT ColumnLayout.ISEMPTY;
//         IF NOT StartDateEnabled THEN
//             StartDate := 0D;
//     end;

//     local procedure ValidateStartEndDate()
//     begin
//         IF (StartDate = 0D) AND (EndDate = 0D) THEN
//             ValidateDateFilter('')
//         ELSE
//             ValidateDateFilter(STRSUBSTNO('%1..%2', StartDate, EndDate));
//     end;

//     local procedure ValidateDateFilter(NewDateFilter: Text[30])
//     var
//         TextManagement: Codeunit "41";
//     begin
//         TextManagement.MakeDateFilter(NewDateFilter);
//         "Acc. Schedule Line".SETFILTER("Date Filter", NewDateFilter);
//         DateFilter := COPYSTR("Acc. Schedule Line".GETFILTER("Date Filter"), 1, MAXSTRLEN(DateFilter));
//     end;

//     local procedure ValidateAccSchedName()
//     begin
//         AccSchedManagement.CheckName(AccSchedName);
//         AccScheduleName.GET(AccSchedName);
//         IF AccScheduleName."Default Column Layout" <> '' THEN
//             ColumnLayoutName := AccScheduleName."Default Column Layout";
//         IF AccScheduleName."Analysis View Name" <> '' THEN
//             AnalysisView.GET(AccScheduleName."Analysis View Name")
//         ELSE BEGIN
//             CLEAR(AnalysisView);
//             AnalysisView."Dimension 1 Code" := GLSetup."Global Dimension 1 Code";
//             AnalysisView."Dimension 2 Code" := GLSetup."Global Dimension 2 Code";
//         END;
//         Dim1FilterEnable := AnalysisView."Dimension 1 Code" <> '';
//         Dim2FilterEnable := AnalysisView."Dimension 2 Code" <> '';
//         Dim3FilterEnable := AnalysisView."Dimension 3 Code" <> '';
//         Dim4FilterEnable := AnalysisView."Dimension 4 Code" <> '';
//         RequestOptionsPage.CAPTION := AccScheduleName.Description;
//         RequestOptionsPage.UPDATE(FALSE);
//     end;
// }
