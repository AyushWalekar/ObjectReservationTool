page 50102 "Object Reserv. Jnl Batch TAL"
{
    Caption = 'ObjectReservationJnlBatchTAL List';
    PageType = List;
    SourceTable = "ObjectReservationJnlBatchTAL";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {

        area(content)
        {
            repeater(Group)
            {

                field("Name"; "Name")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the Name.';
                }

                field("Description"; "Description")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the Description.';
                }

                field("Assigned User ID"; "Assigned User ID")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the Assigned User ID".';
                }

            }
        }
    }

}