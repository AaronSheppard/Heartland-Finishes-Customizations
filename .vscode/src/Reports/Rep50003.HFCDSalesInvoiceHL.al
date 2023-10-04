// report 50003 "HF CD Sales Invoice HL"
// {
//     // version AI13.01,HL

//     DefaultLayout = RDLC;
//     RDLCLayout = '.vscode/src/Reports/Layouts/CD Sales Invoice HL.rdlc';

//     dataset
//     {
//         dataitem(DataItem5581; Table112)
//         {
//             DataItemTableView = SORTING("No.");
//             RequestFilterFields = "No.", "Sell-to Customer No.", "Bill-to Customer No.", "Ship-to Code", "No. Printed";
//             RequestFilterHeading = 'Sales Invoice';
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
//             column(CompanyAddress_7; CompanyAddress[7])
//             {
//             }
//             column(CompanyAddress_8; CompanyAddress[8])
//             {
//             }
//             column(BillToAddress_1; BillToAddress[1])
//             {
//             }
//             column(BillToAddress_2; BillToAddress[2])
//             {
//             }
//             column(BillToAddress_3; BillToAddress[3])
//             {
//             }
//             column(BillToAddress_4; BillToAddress[4])
//             {
//             }
//             column(BillToAddress_5; BillToAddress[5])
//             {
//             }
//             column(BillToAddress_6; BillToAddress[6])
//             {
//             }
//             column(BillToAddress_7; BillToAddress[7])
//             {
//             }
//             column(BillToAddress_8; BillToAddress[8])
//             {
//             }
//             column(ShippingAgent_Name; ShippingAgent.Name)
//             {
//             }
//             column(Shipment_Date; "Shipment Date")
//             {
//             }
//             column(Due_Date; "Due Date")
//             {
//             }
//             column(PaymentTerms_Description; PaymentTerms.Description)
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
//             column(ShipToAddress_8; ShipToAddress[8])
//             {
//             }
//             column(Contract_Description; "Contract Description")
//             {
//             }
//             column(Contract_No_And_Change_Order_No; "Contract No.")
//             {
//             }
//             column(Bill_to_Customer_No; "Bill-to Customer No.")
//             {
//             }
//             column(External_Document_No; "External Document No.")
//             {
//             }
//             column(Order_Date; "Order Date")
//             {
//             }
//             column(Order_No; "Order No.")
//             {
//             }
//             column(SalesPurchPerson_Name; SalesPurchPerson.Name)
//             {
//             }
//             column(Invoice_No; "No.")
//             {
//             }
//             column(Document_Date; "Document Date")
//             {
//             }
//             column(TaxRegNo; TaxRegNo)
//             {
//             }
//             column(TaxRegLabel; TaxRegLabel)
//             {
//             }
//             column(CompanyInformation_Picture; CompanyInformation.Picture)
//             {
//             }
//             column(PrintDetail; "Print Detail")
//             {
//             }
//             column(SuppressItemPrices; "Suppress Item Prices")
//             {
//             }
//             column(PrintPartsAndLaborSummary; "Print Parts and Labor Summary")
//             {
//             }
//             column(Amount; Amount)
//             {
//             }
//             column(AmountIncVat; "Sales Invoice Header"."Amount Including VAT")
//             {
//             }
//             column(AmountReceived; "Sales Invoice Header"."Amount Paid")
//             {
//             }
//             column(ShowPayments; ShowPayments)
//             {
//             }
//             column(PrimaryQty; PrimaryQty)
//             {
//             }
//             dataitem(DataItem1570; Table113)
//             {
//                 DataItemLink = "Document No." = FIELD("No.");
//                 DataItemTableView = SORTING(Document No., "Line No.")
//                                     WHERE(Contract Expense Item=CONST(No));

//                 trigger OnAfterGetRecord()
//                 begin
//                     IF CheckPackageSaleSkip THEN
//                         CurrReport.SKIP;  //AI13.00 CERP-449 SLB 08/15/18
//                     TempSalesInvoiceLine := "Sales Invoice Line";
//                     TempSalesInvoiceLine.INSERT;
//                     HighestLineNo := "Line No.";

//                     IF NOT tempSalesInvCat.GET("Document No.", "Item Category Code")
//                       THEN BEGIN
//                         tempSalesInvCat.INIT;
//                         tempSalesInvCat."No." := "Document No.";
//                         tempSalesInvCat."Item Category Code" := "Item Category Code";
//                         tempSalesInvCat.INSERT;
//                     END;

//                     tempSalesInvCat."Order Lump Sum Value" := tempSalesInvCat."Order Lump Sum Value" + Amount;
//                     tempSalesInvCat.MODIFY;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     TempSalesInvoiceLine.RESET;
//                     TempSalesInvoiceLine.DELETEALL;
//                     tempSalesInvCat.RESET;                    // Angelo
//                     tempSalesInvCat.DELETEALL;                // Angelo
//                 end;
//             }
//             dataitem(DataItem8541; "Sales Comment Line")
//             {
//                 DataItemLink = "No." = FIELD("No.");
//                 DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.")
//                                     WHERE("Document Type" = CONST(Posted Invoice),
//                                           Print On Invoice=CONST(Yes),
//                                           "Document Line No."=CONST(0));

