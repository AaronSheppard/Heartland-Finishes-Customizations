pageextension 50000 "HF Sales Order" extends "Sales Order"
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