<%@ Page Title="" Language="C#" MasterPageFile="~/operador.Master" AutoEventWireup="true" CodeBehind="CadastrarAuditoria.aspx.cs" Inherits="AuditoriaInternetok.CadastrarAuditoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function completar_campos() {
            document.getElementById("loading").style.display = "block";
            var con_consulta;
            if (window.XMLHttpRequest) {
                con_consulta = new XMLHttpRequest();
            } else {
                con_consulta = new ActiveXObject("Microsoft.XMLHTTP");
            }

            con_consulta.onreadystatechange = function () {
                if (con_consulta.readyState == 4 && con_consulta.status == 200) {
                    document.getElementById("dados_essencias").innerHTML = con_consulta.responseText;
                    document.getElementById("loading").style.display = "none";
                }
            }
            var motivo = document.getElementById("ContentPlaceHolder1_txtmotivo").value;
            con_consulta.open("GET", "exibeDados.aspx?motivo=" + motivo, true);

            con_consulta.send(null);

        }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-left:15px;">
     <legend>
      <i class="glyphicon glyphicon-plus"></i> Cadastrar Auditoria
  </legend>
    <div class="row">
        <div class="col-md-6">
        <asp:Label ID="Label1" runat="server" Text="Data da Auditoria:" style="font-weight: 700"></asp:Label>
        <br />
        <asp:TextBox ID="txtdata_auditoria" runat="server" CssClass="form-control" required="required" ReadOnly="True"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Número Binado" style="font-weight: 700"></asp:Label>
        <br />
        <asp:TextBox ID="txtbinado" runat="server" CssClass="form-control" required="required"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Nome do Cliente" style="font-weight: 700"></asp:Label>
        <br />
        <asp:TextBox ID="txtcliente" runat="server" CssClass="form-control" required="required"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Nome do Vendedor" style="font-weight: 700"></asp:Label>
        <br />
        <asp:TextBox ID="txtcolaborador" runat="server" CssClass="form-control" required="required"></asp:TextBox>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Motivo" style="font-weight: 700"></asp:Label>
        <br />
        <asp:DropDownList ID="txtmotivo" runat="server" CssClass="form-control" required="required" onblur="completar_campos();">
        </asp:DropDownList>
        <img src="imagens/loading.gif" width="15" id="loading" alt="carregando" 
        style="display:none"/>
        <br />
            <div id="dados_essencias">
        <asp:Label ID="Label6" runat="server" Text="Classificação da Venda" style="font-weight: 700"></asp:Label>
        <br />
            <asp:TextBox ID="txtclassificacao" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
                </div>
        <asp:Button ID="txtsalvar" runat="server" Text="Salvar" OnClick="txtsalvar_Click" CssClass="btn btn-large btn-primary" />
        <br />
    </div>
        </div>
    </div>
</asp:Content>
