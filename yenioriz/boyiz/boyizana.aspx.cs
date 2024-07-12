using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace yenioriz.boyiz
{
    public partial class boyizana : System.Web.UI.Page
    {

        SqlConnection baglan = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader oku;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Label1.Text = Session["sqlip"].ToString();
            //Label2.Text = Session["username"].ToString();
            //Label3.Text = Session["userparola"].ToString();
            //Label4.Text = Session["kulad"].ToString();
            //Label5.Text = Session["parola"].ToString();

            baglan.ConnectionString = "Data Source=" + Session["sqlip"] + ";Network Library=DBMSSOCN;Initial Catalog=arer;User ID=" + Session["username"] + ";Password=" + Session["userparola"];
            baglan.Open();
            cmd.Parameters.Clear();
            cmd.CommandText = "select * from usertable where username='" + Session["kulad"] + "' and password='" + Session["parola"] + "'";
            cmd.Connection = baglan;
            oku = cmd.ExecuteReader();
            if (oku.Read())
            {
                Session["proje_sql_ip"] = oku["sqlip"];
                Session["proje_sql_sa"] = oku["sql_sa"];
                Session["proje_sql_parola"] = oku["sql_pas"];
                Session["proje_database"] = oku["veritabani"];
                //Label6.Text = Session["proje_sql_ip"].ToString();
                //Label7.Text = Session["proje_sql_sa"].ToString();
                //Label8.Text = Session["proje_sql_parola"].ToString();
                //Label9.Text = Session["proje_database"].ToString();

                //string userdevice = Request.UserAgent.ToLower();

                //if (userdevice.Contains("mobile"))
                //{
                //    Response.Redirect("yenimain.aspx");
                //}
                //else
                //{
                //    Response.Redirect("anasayfa.aspx");
                //}

                Response.Redirect("dokuanasayfa.aspx");
            }
            else
            {
                Response.Write("SİSTEM VERİ TABANI BİLGİLERİNİZ YANLIŞTIR");
            }
            oku.Close();
            baglan.Close();
        }
    }
}