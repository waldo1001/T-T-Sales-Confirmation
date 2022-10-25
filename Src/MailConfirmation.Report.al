report 52100 "MailConfirmation"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem(People; People)
        {
            column(Email; People.Email) { }
            column(Total__Entries_; "Total (Entries)") { }
            dataitem(SalesEntry; SalesEntry)
            {
                DataItemLink = Email = field(Email);
                column(Article; Article) { }
                column(Size; Size) { }
                column(ArticleKey; ArticleKey) { }
                column(Price; Price) { }
                column(ArticleDetails; ArticleDetails) { }

                trigger OnAfterGetRecord()
                begin
                    ArticleDetails := ArticleKey + ' (' + format(Price) + ' EUR)';
                end;
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; people.Email)
                    {

                    }
                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = Word;
            LayoutFile = 'Src/MailConfirmation.docx';
        }
    }

    var
        ArticleDetails: Text;

}