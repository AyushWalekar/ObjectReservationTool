report 50100 "Suggest Objects TAL"
{
    Caption = 'Suggest Object IDs';
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(ObjectReservationJnlLine; ObjectReservationJnlLineTAL)
        {
            RequestFilterFields = "ID Range", "Project Code";
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
        BatchName := ObjectReservationJnlLine.GetFilter("Project Code");
        if Text = '' then
            Error(IdRangeMissingLbl);
        if BatchName = '' then
            Error(BatchNameBlankLbl);

        Evaluate(StartId, CopyStr(Text, 1, Text.LastIndexOf('.') - 2));
        Evaluate(EndId, CopyStr(Text, Text.LastIndexOf('.') + 1), StrLen(Text));

        StartingIdToReserve := ObjectReservationMgmt.SuggestObjects(ObjectCount, StartId, EndId);
        CreateObjectReservationJnlEntry();

        Message(RecordsInsertedLbl);
    end;

    local procedure CreateObjectReservationJnlEntry()
    var
        ObjectReservationJnlLineRec: Record ObjectReservationJnlLineTAL;
        counter: Integer;
        counter1: Integer;

    begin
        for counter := 1 to System.ArrayLen(ObjectCount) do
            for counter1 := StartingIDtoReserve to (StartingIdToReserve + ObjectCount[counter] - 1) do begin
                ObjectReservationJnlLineRec.Init();
                ObjectReservationJnlLineRec."Project Code" := CopyStr(BatchName, 1, MaxStrLen(ObjectReservationJnlLineRec."Project Code"));
                ObjectReservationJnlLineRec."Object Type" := Enum::"Object Type TAL".FromInteger(Counter - 1);
                ObjectReservationJnlLineRec."Object ID" := counter1;
                ObjectReservationJnlLineRec.Insert(true);
            end;
    end;

    var
        ObjectReservationMgmt: Codeunit "Object Reservation Mgmt. TAL";
        ObjectCount: array[12] of Integer;
        IdRangeMissingLbl: Label 'ID Range can not be blank', MaxLength = 30;
        BatchNameBlankLbl: Label 'Batch Name can not be blank', MaxLength = 30;
        StartId: Integer;
        EndId: Integer;
        Text: text;
        BatchName: Text;
        StartingIdToReserve: Integer;
        RecordsInsertedLbl: Label 'Records Inserted in Object Reservation Journal', MaxLength = 30;
}