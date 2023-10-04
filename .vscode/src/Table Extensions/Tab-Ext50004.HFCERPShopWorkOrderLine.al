tableextension 50004 "HF CERP Shop_Work Order Line" extends "CERP Shop/Work Order Line"
{
    // version AI13.00.02,HL

    fields
    {
    }
    keys
    {
    }

    procedure GetPlannedResCapacity() Total: Decimal
    var
        Component: Record "CERP Component";
    begin
        //HL JPU CC-633

        Component.SETRANGE("Document Type", "Component Doc. Type");
        Component.SETRANGE("Document No.", "Component Doc. No.");
        Component.SETRANGE("Line No.", "Component Line No.");
        Component.SETRANGE("Parent Component Line No.", "Component Parent Line No.");
        Component.SETRANGE(Blocked, FALSE);
        Component.SETRANGE(Type, Component.Type::Resource);
        IF Component.FINDSET THEN
            REPEAT
                Total += Component.GetPlannedResourceCapacity * Quantity;
            UNTIL Component.NEXT = 0;

        EXIT(Total);
    end;
}
