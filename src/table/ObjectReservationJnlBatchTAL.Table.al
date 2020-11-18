table 50102 "ObjectReservationJnlBatchTAL"
{
    Caption = 'Object Reservation Journal Batch';
    DataClassification = CustomerContent;
    LookupPageId = "Object Reserv. Jnl Batch TAL";
    DrillDownPageId = "Object Reserv. Jnl Batch TAL";

    fields
    {
        field(1; "Name"; Code[20])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Assigned User ID"; Code[50])
        {
            Caption = 'Assigned User ID"';
            DataClassification = CustomerContent;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
    }

    keys
    {
        key(PK; Name)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "Assigned User ID" := format(UserId);
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    var
        ObjectReservationJnlLine: Record ObjectReservationJnlLineTAL;
    begin
        ObjectReservationJnlLine.SetRange("Batch Name", Rec.Name);
        if not ObjectReservationJnlLine.IsEmpty() then
            ObjectReservationJnlLine.DeleteAll(true);
    end;

    trigger OnRename()
    begin

    end;

}