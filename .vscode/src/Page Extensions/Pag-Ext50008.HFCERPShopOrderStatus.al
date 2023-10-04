pageextension 50008 "HF CERP Shop Order Status" extends "CERP Shop Order Status"
{
    layout
    {
        addlast(Group)
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