//                 trigger OnAfterGetRecord()
//                 begin
//                     WITH TempSalesInvoiceLine DO BEGIN
//                         INIT;
//                         "Document No." := "Sales Invoice Header"."No.";
//                         "Line No." := HighestLineNo + 1000;
//                         HighestLineNo := "Line No.";
//                     END;
//                     IF STRLEN(Comment) <= MAXSTRLEN(TempSalesInvoiceLine.Description) THEN BEGIN
//                         TempSalesInvoiceLine.Description := Comment;
//                         TempSalesInvoiceLine."Description 2" := '';
//                     END ELSE BEGIN
//                         SpacePointer := MAXSTRLEN(TempSalesInvoiceLine.Description) + 1;
//                         WHILE (SpacePointer > 1) AND (Comment[SpacePointer] <> ' ') DO
//                             SpacePointer := SpacePointer - 1;
//                         IF SpacePointer = 1 THEN
//                             SpacePointer := MAXSTRLEN(TempSalesInvoiceLine.Description) + 1;
//                         TempSalesInvoiceLine.Description := COPYSTR(Comment, 1, SpacePointer - 1);
//                         TempSalesInvoiceLine."Description 2" :=
//                           COPYSTR(COPYSTR(Comment, SpacePointer + 1), 1, MAXSTRLEN(TempSalesInvoiceLine."Description 2"));
//                     END;
//                     TempSalesInvoiceLine.INSERT;
//                 end;
//             }
//             dataitem(CopyLoop; Integer)
//             {
//                 DataItemTableView = SORTING(Number);
//                 column(CopyRec; 'True')
//                 {
//                 }
//                 column(CopyNo; CopyNo)
//                 {
//                 }
//                 column(CopyTxt; CopyTxt)
//                 {
//                 }
//                 dataitem(SalesInvCat; Integer)
//                 {
//                     DataItemTableView = SORTING(Number);
//                     column(CategoryRec; 'True')
//                     {
//                     }
//                     column(Category_Code; tempSalesInvCat."Item Category Code")
//                     {
//                     }
//                     column(Category_Amount; AmountExclInvDisc)
//                     {
//                     }
//                     column(SalesInvCat_Number; Number)
//                     {
//                     }

//                     trigger OnAfterGetRecord()
//                     begin
//                         IF SalesInvCat.Number = 1
//                           THEN
//                             tempSalesInvCat.FINDFIRST
//                         ELSE
//                             tempSalesInvCat.NEXT;

//                         IF "Sales Invoice Header"."Suppress Item Prices"
//                           THEN
//                             AmountExclInvDisc := 0
//                         ELSE
//                             AmountExclInvDisc := tempSalesInvCat."Order Lump Sum Value";
//                     end;

//                     trigger OnPreDataItem()
//                     begin
//                         SalesInvCat.SETRANGE(Number, 1, tempSalesInvCat.COUNT);
//                     end;
//                 }
//                 dataitem(SalesInvLine; Integer)
//                 {
//                     DataItemTableView = SORTING(Number);
//                     column(SalesInvLineRec; 'True')
//                     {
//                     }
//                     column(SalesInvoiceLine_DescToPrint; DescriptionToPrint)
//                     {
//                     }
//                     column(SalesInvoiceLine_No; TempSalesInvoiceLine."No.")
//                     {
//                     }
//                     column(SalesInvoiceLine_Unit_of_Measure; TempSalesInvoiceLine."Unit of Measure")
//                     {
//                     }
//                     column(SalesInvoiceLine_OrderedQuantity; OrderedQuantity)
//                     {
//                         DecimalPlaces = 0 : 5;
//                     }
//                     column(SalesInvoiceLine_Quantity; TempSalesInvoiceLine.Quantity)
//                     {
//                         DecimalPlaces = 0 : 5;
//                     }
//                     column(SalesInvoiceLine_UnitPriceToPrint; UnitPriceToPrint)
//                     {
//                         DecimalPlaces = 2 : 5;
//                     }
//                     column(SalesInvoiceLine_AmountExclInvDisc; AmountExclInvDisc)
//                     {
//                         DecimalPlaces = 2 : 2;
//                     }
//                     column(SalesInvLine_Number; Number)
//                     {
//                     }
//                     column(SalesInvLine_LineNo; TempSalesInvoiceLine."Line No.")
//                     {
//                     }
//                     column(AssignmentList; tAssignList)
//                     {
//                     }
//                     column(PricingUOMCode; TempSalesInvoiceLine."Pricing UOM Code")
//                     {
//                     }
//                     column(UOMPrice; TempSalesInvoiceLine."Pricing UOM Unit Price")
//                     {
//                         DecimalPlaces = 2 : 5;
//                     }
//                     column(QuantityUOM; QtyUOM)
//                     {
//                         DecimalPlaces = 2 : 5;
//                     }
//                     column(OrderedQuantityUOM; OrderedQtyUOM)
//                     {
//                         DecimalPlaces = 2 : 5;
//                     }
//                     dataitem(Attribute_Component; Table37004586)
//                     {
//                         DataItemTableView = SORTING(Table ID, "Document No.", "Line No.", "Component Line No.")
//                                             WHERE(Blocked = CONST(No),
//                                                   Attribute Value=FILTER(<>''&<>BLANK VALUE));
//                         column(Attribute_AttributeCode; "Attribute Code")
//                         {
//                         }
//                         column(Attribute_No; "No.")
//                         {
//                         }
//                         column(Attribute_Description; DescToPrint)
//                         {
//                         }
//                         column(Attribute_ComponenLineNo; "Component Line No.")
//                         {
//                         }

//                         trigger OnAfterGetRecord()
//                         var
//                             PrintOn: Option ShopOrder,PurchaseOrder,"Picking Ticket","Packing Slip",SalesOrder,SalesInvoice,SalesCRMemo;
//                         begin
//                             //AI9.00 JPU 12042015 BEGIN
//                             IF NOT cERP.PrintAttribute("Attribute Code",TempSalesInvoiceLine."Item Category Code",
//                                                       //AI9.00.03 JPU 09292017 BEGIN
//                                                       //TempSalesInvoiceLine."Product Group Code",PrintOn::SalesOrder)
//                                                       TempSalesInvoiceLine."Product Group Code",PrintOn::SalesInvoice)
//                                                       //AI9.00.03 JPU 09292017 END

//                               THEN CurrReport.SKIP;
//                             //AI9.00 JPU 12042015 END
//                         end;

