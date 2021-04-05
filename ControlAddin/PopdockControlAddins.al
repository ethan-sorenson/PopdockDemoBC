controladdin PopdockActionWidget
{
    Scripts = 'ControlAddin\Functions.js';
    StartupScript = 'ControlAddin\StartupScript.js';
    HorizontalStretch = true;
    VerticalStretch = true;
    event onLoad();
    procedure CreateIframe(url: Text);
}
controladdin PopdockCardWidget
{
    RequestedHeight = 600;
    MaximumHeight = 600;
    VerticalStretch = true;
    HorizontalStretch = true;
    Scripts = 'ControlAddin\Functions.js';
    StartupScript = 'ControlAddin\StartupScript.js';
    event onLoad();
    procedure CreateIframe(url: Text);
}