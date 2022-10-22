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
    public partial class rejestracja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Zarejestruj się
            SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            string login = TextBox1.Text;
            string password = TextBox2.Text;
            string email = TextBox3.Text;
            string imie = TextBox4.Text;
            string nazwisko = TextBox5.Text;

            SqlCommand cmd = new SqlCommand("Insert Users (Imie, Nazwisko, Login, Password, Email) Values ('"
            + imie + "','" + nazwisko + "','" + login + "','" + password + "', '" + email + "')", conn);

            if (login == "" || password == "" || imie == "" || nazwisko == "" || email == "")
            {
                LabelError.Text = "Musisz wypełnić wsystkie pola!";
                LabelError.Visible = true;
            }
            else
            {
                LabelError.Visible = false;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                //GridView1.DataBind();\
                Response.Redirect("default.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Anuluj
            Response.Redirect("default.aspx");
        }
    }
}