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
                    Caption = 'Object Type';
                    Tooltip = 'Specifies the Object Type.';
                }

                field("Object ID"; "Object ID")
                {
                    ApplicationArea = All;
                    Caption = 'Object ID';
                    Tooltip = 'Specifies the Object ID.';
                }

                field("Field ID"; "Field ID")
                {
                    ApplicationArea = All;
                    Caption = 'Field ID';
                    Tooltip = 'Specifies the Field ID.';
                }

                field("Field Name"; "Field Name")
                {
                    ApplicationArea = All;
                    Caption = 'Field Name';
                    Tooltip = 'Specifies the Field Name.';
                }

                field("Reserved By"; "Reserved By")
                {
                    ApplicationArea = All;
                    Caption = 'Reserved By';
                    Tooltip = 'Specifies the Reserved By.';
                }

                field("Reserved Date"; "Reserved Date")
                {
                    ApplicationArea = All;
                    Caption = 'Reserved Date';
                    Tooltip = 'Specifies the Reserved Date.';
                }

            }
        }
    }

}