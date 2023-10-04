// report 50014 "Temp Update WIP Posting Group"
// {
//     ProcessingOnly = true;

//     dataset
//     {
//         dataitem(DataItem1102621000; Table37)
//         {
//             DataItemTableView = WHERE(Contract No.=FILTER(<>''),
//                                       Type=CONST(Item));

//             trigger OnAfterGetRecord()
//             var
//                 Item: Record Item;
//                 Purchasing: Record "5721";
//             begin
//                 IF Purchasing.GET("Purchasing Code") AND (Purchasing."Purchase from Contract") THEN BEGIN
//                   IF Item.GET("No.") AND (Item."WIP Inventory Posting Group" <> '') AND (Item."WIP Inventory Posting Group" <> "Posting Group") THEN BEGIN
//                     "Posting Group" := Item."WIP Inventory Posting Group";
//                     MODIFY;
//                   END;
//                 END;
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
//     }
// }