//                         trigger OnPreDataItem()
//                         begin
//                             //AI9.00 JPU 12042015 BEGIN
//                             SETRANGE("Table ID", DATABASE::"Sales Invoice Line");
//                             SETRANGE("Document No.",TempSalesInvoiceLine."Document No.");
//                             SETRANGE("Line No.",TempSalesInvoiceLine."Line No.");
//                             //AI9.00 JPU 12042015 END
//                         end;
//                     }
//                     dataitem(SalesLineComment;"Sales Comment Line")
//                     {
//                         DataItemTableView = SORTING("Document Type",No.,Document Line No.,Line No.)
//                                             WHERE(Print On Invoice=CONST(Yes));
//                         column(SalesLineCommentRec;'True')
//                         {
//                         }
//                         column(SalesLineComment_Comment; Comment)
//                         {
//                         }
//                         column(SalesLineComment_Line_No; "Line No.")
//                         {
//                         }

//                         trigger OnPreDataItem()
//                         begin
//                             SETRANGE("Document Type","Document Type"::"Posted Invoice");
//                             SETRANGE("No.",TempSalesInvoiceLine."Document No.");
//                             SETRANGE("Document Line No.",TempSalesInvoiceLine."Line No.");
//                         end;
//                     }
//                     dataitem(DataItem3821;Table37012852)
//                     {
//                         DataItemTableView = SORTING(Table ID,Document No.,Document Line No.,Component Line No.,Line No.);
//                         column(SerialNoRec;'True')
//                         {
//                         }
//                         column(SerialNo1;Addr[1][1])
//                         {
//                         }
//                         column(SerialNo2;Addr[2][1])
//                         {
//                         }
//                         column(SerialNo3;Addr[3][1])
//                         {
//                         }
//                         column(SerialNo4;Addr[4][1])
//                         {
//                         }
//                         column(ColumnNo; ColumnNo)
//                         {
//                         }

//                         trigger OnAfterGetRecord()
//                         begin
//                             RecordNo := RecordNo + 1;
//                             ColumnNo := ColumnNo + 1;

//                             Addr[ColumnNo][1] := FORMAT("Serial No.");

//                             COMPRESSARRAY(Addr[ColumnNo]);

//                             IF RecordNo = NoOfRecords THEN BEGIN
//                               FOR i := ColumnNo + 1 TO NoOfColumns DO
//                                 CLEAR(Addr[i]);
//                               ColumnNo := 0;
//                             END ELSE BEGIN
//                               IF ColumnNo = NoOfColumns THEN
//                                 ColumnNo := 0;
//                             END;
//                         end;

//                         trigger OnPreDataItem()
//                         begin
//                             SETRANGE("Table ID",DATABASE::"Sales Invoice Line");
//                             SETRANGE("Document No.",TempSalesInvoiceLine."Document No.");
//                             SETRANGE("Document Line No.",TempSalesInvoiceLine."Line No.");
//                             SETRANGE("Component Line No.",0);

//                             NoOfRecords := COUNT;
//                             NoOfColumns := 4;
//                             RecordNo := 0;
//                         end;
//                     }
//                     dataitem(TimeAndMaterialDetail;Integer)
//                     {
//                         DataItemTableView = SORTING(Number)
//                                             WHERE(Number=CONST(1));
//                         column(DetailHeaderRec;'True')
//                         {
//                         }
//                         dataitem(DataItem6623;Table37004586)
//                         {
//                             DataItemTableView = SORTING(Table ID,Unposted Document Type,Unposted Document No.,Unposted Line No.,Type)
//                                                 WHERE(Blocked=CONST(No));
//                             column(ComponentRec;'True')
//                             {
//                             }
//                             column(Component_No_And_DescToPrint;"No." + ' - ' + DescToPrint)
//                             {
//                             }
//                             column(Component_Unit_of_Measure_Code; "Unit of Measure Code")
//                             {
//                             }
//                             column(Component_Qty_Per; "Qty. Per")
//                             {
//                             }
//                             column(Component_UnitPriceToPrint; UnitPriceToPrint)
//                             {
//                                 DecimalPlaces = 2:5;
//                             }
//                             column(Component_AmountExclInvDisc; AmountExclInvDisc)
//                             {
//                             }
//                             column(Component_Component_Line_No; "Component Line No.")
//                             {
//                             }

//                             trigger OnAfterGetRecord()
//                             begin
//                                 IF NOT TimeMatWorkOrderMgmt.IncludeCompInTandMPrice(Type,"No.",bIncludePlannedLabor)
//                                   THEN CurrReport.SKIP;

//                                 //AI9.00 JPU 12042015 BEGIN
//                                 IF NOT cERP.PrintAttribute("Attribute Code",TempSalesInvoiceLine."Item Category Code",
//                                                                  TempSalesInvoiceLine."Product Group Code",PrintOn::SalesInvoice)
//                                   THEN CurrReport.SKIP;
//                                 //AI9.00 JPU 12042015 END

//                                 IF "Sales Invoice Header"."Suppress Item Prices" THEN
//                                   BEGIN
//                                     UnitPriceToPrint := 0;
//                                     AmountExclInvDisc := 0;
//                                   END
//                                   ELSE
//                                     BEGIN
//                                       UnitPriceToPrint := "Unit Price";
//                                       AmountExclInvDisc := Amount;
//                                     END;
//                             end;

//                             trigger OnPreDataItem()
//                             begin
//                                 SETRANGE("Table ID",DATABASE::"Posted Work Order Line");
//                                 SETRANGE("Unposted Document Type","Posted Component"."Unposted Document Type"::Order);
//                                 SETRANGE("Unposted Document No.","Sales Invoice Header"."Order No.");
//                                 SETRANGE("Unposted Line No.",TempSalesInvoiceLine."Line No.");
//                                 SETFILTER("Unit Price",'<>0');
//                             end;
//                         }
//                         dataitem(DataItem8782;Table37004785)
//                         {
//                             DataItemTableView = SORTING(Sales Order No.,Sales Line No.);
//                             column(PostedTimeEntryRec;'True')
//                             {
//                             }
//                             column(Posted_Time_Entry_Resource_No; "Resource No.")
//                             {
//                             }
//                             column(Posted_Time_Entry_Unit_of_Measure_Code; "Unit of Measure Code")
//                             {
//                             }
//                             column(Posted_Time_Entry_Quantity; Quantity)
//                             {
//                             }
//                             column(Posted_Time_Entry_UnitPriceToPrint; UnitPriceToPrint)
//                             {
//                                 DecimalPlaces = 2:5;
//                             }
//                             column(Posted_Time_Entry_AmountExclInvDisc; AmountExclInvDisc)
//                             {
//                             }
//                             column(Posted_Time_Entry_Entry_No; "Entry No.")
//                             {
//                             }

