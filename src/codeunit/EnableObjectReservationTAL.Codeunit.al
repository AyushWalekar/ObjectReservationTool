codeunit 50102 "EnableObjectReservationTAL"
{
    var
        ProfileLbl: Label 'ObjectReservationProfile', Locked = true, MaxLength = 30;
        ObjectReservationAreaErr: label 'Object Reservation Area should be part of Dynamics 365 Business Central Essentials in order for the Object Reservation extension to work.', MaxLength = 200;


    [EventSubscriber(ObjectType::Codeunit, codeunit::"Application Area Mgmt.", 'OnGetEssentialExperienceAppAreas', '', false, false)]
    local procedure RegisterObjectReservationOnGetEssentialExperienceAppAreas(var TempApplicationAreaSetup: Record "Application Area Setup" temporary)
    begin
        TempApplicationAreaSetup.ObjectReservationAppAreaTAL := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Application Area Mgmt.", 'OnValidateApplicationAreas', '', false, false)]
    local procedure VerifyApplicationAreasOnValidateAppliactionAreas(ExperienceTierSetup: Record "Experience Tier Setup"; TempApplicationAreaSetup: Record "Application Area Setup" temporary)
    begin
        if ExperienceTierSetup.Essential then
            if not TempApplicationAreaSetup.ObjectReservationAppAreaTAL then
                Error(ObjectReservationAreaErr);
    end;

    procedure IsObjectReservationApplicationAreaEnabled(): Boolean
    var
        ApplicationAreaSetup: Record "Application Area Setup";
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
    begin
        if ApplicationAreaMgmtFacade.GetApplicationAreaSetupRecFromCompany(ApplicationAreaSetup, CompanyName()) then
            exit(ApplicationAreaSetup.ObjectReservationAppAreaTAL);
    end;

    procedure EnableObjectReservationExtension()
    var
        ApplicationAreaSetup: Record "Application Area Setup";
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
    begin
        if ApplicationAreaMgmtFacade.GetApplicationAreaSetupRecFromCompany(ApplicationAreaSetup, CompanyName()) then begin
            ApplicationAreaSetup.ObjectReservationAppAreaTAL := true;
            ApplicationAreaSetup.Modify();
            ApplicationAreaMgmtFacade.SetupApplicationArea();
        end;
    end;

    procedure AddBasicPermissionToAllUsers()
    var
        User: Record User;
        AccessControl: Record "Access Control";
        RoleId: Code[20];
        AppId: Text;
        Info: ModuleInfo;
    begin
        RoleId := 'OBJ RESERVE BASIC';
        NavApp.GetCurrentModuleInfo(Info);
        AppId := Info.Id();
        if User.FindSet() then
            repeat
                AccessControl.SetRange("User Security ID", User."User Security ID");
                AccessControl.SetRange("Role ID", RoleId);
                if AccessControl.IsEmpty() then begin
                    AccessControl.Init();
                    AccessControl.Validate("User Security ID", User."User Security ID");
                    AccessControl."Role ID" := RoleId;
                    AccessControl.Validate("App ID", AppId);
                    AccessControl.Validate(Scope, AccessControl.Scope::Tenant);
                    AccessControl.Insert(true);
                end;
            until User.Next() <= 0;
    end;

    procedure AddBasicPermissionToAllUserGroups()
    var
        UserGroup: Record "User Group";
        UserGroupPermissionSet: Record "User Group Permission Set";
        RoleId: Code[20];
        AppId: Text;
        Info: ModuleInfo;
    begin
        RoleId := 'OBJ RESERVE BASIC';
        NavApp.GetCurrentModuleInfo(Info);
        AppId := Info.Id();
        if UserGroup.FindSet() then
            repeat
                UserGroupPermissionSet.SetRange("User Group Code", UserGroup.Code);
                UserGroupPermissionSet.SetRange("Role ID", RoleId);
                if UserGroupPermissionSet.IsEmpty() then begin
                    UserGroupPermissionSet.Init();
                    UserGroupPermissionSet.Validate("User Group Code", UserGroup.Code);
                    UserGroupPermissionSet."Role ID" := RoleId;
                    UserGroupPermissionSet.Validate("App ID", AppId);
                    UserGroupPermissionSet.Validate(Scope, UserGroupPermissionSet.Scope::Tenant);
                    UserGroupPermissionSet.Insert(true);
                end;
            until UserGroup.Next() <= 0;
    end;

    procedure DisplayInRoleExplorer()
    var
        AllProfile: Record "All Profile";
        Info: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(Info);
        AllProfile.SetRange("App ID", Info.Id());
        AllProfile.SetRange("Profile ID", ProfileLbl);
        if AllProfile.FindFirst() then begin
            AllProfile.Validate(Promoted, true);
            AllProfile.Modify(true);
        end;
    end;
}