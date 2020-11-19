codeunit 50100 "Object Reservation Mgmt. TAL"
{
    procedure ReleaseField(var ReservedField: Record "Reserved Field TAL")
    begin
        ReservedField.DeleteAll();
    end;

    procedure ReleaseObject(var ReservedObject: Record "Reserved Object TAL")
    var
        ReservedField: Record "Reserved Field TAL";
    begin
        if ReservedObject.FindSet() then
            repeat
                ReservedField.SetRange("Object Type", ReservedObject."Object Type");
                ReservedField.SetRange("Object ID", ReservedObject."Object ID");
                ReleaseField(ReservedField);
            until ReservedObject.Next() = 0;
        ReservedObject.DeleteAll();
    end;

    procedure ReserveJournal(var ObjectReservationJnlLine: Record ObjectReservationJnlLineTAL)
    var
        ReservedObject: Record "Reserved Object TAL";

    begin

        if ObjectReservationJnlLine.FindSet() then
            repeat
                ReservedObject.Init();
                ReservedObject.TransferFields(ObjectReservationJnlLine);
                ReservedObject.Insert();
            until ObjectReservationJnlLine.Next() = 0;
        ReserveFields(ObjectReservationJnlLine."Batch Name");
        ObjectReservationJnlLine.DeleteAll();
    end;


    local procedure ReserveFields(BatchName: Code[20])
    var
        ReservedField: Record "Reserved Field TAL";
        FieldReservationJnlLine: Record FieldReservationJnlLineTAL;
    begin
        FieldReservationJnlLine.SetRange("Batch Name", BatchName);
        if FieldReservationJnlLine.FindSet() then
            repeat
                ReservedField.Init();
                ReservedField.TransferFields(FieldReservationJnlLine);
                ReservedField.Insert();
            until FieldReservationJnlLine.Next() = 0;
        FieldReservationJnlLine.DeleteAll();
    end;

    procedure SetName(BatchName: Code[20]; var ObjectReservJnlLine: Record ObjectReservationJnlLineTAL)
    begin
        ObjectReservJnlLine.FilterGroup := 2;
        ObjectReservJnlLine.SetRange("Batch Name", BatchName);
        ObjectReservJnlLine.FilterGroup := 0;
        if ObjectReservJnlLine.FindSet() then;
    end;

    procedure ValidateObjectID(ObjectType: Enum "Object Type TAL"; ObjectID: Integer)
    var

    begin

    end;

    procedure ValidateObjectName(ObjectType: Enum "Object Type TAL"; ObjectName: Text[30])
    var

    begin

    end;

    procedure ValidateFieldID(ObjectType: enum "Object Type TAL"; ObjectID: Integer; FieldID: Integer)
    var

    begin

    end;

    procedure ValidateFieldName()
    var

    begin

    end;
}