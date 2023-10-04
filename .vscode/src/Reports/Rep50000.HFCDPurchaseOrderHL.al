// report 50000 "HF CD Purchase Order HL"
// {
//     // version AI13.00,HL

//     DefaultLayout = RDLC;
//     RDLCLayout = '.vscode/src/Reports/Layouts/CD Purchase Order HL.rdlc';

//     dataset
//     {
//         dataitem("Purchase Header"; "Purchase Header")
//         {
//             DataItemTableView = SORTING("Document Type", "No.")
//                                 WHERE("Document Type" = CONST(Order));
//             RequestFilterFields = "No.", "Buy-from Vendor No.", "Pay-to Vendor No.", "No. Printed";
//             RequestFilterHeading = 'Purchase Order';
//             column(Purchase_Header_Document_Type; "Document Type")
//             {
//             }
//             column(Purchase_Header_AmtExcInvDisc; AmountExclInvDisc)
//             {
//             }
//             column(Purchase_Header_No; "No.")
//             {
//             }
//             column(OrderBarcode; OrderBarcode)
//             {
//             }
//             dataitem(CopyLoop; Integer)
//             {
//                 DataItemTableView = SORTING(Number);
//                 dataitem(PageLoop; Integer)
//                 {
//                     DataItemTableView = SORTING(Number)
//                                         WHERE(Number = CONST(1));
//                     column(PageRec; 'True')
//                     {
//                     }
//                     column(CompanyPicture; CompanyInformation.Picture)
//                     {
//                     }
//                     column(CompanyAddress_1; CompanyAddress[1])
//                     {
//                     }
//                     column(CompanyAddress_2; CompanyAddress[2])
//                     {
//                     }
//                     column(CompanyAddress_3; CompanyAddress[3])
//                     {
//                     }
//                     column(CompanyAddress_4; CompanyAddress[4])
//                     {
//                     }
//                     column(CompanyAddress_5; CompanyAddress[5])
//                     {
//                     }
//                     column(CompanyAddress_6; CompanyAddress[6])
//                     {
//                     }
//                     column(CopyTxt; CopyTxt)
//                     {
//                     }
//                     column(BuyFromAddress_1; BuyFromAddress[1])
//                     {
//                     }
//                     column(BuyFromAddress_2; BuyFromAddress[2])
//                     {
//                     }
//                     column(BuyFromAddress_3; BuyFromAddress[3])
//                     {
//                     }
//                     column(BuyFromAddress_4; BuyFromAddress[4])
//                     {
//                     }
//                     column(BuyFromAddress_5; BuyFromAddress[5])
//                     {
//                     }
//                     column(BuyFromAddress_6; BuyFromAddress[6])
//                     {
//                     }
//                     column(BuyFromAddress_7; BuyFromAddress[7])
//                     {
//                     }
//                     column(Purchase_Header_Expected_Receipt_Date; "Purchase Header"."Expected Receipt Date")
//                     {
//                     }
//                     column(ShipToAddress_1; ShipToAddress[1])
//                     {
//                     }
//                     column(ShipToAddress_2; ShipToAddress[2])
//                     {
//                     }
//                     column(ShipToAddress_3; ShipToAddress[3])
//                     {
//                     }
//                     column(ShipToAddress_4; ShipToAddress[4])
//                     {
//                     }
//                     column(ShipToAddress_5; ShipToAddress[5])
//                     {
//                     }
//                     column(ShipToAddress_6; ShipToAddress[6])
//                     {
//                     }
//                     column(ShipToAddress_7; ShipToAddress[7])
//                     {
//                     }
//                     column(Purchase_Header_Buy_from_Vendor_No; "Purchase Header"."Buy-from Vendor No.")
//                     {
//                     }
//                     column(Purchase_Header_Your_Reference; "Purchase Header"."Your Reference")
//                     {
//                     }
//                     column(SalesPurchPerson_Name; SalesPurchPerson.Name)
//                     {
//                     }
//                     column(SalesPurchPerson_Phone; SalesPurchPerson."Phone No.")
//                     {
//                     }
//                     column(SalesPurchPerson_EMail; SalesPurchPerson."E-Mail")
//                     {
//                     }
//                     column(Purchase_Header_No_1; "Purchase Header"."No.")
//                     {
//                     }
//                     column(Purchase_Header_Order_Date; "Purchase Header"."Order Date")
//                     {
//                     }
//                     column(CurrReport_PAGENO; CurrReport.PAGENO)
//                     {
//                     }
//                     column(CompanyAddress_7; CompanyAddress[7])
//                     {
//                     }
//                     column(CompanyAddress_8; CompanyAddress[8])
//                     {
//                     }
//                     column(BuyFromAddress_8; BuyFromAddress[8])
//                     {
//                     }
//                     column(ShipToAddress_8; ShipToAddress[8])
//                     {
//                     }
//                     column(ShipmentMethodName; ShipmentMethod.Description)
//                     {
//                     }
//                     column(PaymentTerms_Description; PaymentTerms.Description)
//                     {
//                     }
//                     column(CompanyInformation_Phone_No; CompanyInformation."Phone No.")
//                     {
//                     }
//                     column(VS_ColumnNo; ColumnNo)
//                     {
//                     }
//                     column(PrintFooter; PrintFooter)
//                     {
//                     }
//                     column(OutputNo; OutputNo)
//                     {
//                     }
//                     column(CopyNo; CopyNo)
//                     {
//                     }
//                     column(PrintAssingments; "Purchase Header"."CERP Print Assignments")
//                     {
//                     }
//                     column(PageLoop_Number; Number)
//                     {
//                     }
//                     dataitem(HeaderComment; "Purch. Comment Line")
//                     {
//                         DataItemLink = "Document Type" = FIELD("Document Type"),
//                                        "No." = FIELD("No.");
//                         DataItemLinkReference = "Purchase Header";
//                         DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.")
//                                             WHERE("CERP Print on PO" = CONST(true),
//                                                   "Document Line No." = CONST(0));
//                         column(HeaderComment_Comment; Comment)
//                         {
//                         }
//                         column(CommentChar; 'C')
//                         {
//                         }
//                         column(HeaderComment_Document_Type; "Document Type")
//                         {
//                         }
//                         column(HeaderComment_No; "No.")
//                         {
//                         }
//                         column(HeaderComment_Document_Line_No; "Document Line No.")
//                         {
//                         }
//                         column(HeaderComment_Line_No; "Line No.")
//                         {
//                         }
//                     }
//                     dataitem("Purchase Line"; "Purchase Line")
//                     {
//                         CalcFields = "CERP Assignments";
//                         DataItemLink = "Document No." = FIELD("No.");
//                         DataItemLinkReference = "Purchase Header";
//                         DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
//                         column(PurchLineTrue; 'True')
//                         {
//                         }
//                         column(ItemNumberToPrint; ItemNumberToPrint)
//                         {
//                         }
//                         column(Purchase_Line__Unit_of_Measure; "Unit of Measure")
//                         {
//                         }
//                         column(Purchase_Line_Quantity; Quantity)
//                         {
//                         }
//                         column(UnitPriceToPrint; UnitPriceToPrint)
//                         {
//                             DecimalPlaces = 2 : 5;
//                         }
//                         column(AmountExclInvDisc; AmountExclInvDisc)
//                         {
//                         }
//                         column(Submittal_Description__DescToPrint; "CERP Submittal Description" + ' ' + CERPDescToPrint)
//                         {
//                         }
//                         column(VendorQuoteNo; VendorQuoteNo)
//                         {
//                         }
//                         column(AssignPrintDetail; AssignPrintDetail)
//                         {
//                         }
//                         column(AssignAndQtyPrint; AssignAndQtyPrint)
//                         {
//                         }
//                         column(AssignAndKeyingPrint; AssignAndKeyingPrint)
//                         {
//                         }
//                         column(Purchase_Line_Line_No; "Line No.")
//                         {
//                         }
//                         column(STRSUBSTNO_Text002_CurrReport_PAGENO___1_; STRSUBSTNO(Text002, CurrReport.PAGENO + 1))
//                         {
//                         }
//                         column(AmountExclInvDisc_Control40; AmountExclInvDisc)
//                         {
//                         }
//                         column(AmountExclInvDisc_Control79; AmountExclInvDisc)
//                         {
//                         }
//                         column(Purchase_Line__Inv__Discount_Amount; "Inv. Discount Amount")
//                         {
//                         }
//                         column(TaxAmount; TaxAmount)
//                         {
//                         }
//                         column(Line_Amount_TaxAmount_Inv_Discount_Amount; "Line Amount" + TaxAmount - "Inv. Discount Amount")
//                         {
//                         }
//                         column(TotalTaxLabel; TotalTaxLabel)
//                         {
//                         }
//                         column(BreakdownTitle; BreakdownTitle)
//                         {
//                         }
//                         column(BreakdownLabel_1; BreakdownLabel[1])
//                         {
//                         }
//                         column(BreakdownAmt_1; BreakdownAmt[1])
//                         {
//                         }
//                         column(BreakdownLabel_2; BreakdownLabel[2])
//                         {
//                         }
//                         column(BreakdownAmt_2; BreakdownAmt[2])
//                         {
//                         }
//                         column(BreakdownLabel_3; BreakdownLabel[3])
//                         {
//                         }
//                         column(BreakdownAmt_3; BreakdownAmt[3])
//                         {
//                         }
//                         column(BreakdownAmt_4; BreakdownAmt[4])
//                         {
//                         }
//                         column(BreakdownLabel_4; BreakdownLabel[4])
//                         {
//                         }
//                         column(AmountExclInvDisc2; AmountExclInvDisc2)
//                         {
//                         }
//                         column(Total; Total)
//                         {
//                         }
//                         column(Purchase_Line_Document_Type; "Document Type")
//                         {
//                         }
//                         column(Purchase_Line_Document_No; "Document No.")
//                         {
//                         }
//                         column(Purchase_Line_Associated_Document_No; "CERP Assoc Document No.")
//                         {
//                         }
//                         column(Purchase_Line_Associated_Line_No; "CERP Associated Line No.")
//                         {
//                         }
//                         column(Purchase_Line_Associated_Change_Order_No; "Associated Change Order No.")
//                         {
//                         }
//                         column(Purchase_Line_Component_Document_Type; "Component Document Type")
//                         {
//                         }
//                         column(Purchase_Line_Component_Document_No; "Component Document No.")
//                         {
//                         }
//                         column(Purchase_Line_Component_Sales_Line_No; "Component Sales Line No.")
//                         {
//                         }
//                         column(Purchase_Line_Component_Line_No; "Component Line No.")
//                         {
//                         }
//                         column(Purchase_Line_Contract_No; "Contract No.")
//                         {
//                         }
//                         column(Purchase_Line_Change_Order_No; "Change Order No.")
//                         {
//                         }
//                         column(Purchase_Line_Material_Entry_No; "Material Entry No.")
//                         {
//                         }
//                         column(Purchase_Line_Material_Comp__Line_No; "Material Comp. Line No.")
//                         {
//                         }
//                         column(Purchase_Line_CostingUOMCode_PurchaseLine; "Costing UOM Code")
//                         {
//                         }
//                         column(Purchase_Line_CostingUOMUnitCost_PurchaseLine; "Costing UOM Unit Cost")
//                         {
//                         }
//                         column(Purchase_Line_QtyUOM; QtyUOM)
//                         {
//                         }
//                         dataitem(DataItem8417; "Purch. Comment Line")
//                         {
//                             DataItemLink = "Document Type" = FIELD("Document Type"),
//                                            "No." = FIELD("Document No."),
//                                            "Document Line No." = FIELD("Line No.");
//                             DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.")
//                                                 WHERE("CERP Print on PO" = CONST(true));
//                             column(Purch__Comment_Line_Comment; Comment)
//                             {
//                             }
//                             column(Purch__Comment_Line_Document_Type; "Document Type")
//                             {
//                             }
//                             column(Purch__Comment_Line_No; "No.")
//                             {
//                             }
//                             column(Purch__Comment_Line_Document_Line_No; "Document Line No.")
//                             {
//                             }
//                             column(Purch__Comment_Line_Line_No; "Line No.")
//                             {
//                             }
//                         }
//                         dataitem("Serial No. Transaction"; "CERP Serial No. Transaction")
//                         {
//                             DataItemLink = "Document Type" = FIELD("Document Type"),
//                                            "Document No." = FIELD("Document No."),
//                                            "Document Line No." = FIELD("Line No.");
//                             DataItemTableView = SORTING("Table ID", "Document Type", "Template Name", "Document No.", "Document Line No.", "Component Line No.", "Line No.")
//                                                 WHERE("Table ID" = CONST(39),
//                                                       "Template Name" = FILTER(''),
//                                                       "Component Line No." = CONST(0));
//                             column(SerialNoRec; 'True')
//                             {
//                             }
//                             column(Addr_4__1; Addr[4] [1])
//                             {
//                             }
//                             column(Addr_3__1; Addr[3] [1])
//                             {
//                             }
//                             column(L; Addr[2] [1])
//                             {
//                             }
//                             column(Addr_1__1; Addr[1] [1])
//                             {
//                             }
//                             column(Serial_No__Transaction_Table_ID; "Table ID")
//                             {
//                             }
//                             column(Serial_No__Transaction_Document_Type; "Document Type")
//                             {
//                             }
//                             column(Serial_No__Transaction_Template_Name; "Template Name")
//                             {
//                             }
//                             column(Serial_No__Transaction_Document_No; "Document No.")
//                             {
//                             }
//                             column(Serial_No__Transaction_Document_Line_No; "Document Line No.")
//                             {
//                             }
//                             column(Serial_No__Transaction_Component_Line_No; "Component Line No.")
//                             {
//                             }
//                             column(Serial_No__Transaction_Line_No; "Line No.")
//                             {
//                             }
//                             column(Serial_No_NoOfRecords; NoOfRecords)
//                             {
//                             }
//                             column(Serial_Nos_Caption; Serial_Nos_CaptionLbl)
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
//                             end;

