using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //BURALAR EN SON AKTİF OLSUN
        if (Session["GirisVar"] != "True")  // True değilse
        {
            NavigationMenu.Visible = false;
            lbl_KullaniciBilgileri.Visible = false;
            ibtn_exit.Visible = false;
            Response.Redirect("Login.aspx");
        }

        if (Session["GirisVar"] == "True")
        {
            if (Session["Master"] == "True")
            {
                Response.Redirect("~/Yonetim");
               
            }
            else
            {
                NavigationMenu.Visible = true;
                lbl_KullaniciBilgileri.Visible = true;
                ibtn_exit.Visible = true;
            }
        }
      


    }
    protected void ibtn_exit_Click(object sender, ImageClickEventArgs e)
    {
        OturumBilgileriniTemizle();
        Response.Redirect("../Login.aspx");
    }

    protected void OturumBilgileriniTemizle()
    {
        Session["GirisVar"] = "False";
        Session["ConnectionString"] = "";
        Session["firma_id"] = "";
        Session["firma_adi"] = "";
        Session["adi_soyadi"] = "";
        Session["gsm"] = "";
        Session["yetki"] = "";

    }   

}
