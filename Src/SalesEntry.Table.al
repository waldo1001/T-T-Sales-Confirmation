table 52101 "SalesEntry"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "Sales Entries";
    LookupPageId = "Sales Entries";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; "Name"; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; "Email"; Text[100])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
        }
        field(4; "Team"; Text[10])
        {
            Caption = 'Team';
            DataClassification = CustomerContent;
        }
        field(5; "Article"; TExt[20])
        {
            Caption = 'Article';
            DataClassification = CustomerContent;
        }
        field(6; "Size"; Text[10])
        {
            Caption = 'Size';
            DataClassification = CustomerContent;
        }
        field(7; ArticleKey; Text[52])
        {
            DataClassification = CustomerContent;
        }
        field(8; "Price"; Decimal)
        {
            Caption = 'Price';
            DataClassification = CustomerContent;
        }


    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

}