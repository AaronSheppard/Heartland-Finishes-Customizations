tableextension 50002 "HF CERP Component" extends "CERP Component"
{
    fields
    {
    }
    procedure GetPlannedResourceCapacity(): Decimal
    var
        Resource: Record Resource;
    begin
        //HL JPU CC-633

        IF (Type <> Type::Resource) OR (NOT Resource.GET("No.")) THEN
            EXIT(0);

        EXIT(Resource."CERP Resource Unit Capacity" * "Qty. Per");
    end;
}
