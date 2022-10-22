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
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["zalogowano"] == 1)
            {
                string username = Session["username"].ToString();
                L_niezalogowany.Visible = false;
                Panel1.Visible = true;
                Panel3.Visible = false;
                Panel4.Visible = false;
                L_zalogowany2.Text = username;
            }
            else if ((int)Session["zalogowano"] == 0)
            {
                L_niezalogowany.Visible = true;
                Panel1.Visible = false;
                Panel3.Visible = true;
                Panel4.Visible = true;
            }

            if ((string)Session["username"] == "admin")
            {
                Panel2.Visible = true;
            }
            else
            {
                Panel2.Visible = false;
            }
        }

        protected void newsletter_Click(object sender, EventArgs e)
        {
            //Dodawanie rekordu
            SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            string adres = newsletterbox.Text;
            SqlCommand cmd = new SqlCommand("Insert Newsletter (Adres_email) Values ('" + adres + "')", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}