table 50105 "ObjectReservationCueTAL"
{
    Caption = 'Object Reservation Cue';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Reserved Objects"; Integer)
        {
            Caption = 'Reserved Objects';
            FieldClass = FlowField;
            CalcFormula = count("Reserved Object TAL");
        }
        field(3; "Objects to be reserved"; Integer)
        {
            Caption = 'Objects to be reserved';
            FieldClass = FlowField;
            CalcFormula = count(ObjectReservationJnlLineTAL);
        }
        field(4; "Number of Projects"; Integer)
        {
            Caption = 'Number of Projects';
            FieldClass = FlowField;
            CalcFormula = count("ObjectReservationProjectTAL");
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}