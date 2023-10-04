pageextension 50003 "HF CERP Material Component" extends "CERP Material Component"
{
    layout
    {
        addlast(Group)
        {
            field("HF GetPlannedResourceCapacity"; GetPlannedResourceCapacity)
            {
                ApplicationArea = All;
                Caption = 'Planned Resource Capacity';
                ToolTip = 'Specifies the value of the Planned Resource Capacity field.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        GetPlannedResourceCapacity();
    end;

    local procedure GetPlannedResourceCapacity(): Decimal
    var
        Resource: Record Resource;
    begin
        //HL JPU CC-633
        IF (Rec.Type <> Rec.Type::Resource) OR (NOT Resource.GET(Rec."No.")) THEN
            EXIT(0);
        EXIT(Resource."CERP Resource Unit Capacity" * Rec."Qty. Per");
    end;
}