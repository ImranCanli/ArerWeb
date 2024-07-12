using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace yenioriz
{

    public partial class _default : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader oku;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            if (ASPxCheckBox1.Checked)
            {
                baglan.ConnectionString = "Data Source=*******;Network Library=DBMSSOCN;Initial Catalog=******;User ID=******;Password=******";
                baglan.Open();
                cmd.Parameters.Clear();
                cmd.CommandText = "select * from login_yeni where kadi='" + TextBox1.Text + "' and parola='" + TextBox2.Text + "'";
                cmd.Connection = baglan;
                oku = cmd.ExecuteReader();

                if (oku.Read())
                {
                    Session["sqlip"] = oku["sqlip"];
                    Session["username"] = oku["username"];
                    Session["userparola"] = oku["user_parola"];
                    Session["kulad"] = oku["kadi"];
                    Session["parola"] = oku["parola"];
                    Session["firma_bilgi"] = oku["firma_bilgi"]; 

                    if (oku["proje"].ToString() == "oriz")
                    {
                        Response.Redirect("oriz/orizana.aspx");
                    }
                    else if (oku["proje"].ToString() == "boyiz")
                    {
                        Response.Redirect("boyiz/boyizana.aspx");
                    }
                    else if (oku["proje"].ToString() == "dokuiz")
                    {
                        Response.Redirect("dokuiz/dokuizana.aspx");
                    }
                }
                else
                {
                    ASPxLabel1.Text = "Girilen bilgilere ait bir kullanıcı yok";
                    ASPxLabel1.Visible = true;
                }
                oku.Close();
                baglan.Close();
            }
            else
            {
                ASPxLabel1.Text = "Lütfen onay veriniz";
                ASPxLabel1.Visible = true;
            }
        }
    }
}