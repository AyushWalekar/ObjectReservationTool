codeunit 50101 "InstallObjectReservationTAL"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        EnableObjectReservation: codeunit EnableObjectReservationTAL;
    begin
        if EnableObjectReservation.IsObjectReservationApplicationAreaEnabled() then
            exit;

        EnableObjectReservation.AddBasicPermissionToAllUsers();
        EnableObjectReservation.AddBasicPermissionToAllUserGroups();
        EnableObjectReservation.EnableObjectReservationExtension();
        EnableObjectReservation.DisplayInRoleExplorer();
    end;
}