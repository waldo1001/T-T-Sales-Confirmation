codeunit 52101 "GetBody Meth"
{
    internal procedure GetBody(var People: Record People) Body: Text
    var
        BodyBuilder: TextBuilder;
    begin
        People.CalcFields("Total (Entries)");

        BodyBuilder.AppendLine('Beste,');
        BodyBuilder.AppendLine('');
        BodyBuilder.AppendLine('Vanuit T&T, hartelijk bedankt voor uw bestelling vanuit onze kledinglijn die we aanbieden naar aanleiding van ons 10 jaar bestaan.');
        BodyBuilder.AppendLine('');
        BodyBuilder.AppendLine('We beseffen maar al te goed dat het zeer kort dag was, en dat het beter zou geweest zijn dat we eerst hadden kunnen passen.  Echter wilden we u de gelegenheid geven om dit ook als Kerst-kado te voorzien, en daarom moest het nu net even sneller gaan.  Bedankt voor uw begrip.  Wees gerust – als het item niet past, dan zorgen wij voor eentje dat wel past. ');
        BodyBuilder.AppendLine('');
        BodyBuilder.AppendLine('Dit is uw bestelling (als er iets niet klopt, weten we het graag):');
        BodyBuilder.Append('<ul>');
        AppendItemDetails(People, BodyBuilder);
        BodyBuilder.Append('</ul>');
        BodyBuilder.AppendLine('Totaalprijs: <b>' + format(People."Total (Entries)") + ' EUR. </b>');
        BodyBuilder.AppendLine('');
        BodyBuilder.AppendLine('We zouden u vriendelijk willen vragen om dit bedrag over te maken op:');
        BodyBuilder.AppendLine('');
        BodyBuilder.AppendLine('<b>Naam: </b><i>HBBC T&T</i>');
        BodyBuilder.AppendLine('<b>Reknr: </b><i>BE49 0010 3632 6071</i>');
        BodyBuilder.AppendLine('<b>Omschrijving: </b><i>“Kleding ' + People.Email + '“</i>');
        BodyBuilder.AppendLine('');
        BodyBuilder.AppendLine('Alvast bedankt!');
        BodyBuilder.AppendLine('');
        BodyBuilder.AppendLine('Mvg,');
        BodyBuilder.AppendLine('');
        BodyBuilder.AppendLine('Het T&T Bestuur');

        Body := BodyBuilder.ToText();

        Body := DefineFullEmailBody(Body);
    end;

    local procedure AppendItemDetails(var People: Record People; var BodyBuilder: TextBuilder)
    var
        SalesEntry: Record SalesEntry;
    begin
        SalesEntry.SetRange(Email, People.Email);
        SalesEntry.FindSet();

        repeat
            BodyBuilder.Append('<li>' + SalesEntry.Name + ' - ' + SalesEntry.ArticleKey + ' - <b>' + format(SalesEntry.Price) + ' EUR </b></li>');
        until SalesEntry.Next() < 1;
    end;

    local procedure DefineFullEmailBody(InitialEmailMessage: Text): Text
    var
        EmailBody: Text;
    begin
        EmailBody := ReplaceNewLinesWithHtmlLineBreak(InitialEmailMessage);
        exit(EmailBody)
    end;

    local procedure ReplaceNewLinesWithHtmlLineBreak(InputText: Text): Text
    var
        String: Text;
        TextToReplace: Text;
    begin
        String := InputText;
        TextToReplace[1] := 10;
        exit(String.Replace(TextToReplace, LineBreakForEmail()));
    end;

    local procedure LineBreakForEmail(): Text
    begin
        exit('</br>');
    end;



}