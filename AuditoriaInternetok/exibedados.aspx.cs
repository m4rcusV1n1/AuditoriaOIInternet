using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuditoriaInternetok
{
    public partial class exibedados : System.Web.UI.Page
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
            string motivo = Request.QueryString["motivo"];
            //string classificacao = "Aceite do cliente fora do padrão";
            SqlConnection conn = new SqlConnection(@"Data Source=CARITA-PC\SQLEXPRESS;Initial Catalog=oi_internet;User ID=sa;Password=marcus123");

            SqlCommand comm = new SqlCommand("SELECT * FROM tb_perguntas WHERE motivo='" + motivo + "'", conn);

            /* Aqui no CommandType tem que definir se vai utilizar uma Stored Procedure ou uma query */
            //comm.CommandType = CommandType.StoredProcedure; /* Quando usa SP's */
            /* ou */
            comm.CommandType = CommandType.Text; /* Quando usa Query */

            /* paramentros do banco*/
            comm.Parameters.Add(new SqlParameter("@id", "id"));
            comm.Parameters.Add(new SqlParameter("@motivo", "motivo"));
            comm.Parameters.Add(new SqlParameter("@classificacao", "classificacao"));
            conn.Open();
            DbDataReader dr = comm.ExecuteReader();
            while (dr.Read())
            {
                /* dados do banco x text box */
                txtclassificacao.Text = dr["classificacao"].ToString();


            }
            conn.Close();
        }
    }
}