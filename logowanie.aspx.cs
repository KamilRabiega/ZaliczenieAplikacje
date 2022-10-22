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
    public partial class logowanie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Logowanie
            SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            string login = TextBox1.Text;
            string password = TextBox2.Text;

            SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE Login='" + login + "' AND Password='" + password + "'", conn);

            if (login == "" || password == "")
            {
                LabelError.Text = "Musisz wprowadzić login oraz hasło!";
                LabelError.Visible = true;
            }
            else
            {
                LabelError.Visible = false;
                conn.Open();
                using
                (SqlDataReader Areader = cmd.ExecuteReader())
                {
                    if (!Areader.HasRows)//nie ma rekordów. Nie ma takiego konta
                    {
                        Session["zalogowano"] = 0;
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Wprowadzono błędny login lub hasło.')", true);
                        TextBox1.Text = "";
                        TextBox2.Text = "";
                        Session["username"] = login;
                    }
                    else //zalogowanie OK
                    {
                        Session["zalogowano"] = 1;
                        TextBox1.Text = "";
                        TextBox2.Text = "";
                        Session["username"] = login;
                        string username = Session["username"].ToString();
                        if((string)Session["username"] == "admin")
                        {
                            Response.Redirect("konfiguracja.aspx");
                        }
                        else
                        {
                            Response.Redirect("default.aspx"); 
                        }
                    }
                    conn.Close();
                }
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }
    }
}