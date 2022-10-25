codeunit 52100 "MailConfirmation Meth"
{
    internal procedure SendMail(var People: Record People)
    var
        IsHandled: Boolean;
    begin
        OnBeforeSendMail(People, IsHandled);

        DoSendMail(People, IsHandled);

        OnAfterSendMail(People);
    end;

    local procedure DoSendMail(var People: Record People; IsHandled: Boolean);
    var
        EmailAccount: Record "Email Account";
        Email: Codeunit Email;
        DocumentMailing: Codeunit "Document-Mailing";
        MailManagement: Codeunit "Mail Management";
        EmailEditor: Page "Email Editor";
        EmailMessage: Codeunit "Email Message";
        EmailScenario: Codeunit "Email Scenario";
        SendToList: List of [Text];
        Sent: Boolean;
    begin
        if IsHandled then
            exit;

        EmailMessage.Create(People.Email, 'T&T 10j Jubileum Bestelbevestiging', People.GetEmailConfirmationBody(), true);

        EmailScenario.GetEmailAccount(enum::"Email Scenario"::Default, EmailAccount);
        Sent := Email.send(EmailMessage, EmailAccount."Account Id", EmailAccount.Connector);
        if not Sent then Error(GetLastErrorText());

        People.Mailed := true;
        People.Modify();
    end;

    // local procedure PrintReportAsHTML(var People: Record People)
    // var
    //     MailConfirmation: Report MailConfirmation;
    // begin
    //     People.SetRecFilter();
    //     MailConfirmation.SetTableView(People);
    //     MailConfirmation.WordLayout()
    // end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeSendMail(var People: Record People; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSendMail(var People: Record People);
    begin
    end;
}