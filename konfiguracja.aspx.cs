using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projekt_zaliczeniowy
{
    public partial class konfiguracja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["username"] != "admin")
            {
                Response.Redirect("default.aspx");
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Edycja grup
            if(Panel_grupy.Visible == false )
            {
                Panel_grupy.Visible = true;
            }
            else
            {
                Panel_grupy.Visible = false;
            }
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Edycja produktów
            if (Panel_produkty.Visible == false)
            {
                Panel_produkty.Visible = true;
            }
            else
            {
                Panel_produkty.Visible = false;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //Edycja użytkowników
            if (Panel_uzytkownicy.Visible == false)
            {
                Panel_uzytkownicy.Visible = true;
            }
            else
            {
                Panel_uzytkownicy.Visible = false;
            }
        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void SData_grupy2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            GridView2.DataBind();
        }

        protected void SqlDataSource5_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            GridView3.DataBind();
        }
    }
}