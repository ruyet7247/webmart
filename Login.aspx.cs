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
    String dataconnect = WebConfigurationManager.ConnectionStrings["CnnStr"].ConnectionString;

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
                    KullaniciGirisKontrol(txt_kullanici_adi.Text, txt_sifre.Text);
                }
            } 
            
        }
        else // güvenlik kodu doğru değilise
        {
            lbl_mesaj.Text = "Doğrulama Kodu Hatalı";
        }

    }


    protected void KullaniciGirisKontrol(string kullanici_adi,string sifre)
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString="SELECT * FROM firma_kullanici_tanimlama WHERE aktif_or_pasif=1 AND kullanici_adi=@kullanici_adi AND kullanici_sifre=@kullanici_sifre";
        SqlCommand cmd = new SqlCommand(queryString, connection);
        DataTable dt = new DataTable();
        try
        {
            connection.Open();
            cmd.Parameters.Add("@kullanici_adi", kullanici_adi);
            cmd.Parameters.Add("@kullanici_sifre", sifre);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Login. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();
        }
        if (dt.Rows.Count == 1)
        {
            lbl_mesaj.Text = "Giriş Başarılı";
            OturumBilgileriDoldur(kullanici_adi,sifre);
            Response.Redirect("Default.aspx");
        }
        else
        {
            lbl_mesaj.Text = "Giriş Başarısız";
        }
    }

    protected void OturumBilgileriDoldur(string kullanici_adi,string sifre)
    {
        Session["GirisVar"] = "True";

    }   



}
