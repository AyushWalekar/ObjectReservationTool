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
                    //Caption = 'Batch Name';
                    Tooltip = 'Specifies the Batch Name.';
                }

                field("Object Type"; Rec."Object Type")
                {
                    ApplicationArea = All;
                    //Caption = 'Object Type';
                    Tooltip = 'Specifies the Object Type.';
                }

                field("Object ID"; Rec."Object ID")
                {
                    ApplicationArea = All;
                    //Caption = 'Object ID';
                    Tooltip = 'Specifies the Object ID.';
                }

                field("Object Name"; Rec."Object Name")
                {
                    ApplicationArea = All;
                    //Caption = 'Object Name';
                    Tooltip = 'Specifies the Object Name.';
                }

                field("Reserved By"; Rec."Reserved By")
                {
                    ApplicationArea = All;
                    //Caption = 'Reserved By';
                    Tooltip = 'Specifies the Reserved By.';
                }

                field("Reserved Date"; Rec."Reserved Date")
                {
                    ApplicationArea = All;
                    //Caption = 'Reserved Date';
                    Tooltip = 'Specifies the Reserved Date.';
                }

            }
        }
    }

}