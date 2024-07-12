using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace yenioriz.oriz
{
    public partial class duruslar : System.Web.UI.Page
    {
        public string connectionstring = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            string secilenmakine = Request.QueryString["secilenmakine"];
            makinetutucu.Text = secilenmakine.ToString();
            string mainqueryy = "SELECT * FROM duruslar WHERE maknokimlik =" + secilenmakine;

            if (!IsPostBack)
            {
                vericek2();
                verial();
            }
            vericek(mainqueryy);
        }

        protected void verial()
        {
            string connections = getcons();
            using (SqlConnection connection = new SqlConnection(connections))
            {
                string query = "SELECT TOP(1) vardiyatur as vardiyatur, tarih as tarih FROM vardiya WHERE islem = 0";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            vardiyaturlabel.Text = "VARDİYA :" + reader["vardiyatur"].ToString();
                            vardiyatarihlabel.Text = "TARİH :" + reader["tarih"].ToString().Substring(0, 10);
                        }
                    }
                    else
                    {
                        vardiyaturlabel.Text = "-";
                        vardiyatarihlabel.Text = "-";
                    }
                    reader.Close();
                }
                connection.Close();
            }
        }

        protected void vericek2()
        {
            String connectionString = getcons();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM planliduruslar";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    DataTable dataTable = new DataTable();

                    dataTable.Load(reader);

                    connection.Close();

                    Repeater2.DataSource = dataTable;
                    Repeater2.DataBind();
                }
            }
        }

        protected void vericek(string queryforuse)
        {
            String connectionString = getcons();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = queryforuse;

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    DataTable dataTable = new DataTable();

                    dataTable.Load(reader);

                    connection.Close();

                    Repeater1.DataSource = dataTable;
                    Repeater1.DataBind();
                }
            }
        }

        protected string getcons()
        {
            string returndegeri = "Data Source=" + Session["proje_sql_ip"] + ";Network Library=DBMSSOCN;Initial Catalog=" + Session["proje_database"] + ";User ID=" + Session["proje_sql_sa"] + ";Password=" + Session["proje_sql_parola"];
            return returndegeri;
        }

        protected void planlidurusfiltreyeni_Click(object sender, EventArgs e)
        {
            vericek("SELECT * FROM duruslar WHERE maknokimlik =" + makinetutucu.Text + "AND tur = 'PLANLI DURUŞ'");
        }

        protected void plansizfiltreyeni_Click(object sender, EventArgs e)
        {
            vericek("SELECT * FROM duruslar WHERE maknokimlik =" + makinetutucu.Text + "AND tur = 'PLANSIZ DURUŞ'");
        }

        protected void tumduruslarfiltreyeni_Click(object sender, EventArgs e)
        {
            vericek("SELECT * FROM duruslar WHERE maknokimlik =" + makinetutucu.Text);
        }

        protected void aciklamaonaybuton_Click(object sender, EventArgs e)
        {
            string mainqueryy = "SELECT * FROM duruslar WHERE maknokimlik =" + makinetutucu.Text;

            string connectionString = getcons() ;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE duruslar SET aciklama2 = @aciklama2 WHERE kimlik = @kimlik";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@aciklama2", aciklamaentry.Text);
                    command.Parameters.AddWithValue("@kimlik", kimliktut.Value);

                    connection.Open();

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        vericek(mainqueryy);
                        aciklamaentry.Text = "";
                    }
                    else
                    {
                        Response.Redirect("fornavbar.aspx");
                    }
                    connection.Close();
                }
            }
        }

        protected void nedenatamabuton_Command(object sender, CommandEventArgs e)
        {
            string mainqueryy = "SELECT * FROM duruslar WHERE maknokimlik =" + makinetutucu.Text;

            string commandargument = e.CommandArgument.ToString();
            string[] values = commandargument.Split(',');

            string durusad = values[0];
            string kimlik = values[1];


            string connectionString = getcons();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE duruslar SET neden = @neden WHERE kimlik = @kimlik";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@neden", durusad);
                    command.Parameters.AddWithValue("@kimlik", kimliktut.Value);

                    connection.Open();

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        vericek(mainqueryy);
                        aciklamaentry.Text = "";
                    }
                    else
                    {
                        Response.Redirect("fornavbar.aspx");
                    }
                    connection.Close();
                }
            }
        }

        protected void nedenaktarmabuton_Command(object sender, CommandEventArgs e)
        {
            string commandargument = e.CommandArgument.ToString();
            string[] values = commandargument.Split(',');

            string durusad = values[0];
            string kimlik = values[1];
            int secilendurussuresi = Convert.ToInt32(suretut.Value);
            string secilendurusturu = turtut.Value;
            string connectionString = getcons();

            if (secilendurusturu == "PLANLI DURUŞ")
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "UPDATE vardiya SET planlidurus = planlidurus - @sure, plansizdurus = plansizdurus + @sure WHERE kimlik = @maknokimlik";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@sure", secilendurussuresi);
                        command.Parameters.AddWithValue("@maknokimlik", maknokimliktut.Value);

                        connection.Open();

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            aktarmaplus("PLANSIZ DURUŞ", durusad);
                        }
                        else
                        {
                            Response.Redirect("fornavbar.aspx");
                        }
                        connection.Close();
                    }
                }

            }
            else if (secilendurusturu == "PLANSIZ DURUŞ")
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "UPDATE vardiya SET planlidurus = planlidurus + @sure, plansizdurus = plansizdurus - @sure WHERE kimlik = @maknokimlik";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@sure", secilendurussuresi);
                        command.Parameters.AddWithValue("@maknokimlik", maknokimliktut.Value);

                        connection.Open();

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            aktarmaplus("PLANLI DURUŞ", durusad);
                        }
                        else
                        {
                            Response.Redirect("fornavbar.aspx");
                        }
                        connection.Close();
                    }
                }
            }
        }

        protected void aktarmaplus(String tur, String eklenecekneden)
        {

            string mainqueryy = "SELECT * FROM duruslar WHERE maknokimlik =" + makinetutucu.Text;
            string connectionString = getcons();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE duruslar SET neden = @neden, tur = @tur WHERE kimlik = @kimlik";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@neden", eklenecekneden);
                    command.Parameters.AddWithValue("@tur", tur);
                    command.Parameters.AddWithValue("@kimlik", kimliktut.Value);

                    connection.Open();

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        vericek(mainqueryy);
                        aciklamaentry.Text = "";
                    }
                    else
                    {
                        Response.Redirect("fornavbar.aspx");
                    }
                    connection.Close();
                }
            }
        }

        protected void plansidurusbuton_Click(object sender, EventArgs e)
        {
            Response.Redirect("anasayfa.aspx");
        }
    }
}