//                             trigger OnPreDataItem()
//                             begin
//                                 NoOfRecords := COUNT;
//                                 NoOfColumns := 4;
//                                 RecordNo := 0;
//                             end;
//                         }
//                         dataitem(Component; "CERP Component")
//                         {
//                             DataItemLink = "Document No." = FIELD("CERP Assoc Document No."),
//                                            "Line No." = FIELD("CERP Associated Line No.");
//                             DataItemTableView = SORTING("Document Type", "Document No.", "Line No.", Type)
//                                                 WHERE("Document Type" = CONST(Order),
//                                                       Blocked = CONST(false),
//                                                       "Parent Component Line No." = CONST(0),
//                                                       "No." = FILTER('<>BLANK VALUE'));
//                             column(Component__No; "No.")
//                             {
//                             }
//                             column(Component_Description; Description)
//                             {
//                             }
//                             column(Component__Unit_Cost; "Unit Cost (LCY)")
//                             {
//                             }
//                             column(Component__Unit_of_Measure_Code; "Unit of Measure Code")
//                             {
//                             }
//                             column(Component__Total_Cost; "Total Cost")
//                             {
//                             }
//                             column(Component__Attribute_Code; "Attribute Code")
//                             {
//                             }
//                             column(Component__Qty__Per; "Qty. Per")
//                             {
//                             }
//                             column(Component_Document_Type; "Document Type")
//                             {
//                             }
//                             column(Component_Document_No; "Document No.")
//                             {
//                             }
//                             column(Component_Line_No; "Line No.")
//                             {
//                             }
//                             column(Component_Component_Line_No; "Component Line No.")
//                             {
//                             }

