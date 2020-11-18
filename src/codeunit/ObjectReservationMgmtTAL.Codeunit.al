codeunit 50100 "Object Reservation Mgmt. TAL"
{
    procedure ReleaseFieldID(Rec: Record "Reserved Field TAL")
    begin
        Rec.DeleteAll();
    end;

    procedure ReleaseObjectID(Rec: Record "Reserved Object TAL")
    var
        ReservedField: Record "Reserved Field TAL";
    begin
        if Rec.FindSet() then
            repeat
                ReservedField.SetRange("Object Type", Rec."Object Type");
                ReservedField.SetRange("Object ID", Rec."Object ID");
                ReleaseFieldID(ReservedField);
            until Rec.Next() = 0;
        Rec.DeleteAll();
    end;

    procedure ReserveJournal(Rec: Record ObjectReservationJnlLineTAL)
    begin

    end;
}