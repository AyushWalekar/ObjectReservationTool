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
                    //Caption = 'Name';
                    Tooltip = 'Specifies the Name.';
                }

                field("Description"; "Description")
                {
                    ApplicationArea = All;
                    //Caption = 'Description';
                    Tooltip = 'Specifies the Description.';
                }

                field("Assigned User ID"; "Assigned User ID")
                {
                    ApplicationArea = All;
                    //Caption = 'Assigned User ID"';
                    Tooltip = 'Specifies the Assigned User ID".';
                }

            }
        }
    }

}