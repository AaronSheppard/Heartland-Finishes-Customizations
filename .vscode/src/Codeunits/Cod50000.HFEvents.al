codeunit 50000 "HF Events"
{
    Trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterSalesOrderInsert(var Rec: Record "Sales Header"; RunTrigger: Boolean);
    begin
        if Rec."Document Type" <> Rec."Document Type"::Order then
            exit;
        Rec."HF Sales Order Creation Date" := Today();
        Rec.Modify();
    end;
}