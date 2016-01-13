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


public partial class GFirmaTanimlama : System.Web.UI.Page
{
    String dataconnect = WebConfigurationManager.ConnectionStrings["CnnStr"].ConnectionString;
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
      
        //FirmaBilgileriniGetir();
    }

    protected void ibtn_guncelle_Click(object sender, ImageClickEventArgs e)
    {
        FirmaBilgileriniGuncelle();
    }

    protected void FirmaBilgileriniGetir()
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "SELECT * FROM firma_kayit";
        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {
           
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    txt_kurulus_tarihi.Text= reader["kurulus_tarihi"].ToString();
                    txt_firma_tipi.Text=
                    txt_kisa_unvani.Text=
                    txt_tam_unvani.Text=
                    txt_tam_unvani.Text=
                    txt_yetkili.Text=
                    txt_vergi_dairesi.Text=
                    txt_vergi_dairesi.Text=
                    txt_adres1.Text=
                    txt_adres2.Text=
                    txt_semt.Text=
                    txt_ilce.Text=
                    txt_il.Text=
                    txt_posta_kodu.Text=
                    te
                   
                }
            }


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

    protected void FirmaBilgileriniGuncelle()
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "UPDA * FROM firma_kullanici_tanimlama WHERE aktif_or_pasif=1 AND kullanici_adi=@kullanici_adi AND kullanici_sifre=@kullanici_sifre";
        SqlCommand cmd = new SqlCommand(queryString, connection);


        try
        {
            /*
            cmd.Parameters.AddWithValue("@id", dataGridView.CurrentRow.Cells[0].Value);
            cmd.Parameters.AddWithValue("@ad", txtAd.Text);
            cmd.Parameters.AddWithValue("@soyad", txtSoyad.Text);
            cmd.Parameters.AddWithValue("@yas", txtYas.Text);
            cmd.Parameters.AddWithValue("@tarih", txtTarih.Text);
            cmd.Parameters.AddWithValue("@onay", durum);
            */
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



}