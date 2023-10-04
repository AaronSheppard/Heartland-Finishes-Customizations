codeunit 53999 "HF Version Management"
{
    trigger OnRun()
    begin
    end;

    var
        // *********************************** CHANGE THIS TO CLIENT NAME ***********************************
        ClientExtensionName: Label 'Heartland Finishes Customizations v%1 with %2';

    local procedure VersionNo(): Text[30]
    var
        ModInfo: ModuleInfo;
        AppVer: Version;
    begin
        NavApp.GetCurrentModuleInfo(ModInfo);
        AppVer := ModInfo.AppVersion();
        exit(format(AppVer.Major()) + '.' + format(AppVer.Minor()) + '.' + format(AppVer.Build()) + '.' + format(Appver.Revision()));
    end;
    //     **************************************************************************************************
    /// <summary>
    /// Adds ApplicationVersion to Help
    /// </summary>
    /// <param name="ApplicationVersion">VAR Text[248].</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Application System Constants", 'OnAfterGetApplicationVersion', '', false, false)]
    procedure ApplicationVersion(var ApplicationVersion: Text[248])
    var
        AppSystemConstants: Codeunit "Application System Constants";
        cERPtocERP: Codeunit "CERP To cERP Integration";
        ApplicationBuild: Text[50];
        BuildBranch: Text[250];
    begin
        ApplicationBuild := AppSystemConstants.ApplicationBuild;
        BuildBranch := AppSystemConstants.BuildBranch;
        ApplicationVersion := StrSubstNo(ClientExtensionName, VersionNo(), ApplicationVersion);
    end;
}
