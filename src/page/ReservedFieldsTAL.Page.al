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