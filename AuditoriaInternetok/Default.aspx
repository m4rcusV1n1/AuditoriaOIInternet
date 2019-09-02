<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AuditoriaInternetok.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container" >
        <div class="row">
            <div class="col-md-4 col-md-offset-3"  style="margin-top: 100px;" >
                <img src="imagens/logo.png" alt="logomarca" class="img-responsive"/><h4>Auditoria Oi Internet</h4>
        <br/>
       
        <div class="form-group">
      <label for="login">Login</label>
            <asp:TextBox ID="txtlogin" runat="server" CssClass="form-control" required="required"></asp:TextBox>
      </div>
        <div class="form-group">
      <label for="senha">Senha</label>
      <asp:TextBox ID="txtsenha" runat="server" CssClass="form-control" required="required" TextMode="Password"></asp:TextBox>
      </div>
                
                <asp:Button ID="txtacessar" runat="server" Text="Acessar Sistema" CssClass="btn btn-large btn-primary" OnClick="txtacessar_Click" /> 
               <br />
                <br />
                <asp:Label ID="txtmsg" runat="server" ForeColor="Red" style="font-weight: 700"></asp:Label>
    </div>
        </div>
        </div>
    <footer>
        
    </footer>
        <script src="Scripts/jquery-1.10.2.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
    </form>
</body>
</html>

