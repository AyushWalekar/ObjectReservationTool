page 50100 "Reserved Objects TAL"
{
    Caption = 'Reserved Objects';
    PageType = List;
    SourceTable = "Reserved Object TAL";
    UsageCategory = Lists;
    ApplicationArea = All;
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
                    ApplicationArea = All;
                    Tooltip = 'Specifies the Project Name.';
                }

                field("Object Type"; "Object Type")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the Object Type.';
                }

                field("Object ID"; "Object ID")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the Object ID.';
                }

                field("Object Name"; "Object Name")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the Object Name.';
                }

                field("Reserved By"; "Reserved By")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the Reserved By.';
                }

                field("Reserved Date"; "Reserved Date")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the Reserved Date.';
                }

            }
        }
    }


}