//                             trigger OnAfterGetRecord()
//                             begin
//                                 IF NOT PrintAttributes
//                                   THEN
//                                     CurrReport.SKIP;

//                                 IF (NOT "Mfg. Supplied") AND NOT ("Main Component" AND ConfigSetup."Print Main Component on PO") AND (Type <> Type::Attribute)
//                                   THEN
//                                     CurrReport.SKIP;

//                                 IF (Type = Type::Attribute) AND
//                                    (NOT cERP.PrintAttribute("Attribute Code", "Purchase Line"."Item Category Code",
//                                         "Purchase Line"."Product Group Code", PrintOn::PurchaseOrder)) THEN
//                                     CurrReport.SKIP;
//                             end;

//                             trigger OnPreDataItem()
//                             var
//                                 MainComp: Record "CERP Component";
//                                 tempShopOrderParent: Record "CERP Component Parent (Temp)" temporary;
//                             begin
//                                 IF NOT ("Purchase Line"."Associated Document Type" IN ["Purchase Line"."Associated Document Type"::"Sales Order",
//                                                                                        "Purchase Line"."Associated Document Type"::"Shop Order"])
//                                   THEN
//                                     CurrReport.SKIP;

//                                 IF "Purchase Line"."Associated Document Type" = "Purchase Line"."Associated Document Type"::"Shop Order"
//                                   THEN
//                                     SETRANGE("Document Type", "Document Type"::Shop)
//                                 ELSE
//                                     SETRANGE("Document Type", "Document Type"::Order);

//                                 IF "Purchase Line"."Associated Comp. Line No." = 0
//                                   THEN
//                                     PrintAttributes := TRUE        //Purchasing Parent Line.
//                                 ELSE
//                                     IF MainComp.GET("Purchase Line"."Component Document Type", "Purchase Line"."Component Document No.",
//                                                     "Purchase Line"."Component Sales Line No.", "Purchase Line"."Component Line No.") AND
//                                        MainComp."Main Component"
//                                       THEN
//                                         PrintAttributes := TRUE //Purchasing Main Component.
//                                     ELSE
//                                         PrintAttributes := FALSE;

//                                 ConfigSetup.INIT;
//                                 IF PrintAttributes
//                                   THEN BEGIN
//                                     tempShopOrderParent.CreateCompParent(MainComp."Document Type", MainComp."Document No.", MainComp."Line No.", MainComp."Parent Component Line No.");
//                                     IF (tempShopOrderParent."Configurator Setup No." <> '')
//                                       THEN
//                                         IF ConfigSetup.GET(tempShopOrderParent."Configurator Setup No.") THEN;
//                                 END;
//                             end;
//                         }
//                         dataitem("Material Component"; "CERP Material Component")
//                         {
//                             DataItemLink = "Contract No." = FIELD("CERP Assoc Document No."),
//                                            "Change Order No." = FIELD("CERP Assoc Change Order No."),
//                                            "Material Entry No." = FIELD("CERP Associated Line No.");
//                             DataItemTableView = SORTING("Contract No.", "Change Order No.", "Material Entry No.", Type)
//                                                 WHERE(Blocked = CONST(false),
//                                                       "Parent Component Line No." = CONST(0),
//                                                       "No." = FILTER('<>BLANK VALUE'));
//                             column(Material_Component__No; "No.")
//                             {
//                             }
//                             column(Material_Component_Description; Description)
//                             {
//                             }
//                             column(Material_Component__Unit_of_Measure_Code; "Unit of Measure Code")
//                             {
//                             }
//                             column(Material_Component__Qty__Per; "Qty. Per")
//                             {
//                             }
//                             column(Material_Component__Unit_Cost; "Unit Cost (LCY)")
//                             {
//                             }
//                             column(Material_Component__Total_Cost; "Total Cost (LCY)")
//                             {
//                             }
//                             column(Material_Component__Attribute_Code; "Attribute Code")
//                             {
//                             }
//                             column(Material_Component_Contract_No; "Contract No.")
//                             {
//                             }
//                             column(Material_Component_Change_Order_No; "Change Order No.")
//                             {
//                             }
//                             column(Material_Component_Material_Entry_No; "Material Entry No.")
//                             {
//                             }
//                             column(Material_Component_Line_No; "Component Line No.")
//                             {
//                             }

//                             trigger OnAfterGetRecord()
//                             begin
//                                 IF NOT PrintAttributes
//                                   THEN
//                                     CurrReport.SKIP;

//                                 IF (NOT "Mfg. Supplied") AND NOT ("Main Component" AND ConfigSetup."Print Main Component on PO") AND (Type <> Type::Attribute)
//                                   THEN
//                                     CurrReport.SKIP;

//                                 IF (Type = Type::Attribute) AND
//                                    (NOT cERP.PrintAttribute("Attribute Code", "Purchase Line"."Item Category Code",
//                                                    "Purchase Line"."Product Group Code", PrintOn::PurchaseOrder)) THEN
//                                     CurrReport.SKIP;
//                             end;

//                             trigger OnPreDataItem()
//                             var
//                                 MainComp: Record "CERP Material Component";
//                                 MatList: Record "CERP Material List";
//                             begin
//                                 IF "Purchase Line"."Associated Document Type" <> "Purchase Line"."Associated Document Type"::Contract
//                                   THEN
//                                     CurrReport.SKIP;

