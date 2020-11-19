report 50100 "Suggest Objects TAL"
{
    Caption = 'Suggest Objects';
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;

    // dataset
    // {
    //     dataitem(DataItemName; SourceTableName)
    //     {
    //         column(ColumnName; SourceFieldName)
    //         {

    //         }
    //     }
    // }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field("Table Count"; TableCount)
                    {
                        ApplicationArea = All;
                        Caption = 'Table Count';
                        ToolTip = 'Number of required tables';
                    }

                    field("Page Count"; PageCount)
                    {
                        ApplicationArea = All;
                        Caption = 'Page Count';
                        ToolTip = 'Number of required pages';
                    }

                    field("Codeunit Count"; CodeunitCount)
                    {
                        ApplicationArea = All;
                        Caption = 'Codeunit Count';
                        ToolTip = 'Number of required codeunits';
                    }

                    field("Report Count"; ReportCount)
                    {
                        ApplicationArea = All;
                        Caption = 'Report Count';
                        ToolTip = 'Number of required reports';
                    }

                    field("TableExt Count"; TableExtCount)
                    {
                        ApplicationArea = All;
                        Caption = 'Table Extension Count';
                        ToolTip = 'Number of required table extensions';
                    }

                    field("PageExt Count"; PageExtCount)
                    {
                        ApplicationArea = All;
                        Caption = 'Page Extension Count';
                        ToolTip = 'Number of required page extensions';
                    }

                    field("XMLPort Count"; XMLPortCount)
                    {
                        ApplicationArea = All;
                        Caption = 'XML Port Count';
                        ToolTip = 'Number of required XML Ports';
                    }

                    field("Query Count"; QueryCount)
                    {
                        ApplicationArea = All;
                        Caption = 'Query Count';
                        ToolTip = 'Number of required queries';
                    }

                    field("Enum Count"; EnumCount)
                    {
                        ApplicationArea = All;
                        Caption = 'Enum Count';
                        ToolTip = 'Number of required enums';
                    }

                    field("EnumExt Count"; EnumExtCount)
                    {
                        ApplicationArea = All;
                        Caption = 'Enum Extension Count';
                        ToolTip = 'Number of required enum extensions';
                    }

                    field("Profile Count"; ProfileCount)
                    {
                        ApplicationArea = All;
                        Caption = 'Profile Count';
                        ToolTip = 'Number of required profiles';
                    }

                    field("ProfileExt Count"; ProfileExtCount)
                    {
                        ApplicationArea = All;
                        Caption = 'Profile Extensions Count';
                        ToolTip = 'Number of required profile extensions';
                    }
                }
            }
        }

        var
            TableCount: Integer;
            TableExtCount: Integer;
            PageCount: Integer;
            PageExtCount: Integer;
            ReportCount: Integer;
            CodeunitCount: Integer;
            XMLPortCount: Integer;
            QueryCount: Integer;
            EnumCount: Integer;
            EnumExtCount: Integer;
            ProfileCount: Integer;
            ProfileExtCount: Integer;
    }
}