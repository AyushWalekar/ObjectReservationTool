table 50103 "Reserved Field TAL"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Object Type"; Enum "Object Type TAL")
        {
            Caption = 'Object Type';
            DataClassification = CustomerContent;
        }
        field(2; "Object ID"; Integer)
        {
            Caption = 'Object ID';
            DataClassification = CustomerContent;
        }
        field(3; "Field ID"; Integer)
        {
            Caption = 'Field ID';
            DataClassification = CustomerContent;
        }
        field(4; "Field Name"; Text[30])
        {
            Caption = 'Field Name';
            DataClassification = CustomerContent;
        }
        field(5; "Reserved By"; Code[50])
        {
            Caption = 'Reserved By';
            DataClassification = CustomerContent;
            TableRelation = User."User Name";
        }
        field(6; "Reserved Date"; DateTime)
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