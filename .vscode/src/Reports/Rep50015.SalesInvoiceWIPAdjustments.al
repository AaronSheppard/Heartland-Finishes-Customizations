report 50015 "Sales Invoice WIP Adjustments"
{
    DefaultLayout = RDLC;
    RDLCLayout = '.vscode/src/Reports/Layouts/Sales Invoice WIP Adjustments.rdlc';

    dataset
    {
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            DataItemTableView = WHERE("CERP Contract No." = FILTER(<> ''),
                                      Type = CONST(Item));
            column(DocumentNo; "Sales Invoice Line"."Document No.")
            {
            }
            column(LineNo; "Sales Invoice Line"."Line No.")
            {
            }
            column(ItemNo; "Sales Invoice Line"."No.")
            {
            }
            column(PostingGroup; "Sales Invoice Line"."Posting Group")
            {
            }
            column(WIPPostingGroup; Item."CERP WIP Inv. Posting Group")
            {
            }
            column(Quantity; "Sales Invoice Line".Quantity)
            {
            }
            column(UnitCost; "Sales Invoice Line"."Unit Cost (LCY)")
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF (NOT Purchasing.GET("Purchasing Code")) OR (NOT Purchasing."CERP Purchase from Contract") THEN
                    CurrReport.SKIP;
                IF (NOT Item.GET("No.")) OR (Item."CERP WIP Inv. Posting Group" = '') OR (Item."CERP WIP Inv. Posting Group" = "Posting Group") THEN
                    CurrReport.SKIP;
            end;
        }
    }

    requestpage
    {
        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Item: Record Item;
        Purchasing: Record Purchasing;
}
