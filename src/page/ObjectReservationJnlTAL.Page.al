page 50101 "ObjectReservationJnlTAL"
{
    Caption = 'Object Reservation Journal';
    PageType = Worksheet;
    SourceTable = "ObjectReservationJnlLineTAL";
    DelayedInsert = true;
    UsageCategory = Lists;
    ApplicationArea = ObjectReservationAppAreaTAL;

    layout
    {

        area(content)
        {
            repeater(Group)
            {

                field("Batch Name"; Rec."Batch Name")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Batch Name.';
                }

                field("Object Type"; Rec."Object Type")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Object Type.';
                }

                field("Object ID"; Rec."Object ID")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Object ID.';
                }

                field("Object Name"; Rec."Object Name")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Object Name.';
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

    actions
    {
        area(Processing)
        {
            action(SuggestObjectIDs)
            {
                ApplicationArea = ObjectReservationAppAreaTAL;
                ToolTip = 'Provides suggestion for object IDs based on available ranges';
                Image = Suggest;

                trigger OnAction()
                begin
                    // code to be added
                end;
            }
            action(Reserve)
            {
                ApplicationArea = ObjectReservationAppAreaTAL;
                ToolTip = 'Reserves the Object and Field IDs ';
                Image = Reserve;

                trigger OnAction()
                begin

                end;
            }

        }
        area(Navigation)
        {
            action(ReserveFields)
            {
                ApplicationArea = ObjectReservationAppAreaTAL;
                ToolTip = 'Reserve fields for current object';
                Image = Reserve;
                RunObject = page "Field Reserv. Jnl Line TAL";
                RunPageLink = "Object Type" = field("Object Type"), "Object ID" = field("Object ID");
            }
        }
    }

}