table 52100 "People"
{
    DataClassification = CustomerContent;
    DrillDownPageId = People;
    LookupPageId = People;

    fields
    {
        field(1; "Email"; Text[100])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
        }
        field(2; "Total (Excel)"; Decimal)
        {
            Caption = 'Total (Excel)';
            DataClassification = CustomerContent;
        }
        field(3; "Total (Entries)"; Decimal)
        {
            Caption = 'Total (Entries)';
            FieldClass = FlowField;
            CalcFormula = sum(SalesEntry.Price where(Email = field(Email)));
            Editable = false;
        }
        field(10; "Mailed"; Boolean)
        {
            Caption = 'Mailed';
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; "Email")
        {
            Clustered = true;
        }
    }

    internal procedure MailConfirmation()
    var
        MailConfirmationMeth: Codeunit "MailConfirmation Meth";
    begin
        MailConfirmationMeth.SendMail(Rec);
    end;

    internal procedure GetEmailConfirmationBody(): Text
    var
        GetBodyMeth: Codeunit "GetBody Meth";
    begin
        exit(GetBodyMeth.GetBody(Rec));
    end;

}