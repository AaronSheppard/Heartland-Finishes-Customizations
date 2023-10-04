pageextension 50004 "HF CERP Shop Order Card" extends "CERP Shop Order Card"
{
    layout
    {
        addlast(General)
        {
            field("HF GetTotalPlannedResCap"; Rec.GetTotalPlannedResCap)
            {
                ApplicationArea = All;
                Caption = 'Total Planned Resource Capacity';
                ToolTip = 'Specifies the value of the Total Planned Resource Capacity field.';
            }
            field("HF Total Actual Time Entry Qty"; Rec."HF Total Actual Time Entry Qty")
            {
                ApplicationArea = All;
                Caption = 'Total Actual Time Entry Qty';
                ToolTip = 'Specifies the value of the Total Actual Time Entry Qty field.';
            }
        }
    }
}