var __div = document.getElementById('controlAddIn');
var __iframe = document.createElement("iframe");
__iframe.id = "__iframe";
__iframe.name = "iframe";
__iframe.style.position = "fixed";
__iframe.style.width = "96%";
__iframe.style.height = "600px";
__iframe.style.margin = "0";
__iframe.style.border = "0";
__iframe.style.padding = "0";
__iframe.style.top = "0";
__iframe.style.left = "0";

__iframe.src = "https://widget.popdock.com/embed/hjXUVk86YAL27BlLBGqbAA?theme=dynamics_bc";
__div.appendChild(__iframe);
Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ControlReady",[]);