tableextension 50005 "HF CERP Posted Component" extends "CERP Posted Component"
{
    // version AI13.00,HL

    fields
    {
        //Unsupported feature: Property Modification (Name) on ""Storage Location Code"(Field 775)".

        //Unsupported feature: Code Modification on ""Storage Location Code"(Field 775).OnLookup".

        //trigger OnLookup()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        //AI13.00.05 CERP-1717 jim 4/9/21 begin
        TESTFIELD(Type,Type::Item);
        TESTFIELD("No.");
        TESTFIELD("Qty. to Adjust");
        IF StorageLocMgmt.StorageLocLookupFromLine("Qty. to Adjust" < 0,"Associated Document Type","Associated Document No.","Associated Change Order No.","Associated Contract Variant","Associated Line No.","Associated Comp. Line No.",
                "No.","Variant Code","Location Code",StorageLocCode)
          THEN VALIDATE("Storage Location Code",StorageLocCode);
        //AI13.00.05 CERP-1717 end
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        */
        //end;

        //Unsupported feature: Code Modification on ""Storage Location Code"(Field 775).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        //AI13.00.05 CERP-1717 jim 4/9/21 begin
        IF ("Storage Location Code" <> '')
          THEN
            BEGIN
              TESTFIELD(Type,Type::Item);
              TESTFIELD("No.");
            END;
        //AI13.00.05 CERP-1717 end
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        */
        //end;

        //Unsupported feature: Deletion (FieldCollection) on ""Product Picking Group Code"(Field 810)".
    }

    procedure GetPlannedResourceCapacity(): Decimal
    var
        Resource: Record "Resource";
    begin
        //HL JPU CC-633

        IF (Type <> Type::Resource) OR (NOT Resource.GET("No.")) THEN
            EXIT(0);

        EXIT(Resource."CERP Resource Unit Capacity" * "Qty. Per");
    end;
}
