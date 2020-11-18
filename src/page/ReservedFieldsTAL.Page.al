page 50103 "Reserved Fields TAL"
{
    Caption = 'Reserved Fields';
    PageType = List;
    SourceTable = "Reserved Field TAL";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {

        area(content)
        {
            repeater(Group)
            {

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

                field("Field ID"; "Field ID")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the Field ID.';
                }

                field("Field Name"; "Field Name")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the Field Name.';
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