//                                 IF "Purchase Line"."Associated Comp. Line No." = 0
//                                   THEN
//                                     PrintAttributes := TRUE        //Purchasing Parent Line.
//                                 ELSE
//                                     IF MainComp.GET("Purchase Line"."Associated Document No.", "Purchase Line"."Associated Change Order No.",
//                                                     "Purchase Line"."Associated Line No.", "Purchase Line"."Associated Comp. Line No.") AND
//                                        MainComp."Main Component"
//                                       THEN
//                                         PrintAttributes := TRUE //Purchasing Main Component.
//                                     ELSE
//                                         PrintAttributes := FALSE;

//                                 ConfigSetup.INIT;
//                                 IF PrintAttributes
//                                   THEN
//                                     IF MatList.GET("Purchase Line"."Associated Document No.", "Purchase Line"."Associated Change Order No.",
//                                                    "Purchase Line"."Associated Line No.")
//                                       THEN
//                                         IF (MatList."Configurator Setup No." <> '')
//                                           THEN
//                                             IF ConfigSetup.GET(MatList."Configurator Setup No.") THEN;
//                             end;
//                         }
//                         dataitem("Component Attribute"; "CERP Component")
//                         {
//                             DataItemLink = "Document Type" = FIELD("CERP Component Document Type"),
//                                            "Document No." = FIELD("CERP Component Document No."),
//                                            "Line No." = FIELD("CERP Component Sales Line No."),
//                                            "Parent Component Line No." = FIELD("CERP Component Line No.");
//                             DataItemTableView = SORTING("Document Type", "Document No.", "Line No.", "Parent Component Line No.", "Component Line No.", Blocked)
//                                                 WHERE("Document Type" = CONST(Order),
//                                                       Blocked = CONST(false),
//                                                       "Attribute Value" = FILTER('<>''' & '<>BLANK VALUE'));
//                             column(Component_Attribute__Attribute_Code; "Attribute Code")
//                             {
//                             }
//                             column(Component_Attribute__Attribute_Value; "Attribute Value")
//                             {
//                             }
//                             column(Component_Attribute_Document_Type; "Document Type")
//                             {
//                             }
//                             column(Component_Attribute_Document_No; "Document No.")
//                             {
//                             }
//                             column(Component_Attribute_Line_No; "Line No.")
//                             {
//                             }
//                             column(Component_Attribute_Component_Line_No; "Component Line No.")
//                             {
//                             }

//                             trigger OnAfterGetRecord()
//                             begin
//                                 IF NOT PrintAttributes
//                                   THEN
//                                     CurrReport.SKIP;

//                                 IF (NOT cERP.PrintAttribute("Attribute Code", "Purchase Line"."Item Category Code",
//                                         "Purchase Line"."Product Group Code", PrintOn::PurchaseOrder)) THEN
//                                     CurrReport.SKIP;
//                             end;

//                             trigger OnPreDataItem()
//                             var
//                                 MainComp: Record "CERP Component";
//                             begin
//                                 PrintAttributes := TRUE;
//                                 IF (NOT ("Purchase Line"."Associated Document Type" IN ["Purchase Line"."Associated Document Type"::"Sales Order",
//                                                                                        "Purchase Line"."Associated Document Type"::"Shop Order"])) OR
//                                    ("Purchase Line"."Associated Comp. Line No." = 0)
//                                   THEN
//                                     PrintAttributes := FALSE
//                                 ELSE
//                                     IF MainComp.GET("Purchase Line"."Component Document Type", "Purchase Line"."Component Document No.",
//                                                        "Purchase Line"."Component Sales Line No.", "Purchase Line"."Component Line No.") AND
//                                           MainComp."Main Component"
//                                          THEN
//                                         PrintAttributes := FALSE; //Purchasing Main Component.
//                             end;
//                         }
//                         dataitem("Material Component Attribute"; "CERP Material Component")
//                         {
//                             DataItemLink = "Contract No." = FIELD("CERP Contract No."),
//                                            "Change Order No." = FIELD("CERP Change Order No."),
//                                            "Material Entry No." = FIELD("CERP Material Entry No."),
//                                            "Parent Component Line No." = FIELD("CERP Mtrl Comp Line No.");
//                             DataItemTableView = SORTING("Contract No.", "Change Order No.", "Material Entry No.", "Parent Component Line No.", Blocked, "Configurator Setup Line No.")
//                                                 WHERE(Blocked = CONST(false),
//                                                       "Attribute Value" = FILTER('<>''' & '<>BLANK VALUE'));
//                             column(Material_Component_Attribute__Attribute_Value; "Attribute Value")
//                             {
//                             }
//                             column(Material_Component_Attribute__Attribute_Code; "Attribute Code")
//                             {
//                             }
//                             column(Material_Component_Attribute_Contract_No; "Contract No.")
//                             {
//                             }
//                             column(Material_Component_Attribute_Change_Order_No; "Change Order No.")
//                             {
//                             }
//                             column(Material_Component_Attribute_Material_Entry_No; "Material Entry No.")
//                             {
//                             }
//                             column(Material_Component_Attribute_Line_No; "Component Line No.")
//                             {
//                             }

//                             trigger OnAfterGetRecord()
//                             begin
//                                 IF NOT PrintAttributes
//                                   THEN
//                                     CurrReport.SKIP;

//                                 IF (NOT cERP.PrintAttribute("Attribute Code", "Purchase Line"."Item Category Code",
//                                         "Purchase Line"."Product Group Code", PrintOn::PurchaseOrder)) THEN
//                                     CurrReport.SKIP;
//                             end;

//                             trigger OnPreDataItem()
//                             var
//                                 MainComp: Record "CERP Material Component";
//                             begin
//                                 PrintAttributes := TRUE;
//                                 IF ("Purchase Line"."Associated Document Type" <> "Purchase Line"."Associated Document Type"::Contract) OR
//                                    ("Purchase Line"."Associated Comp. Line No." = 0)
//                                   THEN
//                                     PrintAttributes := FALSE
//                                 ELSE
//                                     IF MainComp.GET("Purchase Line"."Associated Document No.", "Purchase Line"."Associated Change Order No.",
//                                                        "Purchase Line"."Associated Line No.", "Purchase Line"."Associated Comp. Line No.") AND
//                                           MainComp."Main Component"
//                                          THEN
//                                         PrintAttributes := FALSE; //Purchasing Main Component.
//                             end;
//                         }
//                         dataitem(Assignments; Integer)
//                         {
//                             DataItemTableView = SORTING(Number);
//                             column(AssignArray_Number; AssignArray[Number])
//                             {
//                             }
//                             column(Assignments_Number; Number)
//                             {
//                             }

//                             trigger OnAfterGetRecord()
//                             begin
//                                 IF AssignArray[Number] = ''
//                                   THEN
//                                     SETRANGE(Number, 1, Number);
//                             end;

//                             trigger OnPreDataItem()
//                             begin
//                                 CLEAR(AssignArray);
//                                 SETRANGE(Number, 1, ARRAYLEN(AssignArray, 1));

//                                 IF AssignPrintDetail OR AssignAndQtyPrint OR AssignAndKeyingPrint
//                                   THEN
//                                     CurrReport.SKIP;