//                             trigger OnAfterGetRecord()
//                             begin
//                                 IF "Sales Invoice Header"."Suppress Item Prices" THEN
//                                   BEGIN
//                                     UnitPriceToPrint := 0;
//                                     AmountExclInvDisc := 0;
//                                   END
//                                   ELSE
//                                     BEGIN
//                                       UnitPriceToPrint := "Unit Price";
//                                       AmountExclInvDisc := Amount;
//                                     END;
//                             end;

//                             trigger OnPreDataItem()
//                             begin
//                                 "Posted Time Entry".SETCURRENTKEY("Sales Order No.","Sales Line No.");
//                                 "Posted Time Entry".SETRANGE("Sales Order No.","Sales Invoice Header"."Order No.");
//                                 "Posted Time Entry".SETRANGE("Sales Line No.",TempSalesInvoiceLine."Line No.");
//                             end;
//                         }

//                         trigger OnAfterGetRecord()
//                         begin
//                             IF NOT "Sales Invoice Header"."Print Detail for TandM Service"
//                               THEN CurrReport.SKIP;
//                             IF NOT (ConfigSetup.GET(TempSalesInvoiceLine."Configurator Setup No.") AND ConfigSetup."Time and Material Billing")
//                               THEN CurrReport.SKIP;

//                             bIncludePlannedLabor := TimeMatWorkOrderMgmt.IncludePlannedLabor("Sales Invoice Header"."Order No.",
//                                TempSalesInvoiceLine."Line No.");
//                         end;
//                     }

//                     trigger OnAfterGetRecord()
//                     var
//                         "--cERP Locals--": Integer;
//                         ItemUOM: Record "Item Unit of Measure";
//                         Item: Record Item;
//                         Ratio: Decimal;
//                         cERPUOMMgmt: Codeunit "CERP UOM Management";
//                     begin
//                         OnLineNumber := OnLineNumber + 1;

//                         WITH TempSalesInvoiceLine DO BEGIN
//                           IF OnLineNumber = 1 THEN
//                             FINDFIRST
//                           ELSE
//                             NEXT;

//                           OrderedQuantity :=  0;
//                           IF "Sales Invoice Header"."Order No." = '' THEN
//                             OrderedQuantity := Quantity
//                           ELSE BEGIN
//                             IF OrderLine.GET(1,"Sales Invoice Header"."Order No.","Line No.") THEN
//                               OrderedQuantity := OrderLine.Quantity
//                             ELSE BEGIN
//                               ShipmentLine.SETRANGE("Order No.","Sales Invoice Header"."Order No.");
//                               ShipmentLine.SETRANGE("Order Line No.","Line No.");
//                               IF ShipmentLine.FINDSET THEN
//                                 REPEAT
//                                   OrderedQuantity := OrderedQuantity + ShipmentLine.Quantity;
//                                 UNTIL 0=ShipmentLine.NEXT;
//                             END;
//                           END;

//                           DescriptionToPrint := DescToPrint;
//                           IF Type = 0 THEN BEGIN
//                             IF OnLineNumber < NumberOfLines THEN BEGIN
//                               NEXT;
//                               IF Type = 0 THEN BEGIN
//                                 DescriptionToPrint :=
//                                   COPYSTR(DescriptionToPrint + ' ' + DescToPrint,1,MAXSTRLEN(DescriptionToPrint));
//                                 OnLineNumber := OnLineNumber + 1;
//                                 SalesInvLine.NEXT;
//                               END ELSE
//                                 NEXT(-1);
//                             END;
//                             "No." := '';
//                             "Unit of Measure" := '';
//                             Amount := 0;
//                             "Amount Including VAT" := 0;
//                             "Inv. Discount Amount" := 0;
//                             Quantity := 0;
//                           END ELSE IF Type = Type::"G/L Account" THEN
//                             "No." := '';

//                           IF "No." = '' THEN BEGIN
//                             HighDescriptionToPrint := DescriptionToPrint;
//                             LowDescriptionToPrint := '';
//                           END ELSE BEGIN
//                             HighDescriptionToPrint := '';
//                             LowDescriptionToPrint := DescriptionToPrint;
//                           END;

//                           IF Amount <> "Amount Including VAT" THEN BEGIN
//                             TaxFlag := TRUE;
//                             TaxLiable := Amount;
//                           END ELSE BEGIN
//                             TaxFlag := FALSE;
//                             TaxLiable := 0;
//                           END;

//                           AmountExclInvDisc := Amount + "Inv. Discount Amount";

//                           CASE Type OF
//                             Type::Item :
//                               BEGIN
//                                 IF TempSalesInvoiceLine."Work Code"
//                                   THEN TotalLabor := TotalLabor + AmountExclInvDisc
//                                   ELSE TotalParts := TotalParts + AmountExclInvDisc;
//                               END;
//                             Type::Resource : TotalLabor := TotalLabor + AmountExclInvDisc;
//                             ELSE TotalMisc := TotalMisc + AmountExclInvDisc
//                           END;

//                             IF Quantity = 0 THEN
//                               UnitPriceToPrint := 0  // so it won't print
//                             ELSE
//                               UnitPriceToPrint := ROUND(AmountExclInvDisc / Quantity,0.00001);

