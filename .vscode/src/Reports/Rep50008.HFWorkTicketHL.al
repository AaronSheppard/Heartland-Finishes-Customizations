// report 50008 "HF Work Ticket HL"
// {
//     // version AI9.01,HL

//     DefaultLayout = RDLC;
//     RDLCLayout = '.vscode/src/Reports/Layouts/Work Ticket HL.rdlc';

//     dataset
//     {
//         dataitem(DataItem8539; Table37004576)
//         {
//             CalcFields = Start By Date, Due Date;
//             DataItemTableView = WHERE(Type = CONST(Work));
//             RequestFilterFields = "No.";
//             column(Order_Type; Type)
//             {
//             }
//             column(Order_No; "No.")
//             {
//             }
//             column(WorkOrderDate; "Shop/Work Order"."Document Date")
//             {
//             }
//             column(OrderBarcode; OrderBarcode)
//             {
//             }
//             dataitem(DataItem4252; Table37004577)
//             {
//                 CalcFields = Assignments;
//                 DataItemLink = Order Type=FIELD(Type),
//                                Order No.=FIELD("No.");
//                 DataItemTableView = SORTING(Order Type,Order No.,Line No.);
//                 column(CompanyInformation_Picture; CompanyInformation.Picture)
//                 {
//                 }
//                 column(CustAddr_1; CustAddr[1])
//                 {
//                 }
//                 column(CustAddr_2; CustAddr[2])
//                 {
//                 }
//                 column(CustAddr_3; CustAddr[3])
//                 {
//                 }
//                 column(CustAddr_4; CustAddr[4])
//                 {
//                 }
//                 column(CustAddr_5; CustAddr[5])
//                 {
//                 }
//                 column(CustAddr_6; CustAddr[6])
//                 {
//                 }
//                 column(CustAddr_7; CustAddr[7])
//                 {
//                 }
//                 column(CustAddr_8; CustAddr[8])
//                 {
//                 }
//                 column("USERID"; USERID)
//                 {
//                 }
//                 column(Line_Item_No_And_Quantity;"Item No." + ' ' + cERP.MultiQtyPrint(Quantity))
//                 {
//                 }
//                 column(Line_Description; Description)
//                 {
//                     IncludeCaption = true;
//                 }
//                 column(Line_Associated_Document_Type; "Associated Document Type")
//                 {
//                 }
//                 column(Line_Associated_Document_No; "Associated Document No.")
//                 {
//                 }
//                 column(Contract_Description; "Shop/Work Order Line"."Contract Description")
//                 {
//                 }
//                 column(CompanyAddress_4; CompanyAddress[4])
//                 {
//                 }
//                 column(CompanyAddress_3; CompanyAddress[3])
//                 {
//                 }
//                 column(CompanyAddress_2; CompanyAddress[2])
//                 {
//                 }
//                 column(CompanyAddress_1; CompanyAddress[1])
//                 {
//                 }
//                 column(CompanyAddress_5; CompanyAddress[5])
//                 {
//                 }
//                 column(CompanyAddress_6; CompanyAddress[6])
//                 {
//                 }
//                 column(CompanyAddress_7; CompanyAddress[7])
//                 {
//                 }
//                 column(CompanyAddress_8; CompanyAddress[8])
//                 {
//                 }
//                 column(JobSiteAddr_1; JobSiteAddr[1])
//                 {
//                 }
//                 column(JobSiteAddr_2; JobSiteAddr[2])
//                 {
//                 }
//                 column(JobSiteAddr_3; JobSiteAddr[3])
//                 {
//                 }
//                 column(JobSiteAddr_4; JobSiteAddr[4])
//                 {
//                 }
//                 column(JobSiteAddr_5; JobSiteAddr[5])
//                 {
//                 }
//                 column(JobSiteAddr_6; JobSiteAddr[6])
//                 {
//                 }
//                 column(JobSiteAddr_7; JobSiteAddr[7])
//                 {
//                 }
//                 column(JobSiteAddr_8; JobSiteAddr[8])
//                 {
//                 }
//                 column(Line_Work_Order_Type; "Work Order Type")
//                 {
//                     IncludeCaption = false;
//                 }
//                 column(Line_Scheduled_Start_Date_Time; "Sch. Service Start Date/Time")
//                 {
//                 }
//                 column(Line_Scheduled_End_Date_Time; "Sch. Service End Date/Time")
//                 {
//                 }
//                 column(Line_Line_No; "Line No.")
//                 {
//                 }
//                 column(Line_Serviceable_Item_No; "Serviceable Item No.")
//                 {
//                 }
//                 column(Assign1Caption; cERPSetup."Assignment Level 1")
//                 {
//                 }
//                 column(Assign2Caption; cERPSetup."Assignment Level 2")
//                 {
//                 }
//                 column(Assign3Caption; cERPSetup."Assignment Level 3")
//                 {
//                 }
//                 column(AssignmentList; tAssignList)
//                 {
//                 }
//                 dataitem(DataItem1000000046;Table13)
//                 {
//                     DataItemLink = Code=FIELD(Project Manager Code);
//                     column(PM_Name; "Salesperson/Purchaser".Name)
//                     {
//                     }
//                 }
//                 dataitem(DataItem8809;Table37012825)
//                 {
//                     DataItemLink = "No."=FIELD(Serviceable Item No.);
//                     DataItemTableView = SORTING("No.");
//                     column(Serviceable_Item_No; "No.")
//                     {
//                     }
//                     column(Serviceable_Item_Item_No; "Item No.")
//                     {
//                         IncludeCaption = false;
//                     }
//                     column(Serviceable_Item_Serial_No; "Serial No.")
//                     {
//                         IncludeCaption = false;
//                     }
//                     column(Serviceable_Item_Assignment_Level_1; "Assignment Level 1")
//                     {
//                         IncludeCaption = true;
//                     }
//                     column(Serviceable_Item_Assignment_Level_2; "Assignment Level 2")
//                     {
//                         IncludeCaption = true;
//                     }
//                     column(Serviceable_Item_Assignment_Level_3; "Assignment Level 3")
//                     {
//                         IncludeCaption = true;
//                     }
//                 }
//                 dataitem(DataItem5531;Table37004582)
//                 {
//                     DataItemLink = Order Type=FIELD(Order Type),
//                                    Order No.=FIELD(Order No.),
//                                    Order Line No.=FIELD("Line No.");
//                     DataItemTableView = SORTING(Order Type,Order No.,Order Line No.,Line No.)
//                                         WHERE(Print=CONST(Yes));
//                     column(LineCommentRec;'True')
//                     {
//                     }
//                     column(Line_Comment; Comment)
//                     {
//                     }
//                     column(Line_Comment_Line_No; "Line No.")
//                     {
//                     }
//                 }
//                 dataitem(DataItem9527;"CERP Component")
//                 {
//                     DataItemLink = Shop/Work Order Type=FIELD(Order Type),
//                                    Shop/Work Order No.=FIELD(Order No.),
//                                    Shop/Work Order Line No.=FIELD("Line No.");
//                     DataItemTableView = SORTING(Shop/Work Order Type,Shop/Work Order No.,Type,Mfg. Supplied)
//                                         WHERE(Blocked=CONST(No));
//                     column(Component_No; "No.")
//                     {
//                         IncludeCaption = true;
//                     }
//                     column(Component_Description; Description)
//                     {
//                         IncludeCaption = true;
//                     }
//                     column(Component_Qty_Per; "Qty. Per")
//                     {
//                         IncludeCaption = true;
//                     }
//                     column(Component_Staging_Location; "Staging Location")
//                     {
//                         IncludeCaption = true;
//                     }
//                     column(Component_Attribute_Code; "Attribute Code")
//                     {
//                     }
//                     column(Component_Unit_of_Measure_Code; "Unit of Measure Code")
//                     {
//                     }
//                     column(Component_Planned_Time; FORMAT("Qty. Per") + ' ' + "Unit of Measure Code")
//                     {
//                     }
//                     column(Component_Document_Type; "Document Type")
//                     {
//                     }
//                     column(Component_Document_No; "Document No.")
//                     {
//                     }
//                     column(Component_Line_No; "Line No.")
//                     {
//                     }
//                     column(Component_Component_Line_No; "Component Line No.")
//                     {
//                     }
//                     column(Component_Type; Type)
//                     {
//                     }
//                     dataitem(DataItem3908;Table37012850)
//                     {
//                         DataItemLink = "Document Type"=FIELD("Document Type"),
//                                        "Document No."=FIELD("Document No."),
//                                        "Document Line No."=FIELD("Line No."),
//                                        Component Line No.=FIELD(Component Line No.);
//                         DataItemTableView = SORTING(Table ID,Document Type,Template Name,Document No.,Document Line No.,Component Line No.,Line No.)
//                                             WHERE(Table ID=CONST(37004575),
//                                                   Template Name=FILTER(''));
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
//                             NoOfRecords := COUNT;
//                             NoOfColumns := 4;
//                             RecordNo := 0;
//                         end;
//                     }
//                     dataitem(POs;Integer)
//                     {
//                         DataItemTableView = SORTING(Number);
//                         column(PO_Document_No; CompPOTemp."Document No.")
//                         {
//                         }
//                         column(PO_Quantity; CompPOTemp.Quantity)
//                         {
//                             DecimalPlaces = 0:5;
//                         }
//                         column(POs_Number; Number)
//                         {
//                         }

