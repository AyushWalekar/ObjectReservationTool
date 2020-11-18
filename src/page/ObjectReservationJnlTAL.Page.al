page 50101 "ObjectReservationJnlTAL"
{
    Caption = 'ObjectReservationJnlLineTAL';
    PageType = Worksheet;
    SourceTable = "ObjectReservationJnlLineTAL";
    DelayedInsert = true;
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {

        area(content)
        {
            repeater(Group)
            {

                field("Batch Name"; Rec."Batch Name")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the Batch Name.';
                }

                field("Object Type"; Rec."Object Type")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the Object Type.';
                }

                field("Object ID"; Rec."Object ID")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the Object ID.';
                }

                field("Object Name"; Rec."Object Name")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the Object Name.';
                }

                field("Reserved By"; Rec."Reserved By")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the Reserved By.';
                }

                field("Reserved Date"; Rec."Reserved Date")
                {
                    ApplicationArea = All;
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
                ApplicationArea = All;
                ToolTip = 'Provides suggestion for object IDs based on available ranges';
                Image = Suggest;

                trigger OnAction()
                begin
                    // code to be added
                end;
            }
            action(Release)
            {
                ApplicationArea = All;
                ToolTip = 'Release the object';
                Image = ReleaseDoc;

                trigger OnAction()
                begin
                    Rec.Delete();

                end;
            }

        }
        area(Navigation)
        {
            action(ReserveFields)
            {
                ApplicationArea = All;
                ToolTip = 'Reserve fields for current object';
                Image = Reserve;
                RunObject = page "Reserved Fields TAL";
                RunPageLink = "Object Type" = field("Object Type"), "Object ID" = field("Object ID");
            }
        }
    }

}