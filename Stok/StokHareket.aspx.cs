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

public partial class Stok_StokHareket : System.Web.UI.Page
{
    String dataconnect = WebConfigurationManager.ConnectionStrings["CnnStr"].ConnectionString;

    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["StokID"] != null)
        {
            try
            {
                lbl_stok_id.Text = Request.QueryString["StokID"];
            }
            catch
            {
                // deal with it
            }
        }


        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {

           
            if (lbl_stok_id.Text != "0")
            {
                StokBilgileriniGetir(Convert.ToInt32(lbl_stok_id.Text));
                StokHareketListesiniGetir(Convert.ToInt32(lbl_stok_id.Text));
                StokBorcAlacakBilgisiniGetir(Convert.ToInt32(lbl_stok_id.Text));
            }

        }

    }

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // Stok arama modal popup
    {
        StokArama(txt_arama.Text);
    }

    protected void StokArama(string stok_adi) //Stok arama modal popup
    {
        string hareketSQL = "SELECT stok_id,stok_adi,birimi,giren,cikan,alis_fiyati,satis_fiyati FROM stok_karti WHERE stok_adi LIKE '%" + stok_adi + "%'";
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
            lbl_mesaj.Text = "Error Stok Bulma ";
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
        Label lbl_Stok_id = (Label)row.FindControl("lbl_Stok_id");
        ibtn_stok_bul_ModalPopupExtender.Hide();
        Response.Redirect("StokHareket.aspx?StokID=" + lbl_Stok_id.Text);


    }

    protected void StokBilgileriniGetir(int stok_id)
    {


        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "SELECT * FROM stok_karti WHERE stok_id=" + stok_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_stok_id.Text = reader["stok_id"].ToString();

                    txt_stok_adi.Text = reader["unvan"].ToString();
                    dd_grup_id.SelectedValue = reader["grup_id"].ToString();
                    txt_giren.Text = reader["giren"].ToString();
                    txt_cikan.Text = reader["cikan"].ToString();
                    int stok_miktari = Convert.ToInt32(reader["giren"].ToString()) - Convert.ToInt32(reader["cikan"].ToString());
                    txt_stok_miktari.Text = stok_miktari.ToString();

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

    protected void StokHareketListesiniGetir(int Stok_id)
    {
        string hareketSQL = "SELECT * FROM Stok_hareket WHERE Stok_id=" + Stok_id + " ORDER BY kayit_tarihi DESC,Stok_hareket_id DESC";
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

            gv_listele.DataSource = ds_hareket;
            gv_listele.DataBind();

            //lblResults.Text = updated.ToString() + " record updated.";
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Stok Bulma ";
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

    protected void StokBorcAlacakBilgisiniGetir(int Stok_id)
    {
        string hareketSQL = "SELECT sum(borc) AS borc,sum(alacak) AS alacak,sum(borc)-sum(alacak) AS bakiye FROM Stok_hareket WHERE Stok_id=" + Stok_id;
        SqlConnection connection = new SqlConnection(dataconnect);
        SqlCommand cmd = new SqlCommand(hareketSQL, connection);


        try
        {
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    txt_giren.Text = reader["borc"].ToString();
                    txt_cikan.Text = reader["alacak"].ToString();
                    txt_stok_miktari.Text = reader["bakiye"].ToString();

                }
            }
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Stok Bulma ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();
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
            SqlConnection connection = new SqlConnection(dataconnect);

            SqlCommand cmd = new SqlCommand(queryString, connection);
            try
            {

                connection.Open();
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
                connection.Close();
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
            string queryString = "";
            string islem_tipi = "";
            decimal borc = 0;
            decimal alacak = 0;
            string fis_id = ""; string kasa_id = ""; string pos_id = ""; string banka_hesap_id = "";

            if (dd_giris_or_alacak.SelectedValue == "borc") { borc = Convert.ToDecimal(txt_tutar.Text); alacak = 0; }
            if (dd_giris_or_alacak.SelectedValue == "alacak") { borc = 0; alacak = Convert.ToDecimal(txt_tutar.Text); }

            //  1. DURUM
            if (dd_odeme_sekli.SelectedValue == "nakit")
            {
                if (dd_giris_or_alacak.SelectedValue == "borc") { islem_tipi = "tahsilat"; }    //işlem tipi manuel olarak veritabanına kayıt edilir ve islem tiipleri tabloda tutulur.
                if (dd_giris_or_alacak.SelectedValue == "alacak") { islem_tipi = "tediye"; }      //işlem tipi manuel olarak veritabanına kayıt edilir ve islem tiipleri tabloda tutulur.
                fis_id = "";
                kasa_id = dd_bagli_hesap.SelectedValue;
                pos_id = "";
                banka_hesap_id = "";
                StokHareketBorcAlacakKaydet(txt_kayit_tarihi.Text, lbl_stok_id.Text, dd_giris_or_alacak.SelectedValue.ToString(), islem_tipi, "nakit", txt_belge_no.Text, txt_aciklama.Text, Session["personel"].ToString(), borc, alacak, fis_id, kasa_id, pos_id, banka_hesap_id);

            }
            //  2. DURUM
            if (dd_odeme_sekli.SelectedValue == "acikhesap")
            {

                if (dd_giris_or_alacak.SelectedValue == "borc") { islem_tipi = "borcdekontu"; }    //işlem tipi manuel olarak veritabanına kayıt edilir ve islem tiipleri tabloda tutulur.
                if (dd_giris_or_alacak.SelectedValue == "alacak") { islem_tipi = "alacakdekontu"; }      //işlem tipi manuel olarak veritabanına kayıt edilir ve islem tiipleri tabloda tutulur.
                fis_id = "";
                kasa_id = "";
                pos_id = "";
                banka_hesap_id = "";
                StokHareketBorcAlacakKaydet(txt_kayit_tarihi.Text, lbl_stok_id.Text, dd_giris_or_alacak.SelectedValue.ToString(), islem_tipi, "acikhesap", txt_belge_no.Text, txt_aciklama.Text, Session["personel"].ToString(), borc, alacak, fis_id, kasa_id, pos_id, banka_hesap_id);

            }
            //  3. DURUM
            if (dd_odeme_sekli.SelectedValue == "banka")
            {
                if (dd_giris_or_alacak.SelectedValue == "borc") { islem_tipi = "banka"; }    //işlem tipi manuel olarak veritabanına kayıt edilir ve islem tiipleri tabloda tutulur.
                if (dd_giris_or_alacak.SelectedValue == "alacak") { islem_tipi = "banka"; }      //işlem tipi manuel olarak veritabanına kayıt edilir ve islem tiipleri tabloda tutulur.
                fis_id = "";
                kasa_id = "";
                pos_id = "";
                banka_hesap_id = dd_bagli_hesap.SelectedValue;
                StokHareketBorcAlacakKaydet(txt_kayit_tarihi.Text, lbl_stok_id.Text, dd_giris_or_alacak.SelectedValue.ToString(), islem_tipi, "banka", txt_belge_no.Text, txt_aciklama.Text, Session["personel"].ToString(), borc, alacak, fis_id, kasa_id, pos_id, banka_hesap_id);

            }
            //  4. DURUM
            if (dd_odeme_sekli.SelectedValue == "pos")
            {
                if (dd_giris_or_alacak.SelectedValue == "borc") { islem_tipi = "pos"; }    //işlem tipi manuel olarak veritabanına kayıt edilir ve islem tiipleri tabloda tutulur.
                if (dd_giris_or_alacak.SelectedValue == "alacak") { islem_tipi = "pos"; }      //işlem tipi manuel olarak veritabanına kayıt edilir ve islem tiipleri tabloda tutulur.
                fis_id = "";
                kasa_id = "";
                pos_id = dd_bagli_hesap.SelectedValue;
                banka_hesap_id = "";
                StokHareketBorcAlacakKaydet(txt_kayit_tarihi.Text, lbl_stok_id.Text, dd_giris_or_alacak.SelectedValue.ToString(), islem_tipi, "pos", txt_belge_no.Text, txt_aciklama.Text, Session["personel"].ToString(), borc, alacak, fis_id, kasa_id, pos_id, banka_hesap_id);

            }
            // 

        } // if kontroller

        StokHareketListesiniGetir(Convert.ToInt32(lbl_stok_id.Text));
        StokBorcAlacakBilgisiniGetir(Convert.ToInt32(lbl_stok_id.Text));

    }

    protected bool Kontroller()
    {

        return true;
    }

    protected void StokHareketBorcAlacakKaydet(string kayit_tarihi, string Stok_id, string borc_or_alacak, string islem_tipi, string odeme_sekli, string belge_no, string aciklama1, string personel, decimal borc, decimal alacak, string fis_id, string kasa_id, string pos_id, string banka_hesap_id)
    {

        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "INSERT INTO Stok_hareket (kayit_tarihi,Stok_id, borc_or_alacak, islem_tipi, odeme_sekli, belge_no, aciklama1, personel,borc,alacak fis_id, kasa_id, pos_id, banka_hesap_id)  VALUES \n" +
                                                   "(@kayit_tarihi,@Stok_id,@borc_or_alacak,@islem_tipi,@odeme_sekli,@belge_no,@aciklama1,@personel,@borc,@alacak,@fis_id,@kasa_id,@pos_id,@banka_hesap_id)";

        SqlCommand cmd = new SqlCommand("StokHareketEkle", connection);

        int insert_sql = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(kayit_tarihi);
            cmd.Parameters.Add("@Stok_id", SqlDbType.NVarChar).Value = Stok_id;
            cmd.Parameters.Add("@borc_or_alacak", SqlDbType.NVarChar).Value = borc_or_alacak;
            cmd.Parameters.Add("@islem_tipi", SqlDbType.NVarChar).Value = islem_tipi;
            cmd.Parameters.Add("@odeme_sekli", SqlDbType.NVarChar).Value = odeme_sekli;
            cmd.Parameters.Add("@belge_no", SqlDbType.NVarChar).Value = belge_no;
            cmd.Parameters.Add("@aciklama1", SqlDbType.NVarChar).Value = aciklama1;
            cmd.Parameters.Add("@personel", SqlDbType.NVarChar).Value = personel;
            cmd.Parameters.Add("@borc", SqlDbType.Decimal).Value = borc;
            cmd.Parameters.Add("@alacak", SqlDbType.Decimal).Value = alacak;
            cmd.Parameters.Add("@fis_id", SqlDbType.NVarChar).Value = fis_id;
            cmd.Parameters.Add("@kasa_id", SqlDbType.NVarChar).Value = kasa_id;
            cmd.Parameters.Add("@pos_id", SqlDbType.NVarChar).Value = pos_id;
            cmd.Parameters.Add("@banka_hesap_id", SqlDbType.NVarChar).Value = banka_hesap_id;

            connection.Open();
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
            connection.Close();


        }
    }

    protected void gv_listele_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int Stok_hareket_id = Convert.ToInt32(gv_listele.DataKeys[e.RowIndex].Value);
        SqlConnection connection = new SqlConnection(dataconnect);
        SqlCommand cmd = new SqlCommand("StokHareketSil", connection);

        int sql_query = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Stok_hareket_id", SqlDbType.Int).Value = Stok_hareket_id;
            connection.Open();
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
            connection.Close();
            StokHareketListesiniGetir(Convert.ToInt32(Request.QueryString["StokID"]));
            StokBorcAlacakBilgisiniGetir(Convert.ToInt32(Request.QueryString["StokID"]));
        }

    }

   
}