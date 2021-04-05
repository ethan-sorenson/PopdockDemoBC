pageextension 83504 eOnePopdockCustListExt extends "Customer List"
{
    layout
    {
        addfirst(factboxes)
        {
            part(PopdockFactBox; PopdockCardPart)
            {
                ApplicationArea = all;
                Caption = ' ';
                Visible = PopdockFactboxVis;
            }
        }
    }
    actions
    {
        addafter("Statistics")
        {
            action("eOnePopdockPageAction")
            {
                Caption = 'Popdock';
                visible = PopdockActionVis;
                Promoted = true;
                PromotedCategory = Category7;
                image = Report;
                ApplicationArea = All;
                trigger OnAction()
                var
                    urlstring: Text;
                    eOnePopdockPopup: Page eOnePopdockAction;
                begin
                    eOnePopdockPopup.seturl(PopdockMethods.GenerateUrl(PopdockActionId, recRef));
                    eOnePopdockPopup.Run();
                end;

            }
        }
    }
    var
        PopdockActionVis: Boolean;
        PopdockActionId: Text;
        PopdockFactboxVis: Boolean;
        PopdockFactboxId: Text;
        PopdockMethods: Codeunit "Popdock Methods";
        recRef: RecordRef;

    trigger OnOpenPage()
    begin
        if GuiAllowed then
            GetWidgets()
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if GuiAllowed then begin
            recRef.GETTABLE(rec);
            recRef.GetBySystemId(SystemId);
            if PopdockFactboxVis then
                CurrPage.PopdockFactBox.Page.seturl(PopdockMethods.GenerateUrl(PopdockFactboxId, recRef));
        end;
    end;

    procedure GetWidgets()
    var
        PopdockWidgets: Record "Popdock Widgets Demo";
        Jobject: JsonObject;
        PageName: Text;
    begin
        PageName := 'Customer List';
        PopdockWidgets.Reset();
        PopdockWidgets.SetRange("Visible", true);
        PopdockWidgets.SetRange(Page, PageName);
        if PopdockWidgets.FindSet() then begin
            repeat
                case PopdockWidgets."Widget Type" of
                    PopdockWidgets."Widget Type"::Action:
                        begin
                            PopdockActionVis := PopdockWidgets.Visible;
                            PopdockActionId := PopdockWidgets.WidgetId;
                        end;
                    PopdockWidgets."Widget Type"::FactBox:
                        begin
                            PopdockFactboxVis := PopdockWidgets.Visible;
                            PopdockFactboxId := PopdockWidgets.WidgetId;
                        end;
                end;
            until PopdockWidgets.Next = 0;
        end;
    end;
}