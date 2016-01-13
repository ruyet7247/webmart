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

public partial class GenelTanimlamar_GKullaniciTanimlama : System.Web.UI.Page
{
    String dataconnect = WebConfigurationManager.ConnectionStrings["CnnStr"].ConnectionString;
    int kullanici_id = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbl_kod_no.Text = "0";
        }
    }
    protected void ibtn_ekle_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_kod_no.Text == "0")
        {
            KullaniciEkle();
        }
        else
        {
            KullaniciGuncelle();
        }
    }

    protected void KullaniciEkle()
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "INSERT INTO firma_kullanici_tanimlama (kullanici_personel_id,kullanici_adi,kullanici_sifre,aktif_or_pasif) VALUES \n" +
                                                                    "(@kullanici_personel_id,@kullanici_adi,@kullanici_sifre,@aktif_or_pasif)";
        SqlCommand cmd = new SqlCommand(queryString, connection);

        Response.Write(dd_list_aktif_or_pasif.SelectedValue);

        try
        {
            cmd.Parameters.Add("@kullanici_personel_id", SqlDbType.Int).Value =Convert.ToInt32(dd_list_kullanici.SelectedValue);
            cmd.Parameters.Add("@kullanici_adi", SqlDbType.NVarChar).Value = txt_kullanici_adi.Text;
            cmd.Parameters.Add("@kullanici_sifre", SqlDbType.NVarChar).Value = txt_kullanici_sifre.Text;
            cmd.Parameters.Add("@aktif_or_pasif", SqlDbType.Char).Value =dd_list_aktif_or_pasif.SelectedValue;
          
            connection.Open();
            cmd.ExecuteNonQuery();
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
    }

    protected void KullaniciGuncelle()
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "UPDATE firma_kayit SET kullanici_personel_id=@kullanici_personel_id,kullanici_adi=@kullanici_adi,kullanici_sifre=@kullanici_sifre,aktif_or_pasif=@aktif_or_pasif WHERE kullanici_id=" + kullanici_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);



        try
        {

            cmd.Parameters.Add("@kullanici_personel_id", SqlDbType.Int).Value = Convert.ToInt32(dd_list_kullanici.SelectedValue);
            cmd.Parameters.Add("@kullanici_adi", SqlDbType.NVarChar).Value = txt_kullanici_adi.Text;
            cmd.Parameters.Add("@kullanici_sifre", SqlDbType.NVarChar).Value = txt_kullanici_sifre.Text;
            cmd.Parameters.Add("@aktif_or_pasif", SqlDbType.Char).Value = dd_list_aktif_or_pasif.SelectedValue;


            //Response.Write(cmd.CommandText);

            connection.Open();
            cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Login. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();
            Response.Write(cmd.UpdatedRowSource.ToString());
        }
    }




    protected void dd_list_kullanici_DataBound(object sender, EventArgs e)
    {
        dd_list_kullanici.Items.Insert(0, "Seçiniz");
    }
}