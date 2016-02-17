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
        object sessionObject = Session["GirisVar"];
        if (sessionObject != null)
        {
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
                    if (SayfaKontrolleri(HttpContext.Current.Request.Url.AbsolutePath))  //// sayfada yetkisi kontrolü
                    {
                        NavigationMenu.Visible = true;
                        lbl_KullaniciBilgileri.Visible = true;
                        ibtn_exit.Visible = true;
                    }
                    else
                    {
                        Response.Redirect("../Default.aspx");  // sayfada yetkisi yoksa bu sayfaya yönlensin
                    }
                }
            }
        }
        else
        {
            // Not found
            Response.Redirect("Login.aspx");
        }
       

    }

    protected void ibtn_exit_Click(object sender, ImageClickEventArgs e)
    {
        OturumBilgileriniTemizle();
        Response.Redirect("~/Login.aspx");
    }

    public bool SayfaKontrolleri(string path)
    {
        
        string str = path;
        string[] strArr = null;
        char[] splitchar = { '/' };
        strArr = str.Split(splitchar);
        //Response.Write(strArr[2] + " " + Session["SayfaGenel"].ToString()+" "+Session["SayfaCari"]);  //klasör ismi
        if (strArr[2] == "Default.aspx") { return true; }
        if (strArr[2] == "GenelTanimlamalar" && Session["SayfaGenel"].ToString() == "True") { return true; } 
        if (strArr[2] == "Cari" && Session["SayfaCari"].ToString() == "True") { return true; } 
        if (strArr[2] == "Stok" && Session["SayfaStok"].ToString() == "True") { return true; } 
        if (strArr[2] == "Personel" && Session["SayfaPersonel"].ToString() == "True") { return true; }
        if (strArr[2] == "Kasa" && Session["SayfaKasa"].ToString() == "True") { return true; } 
        if (strArr[2] == "Randevu" && Session["SayfaRandevu"].ToString() == "True") { return true; }
        if (strArr[2] == "Mesaj" && Session["SayfaMesaj"].ToString() == "True") { return true; } 


        return false;
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
        Session["SayfaGenel"] = "";
        Session["SayfaCari"] = "";
        Session["SayfaStok"] = "";
        Session["SayfaPersonel"] = "";
        Session["SayfaKasa"] = "";
        Session["SayfaRandevu"] = "";
        Session["SayfaMesaj"] = "";

    }   

}
