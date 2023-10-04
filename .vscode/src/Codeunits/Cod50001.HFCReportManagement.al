codeunit 50001 "HF C Report Management"
{
    [EventSubscriber(ObjectType::Codeunit, codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure OnAfterSubstituteReport(ReportId: Integer; var NewReportId: Integer)
    begin
        case ReportId of
            REPORT::"Account Schedule":
                ; //NewReportId := REPORT::"Account Schedule"; TODO: replace with 50000 version
        end;
    end;
}