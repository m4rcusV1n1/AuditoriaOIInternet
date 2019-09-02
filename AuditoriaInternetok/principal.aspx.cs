using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuditoriaInternetok
{
    public partial class principal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string login = (string)(Session["login"]);
            SqlConnection cnx = new SqlConnection(@"Data Source=CARITA-PC\SQLEXPRESS;Initial Catalog=oi_internet;User ID=sa;Password=marcus123");
            cnx.Open();
            SqlDataAdapter adp = new SqlDataAdapter("Select * from tb_auditoria where re='" + login + "'", cnx);
            DataSet dst = new DataSet();
            adp.Fill(dst);
            Consulta_status.DataSource = dst;
            Consulta_status.DataBind();
        }
    }
}