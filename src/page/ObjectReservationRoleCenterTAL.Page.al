page 50105 "ObjectReservationRoleCenterTAL"
{
    PageType = RoleCenter;
    Caption = 'Object Reservation Role Center';

    layout
    {
        area(RoleCenter)
        {
            part(Headline; "ObjectReservationRCHeadLineTAL")
            {
                ApplicationArea = ObjectReservationAppAreaTAL;
            }
            part(Activities; "ObjectReservationActivitiesTAL")
            {
                ApplicationArea = ObjectReservationAppAreaTAL;
            }
        }
    }
    actions
    {
        area(Sections)
        {
            group(Process)
            {
                Caption = 'Object Reservation Entries';
                ToolTip = 'Overview about Object Reseravtion Tool';
                Image = ExecuteBatch;

                action("Reserved Objects")
                {
                    Caption = 'Reserved Objects';
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    RunObject = Page "Reserved Objects TAL";
                    ToolTip = 'Show all Reserved Objects';
                }
                action("Object Reservation Journal")
                {
                    Caption = 'Object Reservation Journal';
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    RunObject = Page ObjectReservationJnlTAL;
                    ToolTip = 'Show all objects that are currently present on Object Reservation Journal';
                }
                action("Object Reservation Batch")
                {
                    Caption = 'Object Reservation Batch';
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    RunObject = Page "Object Reserv. Jnl Batch TAL";
                    ToolTip = 'Show all batches related to Object Reservation';
                }
            }
        }
    }
}