<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 300px; margin: 100px auto; padding: 20px; border: 1px solid #ccc; border-radius: 10px; background-color: #f7f7f7;">
            <h2 style="text-align:center;">Login</h2>
            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label><br />
            <asp:TextBox ID="TextBox1" runat="server" Width="100%"></asp:TextBox>
            <br /><br />
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label><br />
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="100%"></asp:TextBox>
            <br /><br />
            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" Width="100%" />
        </div>
    </form>
</body>
</html>
