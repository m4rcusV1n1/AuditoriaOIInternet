using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuditoriaInternetok
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void txtacessar_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            con.Open();

            string query = "select count(*) from tb_usuario where login='" + txtlogin.Text + "' and senha= '" + txtsenha.Text + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            string output = cmd.ExecuteScalar().ToString();

            if (output == "1")
            {
                Session["logado"] = true;
                Session["login"] = txtlogin.Text;
                Response.Redirect("principal.aspx");

            }
            else
            {

                txtmsg.Text = "Login ou Senha Inválidos";
            }
        }
    }
}