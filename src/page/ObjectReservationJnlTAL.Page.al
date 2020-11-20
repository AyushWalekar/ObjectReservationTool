page 50101 "ObjectReservationJnlTAL"
{
    Caption = 'Object Reservation Journal';
    PageType = Worksheet;
    SourceTable = "ObjectReservationJnlLineTAL";
    UsageCategory = Lists;
    ApplicationArea = ObjectReservationAppAreaTAL;
    DelayedInsert = true;

    layout
    {

        area(content)
        {
            field("Batch Name"; BatchName)
            {
                Caption = 'Batch Name';
                ApplicationArea = ObjectReservationAppAreaTAL;
                Tooltip = 'Specifies the Batch Name.';
                Lookup = true;

                trigger OnValidate()
                begin
                    BatchNameOnAfterValidate();
                end;


                trigger OnLookup(var Text: Text): Boolean
                var
                    ObjectReservJnlBatch: Record ObjectReservationJnlBatchTAL;

                begin
                    Commit();
                    CurrPage.SaveRecord();
                    if PAGE.RUNMODAL(0, ObjectReservJnlBatch) = ACTION::LookupOK then begin
                        BatchName := ObjectReservJnlBatch.Name;
                        ObjectReservationMgmt.SetName(BatchName, Rec);
                    end;
                    CurrPage.Update(false);

                end;
            }

            repeater(Group)
            {
                field("Object Type"; Rec."Object Type")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Object Type.';
                }

                field("Object ID"; Rec."Object ID")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Object ID.';
                }

                field("Object Name"; Rec."Object Name")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Object Name.';
                }

                field("Reserved By"; Rec."Reserved By")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Created By.';
                }

                field("Reserved Date"; Rec."Reserved Date")
                {
                    ApplicationArea = ObjectReservationAppAreaTAL;
                    Tooltip = 'Specifies the Created Date.';
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SuggestObjectIDs)
            {
                ApplicationArea = ObjectReservationAppAreaTAL;
                ToolTip = 'Provides suggestion for object IDs based on available ranges';
                Image = Suggest;

                trigger OnAction()
                var
                    ObjectReservationJnlLine: Record ObjectReservationJnlLineTAL;
                    SuggestObjects: Report "Suggest Objects TAL";

                begin
                    ObjectReservationJnlLine.SetRange("Batch Name", Rec."Batch Name");
                    SuggestObjects.SetTableView(ObjectReservationJnlLine);
                    SuggestObjects.RunModal();
                end;
            }
            action(Reserve)
            {
                ApplicationArea = ObjectReservationAppAreaTAL;
                ToolTip = 'Reserves the Object and Field IDs ';
                Image = Reserve;

                trigger OnAction()
                var
                    ObjectReservationMgmt: Codeunit "Object Reservation Mgmt. TAL";
                begin
                    ObjectReservationMgmt.ReserveJournal(Rec);
                    
                end;
            }

        }
        area(Navigation)
        {
            action(ReserveFields)
            {
                ApplicationArea = ObjectReservationAppAreaTAL;
                ToolTip = 'Reserve fields for current object';
                Image = Reserve;

                trigger OnAction()
                var
                    FieldReservationJnlLine: Record FieldReservationJnlLineTAL;
                begin
                    if (Rec."Object Type" = Rec."Object Type"::Table) or (Rec."Object Type" = Rec."Object Type"::"Table Extension") then begin
                        FieldReservationJnlLine.SetRange("Batch Name", rec."Batch Name");
                        FieldReservationJnlLine.SetRange("Object Type", rec."Object Type");
                        FieldReservationJnlLine.SetRange("Object ID", rec."Object ID");
                        Page.Run(Page::"Field Reserv. Jnl Line TAL", FieldReservationJnlLine);
                    end else
                        Error(FieldReservationErr);

                end;
            }
        }
    }
    trigger OnOpenPage()
    var
        ObjectReservationJnlBatch: Record ObjectReservationJnlBatchTAL;
    begin
        if IsOpenedFromBatch() then
            BatchName := Rec."Batch Name"
        else
            if ObjectReservationJnlBatch.FindFirst() then
                BatchName := ObjectReservationJnlBatch.Name;
        ObjectReservationMgmt.SetName(BatchName, Rec);
    end;

    local procedure BatchNameOnAfterValidate()
    begin
        CurrPage.SaveRecord();
        ObjectReservationMgmt.SetName(BatchName, Rec);
        CurrPage.Update();

    end;

    procedure IsOpenedFromBatch(): boolean
    begin
        exit(Rec."Batch Name" <> '')
    end;

    var
        ObjectReservationMgmt: Codeunit "Object Reservation Mgmt. TAL";
        BatchName: Code[20];
        FieldReservationErr: Label 'Fields can only be reserved for table and table extension', maxlength = 50;


}