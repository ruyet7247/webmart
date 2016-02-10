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

public partial class Personel_PersonelHareket : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource_departman.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;
        SqlDataSource_odeme_sekli.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;
        SqlDataSource_odeme_tipi.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;
        
        
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

            dd_odeme_sekli.SelectedValue = "acikhesap";
            string gecerli_ay = DateTime.Now.Month.ToString(); dd_ay.SelectedValue = gecerli_ay;
            string gecerli_yil = DateTime.Now.Year.ToString(); dd_yil.SelectedValue = gecerli_yil;
            if (lbl_personel_id.Text != "0")
            {
                PersonelBilgileriniGetir(Convert.ToInt32(lbl_personel_id.Text));
                PersonelHareketListesiniGetir(Convert.ToInt32(lbl_personel_id.Text));
                PersonelBorcAlacakBilgisiniGetir(Convert.ToInt32(lbl_personel_id.Text));
            }

        }




    }

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // Personel arama modal popup
    {
        PersonelArama(txt_arama.Text);
    }


    protected void PersonelArama(string adi) //Personel arama modal popup
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
            lbl_mesaj.Text = "Error Personel Bulma ";
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
        Label lbl_Personel_id = (Label)row.FindControl("lbl_Personel_id");
        ibtn_personel_bul_ModalPopupExtender.Hide();
        Response.Redirect("PersonelHareket.aspx?PersonelID=" + lbl_Personel_id.Text);


    }

    protected void PersonelBilgileriniGetir(int Personel_id)
    {


        
        string queryString = "SELECT personel_id,adi,soyadi,departman_id,odenen_maas FROM personel_karti WHERE personel_id=" + Personel_id;
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {
            
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    lbl_personel_id.Text = reader["personel_id"].ToString();
                    txt_adi.Text = reader["adi"].ToString() + " " + reader["soyadi"].ToString();
                    dd_departman_id.SelectedValue = reader["departman_id"].ToString();
                    txt_odenen_maas.Text = reader["odenen_maas"].ToString();

                }
            }


        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Personel Bilgileri Getir. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }

    }

    protected void PersonelHareketListesiniGetir(int Personel_id)
    {
        string hareketSQL = "SELECT * FROM personel_cari_maas_hareket WHERE personel_id=" + Personel_id + " ORDER BY kayit_tarihi DESC,maas_hareket_id DESC";
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

            gv_listele.DataSource = ds_hareket;
            gv_listele.DataBind();

            //lblResults.Text = updated.ToString() + " record updated.";
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Personel Hareketleri Getir. ";
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

    protected void PersonelBorcAlacakBilgisiniGetir(int Personel_id)
    {
        string hareketSQL = "SELECT (SELECT sum(tutar) FROM personel_cari_maas_hareket WHERE borc_or_alacak='borc' and personel_id=" + Personel_id + ") AS borc,(SELECT sum(tutar) FROM personel_cari_maas_hareket WHERE borc_or_alacak='alacak' and  personel_id=" + Personel_id + ") AS alacak";

        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand(hareketSQL, connection);

        try
        {
            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    txt_borc_bakiye.Text = reader["borc"].ToString();
                    txt_alacak_bakiye.Text = reader["alacak"].ToString();
                    if (txt_borc_bakiye.Text != "" || txt_alacak_bakiye.Text != "")
                    {
                        decimal bakiye = Convert.ToDecimal(reader["borc"].ToString()) - Convert.ToDecimal(reader["alacak"].ToString());
                        txt_bakiye.Text = bakiye.ToString();
                    }
                

                }
            }
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Personel Borç Alacak Hesaplama ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }


    }

    protected void dd_odeme_sekli_SelectedIndexChanged(object sender, EventArgs e)  // ödeme şekline göre bağlı hesap tabloları
    {

        // ödeme şekli 4 farklı durumda seçilir ve Ödeme tipi belirlenir.
        string secilen_odeme_sekli = dd_odeme_sekli.Text;
        string queryString = "";
        string data_value = "";
        string data_text = "";
        if (dd_odeme_sekli.SelectedValue == "nakit") { queryString = "SELECT kasa_id,kasa_adi FROM kasa_kayit ORDER BY  kasa_adi"; data_value = "kasa_id"; data_text = "kasa_adi"; }
        if (dd_odeme_sekli.SelectedValue == "acikhesap") { queryString = ""; data_value = ""; data_text = ""; }
        if (dd_odeme_sekli.SelectedValue == "banka") { queryString = "SELECT  dbo.banka_kayit.banka_hesap_id, dbo.firma_para_birimi_tanimlama.para_birimi + ' -  ' + dbo.banka_kayit.banka_adi AS banka_hesap_adi FROM dbo.banka_kayit INNER JOIN dbo.firma_para_birimi_tanimlama ON dbo.banka_kayit.para_birimi_id = dbo.firma_para_birimi_tanimlama.para_birimi_id"; data_value = "banka_hesap_id"; data_text = "banka_hesap_adi"; }
        if (dd_odeme_sekli.SelectedValue == "pos") { queryString = "SELECT pos_id,pos_banka_adi FROM banka_pos_kayit ORDER BY pos_banka_adi"; data_value = "pos_id"; data_text = "pos_banka_adi"; }
        // 

        if (queryString == "")
        {
            dd_bagli_hesap.Items.Clear();
            dd_bagli_hesap.Items.Insert(0, "");
        }
        else
        {
            

            ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);
            try
            {

                
                DataTable table = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(table);

                dd_bagli_hesap.DataSource = table;
                dd_bagli_hesap.DataValueField = data_value;
                dd_bagli_hesap.DataTextField = data_text;
                dd_bagli_hesap.DataBind();
            }

            catch (Exception err)
            {
                lbl_mesaj.Text = "Error İŞLEM TİPİ FILLING ";
                lbl_mesaj.Text += err.Message;
            }
            finally
            {
                baglan.VeritabaniBaglantiyiKapat(connection);
            }
        } // if queryString

    }

    protected void dd_islem_tipi_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ibtn_kaydet_Click(object sender, ImageClickEventArgs e)  //İŞLEM KAYDET 
    {
        if (Kontroller())
        {

            // SABİT TANIMLAMALAR
            Session["personel"] = "hamza";
            string islem_tipi = "";
            decimal tutar = 0;

            string fis_id = ""; string kasa_id = ""; string pos_id = ""; string banka_hesap_id = "";

            tutar = Convert.ToDecimal(txt_tutar.Text);
            //  1. DURUM
            if (dd_odeme_sekli.SelectedValue == "nakit")
            {
                fis_id = "";
                kasa_id = dd_bagli_hesap.SelectedValue;
                pos_id = "";
                banka_hesap_id = "";
                

            }
            //  2. DURUM
            if (dd_odeme_sekli.SelectedValue == "acikhesap")
            {
                fis_id = "";
                kasa_id = "";
                pos_id = "";
                banka_hesap_id = "";
            }
            //  3. DURUM
            if (dd_odeme_sekli.SelectedValue == "banka")
            {
                fis_id = "";
                kasa_id = "";
                pos_id = "";
                banka_hesap_id = dd_bagli_hesap.SelectedValue;
            }
            //  4. DURUM
            if (dd_odeme_sekli.SelectedValue == "pos")
            {
                fis_id = "";
                kasa_id = "";
                pos_id = dd_bagli_hesap.SelectedValue;
                banka_hesap_id = "";
            }
            //
         

            PersonelHareketBorcAlacakKaydet(lbl_personel_id.Text, txt_kayit_tarihi.Text, dd_borc_or_alacak.SelectedValue.ToString(),dd_odeme_sekli.SelectedValue, dd_islem_tipi.SelectedValue.ToString(), txt_belge_no.Text, dd_ay.SelectedValue.ToString(), dd_yil.SelectedValue.ToString(), txt_aciklama.Text, tutar, kasa_id, pos_id,banka_hesap_id);

        } // if kontroller

        PersonelHareketListesiniGetir(Convert.ToInt32(lbl_personel_id.Text));
        PersonelBorcAlacakBilgisiniGetir(Convert.ToInt32(lbl_personel_id.Text));

    }

    protected bool Kontroller()
    {

        return true;
    }

    protected void PersonelHareketBorcAlacakKaydet(string personel_id, string kayit_tarihi, string borc_or_alacak, string odeme_sekli, string islem_tipi, string belge_no, string ay, string yil, string aciklama, decimal tutar, string kasa_id, string pos_id, string banka_hesap_id)
    {

        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("PersonelHareketEkle", connection);

        int insert_sql = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(kayit_tarihi);
            cmd.Parameters.Add("@personel_id", SqlDbType.NVarChar).Value = personel_id;
            cmd.Parameters.Add("@borc_or_alacak", SqlDbType.NVarChar).Value = borc_or_alacak;
            cmd.Parameters.Add("@odeme_sekli", SqlDbType.NVarChar).Value = odeme_sekli;
            cmd.Parameters.Add("@islem_tipi", SqlDbType.NVarChar).Value = islem_tipi;
            cmd.Parameters.Add("@belge_no", SqlDbType.NVarChar).Value = belge_no;
            cmd.Parameters.Add("@aciklama1", SqlDbType.NVarChar).Value = aciklama;
            cmd.Parameters.Add("@maas_donem_ay", SqlDbType.NVarChar).Value = ay;
            cmd.Parameters.Add("@maas_donem_yil", SqlDbType.Decimal).Value = yil;
            cmd.Parameters.Add("@tutar", SqlDbType.Decimal).Value = tutar;
            cmd.Parameters.Add("@kasa_id", SqlDbType.NVarChar).Value = kasa_id;
            cmd.Parameters.Add("@pos_id", SqlDbType.NVarChar).Value = pos_id;
            cmd.Parameters.Add("@banka_hesap_id", SqlDbType.NVarChar).Value = banka_hesap_id;

            
            insert_sql = cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error INSERT. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            cmd.Parameters.Clear();
            baglan.VeritabaniBaglantiyiKapat(connection);


        }
    }

    protected void gv_listele_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int maas_hareket_id = Convert.ToInt32(gv_listele.DataKeys[e.RowIndex].Value);
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("PersonelHareketSil", connection);

        int sql_query = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maas_hareket_id", SqlDbType.Int).Value = maas_hareket_id;
            
            sql_query = cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error INSERT. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            cmd.Parameters.Clear();
            baglan.VeritabaniBaglantiyiKapat(connection);
            PersonelHareketListesiniGetir(Convert.ToInt32(Request.QueryString["PersonelID"]));
            PersonelBorcAlacakBilgisiniGetir(Convert.ToInt32(Request.QueryString["PersonelID"]));
        }

    }



}