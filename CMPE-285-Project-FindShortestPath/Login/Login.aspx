<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CMPE_285_Project_FindShortestPath.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body style="background-image:url(../Images/take.png); background-repeat:round;">
    <form id="form1" runat="server">
    <div style="text-align:center">
        <h1 style="margin-top:10%">Welcome to shortest time search</h1>
        <asp:Login ID="LoginCtrl" runat="server" OnAuthenticate="LoginCtrl_Authenticate" Style="margin-top:5%; margin-left:30%" Height="261px" Width="565px" BorderColor="Black" BorderStyle="Solid" BorderWidth="0px">
            <TitleTextStyle Font-Bold="True" Font-Size="18px" />
        </asp:Login>
        
    </div>
    </form>
</body>
</html>
