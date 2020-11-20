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
                Caption = 'Object Reservation';
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
                action("Object Reservation Project")
                {
                    Caption = 'Object Reservation Project';
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    RunObject = Page "Object Reserv. Project TAL";
                    ToolTip = 'Show all projects related to Object Reservation';
                }
            }
            group(SuggestObjectIds)
            {
                Caption = 'Suggest IDs';
                ToolTip = 'Get Suggestion about Ids that can be reserved';
                Image = ExecuteBatch;
                action("Suggest Object Ids")
                {
                    Caption = 'Suggest Object IDs';
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    RunObject = Report "Suggest Objects TAL";
                    ToolTip = 'Runs the report that inserts record in Object Reservation Journal based on available IDs';
                }
            }
        }
    }
}