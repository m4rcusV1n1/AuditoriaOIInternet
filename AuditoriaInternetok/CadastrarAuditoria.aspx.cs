using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuditoriaInternetok
{
    public partial class CadastrarAuditoria : System.Web.UI.Page
    {
        protected override void Render(HtmlTextWriter output)
        {
            StringWriter stringWriter = new StringWriter();

            HtmlTextWriter textWriter = new HtmlTextWriter(stringWriter);
            base.Render(textWriter);

            textWriter.Close();

            string strOutput = stringWriter.GetStringBuilder().ToString();

            strOutput = Regex.Replace(strOutput, "<input[^>]*id=\"__VIEWSTATE\"[^>]*>", "", RegexOptions.Singleline);

            output.Write(strOutput);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            txtdata_auditoria.Text = System.DateTime.Now.ToString("dd/MM/yyyy");
            using (var con = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString))
            {
                con.Open();
                using (var cmd = new SqlCommand("select * from tb_perguntas order by motivo", con))
                {

                    txtmotivo.DataTextField = "motivo";
                    txtmotivo.DataValueField = "motivo";

                    txtmotivo.DataSource = cmd.ExecuteReader();
                    txtmotivo.DataBind();

                }

            }
        }
        protected void txtsalvar_Click(object sender, EventArgs e)
        {



            string conn = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO tb_auditoria (dt_auditoria,numero_binado,nome_cliente,nome_colaborador,motivo,classificacao_venda,auditor,dt_cadastro,re) VALUES (@dt_auditoria,@numero_binado,@nome_cliente,@nome_colaborador,@motivo,@classificacao_venda,@auditor,@dt_cadastro,@re)"))
                {

                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();

                    string login = (string)(Session["login"]);
                    SqlConnection conn1 = new SqlConnection(@"Data Source=CARITA-PC\SQLEXPRESS;Initial Catalog=oi_internet;User ID=sa;Password=marcus123");
                    SqlCommand comm = new SqlCommand("SELECT * FROM tb_usuario WHERE login='" + login + "'", conn1);
                    comm.CommandType = CommandType.Text; /* Quando usa Query */

                    /* paramentros do banco*/
                    comm.Parameters.Add(new SqlParameter("@nome", "nome"));

                    conn1.Open();
                    DbDataReader dr = comm.ExecuteReader();

                    while (dr.Read())
                    {

                        string nome = dr["Nome"].ToString();
                        string dt_cadastro = System.DateTime.Now.ToString("dd/MM/yyyy");
                        //yyyy/MM/dd
                        cmd.Parameters.AddWithValue("dt_auditoria", dt_cadastro);
                        cmd.Parameters.AddWithValue("numero_binado", txtbinado.Text);
                        cmd.Parameters.AddWithValue("nome_cliente", txtcliente.Text);
                        cmd.Parameters.AddWithValue("nome_colaborador", txtcolaborador.Text);
                        cmd.Parameters.AddWithValue("motivo", txtmotivo.Text);
                        cmd.Parameters.AddWithValue("classificacao_venda", txtclassificacao.Text);
                        cmd.Parameters.AddWithValue("auditor", nome);
                        cmd.Parameters.AddWithValue("dt_cadastro", dt_cadastro);
                        cmd.Parameters.AddWithValue("re", login);




                        con.Close();

                        try
                        {
                            con.Open();
                            if (cmd.ExecuteNonQuery() > -1)
                            {

                                txtbinado.Text = "";
                                txtcliente.Text = "";
                                txtcolaborador.Text = "";

                                Response.Write("<script type='text/javascript'>alert('cadastrado com sucesso');</script>");
                                //lblMensagem.InnerText = "Atestado cadastrado com sucesso.";

                            }
                        }
                        catch (Exception ex)
                        {
                            //lblMensagem.InnerText = "Erro ao cadastrar post.\n" + ex.Message;
                            Response.Write("<script type='text/javascript'>alert('Erro ao cadastrar post.\n');</script>" + ex.Message);
                        }
                        finally
                        {
                            con.Close();
                        }
                    }
                }

            }
        }
    }
}