//                           // AI
//                           //  IF "Sales Invoice Header"."Suppress Item Prices" = TRUE THEN  //AI13.00 CERP-449 SLB 08/15/18
//                           IF "Sales Invoice Header"."Suppress Item Prices" OR (("Package Line No." <> 0) AND (NOT PrintDetailPricing)) THEN  //AI13.00 CERP-449 SLB 08/15/18
//                             BEGIN
//                               UnitPriceToPrint := 0;
//                               AmountExclInvDisc := 0;
//                             END;
//                           IF ("Pricing UOM Code" <> '') AND (Type = Type::Item) THEN BEGIN
//                             ItemUOM.GET("No.","Pricing UOM Code");
//                             ItemUOM.TESTFIELD("Qty. per Unit of Measure");
//                             //AI9.00 JPU 11052015 BEGIN - Calculate for Variable Dimension
//                             //QtyUOM := Quantity / ItemUOM."Qty. per Unit of Measure";
//                             //OrderedQtyUOM := OrderedQuantity/ ItemUOM."Qty. per Unit of Measure";
//                             IF Item.IsItemVariableDimensionUOM("No.") THEN BEGIN
//                               IF "Dimensional Ratio" <> 0 THEN BEGIN
//                                 IF Item.GET("No.") THEN BEGIN
//                                   Ratio := 1;
//                                   IF "Dimensional UOM Code" <> Item."Pricing UOM Code" THEN
//                                     Ratio := cERPUOMMgmt.GetRatio("Dimensional UOM Code", Item."Pricing UOM Code");
//                                   //AI9.01 JPU 06212017 BEGIN - Rounded Dimensional Ratio is the value that's used in pricing calculation
//                                   //QtyUOM := Quantity * "Dimensional Ratio" / Ratio;
//                                   //OrderedQtyUOM := OrderedQuantity * "Dimensional Ratio" / Ratio;
//                                   QtyUOM := Quantity * "Rounded Dimensional Ratio" / Ratio;
//                                   OrderedQtyUOM := OrderedQuantity * "Rounded Dimensional Ratio" / Ratio;
//                                   //AI9.01 JPU 06212017 END
//                                 END;
//                               END ELSE BEGIN
//                                 QtyUOM := 0;
//                                 OrderedQtyUOM := 0;
//                               END;
//                             END ELSE
//                               IF Item.GET("No.") AND (Item."Base Unit of Measure" = "Unit of Measure Code") THEN BEGIN
//                                 QtyUOM := Quantity / ItemUOM."Qty. per Unit of Measure";
//                                 OrderedQtyUOM := OrderedQuantity / ItemUOM."Qty. per Unit of Measure";
//                               END ELSE BEGIN //Convert the Unit of Measure to the Base Unit of Measure, then from the Base Unit of Measure to the Pricing Unit of Measure
//                                 ItemUOM.GET("No.", "Unit of Measure Code");
//                                 ItemUOM.TESTFIELD("Qty. per Unit of Measure");
//                                 QtyUOM := Quantity * ItemUOM."Qty. per Unit of Measure";
//                                 OrderedQtyUOM := OrderedQuantity * ItemUOM."Qty. per Unit of Measure";

//                                 ItemUOM.GET("No.","Pricing UOM Code");
//                                 ItemUOM.TESTFIELD("Qty. per Unit of Measure");
//                                 QtyUOM := QtyUOM / ItemUOM."Qty. per Unit of Measure";
//                                 OrderedQtyUOM := OrderedQtyUOM / ItemUOM."Qty. per Unit of Measure";
//                               END;
//                             //AI9.00 JPU 11052015 END
//                           END ELSE
//                             QtyUOM := 0;
//                           // AI

//                         TotalTaxLiable := TotalTaxLiable + TaxLiable;
//                         TotalInvDiscountAmt := TotalInvDiscountAmt + "Inv. Discount Amount";

//                           IF FirstOne
//                             THEN FirstOne := FALSE
//                             ELSE
//                               BEGIN
//                                 //TotalTaxLiable := 0;
//                                 //TotalInvDiscountAmt := 0;
//                                 //TotalParts := 0;
//                                 //TotalMisc := 0;
//                               END;

//                           CLEAR(tAssignList); //AI9.00.03 JPU 01242017 - Reset Assignment list
//                           CALCFIELDS(Assignments);
//                           IF Assignments
//                         //    THEN tAssignList := AssignmentListByReport(REPORT::"CD Sales Invoice");      // Angelo
//                             THEN tAssignList := AssignmentListByReport(REPORT::"CD Sales Invoice",FALSE);  // Angelo
//                         END;
//                     end;

//                     trigger OnPreDataItem()
//                     begin
//                         CurrReport.CREATETOTALS(TaxLiable,AmountExclInvDisc,TempSalesInvoiceLine.Amount,TempSalesInvoiceLine."Amount Including VAT",
//                                                 TempSalesInvoiceLine."Inv. Discount Amount");
//                         NumberOfLines := TempSalesInvoiceLine.COUNT;
//                         SETRANGE(Number,1,NumberOfLines);
//                         OnLineNumber := 0;
//                         PrintFooter := FALSE;
//                     end;
//                 }
//                 dataitem(Footer;Integer)
//                 {
//                     DataItemTableView = SORTING(Number);
//                     MaxIteration = 1;
//                     column(PrintFooter;'True')
//                     {
//                     }
//                     column(TaxLiable; TotalTaxLiable)
//                     {
//                     }
//                     column(ExcemptFromSalesTax; "Sales Invoice Header".Amount - TotalTaxLiable)
//                     {
//                     }
//                     column(InvDiscountAmt; TotalInvDiscountAmt)
//                     {
//                     }
//                     column(SubTotal;"Sales Invoice Header".Amount + TotalInvDiscountAmt)
//                     {
//                         DecimalPlaces = 2:2;
//                     }
//                     column(Inv_Discount;"Sales Invoice Header".Amount -  ("Sales Invoice Header".Amount + TotalInvDiscountAmt))
//                     {
//                         DecimalPlaces = 2:2;
//                     }
//                     column(TaxAmount; "Sales Invoice Header"."Amount Including VAT" - "Sales Invoice Header".Amount)
//                     {
//                         DecimalPlaces = 2:2;
//                     }
//                     column(Total; "Sales Invoice Header"."Amount Including VAT")
//                     {
//                         DecimalPlaces = 2:2;
//                     }
//                     column(TotalTaxLabel; TotalTaxLabel)
//                     {
//                     }
//                     column(BreakdownTitle; BreakdownTitle)
//                     {
//                     }
//                     column(BreakdownLabel_1; BreakdownLabel[1])
//                     {
//                     }
//                     column(BreakdownAmt_1; BreakdownAmt[1])
//                     {
//                     }
//                     column(BreakdownAmt_2; BreakdownAmt[2])
//                     {
//                     }
//                     column(BreakdownLabel_2; BreakdownLabel[2])
//                     {
//                     }
//                     column(BreakdownAmt_3; BreakdownAmt[3])
//                     {
//                     }
//                     column(BreakdownLabel_3; BreakdownLabel[3])
//                     {
//                     }
//                     column(BreakdownAmt_4; BreakdownAmt[4])
//                     {
//                     }
//                     column(BreakdownLabel_4; BreakdownLabel[4])
//                     {
//                     }
//                     column(TotalParts; TotalParts)
//                     {
//                     }
//                     column(TotalLabor; TotalLabor)
//                     {
//                     }
//                     column(TotalMisc; TotalMisc)
//                     {
//                     }
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     CurrReport.PAGENO := 1;

