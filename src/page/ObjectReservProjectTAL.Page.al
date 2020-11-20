page 50102 "Object Reserv. Project TAL"
{
    Caption = 'Object Reservation Projects';
    PageType = List;
    SourceTable = "ObjectReservationProjectTAL";
    layout
    {

        area(content)
        {
            repeater(Group)
            {

                field("Name"; Rec."Name")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Name.';
                }

                field("Description"; Rec."Description")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Description.';
                }

                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Assigned User ID".';
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Ëdit Journal")
            {
                Caption = 'Édit Journal';
                ApplicationArea = ObjectReservationAppAreaTAL;
                Image = OpenJournal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ShortCutKey = 'Return';
                ToolTip = 'Open a journal based on the project';
                trigger onAction()
                var
                    ObjectReservationJnlLine: Record ObjectReservationJnlLineTAL;
                begin
                    ObjectReservationJnlLine.FilterGroup := 2;
                    ObjectReservationJnlLine.SetRange("Project Code", Rec.Name);
                    ObjectReservationJnlLine.FilterGroup := 0;
                    ObjectReservationJnlLine."Project Code" := Rec.Name;

                    Page.Run(0, ObjectReservationJnlLine);
                end;
            }
        }
    }
    trigger OnDeleteRecord(): Boolean
    begin
        if not Confirm(StrSubstNo(ConfirmProjectDeleteLbl, Rec.Name), true) then
            exit(false);
    end;

    var
        ConfirmProjectDeleteLbl: Label 'This will delete the Object Reservation Journal Lines associated to Project %1', Comment = '%1 = Project Code', MaxLength = 80;

}