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

public partial class Personel_PersonelKarti : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {

        SqlDataSource_departman.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;


        if (Request.QueryString["PersonelID"] != null)
        {
            try
            {
                lbl_personel_id.Text = Request.QueryString["PersonelID"];
            }
            catch
            {
                // deal with it
            }
        }


        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {

            if (lbl_personel_id.Text != "0")
            {
                PersonelBilgileriniGetir(Convert.ToInt32(lbl_personel_id.Text));
            }

        }

   

    }

    protected void ibtn_post_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_personel_id.Text == "0")
        {
            PersonelEkle();
            PersonelBilgileriniGetir(Convert.ToInt32(lbl_personel_id.Text));
        }
        else
        {
            PersonelGuncelle(Convert.ToInt32(lbl_personel_id.Text));
            //personelBilgileriniGetir(Convert.ToInt32(lbl_personel_id.Text));
        }
    }

    protected void PersonelEkle()
    {
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("PersonelKartiEkle", connection);

        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@tc", SqlDbType.NVarChar).Value = txt_tc.Text;
            cmd.Parameters.Add("@adi", SqlDbType.NVarChar).Value = txt_adi.Text;
            cmd.Parameters.Add("@soyadi", SqlDbType.NVarChar).Value = txt_soyadi.Text;
            cmd.Parameters.Add("@kullanici_adi", SqlDbType.NVarChar).Value = txt_kullanici_adi.Text;
            cmd.Parameters.Add("@kullanici_sifre", SqlDbType.NVarChar).Value = txt_kullanici_sifre.Text;
            cmd.Parameters.Add("@sicil_no", SqlDbType.NVarChar).Value = txt_sicil_no.Text;
            cmd.Parameters.Add("@basvuru_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_basvuru_tarihi.Text);
            cmd.Parameters.Add("@departman_id", SqlDbType.NVarChar).Value = dd_departman_id.SelectedValue;
            cmd.Parameters.Add("@aciklama1", SqlDbType.NVarChar).Value = txt_aciklama1.Text;
            cmd.Parameters.Add("@tel", SqlDbType.NVarChar).Value = txt_tel.Text;
            cmd.Parameters.Add("@gsm", SqlDbType.NVarChar).Value = txt_gsm.Text;
            cmd.Parameters.Add("@adres1", SqlDbType.NVarChar).Value = txt_adres1.Text;
            cmd.Parameters.Add("@adres2", SqlDbType.NVarChar).Value = txt_adres2.Text;
            cmd.Parameters.Add("@ilce", SqlDbType.NVarChar).Value = txt_ilce.Text;
            cmd.Parameters.Add("@il", SqlDbType.NVarChar).Value = txt_il.Text;
            cmd.Parameters.Add("@giris_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_giris_tarihi.Text);
            cmd.Parameters.Add("@banka_adi", SqlDbType.NVarChar).Value = txt_banka_adi.Text;
            cmd.Parameters.Add("@banka_hesap_no", SqlDbType.NVarChar).Value = txt_banka_hesap_no.Text;
            cmd.Parameters.Add("@banka_iban_no", SqlDbType.NVarChar).Value = txt_banka_iban_no.Text;
            cmd.Parameters.Add("@odenen_maas", SqlDbType.Decimal).Value = Convert.ToDecimal(txt_odenen_maas.Text);
            cmd.Parameters.Add("@cinsiyet", SqlDbType.NVarChar).Value = dd_cinsiyet.SelectedValue;
            cmd.Parameters.Add("@mail", SqlDbType.NVarChar).Value = txt_mail.Text;
            cmd.Parameters.Add("@ehliyet_sinifi", SqlDbType.NVarChar).Value = txt_ehliyet_sinifi.Text;
            cmd.Parameters.Add("@aktif_or_pasif", SqlDbType.NVarChar).Value = dd_aktif_or_pasif.SelectedValue;

            
            cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error INSERT. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);

        }
    }

    protected void PersonelGuncelle(int personel_id)
    {
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("PersonelKartiGuncelle", connection);

        int update_flag = 0;
        try
        {

            cmd.CommandType = CommandType.StoredProcedure;

            DateTime basvuru_tarihi = Convert.ToDateTime(txt_basvuru_tarihi.Text);
            DateTime giris_tarihi = Convert.ToDateTime(txt_giris_tarihi.Text);

            cmd.Parameters.Add("@personel_id", SqlDbType.Int).Value = lbl_personel_id.Text;
            cmd.Parameters.Add("@tc", SqlDbType.NVarChar).Value = txt_tc.Text;
            cmd.Parameters.Add("@adi", SqlDbType.NVarChar).Value = txt_adi.Text;
            cmd.Parameters.Add("@soyadi", SqlDbType.NVarChar).Value = txt_soyadi.Text;
            cmd.Parameters.Add("@kullanici_adi", SqlDbType.NVarChar).Value = txt_kullanici_adi.Text;
            cmd.Parameters.Add("@kullanici_sifre", SqlDbType.NVarChar).Value = txt_kullanici_sifre.Text;
            cmd.Parameters.Add("@sicil_no", SqlDbType.NVarChar).Value = txt_sicil_no.Text;
            cmd.Parameters.Add("@basvuru_tarihi", SqlDbType.DateTime).Value = basvuru_tarihi;
            cmd.Parameters.Add("@departman_id", SqlDbType.Int).Value = dd_departman_id.SelectedValue;
            cmd.Parameters.Add("@aciklama1", SqlDbType.NVarChar).Value = txt_aciklama1.Text;
            cmd.Parameters.Add("@tel", SqlDbType.NVarChar).Value = txt_tel.Text;
            cmd.Parameters.Add("@gsm", SqlDbType.NVarChar).Value = txt_gsm.Text;
            cmd.Parameters.Add("@adres1", SqlDbType.NVarChar).Value = txt_adres1.Text;
            cmd.Parameters.Add("@adres2", SqlDbType.NVarChar).Value = txt_adres2.Text;
            cmd.Parameters.Add("@ilce", SqlDbType.NVarChar).Value = txt_ilce.Text;
            cmd.Parameters.Add("@il", SqlDbType.NVarChar).Value = txt_il.Text;
            cmd.Parameters.Add("@giris_tarihi", SqlDbType.DateTime).Value = giris_tarihi;
            cmd.Parameters.Add("@banka_adi", SqlDbType.NVarChar).Value = txt_banka_adi.Text;
            cmd.Parameters.Add("@banka_hesap_no", SqlDbType.NVarChar).Value = txt_banka_hesap_no.Text;
            cmd.Parameters.Add("@banka_iban_no", SqlDbType.NVarChar).Value = txt_banka_iban_no.Text;
            cmd.Parameters.Add("@odenen_maas", SqlDbType.Decimal).Value = Convert.ToDecimal(txt_odenen_maas.Text);
            cmd.Parameters.Add("@cinsiyet", SqlDbType.NVarChar).Value = dd_cinsiyet.SelectedValue;
            cmd.Parameters.Add("@mail", SqlDbType.NVarChar).Value = txt_mail.Text;
            cmd.Parameters.Add("@ehliyet_sinifi", SqlDbType.NVarChar).Value = txt_ehliyet_sinifi.Text;
            cmd.Parameters.Add("@aktif_or_pasif", SqlDbType.NVarChar).Value =dd_aktif_or_pasif.SelectedValue;


            
            update_flag = cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error UPDATE. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);

        }


    }

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // personel arama modal popup
    {
        PersonelArama(txt_arama.Text);
    }

    protected void PersonelArama(string adi) //personel arama modal popup
    {
        string hareketSQL = "SELECT personel_id,tc,adi,soyadi,kullanici_adi,gsm FROM personel_karti WHERE adi LIKE '%" + adi + "%'";
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand(hareketSQL, connection);

        int updated = 0;
        try
        {
            
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
            lbl_mesaj.Text = "Error personel Bulma ";
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

    protected void gv_arama_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_arama_listele.SelectedRow;
        Label lbl_personel_id = (Label)row.FindControl("lbl_personel_id");
        ibtn_personel_bul_ModalPopupExtender.Hide();
        Response.Redirect("personelKarti.aspx?personelID=" + lbl_personel_id.Text);


    }

    protected void PersonelBilgileriniGetir(int personel_id)
    {


        
        string queryString = "SELECT * FROM personel_karti WHERE personel_id=" + personel_id;
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_personel_id.Text = reader["personel_id"].ToString();
                    txt_tc.Text = reader["tc"].ToString();
                    txt_adi.Text = reader["adi"].ToString();
                    txt_soyadi.Text = reader["soyadi"].ToString();
                    txt_kullanici_adi.Text = reader["kullanici_adi"].ToString();
                    txt_kullanici_sifre.Text = reader["kullanici_sifre"].ToString();
                    txt_sicil_no.Text = reader["sicil_no"].ToString();
                    DateTime basvuru_tarihi = Convert.ToDateTime(reader["basvuru_tarihi"].ToString());
                    txt_basvuru_tarihi.Text = basvuru_tarihi.ToString("dd.MM.yyyy");
                    dd_departman_id.SelectedValue = reader["departman_id"].ToString();
                    txt_aciklama1.Text = reader["aciklama1"].ToString();
                    txt_tel.Text = reader["tel"].ToString();
                    txt_gsm.Text = reader["gsm"].ToString();
                    txt_adres1.Text = reader["adres1"].ToString();
                    txt_adres2.Text = reader["adres2"].ToString();
                    txt_ilce.Text = reader["ilce"].ToString();
                    txt_il.Text = reader["il"].ToString();
                    DateTime giris_tarihi = Convert.ToDateTime(reader["giris_tarihi"].ToString());
                    txt_giris_tarihi.Text = giris_tarihi.ToString("dd.MM.yyyy");
                    txt_banka_adi.Text = reader["banka_adi"].ToString();
                    txt_banka_hesap_no.Text = reader["banka_hesap_no"].ToString();
                    txt_banka_iban_no.Text = reader["banka_iban_no"].ToString();
                    txt_odenen_maas.Text = reader["odenen_maas"].ToString();
                    dd_cinsiyet.SelectedValue = reader["cinsiyet"].ToString();
                    txt_mail.Text = reader["mail"].ToString();
                    txt_ehliyet_sinifi.Text = reader["ehliyet_sinifi"].ToString();
                    dd_aktif_or_pasif.SelectedValue = reader["aktif_or_pasif"].ToString();
                  

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

    protected void ibtn_yeni_personel_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("PersonelKarti.aspx");
    }

    protected void ibtn_personel_sil_Click(object sender, ImageClickEventArgs e)
    {
        int personel_id = Convert.ToInt32(lbl_personel_id.Text);
        PersonelSil(personel_id);
        Response.Redirect("PersonelKarti.aspx");

    }

    protected void PersonelSil(int silinecek_personel_id)
    {
        
        string queryString = "DELETE FROM personel_karti WHERE personel_id=" + silinecek_personel_id;
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            
            cmd.ExecuteNonQuery();

        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Deleting ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }
    }

}