//                         trigger OnAfterGetRecord()
//                         begin
//                             IF Number = 1
//                               THEN CompPOTemp.FINDFIRST
//                               ELSE CompPOTemp.NEXT;
//                         end;

//                         trigger OnPreDataItem()
//                         var
//                             AssignTran: Record "37004541";
//                             ReceivedAssignTran: Record "37004544";
//                             POAssignTran: Record "37004541";
//                             PurchLine: Record "39";
//                             PurchRcptLine: Record "121";
//                             PurchRcptHeader: Record "120";
//                         begin
//                             IF NOT cERP.NonStock(Component."Purchasing Code")
//                               THEN
//                                 BEGIN
//                                   POs.SETRANGE(Number,1,0);
//                                   EXIT;
//                                 END;

//                             CompPOTemp.DELETEALL;

//                             IF "Shop/Work Order Line".Assignments
//                               THEN
//                                 BEGIN
//                                   AssignTran.SETRANGE("Table ID",DATABASE::"Shop/Work Order Line");
//                                   AssignTran.SETRANGE("Document Type",0);
//                                   AssignTran.SETRANGE("Template Name",'');
//                                   AssignTran.SETRANGE("Document No.","Shop/Work Order Line"."Order No.");
//                                   AssignTran.SETRANGE("Document Line No.","Shop/Work Order Line"."Line No.");
//                                   IF AssignTran.FINDFIRST
//                                     THEN
//                                       REPEAT
//                                         POAssignTran.SETRANGE("Table ID",DATABASE::"Purchase Line");
//                                         POAssignTran.SETRANGE("Contract No.",AssignTran."Contract No.");
//                                         POAssignTran.SETRANGE("Change Order No.",AssignTran."Change Order No.");
//                                         POAssignTran.SETRANGE("Material Entry No.",AssignTran."Material Entry No.");
//                                         POAssignTran.SETRANGE("Material Component Line No.",Component."Material Comp. No.");
//                                         POAssignTran.SETRANGE("Assignment Level 1",AssignTran."Assignment Level 1");
//                                         POAssignTran.SETRANGE("Assignment Level 2",AssignTran."Assignment Level 2");
//                                         POAssignTran.SETRANGE("Assignment Level 3",AssignTran."Assignment Level 3");
//                                         IF POAssignTran.FINDFIRST
//                                           THEN
//                                             REPEAT
//                                               UpdateCompPOTemp(POAssignTran."Document No.",0);
//                                             UNTIL POAssignTran.NEXT = 0;

