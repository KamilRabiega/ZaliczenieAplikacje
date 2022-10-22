using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Projekt_zaliczeniowy
{
    public partial class cennik : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Panel2.Visible == true)
            {
                Panel1.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            Panel1.Visible = false;
            
            /*
            SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            string Nazwa = TextBox1.Text;

            SqlCommand cmd = new SqlCommand(
                    "SELECT [Id_produktu], [Nazwa], [Producent], [Cena], [Opis], [Adres_www] AS [Strona internetowa], [Stan_magazynu] AS Stan FROM [Produkty] WHERE [Nazwa] LIKE '" + Nazwa + "')", conn);

            if (TextBox1.Text == "")
            {
                LabelError.Visible = true;
                LabelError.Text = "Aby coś wyszukać musisz wprowadzić tekst!";
            }
            else
            {
                LabelError.Visible = false;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }*/
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
        }
    }
}