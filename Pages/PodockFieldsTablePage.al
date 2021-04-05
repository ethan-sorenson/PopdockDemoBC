Page 83503 PopdockTableFields
{
    PageType = List;
    SourceTable = Field;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(TableNo; TableNo) { ApplicationArea = All; }
                field(TableName; TableName) { ApplicationArea = All; }
                field("No."; "No.") { ApplicationArea = All; }
                field(FieldName; FieldName) { ApplicationArea = All; }
                field("RelationTableNo"; "RelationTableNo") { ApplicationArea = All; }
                field(RelationFieldNo; RelationFieldNo) { ApplicationArea = All; }
                field(Type; Type) { ApplicationArea = All; }
                field("Type Name"; "Type Name") { ApplicationArea = All; }
                field(Enabled; Enabled) { ApplicationArea = All; }
                field(Class; Class) { ApplicationArea = All; }
                field(SQLDataType; SQLDataType) { ApplicationArea = All; }
                field(OptionString; OptionString) { ApplicationArea = All; }
            }
        }
        area(factboxes)
        {
        }
    }
}