<%@ Page Title="" Language="C#" MasterPageFile="~/operador.Master" AutoEventWireup="true" CodeBehind="AlterarSenha.aspx.cs" Inherits="AuditoriaInternetok.AlterarSenha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div style="margin-left:15px;">
    <div class="row">
         <div class="col-md-6">
        <legend>
      <i class="glyphicon glyphicon-pencil"></i> Alterar Senha
  </legend>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Nova Senha"></asp:Label>
    <br />
    <asp:TextBox ID="txtsenha" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
    <br />
        <asp:Label ID="Label2" runat="server" Text="Nova Senha"></asp:Label>
    <br />
    <asp:TextBox ID="txtconfirmar" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Button ID="txtalterar" runat="server" Text="Alterar Senha" CssClass="btn btn-large btn-primary" />
        </div>
 </div>
    </div>
</asp:Content>
