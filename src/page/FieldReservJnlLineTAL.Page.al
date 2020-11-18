page 50104 "Field Reserv. Jnl Line TAL"
{
    Caption = 'Field Reservation Journal Line';
    PageType = List;
    SourceTable = "FieldReservationJnlLineTAL";

    layout
    {

        area(content)
        {
            repeater(Group)
            {

                field("Object Type"; "Object Type")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Object Type.';
                    Editable = False;
                }

                field("Object ID"; "Object ID")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Object ID.';
                    Editable = False;
                }

                field("Field ID"; "Field ID")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Field ID.';
                }

                field("Field Name"; "Field Name")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Field Name.';
                }

                field("Reserved By"; "Reserved By")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Reserved By.';
                }

                field("Reserved Date"; "Reserved Date")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Reserved Date.';
                }

            }
        }
    }

}