tableextension 50000 "HF Sales Header" extends "Sales Header"
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