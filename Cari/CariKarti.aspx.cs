﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // veritabanı
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Threading;

public partial class Cari_CariKarti : System.Web.UI.Page
{
    String dataconnect = WebConfigurationManager.ConnectionStrings["CnnStr"].ConnectionString;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["CariID"] != null)
        {
            try
            {
                lbl_cari_id.Text = Request.QueryString["CariID"];
            }
            catch
            {
                // deal with it
            }
        }
        

        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
           
        }

        if (lbl_cari_id.Text != "0")
        {
            CariBilgileriniGetir(Convert.ToInt32(lbl_cari_id.Text));
        }

    }

    protected void ibtn_post_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_cari_id.Text == "0")
        {
            CariEkle();
            CariBilgileriniGetir(Convert.ToInt32(lbl_cari_id.Text));
        }
        else
        {
            CariGuncelle(Convert.ToInt32(lbl_cari_id.Text));
            //CariBilgileriniGetir(Convert.ToInt32(lbl_cari_id.Text));
        }
    }

    protected void CariEkle()
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "INSERT INTO cari_karti (unvan,adi,soyadi,kayit_tarihi,grup_id,cari_kod_no,tc_no,meslek,ilce,sehir,posta_kodu,ulke,vergi_dairesi,vergi_no,banka_adi,banka_hesap_no,banka_iban_no,tel1,tel2,fax,gsm1,gsm2,mail,adres1,adres2) VALUES \n" +
                              "(@unvan,@adi,@soyadi,@kayit_tarihi,@grup_id,@cari_kod_no,@tc_no,@meslek,@ilce,@sehir,@posta_kodu,@ulke,@vergi_dairesi,@vergi_no,@banka_adi,@banka_hesap_no,@banka_iban_no,@tel1,@tel2,@fax,@gsm1,@gsm2,@mail,@adres1,@adres2)";
        SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {
            cmd.Parameters.Add("@unvan", SqlDbType.NVarChar).Value = txt_unvan.Text;
            cmd.Parameters.Add("@adi", SqlDbType.NVarChar).Value = txt_adi.Text;
            cmd.Parameters.Add("@soyadi", SqlDbType.NVarChar).Value = txt_soyadi.Text;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value =Convert.ToDateTime(txt_kayit_tarihi.Text);
            cmd.Parameters.Add("@grup_id", SqlDbType.NVarChar).Value = dd_grup_id.SelectedValue;
            cmd.Parameters.Add("@cari_kod_no", SqlDbType.NVarChar).Value = txt_cari_kod_no.Text;
            cmd.Parameters.Add("@tc_no", SqlDbType.NVarChar).Value = txt_tc_no.Text;
            cmd.Parameters.Add("@meslek", SqlDbType.NVarChar).Value = txt_meslek.Text;
            cmd.Parameters.Add("@ilce", SqlDbType.NVarChar).Value = txt_ilce.Text;
            cmd.Parameters.Add("@sehir", SqlDbType.NVarChar).Value = txt_sehir.Text;
            cmd.Parameters.Add("@posta_kodu", SqlDbType.NVarChar).Value = txt_posta_kodu.Text;
            cmd.Parameters.Add("@ulke", SqlDbType.NVarChar).Value = txt_ulke.Text;
            cmd.Parameters.Add("@vergi_dairesi", SqlDbType.NVarChar).Value = txt_vergi_dairesi.Text;
            cmd.Parameters.Add("@vergi_no", SqlDbType.NVarChar).Value = txt_vergi_no.Text;
            cmd.Parameters.Add("@banka_adi", SqlDbType.NVarChar).Value = txt_banka_adi.Text;
            cmd.Parameters.Add("@banka_hesap_no", SqlDbType.NVarChar).Value = txt_banka_hesap_no.Text;
            cmd.Parameters.Add("@banka_iban_no", SqlDbType.NVarChar).Value = txt_banka_iban_no.Text;
            cmd.Parameters.Add("@tel1", SqlDbType.NVarChar).Value = txt_tel1.Text;
            cmd.Parameters.Add("@tel2", SqlDbType.NVarChar).Value = txt_tel2.Text;
            cmd.Parameters.Add("@fax", SqlDbType.NVarChar).Value = txt_fax.Text;
            cmd.Parameters.Add("@gsm1", SqlDbType.NVarChar).Value = txt_gsm1.Text;
            cmd.Parameters.Add("@gsm2", SqlDbType.NVarChar).Value = txt_gsm2.Text;
            cmd.Parameters.Add("@mail", SqlDbType.NVarChar).Value = txt_mail.Text;
            cmd.Parameters.Add("@adres1", SqlDbType.NVarChar).Value = txt_adres1.Text;
            cmd.Parameters.Add("@adres2", SqlDbType.NVarChar).Value = txt_adres2.Text;


            connection.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error INSERT. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();

        }
    }

    protected void CariGuncelle(int cari_id)
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "UPDATE cari_karti SET unvan=@unvan,adi=@adi,soyadi=@soyadi,kayit_tarihi=@kayit_tarihi,grup_id=@grup_id,cari_kod_no=@cari_kod_no,tc_no=@tc_no,meslek=@meslek,ilce=@ilce,sehir=@sehir,posta_kodu=@posta_kodu,ulke=@ulke,vergi_dairesi=@vergi_dairesi,vergi_no=@vergi_no,banka_adi=@banka_adi,banka_hesap_no=@banka_hesap_no, banka_iban_no=@banka_iban_no,tel1=@tel1,tel2=@tel2,fax=@fax,gsm1=@gsm1,gsm2=@gsm2,mail=@mail,adres1=@adres1,adres2=@adres2 WHERE cari_id=" + cari_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);



        try
        {
            DateTime kayit_tarihi = Convert.ToDateTime(txt_kayit_tarihi.Text);
            Response.Write(kayit_tarihi.ToShortDateString());

            cmd.Parameters.Add("@unvan", SqlDbType.NVarChar).Value = txt_unvan.Text;
            cmd.Parameters.Add("@adi", SqlDbType.NVarChar).Value = txt_adi.Text;
            cmd.Parameters.Add("@soyadi", SqlDbType.NVarChar).Value = txt_soyadi.Text;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.NVarChar).Value = String.Format("{0:yyyy/MM/dd}", kayit_tarihi);
            cmd.Parameters.Add("@grup_id", SqlDbType.NVarChar).Value = dd_grup_id.SelectedValue;
            cmd.Parameters.Add("@cari_kod_no", SqlDbType.NVarChar).Value = txt_cari_kod_no.Text;
            cmd.Parameters.Add("@tc_no", SqlDbType.NVarChar).Value = txt_tc_no.Text;
            cmd.Parameters.Add("@meslek", SqlDbType.NVarChar).Value = txt_meslek.Text;
            cmd.Parameters.Add("@ilce", SqlDbType.NVarChar).Value = txt_ilce.Text;
            cmd.Parameters.Add("@sehir", SqlDbType.NVarChar).Value = txt_sehir.Text;
            cmd.Parameters.Add("@posta_kodu", SqlDbType.NVarChar).Value = txt_posta_kodu.Text;
            cmd.Parameters.Add("@ulke", SqlDbType.NVarChar).Value = txt_ulke.Text;
            cmd.Parameters.Add("@vergi_dairesi", SqlDbType.NVarChar).Value = txt_vergi_dairesi.Text;
            cmd.Parameters.Add("@vergi_no", SqlDbType.NVarChar).Value = txt_vergi_no.Text;
            cmd.Parameters.Add("@banka_adi", SqlDbType.NVarChar).Value = txt_banka_adi.Text;
            cmd.Parameters.Add("@banka_hesap_no", SqlDbType.NVarChar).Value = txt_banka_hesap_no.Text;
            cmd.Parameters.Add("@banka_iban_no", SqlDbType.NVarChar).Value = txt_banka_iban_no.Text;
            cmd.Parameters.Add("@tel1", SqlDbType.NVarChar).Value = txt_tel1.Text;
            cmd.Parameters.Add("@tel2", SqlDbType.NVarChar).Value = txt_tel2.Text;
            cmd.Parameters.Add("@fax", SqlDbType.NVarChar).Value = txt_fax.Text;
            cmd.Parameters.Add("@gsm1", SqlDbType.NVarChar).Value = txt_gsm1.Text;
            cmd.Parameters.Add("@gsm2", SqlDbType.NVarChar).Value = txt_gsm2.Text;
            cmd.Parameters.Add("@mail", SqlDbType.NVarChar).Value = txt_mail.Text;
            cmd.Parameters.Add("@adres1", SqlDbType.NVarChar).Value = txt_adres1.Text;
            cmd.Parameters.Add("@adres2", SqlDbType.NVarChar).Value = txt_adres2.Text;


            //Response.Write(cmd.CommandText);

            connection.Open();
            cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error UPDATE. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();

        }
    }

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // cari arama modal popup
    {
        cariArama(txt_arama.Text);
    } 

    protected void cariArama(string unvan) //cari arama modal popup
    {
        string hareketSQL = "SELECT cari_id,unvan,gsm1,borc_bakiye,alacak_bakiye,bakiye FROM cari_karti WHERE unvan LIKE '%"+unvan+"%'";
        SqlConnection con = new SqlConnection(dataconnect);
        SqlCommand cmd = new SqlCommand(hareketSQL, con);

        int updated = 0;
        try
        {
            con.Open();
            updated = cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds_hareket = new DataSet();
            da.Fill(ds_hareket);

            gv_arama_listele.DataSource = ds_hareket;
            gv_arama_listele.DataBind();

            //lblResults.Text = updated.ToString() + " record updated.";
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Cari Bulma ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            con.Close();
        }

        if (updated > 0)
        {
            //
        }
    } 

    protected void gv_arama_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_arama_listele.SelectedRow;
        Label lbl_cari_id = (Label)row.FindControl("lbl_cari_id");             
        ibtn_cari_bul_ModalPopupExtender.Hide();
        Response.Redirect("CariKarti.aspx?CariID=" + lbl_cari_id.Text);

        
    }

    protected void CariBilgileriniGetir(int cari_id)
    {

     
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "SELECT * FROM cari_karti WHERE cari_id=" + cari_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                  lbl_cari_id.Text = reader["cari_id"].ToString();

                  txt_unvan.Text = reader["unvan"].ToString();
                  txt_adi.Text = reader["adi"].ToString();
                  txt_soyadi.Text = reader["soyadi"].ToString();
                  txt_kayit_tarihi.Text = reader["kayit_tarihi"].ToString();
                  dd_grup_id.SelectedValue = reader["grup_id"].ToString();
                  txt_cari_kod_no.Text = reader["cari_kod_no"].ToString();
                  txt_tc_no.Text = reader["tc_no"].ToString();
                  txt_meslek.Text = reader["meslek"].ToString();
                  txt_ilce.Text = reader["ilce"].ToString();
                  txt_sehir.Text = reader["sehir"].ToString();
                  txt_posta_kodu.Text = reader["posta_kodu"].ToString();
                  txt_ulke.Text = reader["ulke"].ToString();
                  txt_vergi_dairesi.Text = reader["vergi_dairesi"].ToString();
                  txt_vergi_no.Text = reader["vergi_no"].ToString();
                  txt_banka_adi.Text = reader["banka_adi"].ToString();
                  txt_banka_hesap_no.Text = reader["banka_hesap_no"].ToString();
                  txt_banka_iban_no.Text = reader["banka_iban_no"].ToString();
                  txt_tel1.Text = reader["tel1"].ToString();
                  txt_tel2.Text = reader["tel2"].ToString();
                  txt_fax.Text = reader["fax"].ToString();
                  txt_gsm1.Text = reader["gsm1"].ToString();
                  txt_gsm2.Text = reader["gsm2"].ToString();
                  txt_mail.Text = reader["mail"].ToString();
                  txt_adres1.Text = reader["adres1"].ToString();
                  txt_adres2.Text = reader["adres2"].ToString();

                  


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

    protected void ibtn_yeni_cari_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CariKarti.aspx");
    }
    
    protected void ibtn_cari_sil_Click(object sender, ImageClickEventArgs e)
    {
        int cari_id = Convert.ToInt32(lbl_cari_id.Text);
        CariSil(cari_id);
        Response.Redirect("CariKarti.aspx");
       
    }

    protected void CariSil(int silinecek_cari_id)
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "DELETE FROM cari_karti WHERE cari_id=" + silinecek_cari_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            connection.Open();
            cmd.ExecuteNonQuery();

        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Deleting ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();
        }
    }


}