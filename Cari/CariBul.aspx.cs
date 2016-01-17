using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cari_CariBul : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CariKarti.aspx?cari=1");
    }
}