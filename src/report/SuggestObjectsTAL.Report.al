report 50100 "Suggest Objects TAL"
{
    Caption = 'Suggest Objects';
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(ObjectReservationJnlLine; ObjectReservationJnlLineTAL)
        {
            RequestFilterFields = "ID Range";
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field("Table Count"; ObjectCount[1])
                    {
                        ApplicationArea = All;
                        Caption = 'Table Count';
                        ToolTip = 'Number of required tables';
                    }

                    field("TableExt Count"; ObjectCount[2])
                    {
                        ApplicationArea = All;
                        Caption = 'Table Extension Count';
                        ToolTip = 'Number of required table extensions';
                    }

                    field("Page Count"; ObjectCount[3])
                    {
                        ApplicationArea = All;
                        Caption = 'Page Count';
                        ToolTip = 'Number of required pages';
                    }

                    field("PageExt Count"; ObjectCount[4])
                    {
                        ApplicationArea = All;
                        Caption = 'Page Extension Count';
                        ToolTip = 'Number of required page extensions';
                    }

                    field("Report Count"; ObjectCount[5])
                    {
                        ApplicationArea = All;
                        Caption = 'Report Count';
                        ToolTip = 'Number of required reports';
                    }
                    field("Codeunit Count"; ObjectCount[6])
                    {
                        ApplicationArea = All;
                        Caption = 'Codeunit Count';
                        ToolTip = 'Number of required codeunits';
                    }
                    field("XMLPort Count"; ObjectCount[7])
                    {
                        ApplicationArea = All;
                        Caption = 'XML Port Count';
                        ToolTip = 'Number of required XML Ports';
                    }

                    field("Query Count"; ObjectCount[8])
                    {
                        ApplicationArea = All;
                        Caption = 'Query Count';
                        ToolTip = 'Number of required queries';
                    }

                    field("Enum Count"; ObjectCount[9])
                    {
                        ApplicationArea = All;
                        Caption = 'Enum Count';
                        ToolTip = 'Number of required enums';
                    }

                    field("EnumExt Count"; ObjectCount[10])
                    {
                        ApplicationArea = All;
                        Caption = 'Enum Extension Count';
                        ToolTip = 'Number of required enum extensions';
                    }

                    field("Profile Count"; ObjectCount[11])
                    {
                        ApplicationArea = All;
                        Caption = 'Profile Count';
                        ToolTip = 'Number of required profiles';
                    }

                    field("ProfileExt Count"; ObjectCount[12])
                    {
                        ApplicationArea = All;
                        Caption = 'Profile Extensions Count';
                        ToolTip = 'Number of required profile extensions';
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        Text := ObjectReservationJnlLine.GetFilter("ID Range");
        if Text = '' then
            Error(IdRangeMissingLbl);

        Evaluate(StartId, CopyStr(Text, 1, Text.LastIndexOf('.') - 2));
        Evaluate(EndId, CopyStr(Text, Text.LastIndexOf('.') + 1), StrLen(Text));

        ObjectReservationMgmt.SuggestObjects(ObjectCount, StartId, EndId);
    end;

    var
        ObjectReservationMgmt: Codeunit "Object Reservation Mgmt. TAL";
        ObjectCount: array[12] of Integer;
        IdRangeMissingLbl: Label 'ID Range can not be blank', MaxLength = 30;
        StartId: Integer;
        EndId: Integer;
        Text: text;
}