//                                 IF "Purchase Line".Assignments
//                                   THEN
//                                     "Purchase Line".AssignmentArrayByReport(REPORT::"CD Purchase Order", 120, AssignArray);
//                             end;
//                         }
//                         dataitem("Assignment Transactions"; "CERP Assignment Transactions")
//                         {
//                             DataItemLink = "Document Type" = FIELD("Document Type"),
//                                            "Document No." = FIELD("Document No."),
//                                            "Document Line No." = FIELD("Line No.");
//                             DataItemTableView = SORTING("Table ID", "Document Type", "Template Name", "Document No.", "Document Line No.", "Assignment Level 1", "Assignment Level 2", "Assignment Level 3")
//                                                 WHERE("Table ID" = CONST(39));
//                             column(aAssignTrans_1__Description; aAssignTrans[1].Description)
//                             {
//                             }
//                             column(aAssignTrans_1__Quantity; aAssignTrans[1].Quantity)
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aAssign3_1__Keying; aAssign3[1].Keying)
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aHeight_1; aHeight[1])
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aWidth_1; aWidth[1])
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aThickness_1; aThickness[1])
//                             {
//                             }
//                             column(aAssign3_1___Heading; aAssign3[1]."Heading Code")
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aAssign3_2__Keying; aAssign3[2].Keying)
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aAssign3_2___Heading; aAssign3[2]."Heading Code")
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aAssignTrans_2__Quantity; aAssignTrans[2].Quantity)
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aAssignTrans_2__Description; aAssignTrans[2].Description)
//                             {
//                             }
//                             column(aAssign3_1__Keying_Control1102621023; aAssign3[1].Keying)
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aAssign3_1___Heading____Control1102621024; aAssign3[1]."Heading Code")
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aAssignTrans_1__Quantity_Control1102621025; aAssignTrans[1].Quantity)
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aAssignTrans_1__Description_Control1102621027; aAssignTrans[1].Description)
//                             {
//                             }
//                             column(aAssignTrans_6__Quantity; aAssignTrans[6].Quantity)
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aAssignTrans_6__Description; aAssignTrans[6].Description)
//                             {
//                             }
//                             column(aAssignTrans_5__Quantity; aAssignTrans[5].Quantity)
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aAssignTrans_5__Description; aAssignTrans[5].Description)
//                             {
//                             }
//                             column(aAssignTrans_4__Quantity; aAssignTrans[4].Quantity)
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aAssignTrans_4__Description; aAssignTrans[4].Description)
//                             {
//                             }
//                             column(aAssignTrans_3__Quantity; aAssignTrans[3].Quantity)
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aAssignTrans_3__Description; aAssignTrans[3].Description)
//                             {
//                             }
//                             column(aAssignTrans_2__Quantity_Control1102621055; aAssignTrans[2].Quantity)
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aAssignTrans_2__Description_Control1102621056; aAssignTrans[2].Description)
//                             {
//                             }
//                             column(aAssignTrans_1__Quantity_Control1102621057; aAssignTrans[1].Quantity)
//                             {
//                                 DecimalPlaces = 0 : 5;
//                             }
//                             column(aAssignTrans_1__Description_Control1102621058; aAssignTrans[1].Description)
//                             {
//                             }
//                             column(aAssignTrans_1__DescriptionCaption; CAPTIONCLASSTRANSLATE('AL3'))
//                             {
//                             }
//                             column(Control1102621035Caption; CAPTIONCLASSTRANSLATE('AL3'))
//                             {
//                             }
//                             column(Control1102621042Caption; CAPTIONCLASSTRANSLATE('AL3'))
//                             {
//                             }
//                             column(Control1102621061Caption; CAPTIONCLASSTRANSLATE('AL3'))
//                             {
//                             }
//                             column(Control1102621063Caption; CAPTIONCLASSTRANSLATE('AL3'))
//                             {
//                             }
//                             column(Control1102621066Caption; CAPTIONCLASSTRANSLATE('AL3'))
//                             {
//                             }
//                             column(Control1102621068Caption; CAPTIONCLASSTRANSLATE('AL3'))
//                             {
//                             }
//                             column(Control1102621071Caption; CAPTIONCLASSTRANSLATE('AL3'))
//                             {
//                             }
//                             column(Control1102621073Caption; CAPTIONCLASSTRANSLATE('AL3'))
//                             {
//                             }
//                             column(Assignment_Transactions_Table_ID; "Table ID")
//                             {
//                             }
//                             column(Assignment_Transactions_Document_Type; "Document Type")
//                             {
//                             }
//                             column(Assignment_Transactions_Template_Name; "Template Name")
//                             {
//                             }
//                             column(Assignment_Transactions_Document_No; "Document No.")
//                             {
//                             }
//                             column(Assignment_Transactions_Document_Line_No; "Document Line No.")
//                             {
//                             }
//                             column(Assignment_Transactions_Assignment_Level_1; "Assignment Level 1")
//                             {
//                             }
//                             column(Assignment_Transactions_Assignment_Level_2; "Assignment Level 2")
//                             {
//                             }
//                             column(Assignment_Transactions_Assignment_Level_3; "Assignment Level 3")
//                             {
//                             }

//                             trigger OnAfterGetRecord()
//                             var
//                                 i: Integer;
//                                 Assignment: Record "CERP Assignment";
//                             begin
//                                 IF NOT "Purchase Header"."Print Assignments"
//                                   THEN
//                                     CurrReport.SKIP;

//                                 IF NOT (AssignPrintDetail OR AssignAndQtyPrint OR AssignAndKeyingPrint)
//                                   THEN
//                                     CurrReport.SKIP;

//                                 RecordNo := RecordNo + 1;
//                                 ColumnNo := ColumnNo + 1;

//                                 aAssignTrans[ColumnNo] := "Assignment Transactions";
//                                 aAssign3[ColumnNo].GET("Contract No.", "Assignment Level 1", "Assignment Level 2", "Assignment Level 3");

//                                 IF ProductGroup."Print Door Width Height on PO"
//                                   THEN BEGIN
//                                     Assignment.GET("Contract No.", "Change Order No.", "Material Entry No.",
//                                                    "Assignment Level 1", "Assignment Level 2", "Assignment Level 3");
//                                     //AI9.00 JPU 12282015 BEGIN - Added Door Thickness
//                                     //Assignment.GetDoorWidthAndHeight(aWidth[ColumnNo],aHeight[ColumnNo]);
//                                     Assignment.GetDoorWidthAndHeight(aWidth[ColumnNo], aHeight[ColumnNo], aThickness[ColumnNo]);
//                                     //AI9.00 JPU 12282015 END
//                                 END
//                                 ELSE BEGIN
//                                     aWidth[ColumnNo] := aAssign3[ColumnNo].Width;
//                                     aHeight[ColumnNo] := aAssign3[ColumnNo].Height;
//                                     aThickness[ColumnNo] := aAssign3[ColumnNo]."Door Thickness";//AI9.00 JPU 12282015
//                                 END;

