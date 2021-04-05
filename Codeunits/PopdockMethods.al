codeunit 83500 "Popdock Methods"
{
    var
        Region: Text;
        paramList: List of [Text];

    procedure GenerateUrl(WidgetId: Text; recRef: RecordRef) url: Text
    Var
        RegionVar: Text;
    begin
        RegionVar := WidgetId.Substring(Text.StrLen(WidgetId) - 1, 2);
        case RegionVar of
            '01':
                Region := '-weu';
            '02':
                Region := '-weu';
            '03':
                Region := '-eqa';
            '04':
                Region := '-aus';
            else
                Region := '';
        end;
        getWidgetParameters(WidgetId);
        url := 'https://widget' + Region + '.popdock.com/embed/' + widgetId + '?theme=dynamics_bc' + format(setWidgetParameters(recRef, false));
    end;

    procedure GenerateTransactionUrl(WidgetId: Text; recRef: RecordRef; RecRefLine: RecordRef) url: Text
    begin
        url := GenerateUrl(WidgetId, recRef) + setWidgetParameters(RecRefLine, true).ToText();
    end;

    local procedure getWidgetParameters(WidgetId: Text) url: Text
    var
        requestUrl: Text;
        HttpClient: HttpClient;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        JsonText: Text;
    begin
        requestUrl := 'https://widget' + Region + '.popdock.com/GetZendeskParameters/' + widgetId;
        RequestMessage.Method := 'GET';
        RequestMessage.SetRequestUri(requestUrl);
        HttpClient.Send(RequestMessage, ResponseMessage);
        ResponseMessage.Content().ReadAs(JsonText);
        JsonText := (JsonText.Substring(2, Text.StrLen(JsonText) - 2).replace('"', ''));
        paramList := JsonText.Split(',');
    end;

    local procedure setWidgetParameters(RecRef: RecordRef; Lines: Boolean) paramString: TextBuilder
    var
        i: Integer;
        fldRef: FieldRef;
        URI: Codeunit Uri;
        prefix: Text;
    begin
        if Lines then
            prefix := RecRef.Name.ToLower().Replace(' ', '') + '.';
        for i := 1 to RecRef.FieldCount do begin
            fldRef := RecRef.FieldIndex(i);
            if paramList.Contains(prefix + fldRef.Name) then begin
                if (IsFieldNormal(fldRef)) then begin
                    paramString.Append('&' + URI.EscapeDataString(prefix + fldRef.Name) + '=' + URI.EscapeDataString(Format(fldRef.Value)));
                end
            end;
        end;
    end;

    local procedure IsFieldNormal(FieldRef: FieldRef): Boolean
    begin
        exit(FORMAT(FieldRef.CLASS) = 'Normal');
    end;

}