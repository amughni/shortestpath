<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CMPE_285_Project_FindShortestPath.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <asp:Login ID="LoginCtrl" runat="server" OnAuthenticate="LoginCtrl_Authenticate">
        </asp:Login>
        
    </div>
    </form>
</body>
</html>