//                                 IF RecordNo = AssignmentCount
//                                   THEN BEGIN
//                                     FOR i := ColumnNo + 1 TO NoOfColumns DO BEGIN
//                                         CLEAR(aAssignTrans[i]);
//                                         CLEAR(aAssign3[i]);
//                                         CLEAR(aWidth[i]);
//                                         CLEAR(aHeight[i]);
//                                         CLEAR(aThickness[i]); //AI9.00 JPU 12282015
//                                     END;
//                                     ColumnNo := 0;
//                                 END
//                                 ELSE BEGIN
//                                     IF ColumnNo = NoOfColumns THEN
//                                         ColumnNo := 0;
//                                 END;
//                             end;

//                             trigger OnPreDataItem()
//                             begin
//                                 AssignmentCount := COUNT;
//                                 RecordNo := 0;

//                                 IF AssignAndQtyPrint
//                                   THEN
//                                     NoOfColumns := 6
//                                 ELSE
//                                     IF AssignAndKeyingPrint
//                                       //AI9.00 JPU 12282015 BEGIN - Now includes Door Thickness (will show Height, Width, Door Thickness)
//                                       //THEN NoOfColumns := 2
//                                       THEN
//                                         NoOfColumns := 3
//                                     //AI9.00 JPU 12282015 END
//                                     ELSE
//                                         NoOfColumns := 1;
//                             end;
//                         }

//                         trigger OnAfterGetRecord()
//                         var
//                             AssignPrintOptions: Record "CERP Assignment Print Options";
//                             ItemUOM: Record "Item Unit of Measure";
//                             Ratio: Decimal;
//                             cERPUOMMgmt: Codeunit "CERP UOM Management";
//                             Item: Record Item;
//                         begin
//                             OnLineNumber := OnLineNumber + 1;

//                             IF "Purchase Header"."Tax Area Code" <> '' THEN
//                                 SalesTaxCalc.AddPurchLine("Purchase Line");

//                             IF "Vendor Item No." <> '' THEN
//                                 ItemNumberToPrint := "Vendor Item No."
//                             ELSE
//                                 ItemNumberToPrint := "No.";

//                             IF Type = 0 THEN BEGIN
//                                 ItemNumberToPrint := '';
//                                 "Unit of Measure" := '';
//                                 "Line Amount" := 0;
//                                 "Inv. Discount Amount" := 0;
//                                 Quantity := 0;
//                             END;

//                             AmountExclInvDisc := "Line Amount";

//                             // >> CEL
//                             IF ISSERVICETIER THEN BEGIN
//                                 Total := Total2 + ("Line Amount" + TaxAmount - "Inv. Discount Amount");
//                                 Total2 := Total;
//                                 AmountExclInvDisc2 := AmountExclInvDisc3 + AmountExclInvDisc;
//                                 AmountExclInvDisc3 := AmountExclInvDisc2;
//                             END;
//                             // << CEL

//                             IF Quantity = 0 THEN
//                                 UnitPriceToPrint := 0  // so it won't print
//                             ELSE
//                                 UnitPriceToPrint := ROUND(AmountExclInvDisc / Quantity, 0.00001);

//                             IF ISSERVICETIER THEN BEGIN

//                                 IF OnLineNumber = NumberOfLines THEN BEGIN
//                                     PrintFooter := TRUE;

//                                     IF "Purchase Header"."Tax Area Code" <> '' THEN BEGIN
//                                         IF UseExternalTaxEngine THEN
//                                             SalesTaxCalc.CallExternalTaxEngineForPurch("Purchase Header", TRUE)
//                                         ELSE
//                                             SalesTaxCalc.EndSalesTaxCalculation(UseDate);
//                                         SalesTaxCalc.GetSummarizedSalesTaxTable(TempSalesTaxAmtLine);
//                                         BrkIdx := 0;
//                                         PrevPrintOrder := 0;
//                                         PrevTaxPercent := 0;
//                                         TaxAmount := 0;
//                                         WITH TempSalesTaxAmtLine DO BEGIN
//                                             RESET;
//                                             SETCURRENTKEY("Print Order", "Tax Area Code for Key", "Tax Jurisdiction Code");
//                                             IF FIND('-') THEN
//                                                 REPEAT
//                                                     IF ("Print Order" = 0) OR
//                                                        ("Print Order" <> PrevPrintOrder) OR
//                                                        ("Tax %" <> PrevTaxPercent)
//                                                     THEN BEGIN
//                                                         BrkIdx := BrkIdx + 1;
//                                                         IF BrkIdx > 1 THEN BEGIN
//                                                             IF TaxArea."Country/Region" = TaxArea."Country/Region"::CA THEN
//                                                                 BreakdownTitle := Text006
//                                                             ELSE
//                                                                 BreakdownTitle := Text003;
//                                                         END;
//                                                         IF BrkIdx > ARRAYLEN(BreakdownAmt) THEN BEGIN
//                                                             BrkIdx := BrkIdx - 1;
//                                                             BreakdownLabel[BrkIdx] := Text004;
//                                                         END ELSE
//                                                             BreakdownLabel[BrkIdx] := STRSUBSTNO("Print Description", "Tax %");
//                                                     END;
//                                                     BreakdownAmt[BrkIdx] := BreakdownAmt[BrkIdx] + "Tax Amount";
//                                                     TaxAmount := TaxAmount + "Tax Amount";
//                                                 UNTIL NEXT = 0;
//                                         END;
//                                         IF BrkIdx = 1 THEN BEGIN
//                                             CLEAR(BreakdownLabel);
//                                             CLEAR(BreakdownAmt);
//                                         END;
//                                     END;

//                                 END;
//                                 //AI7.01 Begin
//                                 IF ("Costing UOM Code" <> '') AND (Type = Type::Item) THEN BEGIN
//                                     ItemUOM.GET("No.", "Costing UOM Code");
//                                     ItemUOM.TESTFIELD("Qty. per Unit of Measure");

//                                     //AI9.00 JPU 10232015 BEGIN - Calculate for Variable Dimension
//                                     //QtyUOM := Quantity / ItemUOM."Qty. per Unit of Measure";
//                                     IF Item.IsItemVariableDimensionUOM("No.") THEN BEGIN
//                                         IF ("Dimensional Ratio" <> 0) AND Item.GET("No.") THEN BEGIN
//                                             Ratio := 1;
//                                             IF "Dimensional UOM Code" <> Item."Costing UOM Code" THEN
//                                                 Ratio := cERPUOMMgmt.GetRatio("Dimensional UOM Code", Item."Costing UOM Code");
//                                             //AI9.01 JPU 06212017 BEGIN - Rounded Dimensional Ratio is the value that's used in pricing calculation
//                                             //QtyUOM := Quantity * "Dimensional Ratio" / Ratio;
//                                             QtyUOM := Quantity * "Rounded Dimensional Ratio" / Ratio;
//                                             //AI9.01 JPU 06212017 END
//                                         END ELSE
//                                             QtyUOM := 0;
//                                     END ELSE
//                                         IF Item.GET("No.") AND (Item."Base Unit of Measure" = "Unit of Measure Code") THEN
//                                             QtyUOM := Quantity / ItemUOM."Qty. per Unit of Measure"
//                                         ELSE BEGIN //Convert the Unit of Measure to the Base Unit of Measure, then from the Base Unit of Measure to the Pricing Unit of Measure
//                                             ItemUOM.GET("No.", "Unit of Measure Code");
//                                             ItemUOM.TESTFIELD("Qty. per Unit of Measure");
//                                             QtyUOM := Quantity * ItemUOM."Qty. per Unit of Measure";

