﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteYonetim : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ConnectionString"] = "WebMart_Master";
        if (Session["GirisVar"] != null)
        {
            if (Session["GirisVar"] != "True" && Session["Master"] != "True")  // True değilse ve MASTER değilse
            {
                NavigationMenu.Visible = false;
                lbl_KullaniciBilgileri.Visible = false;
                ibtn_exit.Visible = false;
                Response.Redirect("../Login.aspx");
            }

            if (Session["GirisVar"] == "True" && Session["Master"] == "True") // Giriş var ve MASTER ise
            {
                NavigationMenu.Visible = true;
                lbl_KullaniciBilgileri.Visible = true;
                lbl_KullaniciBilgileri.Text = Session["adi_soyadi"].ToString();
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

    }   

}
