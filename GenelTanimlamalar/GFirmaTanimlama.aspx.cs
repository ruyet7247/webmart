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
    
    int aktif_firma_id = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
            FirmaBilgileriniGetir();
        }
    
    }

    protected void ibtn_guncelle_Click(object sender, ImageClickEventArgs e)
    {
        FirmaBilgileriniGuncelle();
        FirmaBilgileriniGetir();

    }

    protected void FirmaBilgileriniGetir()
    {

        string queryString = "SELECT * FROM firma_kayit WHERE aktif_or_pasif=1";
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());      
        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {
           
            //
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    aktif_firma_id = Convert.ToInt32(reader["firma_id"].ToString());                
                    txt_kurulus_tarihi.Text= reader["kurulus_tarihi"].ToString();
                    txt_firma_tipi.Text = reader["firma_tipi"].ToString();
                    txt_kisa_unvani.Text = reader["kisa_unvani"].ToString();
                    txt_tam_unvani.Text = reader["tam_unvani"].ToString();
                    txt_yetkili.Text = reader["yetkili"].ToString();
                    txt_vergi_dairesi.Text = reader["vergi_dairesi"].ToString();
                    txt_vergi_no.Text = reader["vergi_no"].ToString();
                    txt_adres1.Text = reader["adres1"].ToString();
                    txt_adres2.Text = reader["adres2"].ToString();
                    txt_semt.Text =reader["semt"].ToString();
                    txt_ilce.Text =reader["ilce"].ToString();
                    txt_il.Text =reader["il"].ToString();
                    txt_posta_kodu.Text =reader["posta_kodu"].ToString();
                    txt_tel1.Text=reader["tel1"].ToString();
                    txt_tel2.Text=reader["tel2"].ToString();
                    txt_fax.Text=reader["fax"].ToString();
                    txt_gsm1.Text=reader["gsm1"].ToString();
                    txt_gsm2.Text = reader["gsm1"].ToString();
                    txt_mail.Text=reader["mail"].ToString();
                    txt_web_adresi.Text=reader["web_adresi"].ToString();
                    txt_aciklama1.Text = reader["aciklama1"].ToString();
                   
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
            baglan.VeritabaniBaglantiyiKapat(connection);
            
        }

    }

    protected void FirmaBilgileriniGuncelle()
    {


        string queryString = "UPDATE firma_kayit SET kurulus_tarihi=@kurulus_tarihi,firma_tipi=@firma_tipi,kisa_unvani=@kisa_unvani,tam_unvani=@tam_unvani, yetkili=@yetkili,vergi_dairesi=@vergi_dairesi,vergi_no=@vergi_no,adres1=@adres1,adres2=@adres2,semt=@semt, ilce=@ilce,il=@il,posta_kodu=@posta_kodu,tel1=@tel1,tel2=@tel2, fax=@fax,gsm1=@gsm1,gsm2=@gsm2,mail=@mail,web_adresi=@web_adresi, aciklama1=@aciklama1 WHERE aktif_or_pasif=1";
      
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);


        int updated = 0;
        try
        {

            DateTime kurulus_tarihi = Convert.ToDateTime(txt_kurulus_tarihi.Text);

            cmd.Parameters.Add("@kurulus_tarihi", SqlDbType.DateTime).Value = kurulus_tarihi;
            cmd.Parameters.Add("@firma_tipi", SqlDbType.NVarChar).Value = txt_firma_tipi.Text;
            cmd.Parameters.Add("@kisa_unvani", SqlDbType.NVarChar).Value = txt_kisa_unvani.Text;
            cmd.Parameters.Add("@tam_unvani", SqlDbType.NVarChar).Value = txt_tam_unvani.Text;
            cmd.Parameters.Add("@yetkili", SqlDbType.NVarChar).Value = txt_yetkili.Text;
            cmd.Parameters.Add("@vergi_dairesi", SqlDbType.NVarChar).Value = txt_vergi_dairesi.Text;
            cmd.Parameters.Add("@vergi_no", SqlDbType.NVarChar).Value = txt_vergi_no.Text;
            cmd.Parameters.Add("@adres1", SqlDbType.NVarChar).Value = txt_adres1.Text;
            cmd.Parameters.Add("@adres2", SqlDbType.NVarChar).Value = txt_adres2.Text;
            cmd.Parameters.Add("@semt", SqlDbType.NVarChar).Value = txt_semt.Text;
            cmd.Parameters.Add("@ilce", SqlDbType.NVarChar).Value = txt_ilce.Text;
            cmd.Parameters.Add("@il", SqlDbType.NVarChar).Value = txt_il.Text;
            cmd.Parameters.Add("@posta_kodu", SqlDbType.NVarChar).Value = txt_posta_kodu.Text;
            cmd.Parameters.Add("@tel1", SqlDbType.NVarChar).Value = txt_tel1.Text;
            cmd.Parameters.Add("@tel2", SqlDbType.NVarChar).Value = txt_tel2.Text;
            cmd.Parameters.Add("@fax", SqlDbType.NVarChar).Value = txt_fax.Text;
            cmd.Parameters.Add("@gsm1", SqlDbType.NVarChar).Value = txt_gsm1.Text;
            cmd.Parameters.Add("@gsm2", SqlDbType.NVarChar).Value = txt_gsm2.Text;
            cmd.Parameters.Add("@mail", SqlDbType.NVarChar).Value = txt_mail.Text;
            cmd.Parameters.Add("@web_adresi", SqlDbType.NVarChar).Value = txt_web_adresi.Text;
            cmd.Parameters.Add("@aciklama1", SqlDbType.NVarChar).Value = txt_aciklama1.Text;

         
            //Response.Write(cmd.CommandText);

            
            updated = cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Login. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
            lbl_mesaj.Text = updated.ToString();
           
        }
    }



}