//                                             ItemUOM.GET("No.", "Costing UOM Code");
//                                             ItemUOM.TESTFIELD("Qty. per Unit of Measure");
//                                             QtyUOM := QtyUOM / ItemUOM."Qty. per Unit of Measure";
//                                         END;

//                                     //AI9.00 JPU 10232015 END
//                                 END ELSE
//                                     QtyUOM := 0;
//                                 //AI7.01 End
//                             END;

//                             AssignPrintDetail := FALSE;
//                             AssignAndQtyPrint := FALSE;
//                             AssignAndKeyingPrint := FALSE;
//                             IF NOT AssignPrintOptions.GET("Item Category Code", "Product Group Code", REPORT::"CD Purchase Order")
//                               THEN
//                                 AssignPrintDetail := TRUE
//                             ELSE
//                                 CASE AssignPrintOptions.Print OF
//                                     AssignPrintOptions.Print::"Assignment Detail (PO & Shop Only)":
//                                         AssignPrintDetail := TRUE;
//                                     AssignPrintOptions.Print::"Assignments and Keying":
//                                         AssignAndKeyingPrint := TRUE;
//                                     AssignPrintOptions.Print::"Assignments and Qty. (PO Only)":
//                                         AssignAndQtyPrint := TRUE;
//                                 END;

//                             IF ProductGroup.GET("Item Category Code", "Product Group Code") THEN;
//                         end;

//                         trigger OnPreDataItem()
//                         begin
//                             CurrReport.CREATETOTALS(AmountExclInvDisc, "Line Amount", "Inv. Discount Amount");
//                             NumberOfLines := COUNT;
//                             OnLineNumber := 0;
//                             PrintFooter := FALSE;
//                         end;
//                     }
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     // << CEL
//                     Total := 0;
//                     Total2 := 0;
//                     TaxAmount := 0; //AI9.00 JPU 03042016 - Reset the Tax Amount total for each copy
//                     AmountExclInvDisc2 := 0;
//                     AmountExclInvDisc3 := 0;
//                     IF ISSERVICETIER THEN
//                         OutputNo += 1;
//                     // >> CEL

//                     CurrReport.PAGENO := 1;

//                     IF CopyNo = NoLoops THEN BEGIN
//                         IF NOT CurrReport.PREVIEW THEN
//                             PurchasePrinted.RUN("Purchase Header");
//                         CurrReport.BREAK;
//                     END ELSE
//                         CopyNo := CopyNo + 1;
//                     IF CopyNo = 1 THEN // Original
//                         CLEAR(CopyTxt)
//                     ELSE
//                         CopyTxt := Text000;

//                     CLEAR(BreakdownTitle);
//                     CLEAR(BreakdownLabel);
//                     CLEAR(BreakdownAmt);
//                     TotalTaxLabel := Text008;
//                     TaxRegNo := '';
//                     TaxRegLabel := '';
//                     IF "Purchase Header"."Tax Area Code" <> '' THEN BEGIN
//                         TaxArea.GET("Purchase Header"."Tax Area Code");
//                         CASE TaxArea."Country/Region" OF
//                             TaxArea."Country/Region"::US:
//                                 TotalTaxLabel := Text005;
//                             TaxArea."Country/Region"::CA:
//                                 BEGIN
//                                     TotalTaxLabel := Text007;
//                                     TaxRegNo := CompanyInformation."VAT Registration No.";
//                                     TaxRegLabel := CompanyInformation.FIELDCAPTION("VAT Registration No.");
//                                 END;
//                         END;
//                         SalesTaxCalc.StartSalesTaxCalculation;
//                     END;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     NoLoops := 1 + ABS(NoCopies);
//                     IF NoLoops <= 0 THEN
//                         NoLoops := 1;
//                     CopyNo := 0;

//                     // >> CEL
//                     IF ISSERVICETIER THEN
//                         OutputNo := 0;
//                     // << CEL
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             var
//                 BarcodeMgmt: Codeunit "CERP Barcode Management";
//                 rBarcode: Record "CERP Barcode";
//             begin
//                 cERP.SetCompInfoToLocationInfo("Location Code", CompanyInformation);

//                 IF PrintCompany THEN BEGIN
//                     FormatAddress.Company(CompanyAddress, CompanyInformation);
//                     FormatAddress.AddToArray(CompanyAddress, 'Phone: ' + CompanyInformation."Phone No.");
//                     FormatAddress.AddToArray(CompanyAddress, 'Fax: ' + CompanyInformation."Fax No.");

//                     IF RespCenter.GET("Responsibility Center") THEN BEGIN
//                         FormatAddress.RespCenter(CompanyAddress, RespCenter);
//                         CompanyInformation."Phone No." := RespCenter."Phone No.";
//                         CompanyInformation."Fax No." := RespCenter."Fax No.";
//                     END;
//                 END;
//                 CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

//                 IF "Purchaser Code" = '' THEN
//                     CLEAR(SalesPurchPerson)
//                 ELSE
//                     SalesPurchPerson.GET("Purchaser Code");

//                 IF "Payment Terms Code" = '' THEN
//                     CLEAR(PaymentTerms)
//                 ELSE
//                     PaymentTerms.GET("Payment Terms Code");

//                 IF "Shipment Method Code" = '' THEN
//                     CLEAR(ShipmentMethod)
//                 ELSE
//                     ShipmentMethod.GET("Shipment Method Code");

//                 FormatAddress.PurchHeaderBuyFrom(BuyFromAddress, "Purchase Header");
//                 FormatAddress.PurchHeaderShipTo(ShipToAddress, "Purchase Header");

//                 IF NOT CurrReport.PREVIEW THEN BEGIN
//                     IF ArchiveDocument THEN
//                         ArchiveManagement.StorePurchDocument("Purchase Header", LogInteraction);

//                     IF LogInteraction THEN BEGIN
//                         CALCFIELDS("No. of Archived Versions");
//                         SegManagement.LogDocument(
//                           13, "No.", "Doc. No. Occurrence", "No. of Archived Versions", DATABASE::Vendor, "Buy-from Vendor No.",
//                           "Purchaser Code", '', "Posting Description", '');
//                     END;
//                 END;

//                 IF "Posting Date" <> 0D THEN
//                     UseDate := "Posting Date"
//                 ELSE
//                     UseDate := WORKDATE;

//                 IF PrintOrderBarcode
//                   THEN
//                     OrderBarcode := BarcodeMgmt.GetBarcode(DATABASE::"Purchase Header", "Document Type", "No.", '', rBarcode.Level::Order, 0, 0, '', '', '', '', 0, 0D, '', 0, 0, 0, '', '', 0, 0);
//             end;

