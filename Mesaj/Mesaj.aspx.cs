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

public partial class Mesaj_Mesaj : System.Web.UI.Page
{
    string database_master = "WebMart_Master"; // Bu sayfaya özel veriler Master Database e eklendiği için sabit yaptık
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //lbl_banka_hesap_id.Text = "0";

        }

        lbl_mesaj.Text = "";
        OkunmamisMesajlariGetir();

    }

    protected void dd_kullanici_listele_DataBound(object sender, EventArgs e)
    {
        dd_kullanici_listele.Items.Insert(0, new ListItem("- Kullanıcı Seçiniz -", "0"));
    }

    protected void dd_grup_listele_DataBound(object sender, EventArgs e)
    {
        dd_grup_listele.Items.Insert(0, new ListItem("- Yetki Grubu Seçiniz -", "0"));
    }

    protected void ibtn_post_Click(object sender, ImageClickEventArgs e)
    {
        string queryString;
        string kayit_tarihi = DateTime.Now.ToString("dd.MM.yyyy hh:mm:ss");

        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(database_master);

        try
        {
            if (dd_kullanici_listele.SelectedValue != "0")
            {

                queryString = "INSERT INTO mesaj (tarih,gonderici_id,gonderici_adi_soyadi,alici_id,alici_adi_soyadi,mesaj) VALUES \n" +
                                 "(@tarih,@gonderici_id,@gonderici_adi_soyadi,@alici_id,@alici_adi_soyadi,@mesaj)";
                SqlCommand cmd = new SqlCommand(queryString, connection);
                cmd.Parameters.Add("@tarih", SqlDbType.DateTime).Value = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
                cmd.Parameters.Add("@gonderici_id", SqlDbType.Int).Value = Session["kullanici_id"].ToString();
                cmd.Parameters.Add("@gonderici_adi_soyadi", SqlDbType.NVarChar).Value = Session["adi_soyadi"].ToString();
                cmd.Parameters.Add("@alici_id", SqlDbType.Int).Value = dd_kullanici_listele.SelectedValue;
                cmd.Parameters.Add("@alici_adi_soyadi", SqlDbType.NVarChar).Value = dd_kullanici_listele.SelectedItem.Text;
                cmd.Parameters.Add("@mesaj", SqlDbType.NVarChar).Value = txt_mesaj.Text;
                cmd.ExecuteNonQuery();

            }
            else if (dd_grup_listele.SelectedValue != "0")
            {

                queryString = "INSERT INTO mesaj (grubu_id,grubu_adi,tarih,gonderici_id,gonderici_adi_soyadi,mesaj) VALUES \n" +
                                "(@grubu_id,@grubu_adi,@tarih,@gonderici_id,@gonderici_adi_soyadi,@mesaj)";

                SqlCommand cmd = new SqlCommand(queryString, connection);
                cmd.Parameters.Add("@grubu_id", SqlDbType.Int).Value = dd_grup_listele.SelectedValue;
                cmd.Parameters.Add("@grubu_adi", SqlDbType.NVarChar).Value = dd_grup_listele.SelectedItem.Text;
                cmd.Parameters.Add("@tarih", SqlDbType.DateTime).Value = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
                cmd.Parameters.Add("@gonderici_id", SqlDbType.Int).Value = Session["kullanici_id"].ToString();
                cmd.Parameters.Add("@gonderici_adi_soyadi", SqlDbType.NVarChar).Value = Session["adi_soyadi"].ToString();
                cmd.Parameters.Add("@mesaj", SqlDbType.NVarChar).Value = txt_mesaj.Text;
                cmd.ExecuteNonQuery();
            }



        }//end TRY
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error INSERT. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
            OkunmamisMesajlariGetir();
        }

        if (dd_kullanici_listele.SelectedValue != "0")  //Mesajlarıda gelsin
        { MesajlariGetir(Convert.ToInt32(dd_kullanici_listele.SelectedValue)); }




    }

    protected void OkunmamisMesajlariGetir()
    {
        string hareketSQL = "SELECT * FROM mesaj WHERE alici_id=" + Session["kullanici_id"].ToString() + " and okundu_mu='False' ORDER BY tarih DESC";
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(database_master);
        SqlCommand cmd = new SqlCommand(hareketSQL, connection);

        int updated = 0;
        try
        {

            updated = cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds_hareket = new DataSet();
            da.Fill(ds_hareket);

            gv_okunmamis_mesajlar.DataSource = ds_hareket;
            gv_okunmamis_mesajlar.DataBind();

            //lblResults.Text = updated.ToString() + " record updated.";
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Listele. ";
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

    protected void gv_okunmamis_mesajlar_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_okunmamis_mesajlar.PageIndex = e.NewPageIndex;
        OkunmamisMesajlariGetir();
    }

    protected void gv_okunmamis_mesajlar_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_okunmamis_mesajlar.SelectedRow;
        Label lbl_anahtar_id = (Label)row.FindControl("lbl_gonderici_id"); // label kasa id numarasını alıyoruz detay için.

        dd_kullanici_listele.SelectedValue = lbl_anahtar_id.Text;
        dd_grup_listele.SelectedValue = "0";
        MesajlariGetir(Convert.ToInt32(lbl_anahtar_id.Text));
    }

    protected void MesajlariGetir(int alici_id)
    {
        string hareketSQL = "SELECT * FROM mesaj WHERE (gonderici_id=" + alici_id + " or  alici_id=" + alici_id + ") and  (alici_id=" + Session["kullanici_id"].ToString() + " or gonderici_id=" + Session["kullanici_id"].ToString() + ") ORDER BY tarih DESC";
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(database_master);
        SqlCommand cmd = new SqlCommand(hareketSQL, connection);

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
            lbl_mesaj.Text = "Error MESAJLARI Listele. ";
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

    protected void gv_listele_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void dd_kullanici_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        MesajlariGetir(Convert.ToInt32(dd_kullanici_listele.SelectedValue));
    }

}