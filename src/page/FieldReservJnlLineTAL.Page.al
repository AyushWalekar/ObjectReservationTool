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

                field("Object Type"; Rec."Object Type")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Object Type.';
                    Editable = False;
                }

                field("Object ID"; Rec."Object ID")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Object ID.';
                    Editable = False;
                }

                field("Field ID"; Rec."Field ID")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Field ID.';

                    trigger OnValidate()
                    begin
                        //ObjectReservationMgmt.ValidateFieldID("Object Type", "Object ID", "Field ID");
                    end;

                }

                field("Field Name"; Rec."Field Name")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Field Name.';
                }

                field("Reserved By"; Rec."Reserved By")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Reserved By.';
                }

                field("Reserved Date"; Rec."Reserved Date")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Reserved Date.';
                }

            }
        }
    }
    var
        ObjectReservationMgmt: Codeunit "Object Reservation Mgmt. TAL";

}