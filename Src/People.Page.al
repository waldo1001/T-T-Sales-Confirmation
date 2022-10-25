page 52100 "People"
{
    ApplicationArea = All;
    Caption = 'People';
    PageType = List;
    SourceTable = People;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
                    Style = Attention;
                    StyleExpr = NeedsAttention;
                }
                field("Total (Excel)"; Rec."Total (Excel)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total (Excel) field.';
                }
                field("Total (Entries)"; Rec."Total (Entries)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total (Entries) field.';
                }
                field(Mailed; Rec.Mailed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mailed field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(MailConfirmation)
            {
                ApplicationArea = All;
                Caption = 'Mail Confirmation';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = SendMail;

                trigger OnAction()
                begin
                    Rec.MailConfirmation();
                end;
            }
        }
    }
    var
        [InDataSet]
        NeedsAttention: Boolean;

    trigger OnAfterGetRecord()
    begin
        if Rec."Total (Entries)" <> rec."Total (Excel)" then
            NeedsAttention := true
        else
            NeedsAttention := false;
    end;

}
