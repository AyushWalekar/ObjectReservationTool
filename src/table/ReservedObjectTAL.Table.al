table 50100 "Reserved Object TAL"
{
    Caption = 'Reserved Object';
    DataClassification = CustomerContent;
    LookupPageId = "Reserved Objects TAL";
    DrillDownPageId = "Reserved Objects TAL";

    fields
    {
        field(2; "Object Type"; Enum "Object Type TAL")
        {
            Caption = 'Object Type';
            DataClassification = CustomerContent;
        }
        field(3; "Object ID"; Integer)
        {
            Caption = 'Object ID';
            DataClassification = CustomerContent;
        }
        field(4; "Object Name"; Text[30])
        {
            Caption = 'Object Name';
            DataClassification = CustomerContent;
        }
        field(5; "Reserved By"; Code[50])
        {
            Caption = 'Reserved By';
            DataClassification = CustomerContent;
        }
        field(6; "Reserved Date"; DateTime)
        {
            Caption = 'Reserved Date';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Object Type", "Object ID")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "Reserved By" := Format(userid);
        "Reserved Date" := CurrentDateTime;
    end;

}