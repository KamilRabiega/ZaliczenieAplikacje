using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projekt_zaliczeniowy
{
    public partial class wyloguj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["zalogowano"] = 0;
            Session["username"] = "";
            Response.Redirect("default.aspx");
        }
    }
}