var control = document.getElementById('controlAddIn');
var widget = document.createElement("iframe");
widget.setAttribute("id", "popdock_widget");
widget.setAttribute("frameBorder", 0);
widget.style.width = "100%";
widget.style.height = "calc(100% - 20px)";
control.appendChild(widget);
Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('onLoad');