//                                         ReceivedAssignTran.SETRANGE("Table ID",DATABASE::"Purch. Rcpt. Line");
//                                         ReceivedAssignTran.SETRANGE("Contract No.",AssignTran."Contract No.");
//                                         ReceivedAssignTran.SETRANGE("Change Order No.",AssignTran."Change Order No.");
//                                         ReceivedAssignTran.SETRANGE("Material Entry No.",AssignTran."Material Entry No.");
//                                         ReceivedAssignTran.SETRANGE("Material Component Line No.",Component."Material Comp. No.");
//                                         ReceivedAssignTran.SETRANGE("Assignment Level 1",AssignTran."Assignment Level 1");
//                                         ReceivedAssignTran.SETRANGE("Assignment Level 2",AssignTran."Assignment Level 2");
//                                         ReceivedAssignTran.SETRANGE("Assignment Level 3",AssignTran."Assignment Level 3");
//                                         IF ReceivedAssignTran.FINDFIRST
//                                           THEN
//                                             REPEAT
//                                               UpdateCompPOTemp(ReceivedAssignTran."Order No.",ReceivedAssignTran.Quantity);
//                                             UNTIL ReceivedAssignTran.NEXT = 0;
//                                       UNTIL AssignTran.NEXT = 0;
//                                 END
//                               ELSE
//                                 BEGIN
//                                   Component.SetAssocPurchLineFilters(PurchLine);
//                                   IF PurchLine.FINDFIRST
//                                     THEN
//                                       REPEAT
//                                         UpdateCompPOTemp(PurchLine."Document No.",0);
//                                       UNTIL PurchLine.NEXT = 0;

