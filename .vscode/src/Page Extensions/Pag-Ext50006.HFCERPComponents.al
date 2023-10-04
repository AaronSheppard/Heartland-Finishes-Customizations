pageextension 50006 "HF CERP Components" extends "CERP Components"
{
    layout
    {
        addlast(Control1000000000)
        {
            field("HF Vendor Line Discount"; Rec."Vendor Line Discount")
            {
                ApplicationArea = All;
                Caption = 'Vendor Line Discount';
                ToolTip = 'Specifies the value of the Vendor Line Discount field.';
            }
            field("HF GetPlannedResourceCapacity"; Rec.GetPlannedResourceCapacity)
            {
                ApplicationArea = All;
                Caption = 'Planned Resource Capacity';
                ToolTip = 'Specifies the value of the Planned Resource Capacity field.';
            }
        }
    }
}