codeunit 83501 PopdockInstallCode
{
    // Set the codeunit to be an install codeunit. 
    Subtype = Install;

    // This trigger includes code for database-related operations. 
    trigger OnInstallAppPerDatabase()
    var
        Setup: Record "Popdock Widgets Demo";
    begin
        // If the "Popdock Widgets" table is empty, insert the default rewards.
        if Setup.IsEmpty() then begin
            InsertDefaultSetup();
        end;
    end;

    // Insert the starting Records
    procedure InsertDefaultSetup();
    begin
        InsertSetupLines('Customer Card', 0);
        InsertSetupLines('Customer Card', 1);
        InsertSetupLines('Customer Card', 2);
        InsertSetupLines('Customer List', 0);
        InsertSetupLines('Customer List', 1);
        InsertSetupLines('Sales Invoice', 0);
        InsertSetupLines('Sales Invoice', 1);
        InsertSetupLines('Sales Invoice', 2);
        InsertSetupLines('Sales Invoice Subform', 0);
    end;

    // Create and insert a records in the "Popdock Widgets" table.
    procedure InsertSetupLines(Page: Text; Type: Option);
    var
        Setup: Record "Popdock Widgets Demo";

    begin
        Setup.Init();
        Setup."Page" := Page;
        Setup."Widget Type" := Type;
        Setup.Insert();
    end;

    procedure UpdateStatus(flag: Boolean)
    var
        Update: Boolean;

    begin
        Update := flag;
    end;

}