<%@ Page Title="" Language="C#" MasterPageFile="~/operador.Master" AutoEventWireup="true" CodeBehind="principal.aspx.cs" Inherits="AuditoriaInternetok.principal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
         <legend>
      <i class="glyphicon glyphicon-ok"></i> Auditorias Cadastradas<br />
        </legend>
       
       <asp:GridView ID="Consulta_status" runat="server" Width="100%" AutoGenerateColumns="false" CssClass="table table-condensed">
        <Columns>
            <asp:TemplateField HeaderText="Código">
        <ItemTemplate>

       <center> <%# Eval("id") %></center>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Data Auditoria">
        <ItemTemplate>
        <center><%# DataBinder.Eval(Container.DataItem, "dt_auditoria", "{0:dd/MM/yyyy}") %></center>
        </ItemTemplate>
        </asp:TemplateField>
          <asp:TemplateField HeaderText="Número Binado">
        <ItemTemplate>
        <center><%# Eval("numero_binado") %></center>
        </ItemTemplate>
        </asp:TemplateField>
           <asp:TemplateField HeaderText="Nome do Cliente" >
        <ItemTemplate>
         <center><%# Eval("nome_cliente") %></center>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Nome do Colaborador" >
        <ItemTemplate>
        <center><%# Eval("nome_colaborador")%></center>
        </ItemTemplate>
        </asp:TemplateField>
             <asp:TemplateField HeaderText="Motivo" >
        <ItemTemplate>
        <center><%# Eval("motivo")%></center>
        </ItemTemplate>
        </asp:TemplateField>
             <asp:TemplateField HeaderText="Classificação Venda" >
        <ItemTemplate>
        <center><%# Eval("classificacao_venda")%></center>
        </ItemTemplate>
        </asp:TemplateField>
                 <asp:TemplateField HeaderText="Auditor" >
        <ItemTemplate>
        <center><%# Eval("auditor")%></center>
        </ItemTemplate>
        </asp:TemplateField>
        </Columns>
    </asp:GridView>
            </div>
</asp:Content>
