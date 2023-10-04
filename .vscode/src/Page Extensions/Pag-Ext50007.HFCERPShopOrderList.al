pageextension 50007 "HF CERP Shop Order List" extends "CERP Shop Order List"
{
    layout
    {
        addlast(Control1000000000)
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
            field("HF RemainingShopTime"; (Rec.GetTotalPlannedResCap - Rec."HF Total Actual Time Entry Qty"))
            {
                ApplicationArea = All;
                Caption = 'Remaining Shop Time';
                ToolTip = 'Specifies the value of the Remaining Shop Time field.';
            }
            field("HF GetRemainingPlannedShopTime"; Rec.GetRemainingPlannedShopTime)
            {
                ApplicationArea = All;
                Caption = 'Remaining Planned Shop Time';
                ToolTip = 'Specifies the value of the Remaining Planned Shop Time field.';
            }
        }
    }
}