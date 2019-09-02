<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="exibedados.aspx.cs" Inherits="AuditoriaInternetok.exibedados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:Label ID="Label6" runat="server" Text="Classificação da Venda" style="font-weight: 700"></asp:Label>
        <br />
            <asp:TextBox ID="txtclassificacao" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
    </div>
    </form>
</body>
</html>
