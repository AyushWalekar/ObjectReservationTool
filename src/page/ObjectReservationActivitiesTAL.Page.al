page 50107 "ObjectReservationActivitiesTAL"
{
    Caption = 'Object Reservation Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = ObjectReservationCueTAL;
    ShowFilter = false;

    layout
    {
        area(Content)
        {
            cuegroup("Object Reservation Activity")
            {
                field("Reserved Objects"; Rec."Reserved Objects")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    DrillDownPageId = "Reserved Objects TAL";
                    ToolTip = 'This will show all reserved objects';
                }
                field("Objects to be reserved"; Rec."Objects to be reserved")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    DrillDownPageId = ObjectReservationJnlTAL;
                    ToolTip = 'This will show all objects that are currently present on Object Reservation Journal';
                }
                field("Number of Projects"; Rec."Number of Projects")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    DrillDownPageId = "Object Reserv. Project TAL";
                    ToolTip = 'This will show all the projects that can be used on Object Reservation Journal';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Set Up Cues")
            {
                Caption = 'Set Up Cues';
                ToolTip = 'Set up the cues (status tiles) related to the role.';
                ApplicationArea = ObjectReservationAppAreaTAL;
                Image = Setup;

                trigger OnAction()
                var
                    CuesAndKPIs: Codeunit "Cues And KPIs";
                    CueRecordRef: RecordRef;
                begin
                    CueRecordRef.GetTable(Rec);
                    CuesAndKPIs.OpenCustomizePageForCurrentUser(CueRecordRef.Number());
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

}