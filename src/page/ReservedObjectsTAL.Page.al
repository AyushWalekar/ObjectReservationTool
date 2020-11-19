page 50100 "Reserved Objects TAL"
{
    Caption = 'Reserved Objects';
    PageType = List;
    SourceTable = "Reserved Object TAL";
    UsageCategory = Lists;
    ApplicationArea = ObjectReservationAppAreaTAL;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

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
            action("Create Reservation")
            {
                ApplicationArea = ObjectReservationAppAreaTAL;
                Caption = 'Create Reservation';
                Image = CreateDocument;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Create Reseravation';
                RunObject = page ObjectReservationJnlTAL;
                trigger OnAction()
                begin

                end;
            }
            action(Release)
            {
                ApplicationArea = ObjectReservationAppAreaTAL;
                Image = ReleaseDoc;
                ToolTip = 'Release The Selected Object';
                trigger OnAction()
                var
                    ObjectReservationMgmt: Codeunit "Object Reservation Mgmt. TAL";
                    Rec2: Record "Reserved Object TAL";
                begin
                    CurrPage.SetSelectionFilter(Rec2);
                    if Rec2.Count > 0 then
                        ObjectReservationMgmt.ReleaseObject(Rec2);
                end;
            }
        }
        area(Navigation)
        {
            action(Batches)
            {
                ApplicationArea = ObjectReservationAppAreaTAL;
                Caption = 'Batches';
                Image = Description;
                ToolTip = 'Available Batches';
                RunObject = page "Object Reserv. Jnl Batch TAL";
                trigger OnAction()
                begin

                end;
            }
            action("Reserved Fields")
            {
                ApplicationArea = ObjectReservationAppAreaTAL;
                Caption = 'Reserved Fields';
                Image = Reserve;
                ToolTip = 'Reserved Fields ID for the Object';
                RunObject = Page "Reserved Fields TAL";
                RunPageLink = "Object ID" = field("Object ID"), "Object Type" = field("Object Type");
                trigger onAction()
                begin

                end;
            }
        }
    }

}