//             trigger OnPreDataItem()
//             begin
//                 IF PrintCompany THEN
//                     FormatAddress.Company(CompanyAddress, CompanyInformation)
//                 ELSE
//                     CLEAR(CompanyAddress);
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
//                     field(PrintCompany; PrintCompany)
//                     {
//                         Caption = 'Print Company Address';
//                     }
//                     field(ArchiveDocument; ArchiveDocument)
//                     {
//                         Caption = 'Archive Document';
//                         Enabled = ArchiveDocumentEnable;

//                         trigger OnValidate()
//                         begin
//                             IF NOT ArchiveDocument THEN
//                                 LogInteraction := FALSE;
//                         end;
//                     }
//                     field(LogInteraction; LogInteraction)
//                     {
//                         Caption = 'Log Interaction';
//                         Enabled = LogInteractionEnable;

//                         trigger OnValidate()
//                         begin
//                             IF LogInteraction THEN
//                                 ArchiveDocument := ArchiveDocumentEnable;
//                         end;
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
//             ArchiveDocumentEnable := TRUE;
//         end;

//         trigger OnOpenPage()
//         begin
//             ArchiveDocument := ArchiveManagement.PurchaseDocArchiveGranule;
//             LogInteraction := SegManagement.FindInteractTmplCode(13) <> '';

//             ArchiveDocumentEnable := ArchiveDocument;
//             LogInteractionEnable := LogInteraction;
//         end;
//     }

//     labels
//     {
//         BuyFromVendorNo = 'Vendor ID';
//         ToCaption = 'To:';
//         ReceiveByCaption = 'Receive By';
//         ConfirmToCaption = 'Confirm To';
//         BuyerCaption = 'Buyer';
//         ShipCaption = 'Ship';
//         POCaption = 'PURCHASE ORDER';
//         PONoCaption = 'Purchase Order Number:';
//         PODateCaption = 'Purchase Order Date:';
//         PageCaption = 'Page:';
//         ShipViaCaption = 'Ship Via';
//         TermsCaption = 'Terms';
//         PhoneNoCaption = 'Phone No.';
//         ItemNoCaption = 'Item No.';
//         UnitCaption = 'UOM';
//         DescriptionCaption = 'Description';
//         QtyCaption = 'Qty';
//         QuantityCaption = 'Quantity';
//         UnitPriceCaption = 'Unit Price';
//         TotPriceCaption = 'Total Price';
//         VendQuoteNoCaption = 'Vendor Quote No.';
//         SubtotalCaption = 'Subtotal:';
//         InvDiscCaption = 'Invoice Discount:';
//         TotalCaption = 'Total:';
//         KeyingCaption_1 = 'Keying';
//         HeightCaption_1 = 'Height';
//         WidthCaption_1 = 'Width';
//         ThicknessCaption_1 = 'Thickness';
//         KeyCaption_2 = 'Key';
//         HeadingCaption = 'Heading #';
//         TaxCaption = 'Tax:';
//         EMailCaption = 'EMail';
//     }

//     trigger OnPreReport()
//     begin
//         CompanyInformation.GET('');
//         CompanyInformation.CALCFIELDS(Picture);
//     end;

//     var
//         UnitPriceToPrint: Decimal;
//         AmountExclInvDisc: Decimal;
//         ShipmentMethod: Record "10";
//         PaymentTerms: Record "3";
//         PurchLine: Record "39" temporary;
//         SalesPurchPerson: Record "13";
//         CompanyInformation: Record "79";
//         RespCenter: Record "5714";
//         Language: Record "8";
//         TempSalesTaxAmtLine: Record "10011" temporary;
//         TaxArea: Record "318";
//         CompanyAddress: array[8] of Text[50];
//         BuyFromAddress: array[8] of Text[50];
//         ShipToAddress: array[8] of Text[50];
//         CopyTxt: Text[10];
//         ItemNumberToPrint: Text[20];
//         PrintCompany: Boolean;
//         PrintFooter: Boolean;
//         TaxFlag: Boolean;
//         NoCopies: Integer;
//         NoLoops: Integer;
//         CopyNo: Integer;
//         NumberOfLines: Integer;
//         OnLineNumber: Integer;
//         PurchasePrinted: Codeunit "317";
//         FormatAddress: Codeunit "365";
//         SalesTaxCalc: Codeunit "398";
//         ArchiveManagement: Codeunit "5063";
//         SegManagement: Codeunit "5051";
//         ArchiveDocument: Boolean;
//         LogInteraction: Boolean;
//         TaxAmount: Decimal;
//         TaxRegNo: Text[30];
//         TaxRegLabel: Text[30];
//         TotalTaxLabel: Text[30];
//         BreakdownTitle: Text[30];
//         BreakdownLabel: array[4] of Text[30];
//         BreakdownAmt: array[4] of Decimal;
//         BrkIdx: Integer;
//         PrevPrintOrder: Integer;
//         PrevTaxPercent: Decimal;
//         UseDate: Date;
//         Text000: Label 'COPY';
//         Text001: Label 'Transferred from page %1';
//         Text002: Label 'Transferred to page %1';
//         Text003: Label 'Sales Tax Breakdown:';
//         Text004: Label 'Other Taxes';
//         Text005: Label 'Total Sales Tax:';
//         Text006: Label 'Tax Breakdown:';
//         Text007: Label 'Total Tax:';
//         AssignArray: array[500] of Text[400];
//         ConERPMgmt: Codeunit "37004501";
//         PrintOn: Option ShopOrder,PurchaseOrder,"Picking Ticket","Packing Slip";
//         cERP: Codeunit "37004861";
//         ColumnNo: Integer;
//         RecordNo: Integer;
//         aAssignTrans: array[6] of Record "37004541";
//         aAssign3: array[6] of Record "37004511";
//         AssignmentCount: Integer;
//         AssignPrintDetail: Boolean;
//         AssignAndQtyPrint: Boolean;
//         AssignAndKeyingPrint: Boolean;
//         NoOfColumns: Integer;
//         aHeight: array[6] of Code[20];
//         aWidth: array[6] of Code[20];
//         aThickness: array[6] of Code[20];
//         ProductGroup: Record "5723";
//         PrintAttributes: Boolean;
//         Addr: array[8, 1] of Text[250];
//         NoOfRecords: Integer;
//         i: Integer;
//         ConfigSetup: Record "CERP Configurator Setup";
//         OutputNo: Integer;
//         AmountExclInvDisc2: Decimal;
//         Total: Decimal;
//         Total2: Decimal;
//         AmountExclInvDisc3: Decimal;
//         UseExternalTaxEngine: Boolean;
//         [InDataSet]
//         ArchiveDocumentEnable: Boolean;
//         [InDataSet]
//         LogInteractionEnable: Boolean;
//         Text008: Label 'Tax:';
//         Serial_Nos_CaptionLbl: Label 'Serial Nos';
//         "--cERP Globals": Integer;
//         QtyUOM: Decimal;
//         OrderBarcode: Code[30];
//         PrintOrderBarcode: Boolean;
//         ShippingAgent: Record "Shipping Agent";
// }