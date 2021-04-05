query 83501 CustomerPayments

{
    QueryType = API;
    APIPublisher = 'EthanSorenson';
    APIGroup = 'ES';
    APIVersion = 'v1.0';
    EntityName = 'CustomerPayments';
    EntitySetName = 'CustomerPayments';
    OrderBy = ascending(PostingDate);

    elements
    {
        dataitem(Cust_Ledge; "Cust. Ledger Entry")
        {
            DataItemTableFilter = "Document Type" = filter(Invoice);
            column(DocumentNo; "Document No.")
            {
            }
            column(ExternalDocumentNo; "External Document No.")
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(RemainingAmount; "Remaining Amount")
            {
            }
            dataitem(Detailed_Ledg; "Detailed Cust. Ledg. Entry")
            {
                DataItemLink = "Cust. Ledger Entry No." = Cust_ledge."Entry No.";
                SqlJoinType = InnerJoin;
                DataItemTableFilter = "Document Type" = filter(Payment);
                column(EntryNo; "Entry No.")
                {
                }
                column(CustLedgerEntryNo; "Cust. Ledger Entry No.")
                {
                }
                column(Amount; "Amount")
                {
                }
                column(PostingDate; "Posting Date")
                {
                }


                dataitem(Invoice_Header; "Sales Invoice Header")
                {
                    DataItemLink = "No." = Cust_Ledge."Document No.";
                    SqlJoinType = InnerJoin;
                    column(InvoicePreAssignedNo; "Pre-Assigned No.")
                    {
                        Caption = 'Pre-Assigned No.';
                    }
                    column(InvoiceExternalDocumentNo; "External Document No.")
                    {
                        Caption = 'External Document No.';
                    }
                    column(InvoiceYourReference; "Your Reference")
                    {
                        Caption = 'Your Reference';
                    }
                }
            }
        }
    }
}