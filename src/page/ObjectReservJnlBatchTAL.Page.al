page 50102 "Object Reserv. Jnl Batch TAL"
{
    Caption = 'ObjectReservationJnlBatchTAL List';
    PageType = List;
    SourceTable = "ObjectReservationJnlBatchTAL";
    layout
    {

        area(content)
        {
            repeater(Group)
            {

                field("Name"; "Name")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Name.';
                }

                field("Description"; "Description")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Description.';
                }

                field("Assigned User ID"; "Assigned User ID")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Assigned User ID".';
                }

            }
        }
    }

}