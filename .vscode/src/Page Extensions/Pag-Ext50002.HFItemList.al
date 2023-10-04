pageextension 50002 "HF Item List" extends "Item List"
{
    layout
    {
        addlast(Control1)
        {
            field("HF locQtyAvailable"; locQtyAvailable)
            {
                ApplicationArea = All;
                Caption = 'Qty. Available';
                ToolTip = 'Specifies the value of the Qty. Available field.';
            }
        }
    }
    var
        locQtyAvailable: Decimal;

    trigger OnAfterGetRecord()
    begin
        HFGetQtyAvailable();
    end;

    local procedure HFGetQtyAvailable() qtyAvailable: Decimal
    begin
        // Heartland CC-978 WWC Start
        Rec.CALCFIELDS(Inventory, "Qty. on Sales Order", "CERP Qty on Shop/WO Comps");
        locQtyAvailable := Rec.Inventory - Rec."CERP Qty on Shop/WO Comps" - Rec.CERPQtyOnMaterialList() - Rec."CERP Qty On Sales Order";
        EXIT(locQtyAvailable);
        // Heartland CC-978 WWC End
    end;
}