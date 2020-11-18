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

                field("Batch Name"; "Batch Name")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Project Name.';
                }

                field("Object Type"; "Object Type")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Object Type.';
                }

                field("Object ID"; "Object ID")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Object ID.';
                }

                field("Object Name"; "Object Name")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Object Name.';
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
    actions
    {
        area(Creation)
        {
            group("Reservation")
            {
                Caption = 'Reservation';
                Image = CreateDocument;
                action("Create Reservation")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Caption = 'Create Reservation';
                    Image = Create;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Create Reseravation';
                    trigger OnAction()
                    var
                        ObjectResJnl: Page ObjectReservationJnlTAL;
                    begin
                        ObjectResJnl.Run();
                    end;
                }
            }
            action(Batches)
            {
                ApplicationArea = ObjectReservationAppAreaTAL;
                Caption = 'Batches';
                Image = Description;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Available Batches';
                trigger OnAction()
                var
                    ObjectReservJnlBatch: Page "Object Reserv. Jnl Batch TAL";
                begin
                    ObjectReservJnlBatch.Run();
                end;
            }

        }
        area(Navigation)
        {
            action("Reserved Fields")
            {
                ApplicationArea = ObjectReservationAppAreaTAL;
                Caption = 'Reserved Fields';
                Image = Reserve;
                Promoted = true;
                ToolTip = 'Reserved Fields ID for the Object';
                trigger OnAction()
                var
                    ReservedFields: Page "Reserved Fields TAL";
                begin
                    ReservedFields.Run();
                end;
            }
        }
    }

}