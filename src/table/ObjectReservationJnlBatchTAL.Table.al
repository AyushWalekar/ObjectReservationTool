table 50102 "ObjectReservationJnlBatchTAL"
{
    Caption = 'Object Reservation Journal Batch';
    DataClassification = CustomerContent;

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

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}