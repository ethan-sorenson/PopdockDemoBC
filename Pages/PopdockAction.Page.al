page 83501 eOnePopdockAction
{
    PageType = Card;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            usercontrol(PopdockWidget; PopdockActionWidget)
            {
                ApplicationArea = All;
                trigger onLoad()
                begin
                    CurrPage.PopdockWidget.CreateIframe(url);
                end;
            }
        }
    }
    var
        url: Text;

    procedure seturl(srcurl: Text)
    begin
        url := srcurl;
    end;
}