table 50103 "Reserved Field TAL"
{
    DataClassification = CustomerContent;
    LookupPageId = "Reserved Fields TAL";
    DrillDownPageId = "Reserved Fields TAL";

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
        field(4; "Field ID"; Integer)
        {
            Caption = 'Field ID';
            DataClassification = CustomerContent;
        }
        field(5; "Field Name"; Text[30])
        {
            Caption = 'Field Name';
            DataClassification = CustomerContent;
        }
        field(6; "Reserved By"; Code[50])
        {
            Caption = 'Reserved By';
            DataClassification = CustomerContent;
            TableRelation = User."User Name";
        }
        field(7; "Reserved Date"; DateTime)
        {
            Caption = 'Reserved Date';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Object Type", "Object ID", "Field ID")
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