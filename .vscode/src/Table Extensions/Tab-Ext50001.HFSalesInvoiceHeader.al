tableextension 50001 "HF Sales Invoice Header" extends "Sales Invoice Header"
{
    fields
    {
        field(50000; "HF Sales Order Creation Date"; Date)
        {
            Caption = 'Sales Order Creation Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
}