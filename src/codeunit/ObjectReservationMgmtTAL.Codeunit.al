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

    procedure ValidateFieldName(ObjectType: enum "Object Type TAL"; ObjectID: Integer; FieldName: Text[30])
    var

    begin

    end;

    procedure SuggestObjects(ObjectsArray: array[12] of Integer; StartId: Integer; EndId: Integer)
    var
        ObjectReservationJnlLine: Record ObjectReservationJnlLineTAL;
        Counter: Integer;
        maxValue: Integer;

    begin
        maxValue := 0;
        for Counter := 1 to 12 do
            if ObjectsArray[Counter] > maxValue then
                maxValue := ObjectsArray[Counter];

        if not CheckObjectRangeAvailability(maxValue, StartId, EndId) then
            Error(CouldnotReserveErr)
        else
            for counter := StartingIDtoReserve to (StartingIDtoReserve + maxValue - 1) do begin
                ObjectReservationJnlLine.Init();
                ObjectReservationJnlLine."Batch Name" := '';
                ObjectReservationJnlLine."Object Type" := ObjectReservationJnlLine."Object Type"::Codeunit;
                ObjectReservationJnlLine.Validate("Object ID", Counter);
                ObjectReservationJnlLine.Insert(true);
            end;

    end;

    local procedure CheckObjectRangeAvailability(ObjectCount: Integer; StartId: Integer; EndId: Integer): Boolean
    var
        counter: Integer;
        counter1: Integer;
        ObjectAvailable: Boolean;
    begin
        for counter := StartId to (EndId - ObjectCount) do begin
            for counter1 := counter to (counter + ObjectCount) do begin
                ObjectAvailable := CheckObjectAvailability(counter1);
                if not ObjectAvailable then begin
                    counter := counter1;
                    break;
                end;
            end;
            if ObjectAvailable then begin
                StartingIDtoReserve := counter;
                exit(true);
            end;
        end;
        exit(ObjectAvailable);
    end;

    local procedure CheckObjectAvailability(ObjectId: Integer): Boolean
    var
        ReservedObject: Record "Reserved Object TAL";
        ObjectReservationJnlLine: Record ObjectReservationJnlLineTAL;
        AllObject: Record AllObjWithCaption;
        LicensePermission: Record "License Permission";

    begin
        //ReservedObject.SetRange("Object Type", ObjectType);
        ReservedObject.SetRange("Object ID", ObjectId);
        if not ReservedObject.IsEmpty() then
            exit(false);
        ObjectReservationJnlLine.SetRange("Object ID", ObjectId);
        if not ObjectReservationJnlLine.IsEmpty() then
            exit(false);
        //AllObject.SetRange("Object Type", ObjectType);
        AllObject.SetRange("Object ID", ObjectId);
        if not AllObject.IsEmpty() then
            exit(false);
        //LicensePermission.SetRange("Object Type", ObjectType);
        // LicensePermission.SetRange("Object Number", ObjectId);
        // if not LicensePermission.IsEmpty() then
        //     exit(false);
        exit(true);
    end;

    var
        StartingIDtoReserve: Integer;
        CouldnotReserveErr: Label 'Could not reserve the object IDs';
}