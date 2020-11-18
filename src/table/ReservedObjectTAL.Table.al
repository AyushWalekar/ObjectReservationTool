table 50100 "Reserved Object TAL"
{
    Caption = 'Reserved Object';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1;"Batch Name"; Code[20])
        {
            Caption = 'Batch Name';
            DataClassification = CustomerContent;
        }
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Object Type"; Enum "Object Type TAL")
        {
            Caption = 'Object Type';
            DataClassification = CustomerContent;
        }
        field(4; "Object ID"; Integer)
        {
            Caption = 'Object ID';
            DataClassification = CustomerContent;
        }
        field(5; "Object Name"; Text[30])
        {
            Caption = 'Object Name';
            DataClassification = CustomerContent;
        }
        field(6; "Reserved By"; Code[50])
        {
            Caption = 'Reserved By';
            DataClassification = CustomerContent;
        }
        field(7; "Reserved Date"; DateTime )
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