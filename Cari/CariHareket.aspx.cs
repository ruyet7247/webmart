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

public partial class Cari_CariHareket : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource_odeme_sekli.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;
        SqlDataSource2.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;


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

            dd_odeme_sekli.SelectedValue = "acikhesap";
            if (lbl_cari_id.Text != "0")
            {
                CariBilgileriniGetir(Convert.ToInt32(lbl_cari_id.Text));
                CariHareketListesiniGetir(Convert.ToInt32(lbl_cari_id.Text));
                CariBorcAlacakBilgisiniGetir(Convert.ToInt32(lbl_cari_id.Text)); 
            }

        }

      
    }

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // cari arama modal popup
    {
        cariArama(txt_arama.Text);
    } 

    protected void cariArama(string unvan) //cari arama modal popup
    {
        string hareketSQL = "SELECT cari_id,adi,soyadi,unvan,gsm1,borc_bakiye,alacak_bakiye,bakiye FROM cari_karti WHERE unvan LIKE '%" + unvan + "%' OR adi LIKE '%" + unvan + "%'";
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
            lbl_mesaj.Text = "Error Cari Bulma ";
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
        Label lbl_cari_id = (Label)row.FindControl("lbl_cari_id");
        ibtn_cari_bul_ModalPopupExtender.Hide();
        Response.Redirect("CariHareket.aspx?CariID=" + lbl_cari_id.Text);


    }

    protected void CariBilgileriniGetir(int cari_id)
    {

        string queryString = "SELECT * FROM cari_karti WHERE cari_id=" + cari_id;
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {

            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_cari_id.Text = reader["cari_id"].ToString();
                    txt_unvan.Text = reader["unvan"].ToString();
                    if (reader["grup_id"].ToString() == "")
                        {
                            dd_grup_id.ID = ""; dd_grup_id.Visible = false;
                            txt_unvan.Text = reader["adi"].ToString() + " " + reader["soyadi"].ToString();
                        }
                        else
                        {
                            dd_grup_id.SelectedValue = reader["grup_id"].ToString();
                        }
                    txt_borc_bakiye.Text = reader["borc_bakiye"].ToString();
                    txt_alacak_bakiye.Text = reader["alacak_bakiye"].ToString();
                    txt_bakiye.Text = reader["bakiye"].ToString();
          

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

    protected void CariHareketListesiniGetir(int cari_id)
    {
        string queryString = "SELECT * FROM cari_hareket WHERE cari_id=" + cari_id + " ORDER BY kayit_tarihi DESC,cari_hareket_id DESC";
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);

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
            lbl_mesaj.Text = "Error Cari Bulma ";
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

    protected void CariBorcAlacakBilgisiniGetir(int cari_id)
    {
        string hareketSQL = "SELECT sum(borc) AS borc,sum(alacak) AS alacak,sum(borc)-sum(alacak) AS bakiye FROM cari_hareket WHERE cari_id=" + cari_id;
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
                    txt_bakiye.Text = reader["bakiye"].ToString();

                }
            }
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Cari Bulma ";
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
        if (dd_odeme_sekli.SelectedValue == "nakit") { queryString = "SELECT kasa_id,kasa_adi FROM kasa_kayit ORDER BY  kasa_adi";data_value="kasa_id";data_text="kasa_adi"; }
        if (dd_odeme_sekli.SelectedValue == "acikhesap") { queryString = ""; data_value = ""; data_text = ""; }
        if (dd_odeme_sekli.SelectedValue == "banka") { queryString = "SELECT  dbo.banka_kayit.banka_hesap_id, dbo.firma_para_birimi_tanimlama.para_birimi + ' -  ' + dbo.banka_kayit.banka_adi AS banka_hesap_adi FROM dbo.banka_kayit INNER JOIN dbo.firma_para_birimi_tanimlama ON dbo.banka_kayit.para_birimi_id = dbo.firma_para_birimi_tanimlama.para_birimi_id"; data_value = "banka_hesap_id"; data_text = "banka_hesap_adi"; }
        if (dd_odeme_sekli.SelectedValue == "pos") { queryString = "SELECT pos_id,pos_banka_adi FROM banka_pos_kayit ORDER BY pos_banka_adi"; data_value = "pos_id"; data_text = "pos_banka_adi"; }
        // 

        if (queryString == "")
        {
            dd_bagli_hesap.Items.Clear();
            dd_bagli_hesap.Items.Insert(0, "");
        } else
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
            string queryString = "";
            string islem_tipi = "";
            decimal borc = 0;
            decimal alacak = 0;
            string fis_id = ""; string kasa_id = ""; string pos_id = ""; string banka_hesap_id = "";

            if (dd_borc_or_alacak.SelectedValue == "borc") { borc = Convert.ToDecimal(txt_tutar.Text); alacak = 0; }
            if (dd_borc_or_alacak.SelectedValue == "alacak") { borc = 0; alacak = Convert.ToDecimal(txt_tutar.Text); }

            //  1. DURUM
            if (dd_odeme_sekli.SelectedValue == "nakit")
            {
                if (dd_borc_or_alacak.SelectedValue == "borc") { islem_tipi = "tediye"; }    //işlem tipi manuel olarak veritabanına kayıt edilir ve islem tiipleri tabloda tutulur.
                if (dd_borc_or_alacak.SelectedValue == "alacak") { islem_tipi = "tahsilat"; }      //işlem tipi manuel olarak veritabanına kayıt edilir ve islem tiipleri tabloda tutulur.
                fis_id = "";
                kasa_id = dd_bagli_hesap.SelectedValue;
                pos_id = "";
                banka_hesap_id = "";
                CariHareketBorcAlacakKaydet(txt_kayit_tarihi.Text, lbl_cari_id.Text, dd_borc_or_alacak.SelectedValue.ToString(), islem_tipi, "nakit", txt_belge_no.Text, txt_aciklama.Text, Session["personel"].ToString(), borc, alacak, fis_id, kasa_id, pos_id, banka_hesap_id);

            }
            //  2. DURUM
            if (dd_odeme_sekli.SelectedValue == "acikhesap")
            {

                if (dd_borc_or_alacak.SelectedValue == "borc") { islem_tipi = "borcdekontu"; }    //işlem tipi manuel olarak veritabanına kayıt edilir ve islem tiipleri tabloda tutulur.
                if (dd_borc_or_alacak.SelectedValue == "alacak") { islem_tipi = "alacakdekontu"; }      //işlem tipi manuel olarak veritabanına kayıt edilir ve islem tiipleri tabloda tutulur.
                fis_id = "";
                kasa_id = "";
                pos_id = "";
                banka_hesap_id = "";
                CariHareketBorcAlacakKaydet(txt_kayit_tarihi.Text, lbl_cari_id.Text, dd_borc_or_alacak.SelectedValue.ToString(), islem_tipi, "acikhesap", txt_belge_no.Text, txt_aciklama.Text, Session["personel"].ToString(), borc, alacak, fis_id, kasa_id, pos_id, banka_hesap_id);

            }
            //  3. DURUM
            if (dd_odeme_sekli.SelectedValue == "banka")
            {
                if (dd_borc_or_alacak.SelectedValue == "borc") { islem_tipi = "banka"; }    //işlem tipi manuel olarak veritabanına kayıt edilir ve islem tiipleri tabloda tutulur.
                if (dd_borc_or_alacak.SelectedValue == "alacak") { islem_tipi = "banka"; }      //işlem tipi manuel olarak veritabanına kayıt edilir ve islem tiipleri tabloda tutulur.
                fis_id = "";
                kasa_id = "";
                pos_id = "";
                banka_hesap_id = dd_bagli_hesap.SelectedValue;
                CariHareketBorcAlacakKaydet(txt_kayit_tarihi.Text, lbl_cari_id.Text, dd_borc_or_alacak.SelectedValue.ToString(), islem_tipi, "banka", txt_belge_no.Text, txt_aciklama.Text, Session["personel"].ToString(), borc, alacak, fis_id, kasa_id, pos_id, banka_hesap_id);

            }
            //  4. DURUM
            if (dd_odeme_sekli.SelectedValue == "pos")
            {
                if (dd_borc_or_alacak.SelectedValue == "borc") { islem_tipi = "pos"; }    //işlem tipi manuel olarak veritabanına kayıt edilir ve islem tiipleri tabloda tutulur.
                if (dd_borc_or_alacak.SelectedValue == "alacak") { islem_tipi = "pos"; }      //işlem tipi manuel olarak veritabanına kayıt edilir ve islem tiipleri tabloda tutulur.
                fis_id = "";
                kasa_id = "";
                pos_id = dd_bagli_hesap.SelectedValue;
                banka_hesap_id = ""; // store procedure de id hesaplanıyor
                CariHareketBorcAlacakKaydet(txt_kayit_tarihi.Text, lbl_cari_id.Text, dd_borc_or_alacak.SelectedValue.ToString(), islem_tipi, "pos", txt_belge_no.Text, txt_aciklama.Text, Session["personel"].ToString(), borc, alacak, fis_id, kasa_id, pos_id, banka_hesap_id);

            }
            // 

        } // if kontroller

        CariHareketListesiniGetir(Convert.ToInt32(lbl_cari_id.Text));
        CariBorcAlacakBilgisiniGetir(Convert.ToInt32(lbl_cari_id.Text));
        
    }

    protected bool Kontroller()
    {
        
        return true;
    }

    protected void CariHareketBorcAlacakKaydet(string kayit_tarihi, string cari_id,string borc_or_alacak,string islem_tipi,string odeme_sekli,string belge_no,string aciklama1,string personel, decimal borc, decimal alacak,string fis_id, string kasa_id, string pos_id,string banka_hesap_id)
    {

        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("CariHareketEkle", connection);

        int insert_sql = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(kayit_tarihi);
            cmd.Parameters.Add("@cari_id", SqlDbType.NVarChar).Value = cari_id;
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
            
            
            insert_sql=cmd.ExecuteNonQuery();
          
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
        int cari_hareket_id = Convert.ToInt32(gv_listele.DataKeys[e.RowIndex].Value);
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("CariHareketSil", connection);

        int sql_query = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@cari_hareket_id", SqlDbType.Int).Value = cari_hareket_id;
            
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
            CariHareketListesiniGetir(Convert.ToInt32(Request.QueryString["CariID"]));
            CariBorcAlacakBilgisiniGetir(Convert.ToInt32(Request.QueryString["CariID"]));
        }

    }



    protected void gv_arama_listele_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowState == DataControlRowState.Alternate)
            {
                e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#FFFF99';");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#f7fff8';");
            }
            else
            {
                e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#FFFF99';");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#eefef0';");
            }
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            for (int i = 0; i < e.Row.Cells.Count; i++)
            {
                Response.Write(e.Row.Cells[i].Text);
            }
        }
    }
    protected void gv_arama_listele_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //e.Row.Cells[6].BackColor = System.Drawing.Color.LightYellow;
            // e.Row.Cells[7].BackColor = System.Drawing.Color.LightYellow;
            // e.Row.Cells[8].BackColor = System.Drawing.Color.LightYellow;
            //e.Row.Cells[9].BackColor = System.Drawing.Color.LightYellow;
            /*
            Image buttonCommandField = e.Row.Cells[1].Controls[0] as Image;
            buttonCommandField.Attributes["onClick"] =
                   string.Format("return confirm('Silme İşleminden Emin misiniz? ')");
             * */

            // loop all data rows
            foreach (DataControlFieldCell cell in e.Row.Cells)
            {
                // check all cells in one row
                foreach (Control control in cell.Controls)
                {
                    // Must use LinkButton here instead of ImageButton
                    // if you are having Links (not images) as the command button.
                    ImageButton button = control as ImageButton;
                    if (button != null && button.CommandName == "Delete")
                        // Add delete confirmation
                        button.OnClientClick = "if (!confirm('Are you sure " +
                               "you want to delete this record?')) return;";
                }
            }

        }
    }
    protected void gv_arama_listele_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_arama_listele.PageIndex = e.NewPageIndex;
        cariArama(txt_arama.Text);
    }
    protected void gv_listele_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowState == DataControlRowState.Alternate)
            {
                e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#FFFF99';");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#f7fff8';");
            }
            else
            {
                e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#FFFF99';");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#eefef0';");
            }
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            for (int i = 0; i < e.Row.Cells.Count; i++)
            {
                Response.Write(e.Row.Cells[i].Text);
            }
        }
    }
    protected void gv_listele_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //e.Row.Cells[6].BackColor = System.Drawing.Color.LightYellow;
            // e.Row.Cells[7].BackColor = System.Drawing.Color.LightYellow;
            // e.Row.Cells[8].BackColor = System.Drawing.Color.LightYellow;
            //e.Row.Cells[9].BackColor = System.Drawing.Color.LightYellow;
            /*
            Image buttonCommandField = e.Row.Cells[1].Controls[0] as Image;
            buttonCommandField.Attributes["onClick"] =
                   string.Format("return confirm('Silme İşleminden Emin misiniz? ')");
             * */

            // loop all data rows
            foreach (DataControlFieldCell cell in e.Row.Cells)
            {
                // check all cells in one row
                foreach (Control control in cell.Controls)
                {
                    // Must use LinkButton here instead of ImageButton
                    // if you are having Links (not images) as the command button.
                    ImageButton button = control as ImageButton;
                    if (button != null && button.CommandName == "Delete")
                        // Add delete confirmation
                        button.OnClientClick = "if (!confirm('Are you sure " +
                               "you want to delete this record?')) return;";
                }
            }

        }
    }
    protected void gv_listele_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_listele.PageIndex = e.NewPageIndex;
        CariHareketListesiniGetir(Convert.ToInt32(lbl_cari_id.Text));
    }
}