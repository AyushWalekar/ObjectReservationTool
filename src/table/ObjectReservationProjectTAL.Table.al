table 50102 "ObjectReservationProjectTAL"
{
    Caption = 'Object Reservation Project';
    DataClassification = CustomerContent;
    LookupPageId = "Object Reserv. Project TAL";
    DrillDownPageId = "Object Reserv. Project TAL";

    fields
    {
        field(1; "Name"; Code[20])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
            NotBlank = true;
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

    trigger OnDelete()
    var
        ObjectReservationJnlLine: Record ObjectReservationJnlLineTAL;
    begin
        ObjectReservationJnlLine.SetRange("Project Code", Rec.Name);
        if not ObjectReservationJnlLine.IsEmpty() then
            ObjectReservationJnlLine.DeleteAll(true);
    end;

    trigger OnRename()
    begin
        Error(ProjectRenameErr);
    end;

    var
        ProjectRenameErr: Label 'Renaming Project is not allowed', MaxLength = 30;
}