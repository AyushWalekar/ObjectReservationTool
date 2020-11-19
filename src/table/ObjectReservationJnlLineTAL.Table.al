table 50101 "ObjectReservationJnlLineTAL"
{
    Caption = 'Object Reservation Journal Line';
    DataClassification = ToBeClassified;
    LookupPageId = ObjectReservationJnlTAL;
    DrillDownPageId = ObjectReservationJnlTAL;

    fields
    {
        field(1; "Batch Name"; Code[20])
        {
            Caption = 'Batch Name';
            DataClassification = CustomerContent;
            TableRelation = ObjectReservationJnlBatchTAL.Name;
        }

        field(2; "Object Type"; Enum "Object Type TAL")
        {
            Caption = 'Object Type';
            DataClassification = CustomerContent;
        }
        field(3; "Object ID"; Integer)
        {
            Caption = 'Object ID';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                ObjectReservationMgmt.ValidateObjectID("Object Type", "Object ID");
            end;
        }
        field(4; "Object Name"; Text[30])
        {
            Caption = 'Object Name';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                ObjectReservationMgmt.ValidateObjectName("Object Type", "Object Name");
            end;
        }
        field(5; "Reserved By"; Code[50])
        {
            Caption = 'Reserved By';
            DataClassification = CustomerContent;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(6; "Reserved Date"; DateTime)
        {
            Caption = 'Reserved Date';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Batch Name", "Object Type", "Object ID")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "Reserved By" := format(UserId);
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    var
        FieldReservationJnlLine: Record FieldReservationJnlLineTAL;
    begin
        FieldReservationJnlLine.SetRange("Batch Name", rec."Batch Name");
        FieldReservationJnlLine.SetRange("Object Type", Rec."Object Type");
        FieldReservationJnlLine.SetRange("Object ID", Rec."Object ID");
        if not FieldReservationJnlLine.IsEmpty() then
            FieldReservationJnlLine.DeleteAll();
    end;

    trigger OnRename()
    begin

    end;

    var
        ObjectReservationMgmt: Codeunit "Object Reservation Mgmt. TAL";

}