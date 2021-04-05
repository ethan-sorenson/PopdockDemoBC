page 83505 PopdockSalesCardPart
{
    PageType = CardPart;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    SourceTable = "Sales Line";

    layout
    {
        area(Content)
        {
            usercontrol(Sidebar; PopdockCardWidget)
            {
                ApplicationArea = All;
            }
        }
    }

    var
        widgetId: Text;
        PopdockMethods: Codeunit "Popdock Methods";
        recRef: RecordRef;
        recRefLine: RecordRef;

    trigger OnAfterGetCurrRecord()
    begin
        if GuiAllowed then begin
            recRefLine.GETTABLE(rec);
            recRefLine.GetBySystemId(SystemId);
            CurrPage.Sidebar.CreateIframe(PopdockMethods.GenerateTransactionUrl(widgetId, recRef, recRefLine));
        end;
    end;

    procedure setwidgetId(srcWidgetId: Text; srcRecRef: RecordRef)
    begin
        widgetId := srcWidgetId;
        recRef := srcRecRef;
    end;
}