//                                   Component.SetAssocPurchRcptLineFilters(PurchRcptLine);
//                                   IF PurchRcptLine.FINDFIRST
//                                     THEN
//                                       REPEAT
//                                         PurchRcptHeader.GET(PurchRcptLine."Document No.");
//                                         UpdateCompPOTemp(PurchRcptLine."Order No.",PurchRcptLine.Quantity);
//                                       UNTIL PurchRcptLine.NEXT = 0;
//                                 END;

//                             POs.SETRANGE(Number,1,CompPOTemp.COUNT);
//                         end;
//                     }

//                     trigger OnAfterGetRecord()
//                     begin
//                         IF (Type = Type::Attribute) AND
//                            (NOT cERP.PrintAttribute("Attribute Code",Item."Item Category Code",Item."Product Group Code",PrintOn::ShopOrder)) THEN
//                           CurrReport.SKIP;
//                     end;
//                 }
//                 dataitem(Additional;Integer)
//                 {
//                     DataItemTableView = SORTING(Number)
//                                         WHERE(Number=FILTER(1..5));
//                     column(AdditionalRec;'True')
//                     {
//                     }
//                     column(Additional_Number; Number)
//                     {
//                     }
//                 }
//                 dataitem(LineFooter;Integer)
//                 {
//                     MaxIteration = 1;
//                     column(PrintFooter;'True')
//                     {
//                     }
//                 }

//                 trigger OnAfterGetRecord()
//                 var
//                     AssignPrintOptions: Record "CERP Assignment Print Options";
//                     ProductGroup: Record "5723";
//                     SalesHeader: Record "36";
//                     Contract: Record "37004501";
//                 begin
//                     CurrReport.PAGENO := 1;
//                     CompanyInformation.GET;
//                     CompanyInformation.CALCFIELDS(CompanyInformation.Picture);
//                     cERP.SetCompInfoToLocationInfo("Location Code",CompanyInformation);
//                     FormatAddress.Company(CompanyAddress,CompanyInformation);
//                     FormatAddress.AddToArray(CompanyAddress,'Fax: ' + CompanyInformation."Fax No.");
//                     FormatAddress.AddToArray(CompanyAddress,'Phone: ' + CompanyInformation."Phone No.");

//                     CASE "Associated Document Type" OF
//                       "Associated Document Type"::"Sales Order" :
//                         BEGIN
//                           SalesHeader.GET(SalesHeader."Document Type"::Order,"Associated Document No.");
//                           FormatAddress.SalesHeaderSellTo(CustAddr,SalesHeader);
//                         END;
//                       "Associated Document Type"::Contract :
//                         BEGIN
//                           Contract.GET("Associated Document No.","Associated Change Order No.");
//                           FormatAddress.ContractSellTo(CustAddr,Contract);
//                           FormatAddress.AddToArray(CustAddr,'Phone: ' + Contract."Phone No.");
//                           FormatAddress.AddToArray(CustAddr,'Email: ' + Contract."E-Mail");
//                         END;
//                     END;

//                     IF Item.GET("Item No.") THEN;

//                     fnPrintScannedDocs(DATABASE::"Shop/Work Order Line","Order No.","Line No.");

//                     AttributeMgmt.ShopCompAttributeArray("Component Doc. Type","Component Doc. No.","Component Line No.",aAttribute);

//                     IF Assignments
//                       THEN tAssignList := AssignmentListByReport(REPORT::"Shop Order");
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             var
//                 BarcodeMgmt: Codeunit "CERP Barcode Management";
//                 rBarcode: Record "CERP Barcode";
//             begin
//                 CurrReport.PAGENO := 1;
//                 fnPrintScannedDocs(DATABASE::"Shop/Work Order","No.",0);