//                     IF CopyNo = NoLoops THEN BEGIN
//                       IF NOT CurrReport.PREVIEW THEN
//                         SalesInvPrinted.RUN("Sales Invoice Header");
//                       CurrReport.BREAK;
//                     END ELSE
//                       CopyNo := CopyNo + 1;
//                     IF CopyNo = 1 THEN // Original
//                       CLEAR(CopyTxt)
//                     ELSE
//                       CopyTxt := Text000;

//                     TotalTaxLiable := 0;
//                     TotalInvDiscountAmt := 0;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     NoLoops := 1 + ABS(NoCopies) + Customer."Invoice Copies";
//                     IF NoLoops <= 0 THEN
//                       NoLoops := 1;
//                     CopyNo := 0;
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             var
//                 DelMgmt: Codeunit "37013083";
//             begin
//                 cERP.SetCompInfoToLocationInfo("Location Code",CompanyInformation);
//                 IF PrintCompany THEN BEGIN
//                   FormatAddress.Company(CompanyAddress,CompanyInformation);
//                   FormatAddress.AddToArray(CompanyAddress,'Phone: ' + CompanyInformation."Phone No.");
//                   FormatAddress.AddToArray(CompanyAddress,'Fax: ' + CompanyInformation."Fax No.");
//                   IF RespCenter.GET("Responsibility Center") THEN BEGIN
//                     FormatAddress.RespCenter(CompanyAddress,RespCenter);
//                     CompanyInformation."Phone No." := RespCenter."Phone No.";
//                     CompanyInformation."Fax No." := RespCenter."Fax No.";
//                   END;
//                 END;
//                 CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

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

//                 FormatAddress.SalesInvBillTo(BillToAddress,"Sales Invoice Header");
//                 FormatAddress.SalesInvShipTo(ShipToAddress,BillToAddress,"Sales Invoice Header");

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
//                 //AI9.01 JPU 07172017 END

//                 Customer.GET("Bill-to Customer No.");

//                 IF LogInteraction THEN
//                   IF NOT CurrReport.PREVIEW THEN BEGIN
//                     IF "Bill-to Contact No." <> '' THEN
//                       SegManagement.LogDocument(
//                         4,"No.",0,0,DATABASE::Contact,"Bill-to Contact No.","Salesperson Code",
//                         "Campaign No.","Posting Description",'')
//                     ELSE
//                       SegManagement.LogDocument(
//                         4,"No.",0,0,DATABASE::Customer,"Bill-to Customer No.","Salesperson Code",
//                         "Campaign No.","Posting Description",'');
//                   END;

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
//                   SalesTaxCalc.StartSalesTaxCalculation;
//                   SalesTaxCalc.AddSalesInvoiceLines("No.");
//                   SalesTaxCalc.EndSalesTaxCalculation("Posting Date");
//                   SalesTaxCalc.GetSummarizedSalesTaxTable(TempSalesTaxAmtLine);
//                   BrkIdx := 0;
//                   PrevPrintOrder := 0;
//                   PrevTaxPercent := 0;
//                   WITH TempSalesTaxAmtLine DO BEGIN
//                     RESET;
//                     SETCURRENTKEY("Print Order","Tax Area Code for Key","Tax Jurisdiction Code");
//                     IF FINDSET THEN
//                       REPEAT
//                         IF ("Print Order" = 0) OR
//                            ("Print Order" <> PrevPrintOrder) OR
//                            ("Tax %" <> PrevTaxPercent)
//                         THEN BEGIN
//                           BrkIdx := BrkIdx + 1;
//                           IF BrkIdx > 1 THEN BEGIN
//                             IF TaxArea."Country/Region" = TaxArea."Country/Region"::CA THEN
//                               BreakdownTitle := Text006
//                             ELSE
//                               BreakdownTitle := Text003;
//                           END;
//                           IF BrkIdx > ARRAYLEN(BreakdownAmt) THEN BEGIN
//                             BrkIdx := BrkIdx - 1;
//                             BreakdownLabel[BrkIdx] := Text004;
//                           END ELSE
//                             BreakdownLabel[BrkIdx] := STRSUBSTNO("Print Description","Tax %");
//                         END;
//                         BreakdownAmt[BrkIdx] := BreakdownAmt[BrkIdx] + "Tax Amount";
//                       UNTIL NEXT = 0;
//                   END;
//                   IF BrkIdx = 1 THEN BEGIN
//                     CLEAR(BreakdownLabel);
//                     CLEAR(BreakdownAmt);
//                   END;
//                 END;

