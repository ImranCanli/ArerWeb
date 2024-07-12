using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace yenioriz.oriz
{
    public partial class anasayfa : System.Web.UI.Page
    {
        //public string connectionstring = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string anaquery = "SELECT CONVERT(INT, makverim) as makverim, CONVERT(INT, plansizdurus) as plansizdurus, CONVERT(INT, makkod) as makkod, perisim, perkod, dev, kimlik, gecidurussay, makad FROM vardiya WHERE islem = 0";


            tarihlabel.Text = Session["firma_bilgi"].ToString();

            if (!IsPostBack)
            {
                vericek2();
            }
            verial(anaquery);
        }

        protected void verial(String queryuse)
        {
            String connectionString = getcons();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = queryuse;

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
            vericek();
        }

        protected void vericek()
        {

            string connections = getcons();
            using (SqlConnection connection = new SqlConnection(connections))
            {
                string query = "SELECT CONVERT(INT, AVG(makverim)) as makverim, SUM(plansizdurus) as plansizdurus, (SELECT TOP (1) cassure FROM vardiya WHERE islem = 0 ORDER BY cassure DESC) as vardiyasuresi, (SELECT COUNT(*) FROM vardiya WHERE islem = 0 AND gecidurussay = 0) as calisanmaksayi, (SELECT COUNT(*) FROM vardiya WHERE islem = 0 AND gecidurussay <> 0) as duranmaksayi, (SELECT TOP(1) vardiyatur FROM vardiya WHERE islem = 0) as vardiyatur, (SELECT TOP(1) tarih FROM vardiya WHERE islem = 0) as tarih FROM vardiya WHERE islem = 0";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            ortmakverimlabel.Text = reader["makverim"].ToString() + "%";
                            duranmakineadetlabel.Text = reader["duranmaksayi"].ToString() + " AD.";
                            calisanmakineadetlabel.Text = reader["calisanmaksayi"].ToString() + " AD.";
                            toplamuretimlabel.Text = reader["vardiyasuresi"].ToString() + " DK.";
                            vardiyaturlabel.Text = reader["tarih"].ToString().Substring(0, 10) + ", " + reader["vardiyatur"].ToString();
                        }
                    }
                    else
                    {
                        ortmakverimlabel.Text = "Veri Bulunamadı";
                        duranmakineadetlabel.Text = "Veri Bulunamadı";
                        calisanmakineadetlabel.Text = "Veri Bulunamadı";
                        toplamuretimlabel.Text = "Veri Bulunamadı";
                        tarihlabel.Text = "-";
                        vardiyaturlabel.Text = "-";
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
                string query = "SELECT kartno, ad, soyad, kimlik FROM kisiler ORDER BY ad ASC";

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

        protected string getcons()
        {
            string returndegeri = "Data Source=" + Session["proje_sql_ip"] + ";Network Library=DBMSSOCN;Initial Catalog=" + Session["proje_database"] + ";User ID=" + Session["proje_sql_sa"] + ";Password=" + Session["proje_sql_parola"];

            return returndegeri;
        }

        protected void duranmakinefiltre_Click(object sender, EventArgs e)
        {
            string duranmakinequery = "SELECT CONVERT(INT, makverim) as makverim, CONVERT(INT, plansizdurus) as plansizdurus, CONVERT(INT, makkod) as makkod, perisim, perkod, dev, kimlik, gecidurussay, makad FROM vardiya WHERE islem = 0 AND gecidurussay > 3";
            verial(duranmakinequery);
        }

        protected void calisanmakinefiltre_Click(object sender, EventArgs e)
        {
            string calisanmkinequery = "SELECT CONVERT(INT, makverim) as makverim, CONVERT(INT, plansizdurus) as plansizdurus, CONVERT(INT, makkod) as makkod, perisim, perkod, dev, kimlik, gecidurussay, makad FROM vardiya WHERE islem = 0 AND gecidurussay = 0";
            verial(calisanmkinequery);
        }

        protected void tummakinefiltre_Click(object sender, EventArgs e)
        {
            string tummakinequery = "SELECT CONVERT(INT, makverim) as makverim, CONVERT(INT, plansizdurus) as plansizdurus, CONVERT(INT, makkod) as makkod, perisim, perkod, dev, kimlik, gecidurussay, makad FROM vardiya WHERE islem = 0";
            verial(tummakinequery);
        }

        protected void personelatamabuton_Command(object sender, CommandEventArgs e)
        {
            string mainqueryy = "SELECT CONVERT(INT, makverim) as makverim, CONVERT(INT, plansizdurus) as plansizdurus, CONVERT(INT, makkod) as makkod, perisim, perkod, dev, kimlik, gecidurussay, makad FROM vardiya WHERE islem = 0";
            string commandArgument = e.CommandArgument.ToString();
            string[] values = commandArgument.Split(',');

            string perisim = values[0];
            string kartno = values[1];


            string connectionString = getcons();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE vardiya SET perkod = @perkod, perisim = @perisim WHERE kimlik = @kimlik";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@perkod", kartno);
                    command.Parameters.AddWithValue("@perisim", perisim);
                    command.Parameters.AddWithValue("@kimlik", kimlikgonder.Value);

                    connection.Open();

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        verial(mainqueryy);
                    }
                    else
                    {
                        Response.Redirect("fornavbar.aspx");
                    }
                    connection.Close();
                }
            }
        }

        protected void deviratamonaybuton_Click(object sender, EventArgs e)
        {
            string mainqueryy = "SELECT CONVERT(INT, makverim) as makverim, CONVERT(INT, plansizdurus) as plansizdurus, CONVERT(INT, makkod) as makkod, perisim, perkod, dev, kimlik, gecidurussay, makad FROM vardiya WHERE islem = 0";

            string connectionString = getcons();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE vardiya SET dev = @dev WHERE kimlik = @kimlik";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@dev", devirentry.Text);
                    command.Parameters.AddWithValue("@kimlik", kimlikgonder.Value);

                    connection.Open();

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        verial(mainqueryy);
                        devirentry.Text = "";
                    }
                    else
                    {
                        Response.Redirect("fornavbar.aspx");
                    }
                    connection.Close();
                }
            }
        }

        protected void durusatamaa_Click(object sender, EventArgs e)
        {
            Response.Redirect("duruslar.aspx?secilenmakine=" + kimlikgonder.Value);
        }

        protected void arsivsorgubuton_Click(object sender, EventArgs e)
        {

            try
            {

                string gelentarih = "";
                string gelenvardiya = "";
                string arsivsorgusu = "SELECT CONVERT(INT, makverim) as makverim, CONVERT(INT, plansizdurus) as plansizdurus, CONVERT(INT, makkod) as makkod, perisim, perkod, dev, kimlik, gecidurussay, makad FROM vardiya WHERE tarih ='" + arsivdate.Text + "'AND vardiyatur ='" + vardiyaturutut.Value + "'";
                verial(arsivsorgusu);

                string connections = getcons();
                using (SqlConnection connection = new SqlConnection(connections))
                {
                    string query = "SELECT CONVERT(INT, AVG(makverim)) as makverim, SUM(plansizdurus) as plansizdurus, (SELECT TOP (1) cassure FROM vardiya WHERE tarih = @tarih AND vardiyatur ='" + vardiyaturutut.Value + "' ORDER BY cassure DESC) as vardiyasuresi, (SELECT COUNT(*) FROM vardiya WHERE tarih = @tarih AND vardiyatur ='" + vardiyaturutut.Value + "' AND gecidurussay = 0) as calisanmaksayi, (SELECT COUNT(*) FROM vardiya WHERE tarih = @tarih AND vardiyatur ='" + vardiyaturutut.Value + "' AND gecidurussay <> 0) as duranmaksayi, (SELECT TOP(1) vardiyatur FROM vardiya WHERE tarih = @tarih AND vardiyatur ='" + vardiyaturutut.Value + "') as vardiyatur, (SELECT TOP(1) tarih FROM vardiya WHERE tarih = @tarih AND vardiyatur ='" + vardiyaturutut.Value + "') as tarih FROM vardiya WHERE tarih= @tarih AND vardiyatur='" + vardiyaturutut.Value + "'";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        connection.Open();

                        command.Parameters.AddWithValue("@tarih", arsivdate.Text);

                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                ortmakverimlabel.Text = reader["makverim"].ToString() + "%";
                                duranmakineadetlabel.Text = reader["duranmaksayi"] + " AD.";
                                calisanmakineadetlabel.Text = reader["calisanmaksayi"] + " AD.";
                                toplamuretimlabel.Text = reader["vardiyasuresi"].ToString() + " DK.";
                                gelentarih = reader["tarih"].ToString().Substring(0, 10);
                                gelenvardiya = reader["vardiyatur"].ToString();
                                arsivdate.Text = "";

                            }
                        }
                        else
                        {
                            ortmakverimlabel.Text = "Veri Bulunamadı";
                            duranmakineadetlabel.Text = "Veri Bulunamadı";
                            calisanmakineadetlabel.Text = "Veri Bulunamadı";
                            toplamuretimlabel.Text = "Veri Bulunamadı";
                            tarihlabel.Text = "Veri Bulunamadı";
                            vardiyaturlabel.Text = "Veri Bulunamadı";
                        }
                        reader.Close();
                        connection.Close();
                    }
                }
                vardiyaturlabel.Text = gelentarih.ToString() + ", " + gelenvardiya.ToString();

            }
            catch {
                verial("SELECT CONVERT(INT, makverim) as makverim, CONVERT(INT, plansizdurus) as plansizdurus, CONVERT(INT, makkod) as makkod, perisim, perkod, dev, kimlik, gecidurussay, makad FROM vardiya WHERE islem = 0");
            }
        }

        protected void onlinevardiyabuton_Click(object sender, EventArgs e)
        {
            verial("SELECT CONVERT(INT, makverim) as makverim, CONVERT(INT, plansizdurus) as plansizdurus, CONVERT(INT, makkod) as makkod, perisim, perkod, dev, kimlik, gecidurussay, makad FROM vardiya WHERE islem = 0");
        }
    }
}