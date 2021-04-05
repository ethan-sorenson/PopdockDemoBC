page 83502 PopdockCardPart
{
    PageType = CardPart;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

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
        url: Text;

    procedure seturl(srcurl: Text)
    begin
        if url = '' then
            url := srcurl
        else begin
            url := srcurl;
            CurrPage.Sidebar.CreateIframe(Url);
        end;
    end;
}