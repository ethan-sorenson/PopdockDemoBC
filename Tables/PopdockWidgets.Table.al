table 83500 "Popdock Widgets Demo"
{
    DataClassification = ToBeClassified;
    DataPerCompany = False;

    fields
    {
        field(1; WidgetId; Text[36])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Page"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = true;
            ValidateTableRelation = false;
            TableRelation = "Page Metadata".Name;
        }
        field(3; "Widget Type"; Option)
        {
            OptionMembers = "Action","FactBox","FastTab";
        }
        field(4; "Visible"; Boolean)
        {
            trigger OnValidate()
            begin
                if Text.StrLen(Rec.WidgetId) < 36 then
                    Error('A valid WidgetId must be provided before activating the widget.');
            end;
        }
    }

    keys
    {
        key(ley1; "Widget Type", "Page")
        {
            Clustered = true;
        }
    }
}