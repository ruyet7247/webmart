using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.Security;
using System.Drawing.Imaging;
using System.Data; // veritabanı
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Threading;

public partial class Login : System.Web.UI.Page
{
    TextBox dtext; //doğrulama text
    
   protected void Page_Load(object sender, EventArgs e)
    {
        dtext = (TextBox)Pnl_login.FindControl("txt_dtext");
        //** doğrulama textbox ı üzerindeyken entere basılırsa Login butonunu clickle
        if (dtext != null)
        {
            dtext.Attributes.Add("onkeydown", "if(event.which || event.keyCode){if ((event.which == 13) || (event.keyCode == 13)) {document.getElementById('btnLogin').click();return false;}} else {return true}; ");
        }
        // ** doğrulama resmini çiz
        if (!IsPostBack)
        {
            Dogrulama();
            lbl_mesaj.Text = "";
        }
    }

    private string createCode()
    {
        Random rnd = new Random();
        string charecters = "123456789QWERTYUIPASDFGHJKLZXCVBNM";
        string code = null;

        for (int i = 0; i < 5; i++)
        {
            code = code + charecters[rnd.Next(0, charecters.Length - 1)].ToString();
        }
        return code;
    }

    public void Dogrulama()
    {
        // ** doğrulama resmini çiz

        Bitmap _bitmap = new Bitmap(90, 30);
        Graphics _graph = Graphics.FromImage(_bitmap);
        Font _font = new Font("Georgia", 15);
        _graph.Clear(Color.Red);
        string code = createCode();
        Session["code"] = code;
        _graph.DrawString(code, _font, Brushes.White, 5, 5);
        _bitmap.Save(Server.MapPath("Images/img.Bmp"), ImageFormat.Bmp);

    }

    protected void Ibtn_login_Click(object sender, ImageClickEventArgs e)
    {
        string dog_kodu = dtext.Text;
        string code = Session["code"].ToString();

        if (code == dtext.Text)     // güvenlik kodu doğru ise
        {
            // dtext = (TextBox)Pnl_login.FindControl("txt_dtext");
            //lbl_mesaj.Text = "Başarılı";
            if (txt_kullanici_adi.Text == "" || txt_sifre.Text == "")
            { }
            else
            {
                YasakliKelimeKontrol yasak_kontrol = new YasakliKelimeKontrol();
                bool yasak_kelime_kontrol = yasak_kontrol.YasakKelimeyiKontrolEt(txt_kullanici_adi.Text+" "+txt_sifre.Text);
                if (yasak_kelime_kontrol)
                {
                    if (KullaniciGirisKontrol(txt_kullanici_adi.Text, txt_sifre.Text))  // BAŞARILI MI???????
                    {
                        /* LOGİN başarılı ise DEfault yönlendirilir. Tüm sayfalarda SESSION MASTERPAGE de bir seferde kontrol edilir. */
                        Response.Redirect("Default.aspx");
                    }
                }
            } 
            
        }
        else // güvenlik kodu doğru değilise
        {
            lbl_mesaj.Text = "Doğrulama Kodu Hatalı";
        }

       


    }


    protected bool KullaniciGirisKontrol(string kullanici_adi,string sifre)
    {

        string queryString = "SELECT   dbo.firma_kullanici_kayit.*,dbo.firma_kayit.firma_adi, dbo.firma_kayit.veritabani_adi, dbo.firma_kayit.connection_string_adi FROM dbo.firma_kayit INNER JOIN dbo.firma_kullanici_kayit ON dbo.firma_kayit.firma_id = dbo.firma_kullanici_kayit.firma_id WHERE aktif_or_pasif=1 AND kullanici_adi=@kullanici_adi AND kullanici_sifre=@kullanici_sifre";
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan("WebMart_Master");
        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {
            cmd.Parameters.Add("@kullanici_adi", SqlDbType.NVarChar).Value = txt_kullanici_adi.Text;
            cmd.Parameters.Add("@kullanici_sifre", SqlDbType.NVarChar).Value = txt_sifre.Text;
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Session["GirisVar"] = "True";
                    Session["ConnectionString"] = reader["connection_string_adi"].ToString();
                    Session["firma_id"] = reader["firma_id"].ToString();
                    Session["firma_adi"] = reader["firma_adi"].ToString();
                    Session["adi_soyadi"] = reader["adi_soyadi"].ToString();
                    Session["gsm"] = reader["connection_string_adi"].ToString();
                    Session["yetki"] = reader["yetki"].ToString();


                    string firma_id = reader["firma_id"].ToString();
                    string yetki = reader["yetki"].ToString();

                    if (firma_id == "-1" && yetki == "master")
                    {
                        Session["Master"] = "True";
                    }
                    else
                    {
                        Session["Master"] = "False";
                    }
                    return true;

                }
            }
            else
            {
                lbl_mesaj.Text = "Hatalı Kullanıcı Adı veya Şifre ";
                Session["GirisVar"] = "False";
                return false;
            }


        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Login Kullanıcı Girişi. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }


        return false;

    }
  



}
