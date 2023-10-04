pageextension 50001 "HF Posted Sales Invoice" extends "Posted Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("HF Sales Order Creation Date"; Rec."HF Sales Order Creation Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sales Order Creation Date field.';
            }
        }
    }
}