//                 /*
//                 DepositLabel := ' ';
//                 DepositAmount := 0;
//                 GlEntry.RESET;
//                 GlEntry.SETCURRENTKEY("Deposit Customer","Contract No.","Change Order No.");
//                 GlEntry.SETFILTER("Deposit Customer","Bill-to Customer No.");
//                 GlEntry.SETFILTER("Contract No.","Contract No.");
//                 GlEntry.SETFILTER("Change Order No.","Change Order No.");
//                 GlEntry.SETFILTER("Document No.","No.");
//                 IF GlEntry.FIND ('-') THEN
//                   BEGIN
//                     DepositLabel := 'Deposit:';
//                     DepositAmount := GlEntry.Amount;
//                   END;
//                 */
//                 // AI4.00 end

//                 TotalParts := 0;
//                 TotalLabor := 0;
//                 TotalMisc := 0;

//                 IF cERPSetup."Use Primary Qty."
//                   THEN PrimaryQty := DelMgmt.InvoicePrimaryQty("No.")

//             end;

//             trigger OnPreDataItem()
//             begin
//                 CompanyInformation.GET('');
//                 CompanyInformation.CALCFIELDS(CompanyInformation.Picture);
//                 cERPSetup.GET;
//             end;
//         }
//     }

//     requestpage
//     {
//         layout
//         {
//             area(content)
//             {
//                 field("Number of Copies"; NoCopies)
//                 {
//                 }
//                 field("Show Payments"; ShowPayments)
//                 {
//                 }
//             }
//         }

//         actions
//         {
//         }

//         trigger OnInit()
//         begin
//             ShowPayments := TRUE; //AI13.01 JPU 02082019
//         end;
//     }

//     labels
//     {
//         BillCaptionLbl = 'Bill';
//         To_CaptionLbl = 'To:';
//         Ship_ViaCaptionLbl = 'Ship Via';
//         Ship_DateCaptionLbl = 'Ship Date';
//         Due_DateCaptionLbl = 'Due Date:';
//         TermsCaptionLbl = 'Terms:';
//         Customer_IDCaptionLbl = 'Customer ID';
//         PO_NumberCaptionLbl = 'P.O. Number';
//         PO_DateCaptionLbl = 'P.O. Date';
//         Our_Order_No_CaptionLbl = 'Our Order No.';
//         SalesPersonCaptionLbl = 'SalesPerson';
//         ShipCaptionLbl = 'Ship';
//         Invoice_Number_CaptionLbl = 'Invoice Number:';
//         Invoice_Date_CaptionLbl = 'Invoice Date:';
//         Job_Name_CaptionLbl = 'Job Name:';
//         Contract_No_CaptionLbl = 'Contract No.';
//         Page_CaptionLbl = 'Page:';
//         InvoiceCaptionLbl = 'Invoice';
//         DescriptionCaptionLbl = 'Description';
//         Item_DescriptionCaptionLbl = 'Item/Description';
//         UnitCaptionLbl = 'Unit';
//         Order_QtyCaptionLbl = 'Order Qty';
//         QuantityCaptionLbl = 'Quantity';
//         Total_Parts_CaptionLbl = 'Total Parts:';
//         Total_Labor_CaptionLbl = 'Total Labor:';
//         Total_Miscellaneous_CaptionLbl = 'Total Miscellaneous:';
//         Subtotal_CaptionLbl = 'Subtotal:';
//         Total_CaptionLbl = 'Total:';
//         Amount_Subject_to_Sales_TaxCaptionLbl = 'Amount Subject to Sales Tax';
//         Amount_Exempt_from_Sales_TaxCaptionLbl = 'Amount Exempt from Sales Tax';
//         Serial_Nos_CaptionLbl = 'Serial Nos.';
//         DetailCaptionLbl = 'Detail';
//         TotalPrice_CaptionLbl = 'Total Price';
//         UnitPrice_CaptionLbl = 'Unit Price';
//         Item_CaptionLbl = 'Item';
//         InvoiceDiscount_CaptionLbl = 'Invoice Discount:';
//         ItemNoCaptionLbl = 'Item No.';
//         ReceivedCaption = 'Received:';
//         RemainingCaption = 'Remaining:';
//         PrimaryQtyLbl = 'Primary Qty.';
//     }

//     trigger OnPreReport()
//     begin
//         ShipmentLine.SETCURRENTKEY("Order No.","Order Line No.");
//         IF NOT CurrReport.USEREQUESTPAGE THEN
//           InitLogInteraction;
//         PrintCompany := TRUE;
//     end;

