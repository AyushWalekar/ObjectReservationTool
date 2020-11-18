page 50106 "ObjectReservationRCHeadLineTAL"
{
    Caption = 'Headline';
    PageType = HeadLinePart;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            group(Control1)
            {
                ShowCaption = false;
                Visible = UserGreetingVisible;

                field(GreetingText; RCHeadlinesPageCommon.GetGreetingText())
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Caption = 'Greeting headline';
                    ToolTip = 'Greeting headline';
                }
            }
        }
    }

    var
        RCHeadlinesPageCommon: Codeunit "RC Headlines Page Common";
        [InDataSet]
        UserGreetingVisible: Boolean;

    trigger OnOpenPage()
    begin
        RCHeadlinesPageCommon.HeadlineOnOpenPage(Page::ObjectReservationRCHeadLineTAL);
        UserGreetingVisible := RCHeadlinesPageCommon.IsUserGreetingVisible();
    end;
}