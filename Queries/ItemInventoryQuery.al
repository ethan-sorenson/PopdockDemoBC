query 83500 itemInventoryQuantity

{
    QueryType = API;
    APIPublisher = 'EthanSorenson';
    APIGroup = 'ES';
    APIVersion = 'v1.0';
    EntityName = 'itemInventoryQuantity';
    EntitySetName = 'itemInventoryQuantities';
    OrderBy = ascending(LocationCode), ascending(ItemNo);

    elements
    {
        dataitem(ItemLedger; "Item Ledger Entry")
        {
            DataItemTableFilter = "Location Code" = filter(<> '');
            column(ItemNo; "Item No.")
            {
            }

            column(LocationCode; "Location Code")
            {
            }

            column(Quantity; "Quantity")
            {
                Method = Sum;
            }
        }
    }

    var
        myInt: Integer;
}