//     var
//         TaxLiable: Decimal;
//         OrderedQuantity: Decimal;
//         UnitPriceToPrint: Decimal;
//         AmountExclInvDisc: Decimal;
//         ShipmentMethod: Record "10";
//         PaymentTerms: Record "3";
//         SalesPurchPerson: Record "13";
//         CompanyInformation: Record "79";
//         Customer: Record "18";
//         OrderLine: Record "37";
//         ShipmentLine: Record "111";
//         TempSalesInvoiceLine: Record "113" temporary;
//         RespCenter: Record "5714";
//         Language: Record "8";
//         TempSalesTaxAmtLine: Record "10011" temporary;
//         TaxArea: Record "318";
//         CompanyAddress: array [8] of Text[50];
//         BillToAddress: array [8] of Text[50];
//         ShipToAddress: array [8] of Text[50];
//         CopyTxt: Text[10];
//         DescriptionToPrint: Text[210];
//         HighDescriptionToPrint: Text[210];
//         LowDescriptionToPrint: Text[210];
//         PrintCompany: Boolean;
//         PrintFooter: Boolean;
//         TaxFlag: Boolean;
//         NoCopies: Integer;
//         NoLoops: Integer;
//         CopyNo: Integer;
//         NumberOfLines: Integer;
//         OnLineNumber: Integer;
//         HighestLineNo: Integer;
//         SpacePointer: Integer;
//         SalesInvPrinted: Codeunit "315";
//         FormatAddress: Codeunit "365";
//         SalesTaxCalc: Codeunit "398";
//         SegManagement: Codeunit "5051";
//         LogInteraction: Boolean;
//         Text000: Label 'COPY';
//         Text001: Label 'Transferred from page %1';
//         Text002: Label 'Transferred to page %1';
//         TaxRegNo: Text[30];
//         TaxRegLabel: Text[30];
//         TotalTaxLabel: Text[30];
//         BreakdownTitle: Text[30];
//         BreakdownLabel: array [4] of Text[30];
//         BreakdownAmt: array [4] of Decimal;
//         Text003: Label 'Sales Tax Breakdown:';
//         Text004: Label 'Other Taxes';
//         BrkIdx: Integer;
//         PrevPrintOrder: Integer;
//         PrevTaxPercent: Decimal;
//         Text005: Label 'Total Sales Tax:';
//         Text006: Label 'Tax Breakdown:';
//         Text007: Label 'Total Tax:';
//         Text008: Label 'Tax:';
//         TotalPriceHeader: Text[30];
//         UnitPriceHeader: Text[30];
//         ProjMgr: Text[50];
//         GlEntry: Record "17";
//         AssignArray: array [500] of Text[400];
//         cERP: Codeunit "37004861";
//         TimeMatWorkOrderMgmt: Codeunit "37004821";
//         bIncludePlannedLabor: Boolean;
//         ConfigSetup: Record "CERP Configurator Setup";
//         TotalParts: Decimal;
//         TotalLabor: Decimal;
//         TotalMisc: Decimal;
//         tempSalesInvCat: Record "37004873" temporary;
//         Addr: array [8,1] of Text[250];
//         NoOfRecords: Integer;
//         RecordNo: Integer;
//         NoOfColumns: Integer;
//         ColumnNo: Integer;
//         i: Integer;
//         BillCaptionLbl: Label 'Bill';
//         To_CaptionLbl: Label 'To:';
//         Ship_ViaCaptionLbl: Label 'Ship Via';
//         Ship_DateCaptionLbl: Label 'Ship Date';
//         Due_DateCaptionLbl: Label 'Due Date';
//         TermsCaptionLbl: Label 'Terms';
//         Customer_IDCaptionLbl: Label 'Customer ID';
//         P_O__NumberCaptionLbl: Label 'P.O. Number';
//         P_O__DateCaptionLbl: Label 'P.O. Date';
//         Our_Order_No_CaptionLbl: Label 'Our Order No.';
//         SalesPersonCaptionLbl: Label 'SalesPerson';
//         ShipCaptionLbl: Label 'Ship';
//         To_Caption_Control89Lbl: Label 'To:';
//         Invoice_Number_CaptionLbl: Label 'Invoice Number:';
//         Invoice_Date_CaptionLbl: Label 'Invoice Date:';
//         Job_Name_CaptionLbl: Label 'Job Name:';
//         Contract_No_CaptionLbl: Label 'Contract No.';
//         Page_CaptionLbl: Label 'Page:';
//         InvoiceCaptionLbl: Label 'Invoice';
//         DescriptionCaptionLbl: Label 'Description';
//         Item_DescriptionCaptionLbl: Label 'Item/Description';
//         UnitCaptionLbl: Label 'Unit';
//         Order_QtyCaptionLbl: Label 'Order Qty';
//         QuantityCaptionLbl: Label 'Quantity';
//         Total_Parts_CaptionLbl: Label 'Total Parts:';
//         Total_Labor_CaptionLbl: Label 'Total Labor:';
//         Total_Miscellaneous_CaptionLbl: Label 'Total Miscellaneous:';
//         Subtotal_CaptionLbl: Label 'Subtotal:';
//         Invoice_Discount_CaptionLbl: Label 'Invoice Discount:';
//         Total_CaptionLbl: Label 'Total:';
//         Amount_Subject_to_Sales_TaxCaptionLbl: Label 'Amount Subject to Sales Tax';
//         Amount_Exempt_from_Sales_TaxCaptionLbl: Label 'Amount Exempt from Sales Tax';
//         Serial_Nos_CaptionLbl: Label 'Serial Nos.';
//         DetailCaptionLbl: Label 'Detail';
//         FirstOne: Boolean;
//         tAssignList: Text;
//         TotalInvDiscountAmt: Decimal;
//         TotalTaxLiable: Decimal;
//         QtyUOM: Decimal;
//         OrderedQtyUOM: Decimal;
//         ShowPayments: Boolean;
//         PrimaryQty: Decimal;
//         cERPSetup: Record "37004502";
//         PrintOn: Option ShopOrder,PurchaseOrder,"Picking Ticket","Packing Slip",SalesOrder,SalesInvoice,SalesCRMemo;
//         ShippingAgent: Record "Shipping Agent";
//         PrintDetailPricing: Boolean;

//     procedure InitLogInteraction()
//     begin
//         LogInteraction := SegManagement.FindInteractTmplCode(4) <> '';
//     end;

//     procedure AddToPartsAndLaborSummary()
//     begin
//     end;

//     procedure SetOptions(pNoCopies: Integer;pShowPayments: Boolean)
//     begin
//         // Angelo Begin parameters passed from report PDF Exp CD Sales Invoice
//         NoCopies := pNoCopies;
//         ShowPayments := pShowPayments;
//     end;

//     local procedure CheckPackageSaleSkip(): Boolean
//     var
//         ConfigSetup: Record "CERP Configurator Setup";
//         PkgSaleMgmt: Codeunit "37013600";
//         ParentPkgLine: Record "37";
//     begin
//         //AI13.00 CERP-449 SLB 08/15/18
//         IF ("Sales Invoice Line"."Package Line No." <> 0) THEN BEGIN
//           ParentPkgLine.RESET;
//           ParentPkgLine.SETRANGE("No.","Sales Invoice Line"."No.");
//           ParentPkgLine.SETRANGE("Line No.","Sales Invoice Line"."Package Line No.");
//           ParentPkgLine.SETRANGE("Packaged Sale", TRUE);
//           IF ParentPkgLine.FINDSET AND (NOT ParentPkgLine."Print Detail Lines on Sales") THEN
//             EXIT(TRUE);
//           //PrintDetailPricing := ConfigSetup."Print Detail Pricing on Sales";
//           PrintDetailPricing := ParentPkgLine."Print Detail Pricing on Sales";
//         END;
//         EXIT(FALSE);
//     end;
// }
