table 50101 "ObjectReservationJnlLineTAL"
{
    Caption = 'Object Reservation Journal Line';
    DataClassification = ToBeClassified;
    LookupPageId = ObjectReservationJnlTAL;
    DrillDownPageId = ObjectReservationJnlTAL;

    fields
    {
        field(1; "Project Code"; Code[20])
        {
            Caption = 'Project Code';
            DataClassification = CustomerContent;
            TableRelation = "ObjectReservationProjectTAL".Name;
            NotBlank = true;
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
                if ObjectReservationMgmt.IsIdValid("Object ID") then
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
            Caption = 'Created By';
            DataClassification = CustomerContent;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(6; "Reserved Date"; DateTime)
        {
            Caption = 'Created Date';
            DataClassification = CustomerContent;
        }
        field(7; "ID Range"; Integer)
        {
            Caption = 'ID Range';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Project Code", "Object Type", "Object ID")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "Reserved By" := format(UserId);
        "Reserved Date" := CurrentDateTime;
    end;

    trigger OnDelete()
    var
        FieldReservationJnlLine: Record FieldReservationJnlLineTAL;
    begin
        FieldReservationJnlLine.SetRange("Project Code", rec."Project Code");
        FieldReservationJnlLine.SetRange("Object Type", Rec."Object Type");
        FieldReservationJnlLine.SetRange("Object ID", Rec."Object ID");
        if not FieldReservationJnlLine.IsEmpty() then
            FieldReservationJnlLine.DeleteAll();
    end;

    var
        ObjectReservationMgmt: Codeunit "Object Reservation Mgmt. TAL";

}