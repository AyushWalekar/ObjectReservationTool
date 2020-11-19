page 50103 "Reserved Fields TAL"
{
    Caption = 'Reserved Fields';
    PageType = List;
    SourceTable = "Reserved Field TAL";
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

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

                field("Field ID"; Rec."Field ID")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Field ID.';
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
    actions
    {
        area(Processing)
        {
            action(Release)
            {
                ApplicationArea = ObjectReservationAppAreaTAL;
                Image = ReleaseDoc;
                ToolTip = 'Release The Selected Fields';
                trigger OnAction()
                var
                    ObjectReservationMgmt: Codeunit "Object Reservation Mgmt. TAL";
                    Rec2: Record "Reserved Field TAL";
                begin
                    CurrPage.SetSelectionFilter(Rec2);
                    if Rec2.Count > 0 then
                        ObjectReservationMgmt.ReleaseField(Rec2);
                end;
            }
        }
    }

}