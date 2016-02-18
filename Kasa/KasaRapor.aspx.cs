using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // veritabanı
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Threading;

public partial class Kasa_KasaRapor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;

        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
            DateTime.Now.Year.ToString();
            DateTime date = DateTime.Today;

            txt_bas_tarih.Text = "01-01-" + DateTime.Now.Year.ToString();
            txt_son_tarih.Text = date.ToString("dd-MM-yyyy");

        }

    }
    protected void ibtn_raporla_Click(object sender, ImageClickEventArgs e)
    {
        KasaHareketListesiniGetir();
        KasaHareketToplamlariGetir();
    }

    protected void KasaHareketListesiniGetir()
    {
        DateTime ilktarih = Convert.ToDateTime(txt_bas_tarih.Text);
        DateTime sontarih = Convert.ToDateTime(txt_son_tarih.Text);
        string queryString = "SELECT * FROM kasa_hareket WHERE kasa_id=" + dd_kasa.SelectedValue + " and (kayit_tarihi BETWEEN '" + ilktarih + "' and '" + sontarih + "') ";
        if (dd_giris_or_cikis.SelectedValue != "tum")
        { queryString += " and giris_or_cikis='" + dd_giris_or_cikis.SelectedValue + "'"; }
      
        queryString += " ORDER BY kayit_tarihi DESC,kasa_hareket_id DESC";
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(queryString, connection);

        int updated = 0;
        try
        {

            updated = cmd.ExecuteNonQuery();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds_hareket = new DataSet();
            da.Fill(ds_hareket);

            gv_listele.DataSource = ds_hareket;
            gv_listele.DataBind();
            //lblResults.Text = updated.ToString() + " record updated.";

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error KASA HAREKET LİSTELEME ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }

        if (updated > 0)
        {
            //
        }
    }

    protected void KasaHareketToplamlariGetir()
    {
        
        DateTime ilktarih = Convert.ToDateTime(txt_bas_tarih.Text);
        DateTime sontarih = Convert.ToDateTime(txt_son_tarih.Text);
        int giren_toplam = 0;
        int cikan_toplam = 0;
        txt_giren.Text = "0"; txt_cikan.Text = "0";

        string queryStringGiren = "SELECT SUM(tutar) AS giren FROM kasa_hareket WHERE giris_or_cikis='giris' and kasa_id=" + dd_kasa.SelectedValue + " and (kayit_tarihi BETWEEN '" + ilktarih + "' and '" + sontarih + "') ";
        queryStringGiren += " ORDER BY kayit_tarihi DESC,kasa_hareket_id DESC";
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(queryStringGiren, connection);
        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    txt_giren.Text = reader["giren"].ToString();
                    giren_toplam = Convert.ToInt32(reader["giren"].ToString());
                }
            }
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Cari EXTRE LİSTELEME ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }

        string queryStringCikan = "SELECT sum(miktar) AS cikan FROM stok_hareket WHERE giris_or_cikis='cikis' and (kayit_tarihi BETWEEN '" + ilktarih + "' and '" + sontarih + "')";
        if (dd_islem_tipi.SelectedValue != "tum")
        { queryStringCikan += " and islem_tipi='" + dd_islem_tipi.SelectedValue + "'"; }
        ConnVt baglan2 = new ConnVt(); SqlConnection connection2 = baglan2.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd2 = new SqlCommand(queryStringCikan, connection2);
        try
        {
            SqlDataReader reader2 = cmd2.ExecuteReader();
            if (reader2.HasRows)
            {
                while (reader2.Read())
                {
                    txt_cikan.Text = reader2["cikan"].ToString();
                    cikan_toplam = Convert.ToInt32(reader2["cikan"].ToString());
                }
            }
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Cari EXTRE LİSTELEME ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan2.VeritabaniBaglantiyiKapat(connection);
        }
        ////////////////////////////////////////////////////////////////////////////////////////////
        try
        {
            int stok_miktari = giren_toplam - cikan_toplam;
            txt_stok_miktari.Text = stok_miktari.ToString();
            if (dd_giris_or_cikis.SelectedValue == "giris") { txt_cikan.Text = ""; txt_stok_miktari.Text = ""; }
            if (dd_giris_or_cikis.SelectedValue == "cikis") { txt_giren.Text = ""; txt_stok_miktari.Text = ""; }
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Stok StokGirisCikisToplaminiGetir2. ";
            lbl_mesaj.Text += err.Message;
        }
         * */

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_listele.PageIndex = e.NewPageIndex;
        KasaHareketListesiniGetir();
        KasaHareketToplamlariGetir();
    }
}