//                 //HL JPU 04182019 BEGIN
//                 //FormatAddress.WorkOrderJobSite(JobSiteAddr,"Shop/Work Order");
//                 WorkOrderJobSite(JobSiteAddr,"Shop/Work Order");
//                 //HL JPU 04182019 END
//                 FormatAddress.AddToArray(JobSiteAddr,'Phone: ' + "Job Site Phone No.");
//                 FormatAddress.AddToArray(JobSiteAddr,'Phone: ' + "Job Site Contact"); //HL JPU 04182019

//                 IF PrintOrderBarcode
//                   THEN OrderBarcode := BarcodeMgmt.GetBarcode(DATABASE::"Shop/Work Order",Type,"No.",'',rBarcode.Level::Order,0,0,'','','','',0,0D,'',0,0,0,'','',0,0);
//             end;

//             trigger OnPostDataItem()
//             begin
//                 IF (NOT CurrReport.PREVIEW) AND (Status = Status::Open)
//                   THEN
//                     BEGIN
//                       Status := Status::"In Process";
//                       MODIFY;
//                     END;
//             end;
//         }
//     }

//     requestpage
//     {
//         layout
//         {
//             area(content)
//             {
//                 field(PrintOrderBarcode; PrintOrderBarcode)
//                 {
//                     Caption = 'Print Order Barcode';
//                 }
//             }
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//         Work_OrderCaptionLbl = 'Work Order';
//         CurrReport_PAGENOCaptionLbl = 'Page:';
//         Work_Order_No_CaptionLbl = 'Work Order No.:';
//         Service_CodeCaptionLbl = 'Service Code:';
//         StartCaptionLbl = 'Start:';
//         EndCaptionLbl = 'End:';
//         CustomerCaptionLbl = 'Customer';
//         Job_SiteCaptionLbl = 'Job Site';
//         Serviceable_Item_No_CaptionLbl = 'Serviceable Item No.:';
//         Notes_CaptionLbl = 'Notes:';
//         MaterialCaptionLbl = 'Material';
//         Purchase_Order_No_CaptionLbl = 'Purchase Order No.';
//         Qty_Received_As_Of_CaptionLbl = 'Qty. Received As Of:';
//         Qty_usedCaptionLbl = 'Qty. used';
//         AttributesCaptionLbl = 'Attributes';
//         ResourcesCaptionLbl = 'Resources';
//         Planned_TimeCaptionLbl = 'Planned Time';
//         Actual_TimeCaptionLbl = 'Actual Time';
//         Serial_Nos_CaptionLbl = 'Serial Nos.';
//         Additional_Material_and_ResourcesCaptionLbl = 'Additional Material and Resources';
//         No_CaptionLbl = 'No.';
//         DescriptionCaptionLbl = 'Description:';
//         Qty_CaptionLbl = 'Qty.';
//         Accepted_ByCaptionLbl = 'Accepted By';
//         Date_CaptionLbl = 'Date';
//         PrintedCaptionLbl = 'Printed';
//         SignedCaptionLbl = 'Signed';
//         ProjectMgrCaptionLbl = 'Project Mgr:';
//         Serviceable_Item_Item_NoCaption = 'Item No.:';
//         Serviceable_Item_Serial_NoCaption = 'Serial No.:';
//         WorkOrderTypeLbl = 'WO Type:';
//     }

//     trigger OnPreReport()
//     begin
//         cERPSetup.GET;
//     end;

