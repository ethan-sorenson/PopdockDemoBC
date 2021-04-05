page 83507 "Popdock Widgets"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Popdock Widgets Demo";
    Editable = True;
    SourceTableView = sorting(Page);

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(WidgetId; rec.WidgetId)
                {
                    ApplicationArea = All;
                }
                field(Page; rec.Page)
                {
                    ApplicationArea = All;
                }
                field("Widget Type"; rec."Widget Type")
                {
                    ApplicationArea = All;
                }
                field(Visible; rec.Visible)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}