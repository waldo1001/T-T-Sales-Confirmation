page 52101 "Sales Entries"
{
    ApplicationArea = All;
    Caption = 'Sales Entries';
    PageType = List;
    SourceTable = SalesEntry;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Team; Rec.Team)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Team field.';
                }
                field(Article; Rec.Article)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Article field.';
                }
                field(Size; Rec.Size)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Size field.';
                }
                field(ArticleKey; Rec.ArticleKey)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ArticleKey field.';
                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Price field.';
                }

            }
        }
    }
}