//     var
//         AssignArray: array [500] of Text[400];
//         PrintOn: Option ShopOrder,PurchaseOrder,"Picking Ticket","Packing Slip";
//         ConERPMgmt: Codeunit "37004501";
//         Item: Record Item;
//         PrintScannedDoc: Boolean;
//         cERP: Codeunit "37004861";
//         aAttribute: array [16] of Code[20];
//         aAttributeHeader: array [16] of Code[20];
//         AttributeMgmt: Codeunit "37004505";
//         aAssignTrans: array [3] of Record "37004541";
//         aAssign3: array [3] of Record "37004511";
//         AssignmentCount: Integer;
//         tempAssignComment: Record "37004521" temporary;
//         atempAssignComment: array [3] of Record "37004521" temporary;
//         CompPOTemp: Record "39" temporary;
//         CustAddr: array [8] of Text[50];
//         CompanyAddress: array [8] of Text[50];
//         JobSiteAddr: array [8] of Text[50];
//         CompanyInformation: Record "79";
//         FormatAddress: Codeunit "365";
//         Cust: Record "18";
//         Addr: array [8,1] of Text[250];
//         NoOfRecords: Integer;
//         RecordNo: Integer;
//         NoOfColumns: Integer;
//         ColumnNo: Integer;
//         i: Integer;
//         Work_OrderCaptionLbl: Label 'Work Order';
//         CurrReport_PAGENOCaptionLbl: Label 'Page';
//         Work_Order_No_CaptionLbl: Label 'Work Order No.';
//         Item_No___________cERP_MultiQtyPrint_Quantity_CaptionLbl: Label 'Service Code';
//         StartCaptionLbl: Label 'Start';
//         EndCaptionLbl: Label 'End';
//         CustomerCaptionLbl: Label 'Customer';
//         Job_SiteCaptionLbl: Label 'Job Site';
//         Serviceable_Item_No_CaptionLbl: Label 'Serviceable Item No.';
//         Notes__CaptionLbl: Label 'Notes :';
//         MaterialCaptionLbl: Label 'Material';
//         Purchase_Order_No_CaptionLbl: Label 'Purchase Order No.';
//         Qty__Received_As_Of_CaptionLbl: Label 'Qty. Received As Of:';
//         Qty__usedCaptionLbl: Label 'Qty. used';
//         AttributesCaptionLbl: Label 'Attributes';
//         ResourcesCaptionLbl: Label 'Resources';
//         Actual_TimeCaptionLbl: Label 'Actual Time';
//         Serial_Nos_CaptionLbl: Label 'Serial Nos.';
//         Additional_Material_and_ResourcesCaptionLbl: Label 'Additional Material and Resources';
//         No_CaptionLbl: Label 'No.';
//         DescriptionCaptionLbl: Label 'Description';
//         Qty_CaptionLbl: Label 'Qty.';
//         Accepted_By___________________________________CaptionLbl: Label 'Accepted By___________________________________';
//         EmptyStringCaptionLbl: Label '| ___________________________________';
//         Date______________________CaptionLbl: Label 'Date______________________';
//         PrintedCaptionLbl: Label 'Printed';
//         SignedCaptionLbl: Label 'Signed';
//         cERPSetup: Record "37004502";
//         tAssignList: Text;
//         OrderBarcode: Code[20];
//         PrintOrderBarcode: Boolean;

//     procedure fnPrintScannedDocs(TableID: Integer;ShopOrderNo: Code[20];LineNo: Integer)
//     var
//         ScannedDoc: Record "37004539";
//         ScannedDocMgmt: Codeunit "CERP Assignment";
//     begin
//         IF NOT PrintScannedDoc OR CurrReport.PREVIEW
//           THEN EXIT;

//         ScannedDoc.SETRANGE("Table ID",TableID);
//         ScannedDoc.SETRANGE("No.",ShopOrderNo);
//         ScannedDoc.SETRANGE("Document Line No.",LineNo);
//         IF ScannedDoc.FINDFIRST
//           THEN
//             REPEAT
//               ScannedDocMgmt.Print(ScannedDoc);
//             UNTIL ScannedDoc.NEXT = 0;
//     end;

//     procedure UpdateCompPOTemp(OrderNo: Code[20];Qty: Decimal)
//     begin
//         IF NOT CompPOTemp.GET(CompPOTemp."Document Type"::Order,OrderNo,0)
//           THEN
//             BEGIN
//               CompPOTemp.INIT;
//               CompPOTemp."Document Type" := CompPOTemp."Document Type"::Order;
//               CompPOTemp."Document No." := OrderNo;
//               CompPOTemp.INSERT;
//             END;
//         CompPOTemp.Quantity := CompPOTemp.Quantity + Qty;
//         CompPOTemp.MODIFY;
//     end;

//     procedure WorkOrderJobSite(var AddrArray: array [8] of Text[50];var WorkOrder: Record "37004576")
//     begin
//         //HL JPU 04182019 - Copy of same function in Format Address codeunit but pass blank to Job Site Contact parameter
//         WITH WorkOrder DO
//         FormatAddress.FormatAddr(AddrArray,"Job Site Name",'','',"Job Site Address","Job Site Address 2","Job Site City",
//                    "Job Site Zip Code","Job Site State",'');
//     end;
// }
