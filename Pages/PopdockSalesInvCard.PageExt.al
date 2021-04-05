pageextension 83506 "Popdock Sales Invoice" extends "Sales Invoice"
{
    layout
    {
        addafter("Invoice Details")
        {
            Group("Additional Detail")
            {
                Visible = PopdockFastTabVis;
                usercontrol(PopdockFastTab; PopdockCardWidget)
                {
                    ApplicationArea = All;
                    Visible = PopdockFastTabVis;
                    trigger onLoad()
                    var
                        urlstring: Text;
                    begin
                        if PopdockFastTabVis then
                            CurrPage.PopdockFastTab.CreateIframe(PopdockMethods.GenerateUrl(PopdockFastTabId, recRef));
                    end;
                }
            }
        }
        addfirst(factboxes)
        {
            part(PopdockFactBox; PopdockSalesCardPart)
            {
                ApplicationArea = all;
                Caption = ' ';
                Provider = SalesLines;
                Visible = PopdockFactBoxVis;
                SubPageLink = SystemId = FIELD(SystemId);
            }
        }
    }
    actions
    {
        addafter("&Invoice")
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
        PopdockFastTabVis: Boolean;
        PopdockFastTabId: Text;
        PopdockMethods: Codeunit "Popdock Methods";
        recRef: RecordRef;

    trigger OnOpenPage()
    begin
        GetWidgets();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if GuiAllowed then begin
            recRef.GETTABLE(rec);
            recRef.GetBySystemId(SystemId);
            if PopdockFactboxVis then
                CurrPage.PopdockFactBox.Page.setwidgetId(PopdockFactboxId, recRef);
            if PopdockFastTabVis then
                CurrPage.PopdockFastTab.CreateIframe(PopdockMethods.GenerateUrl(PopdockFastTabId, recRef));
        end;
    end;

    procedure GetWidgets()
    var
        PopdockWidgets: Record "Popdock Widgets Demo";
        Jobject: JsonObject;
        PageName: Text;
    begin
        if GuiAllowed then begin
            if CurrPage.ObjectId().StartsWith('Page ') then
                PageName := CurrPage.ObjectId().Remove(1, 5);
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
                        PopdockWidgets."Widget Type"::FastTab:
                            begin
                                PopdockFastTabVis := PopdockWidgets.Visible;
                                PopdockFastTabId := PopdockWidgets.WidgetId;
                            end;
                    end;
                until PopdockWidgets.Next = 0;
            end;
        end;
    end;
}

pageextension 83507 "Popdock Sales Invoice Subform" extends "Sales Invoice Subform"
{
    actions
    {
        addlast(processing)
        {
            group("eOneReportingGroup")
            {
                Caption = 'Popdock';
                Visible = PopdockActionVis;
                action("eOnePopdockPageAction")
                {
                    Caption = 'Popdock';
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
    }
    var
        PopdockActionVis: Boolean;
        PopdockActionId: Text;
        PopdockMethods: Codeunit "Popdock Methods";
        recRef: RecordRef;

    trigger OnOpenPage()
    begin
        GetWidgets();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if GuiAllowed and not rec.IsEmpty then begin
            recRef.GETTABLE(rec);
            recRef.GetBySystemId(SystemId);
        end;
    end;

    procedure GetWidgets()
    var
        PopdockWidgets: Record "Popdock Widgets Demo";
        Jobject: JsonObject;
        PageName: Text;
    begin
        if GuiAllowed and not rec.IsEmpty then begin
            PageName := 'Sales Invoice Subform';
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
                    end;
                until PopdockWidgets.Next = 0;
            end;
        end;
    end;
}