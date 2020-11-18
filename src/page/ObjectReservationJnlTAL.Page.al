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
            field("Batch Name"; BatchName)
            {
                Caption = 'Batch Name';
                ApplicationArea = ObjectReservationAppAreaTAL;
                Tooltip = 'Specifies the Batch Name.';
            }

            repeater(Group)
            {
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
                    ;
                end;
            }
            action(Reserve)
            {
                ApplicationArea = ObjectReservationAppAreaTAL;
                ToolTip = 'Reserves the Object and Field IDs ';
                Image = Reserve;

                trigger OnAction()
                var
                    ObjectReservationMgmt: Codeunit "Object Reservation Mgmt. TAL";
                begin
                    ObjectReservationMgmt.ReserveJournal(Rec);
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
                RunPageLink = "Batch Name" = field("Batch Name"), "Object Type" = field("Object Type"), "Object ID" = field("Object ID");
            }
        }
    }
    trigger OnOpenPage()
    begin
        //to be done

    end;


    var
        BatchName: Code[20];


}