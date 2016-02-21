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

public partial class Cari_AlisSatisIslemleri : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
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
            if (lbl_cari_id.Text != "0")
            {
                CariBilgileriniGetir(Convert.ToInt32(lbl_cari_id.Text));  //cari_karti
                FaturaTutarlariniHesapla(lbl_cari_id.Text);
                CariFaturaHareketListesiniGetir(Convert.ToInt32(lbl_cari_id.Text)); // fatura_stok_hareket_temp
                CariFaturaBilgisiniGetir(Convert.ToInt32(lbl_cari_id.Text));  // fatura_kayit tablosu
            }
            if (lbl_stok_id.Text != "0")
            {

                StokBilgisiniGetir(Convert.ToInt32(lbl_stok_id.Text));  // fatura_kayit tablosu
            }
        }

    

    }

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // cari arama modal popup
    {
        cariArama(txt_arama.Text);
    }

    protected void cariArama(string unvan) //cari arama modal popup
    {
        string hareketSQL = "SELECT cari_id,unvan,adi,soyadi,gsm1,borc_bakiye,alacak_bakiye,bakiye FROM cari_karti WHERE unvan LIKE '%" + unvan + "%' OR adi LIKE '%" + unvan + "%'";
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
        Response.Redirect("AlisSatisIslemleri.aspx?CariID=" + lbl_cari_id.Text);


    }

    protected void CariBilgileriniGetir(int cari_id)
    {

        string queryString = "SELECT * FROM cari_karti WHERE cari_id=" + cari_id;

        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {

            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_cari_id.Text = reader["cari_id"].ToString();
                    txt_unvan.Text = reader["unvan"].ToString();
                    if (reader["grup_id"].ToString() == "") { 
                        dd_grup_id.ID = ""; dd_grup_id.Visible = false;
                        txt_unvan.Text = reader["adi"].ToString() + " " + reader["soyadi"].ToString();
                    }
                    else { 
                        dd_grup_id.SelectedValue = reader["grup_id"].ToString(); 
                    }
                    txt_vergi_dairesi.Text = reader["vergi_dairesi"].ToString();
                    txt_vergi_no.Text = reader["vergi_no"].ToString();
                    txt_adres.Text = reader["adres1"].ToString() + " " + reader["adres2"].ToString();


                }
            }


        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Cari Bilgileri Getir. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }

    }

    protected void CariFaturaHareketListesiniGetir(int cari_id)
    {
        //string hareketSQL = "SELECT * FROM fatura_stok_hareket_temp WHERE cari_id=" + cari_id + " and onay_verildi_mi='False' ORDER BY fatura_stok_hareket_id DESC";
        string hareketSQL = "SELECT dbo.stok_kayit.stok_kod_no, dbo.stok_kayit.stok_adi, dbo.fatura_stok_hareket_temp.* FROM  dbo.stok_kayit INNER JOIN dbo.fatura_stok_hareket_temp ON dbo.stok_kayit.stok_id = dbo.fatura_stok_hareket_temp.stok_id WHERE cari_id=" + cari_id + " and onay_verildi_mi='False' ORDER BY fatura_stok_hareket_id DESC";
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
            lbl_mesaj.Text = "Error Fatura Hareket Listesi Getir ";
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

    protected void CariFaturaBilgisiniGetir(int cari_id)
    {
       /*
        string hareketSQL = "SELECT sum(borc) AS borc,sum(alacak) AS alacak,sum(borc)-sum(alacak) AS bakiye FROM fatura_stok_hareket_temp WHERE cari_id=" + cari_id;
        
        SqlCommand cmd = new SqlCommand(hareketSQL, connection);


        try
        {
            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    txt_vergi_dairesi.Text = reader["borc"].ToString();
                    txt_vergi_no.Text = reader["alacak"].ToString();
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

        */    
    }

    protected void ibtn_kaydet_Click(object sender, ImageClickEventArgs e)  //İŞLEM KAYDET 
    {
        if (Kontroller())
        {

            decimal d_ara_toplam = Convert.ToDecimal(txt_ara_toplam.Text);
            decimal d_kdv_tutar =Convert.ToDecimal(txt_kdv_toplam.Text);
            decimal d_genel_toplam =Convert.ToDecimal(txt_genel_toplam.Text);
          
            FaturaKaydet(DateTime.Today.ToString("dd.MM.yyyy"), txt_fatura_tarihi.Text, "", txt_fatura_no.Text, txt_unvan.Text, txt_adres.Text, txt_aciklama.Text, txt_vergi_dairesi.Text, txt_vergi_no.Text, d_ara_toplam,d_kdv_tutar, d_genel_toplam, txt_aciklama.Text, "", "personel", lbl_stok_id.Text, lbl_cari_id.Text, "fatura", dd_giris_or_cikis.SelectedValue, "True");
           
            Response.Redirect("AlisSatisIslemleri.aspx?CariID=" + lbl_cari_id.Text);
           

        } // if kontroller

       

    }

    protected bool Kontroller()
    {

        return true;
    }

    protected void FaturaKaydet(string kayit_tarihi, string fatura_tarihi, string sira_no, string fatura_no, string unvan, string adres, string notu, string vergi_dairesi, string vergi_no, decimal ara_toplam, decimal kdv_tutar, decimal genel_toplam, string aciklama, string odeme_sekli, string personel, string stok_id, string cari_id, string islem_tipi, string giris_or_cikis, string onay_verildi_mi)
    {

        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("FaturaKaydet", connection);

        int insert_sql = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
          
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(kayit_tarihi);
            cmd.Parameters.Add("@fatura_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(fatura_tarihi);
            cmd.Parameters.Add("@sira_no", SqlDbType.NVarChar).Value = sira_no;
            cmd.Parameters.Add("@fatura_no", SqlDbType.NVarChar).Value = fatura_no;
            cmd.Parameters.Add("@unvan", SqlDbType.NVarChar).Value = unvan;
            cmd.Parameters.Add("@adres", SqlDbType.NVarChar).Value = adres;
            cmd.Parameters.Add("@notu", SqlDbType.NVarChar).Value = notu;
            cmd.Parameters.Add("@vergi_dairesi", SqlDbType.NVarChar).Value = vergi_dairesi;
            cmd.Parameters.Add("@vergi_no", SqlDbType.NVarChar).Value = vergi_no;
            cmd.Parameters.Add("@ara_toplam", SqlDbType.Decimal).Value = ara_toplam;
            cmd.Parameters.Add("@kdv_tutar", SqlDbType.Decimal).Value = kdv_tutar;
            cmd.Parameters.Add("@genel_toplam", SqlDbType.Decimal).Value = genel_toplam;
            cmd.Parameters.Add("@aciklama", SqlDbType.NVarChar).Value = aciklama;
            cmd.Parameters.Add("@odeme_sekli", SqlDbType.NVarChar).Value = odeme_sekli;
            cmd.Parameters.Add("@personel", SqlDbType.NVarChar).Value = personel;
            cmd.Parameters.Add("@stok_id", SqlDbType.NVarChar).Value = stok_id;
            cmd.Parameters.Add("@cari_id", SqlDbType.NVarChar).Value = cari_id;
            cmd.Parameters.Add("@islem_tipi", SqlDbType.NVarChar).Value = islem_tipi;
            cmd.Parameters.Add("@giris_or_cikis", SqlDbType.NVarChar).Value = giris_or_cikis;
         
            cmd.Parameters.Add("@onay_verildi_mi", SqlDbType.NVarChar).Value = onay_verildi_mi;


            
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
        int fatura_stok_hareket_id = Convert.ToInt32(gv_listele.DataKeys[e.RowIndex].Value);
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("FaturaHareketSilTemp", connection);

        int sql_query = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@fatura_stok_hareket_id", SqlDbType.Int).Value = fatura_stok_hareket_id;
            
            sql_query = cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Fatura Hareket rowdeleting. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            cmd.Parameters.Clear();
            baglan.VeritabaniBaglantiyiKapat(connection);
            FaturaTutarlariniHesapla(lbl_cari_id.Text);
            CariFaturaHareketListesiniGetir(Convert.ToInt32(lbl_cari_id.Text)); // fatura_stok_hareket_temp
        }

    }

    protected void ibtn_stok_arama_Click(object sender, ImageClickEventArgs e)
    {
        StokArama(txt_stok_arama.Text);
    }

    protected void StokArama(string stok_adi) //stok arama modal popup
    {
        string hareketSQL = "SELECT stok_id,stok_kod_no,stok_barkod_no,stok_uretici_no,stok_adi,giren,cikan,kdv,alis_fiyati,satis_fiyati FROM stok_kayit WHERE stok_adi LIKE '%" + stok_adi + "%'";
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

            gv_stok_arama_listele.DataSource = ds_hareket;
            gv_stok_arama_listele.DataBind();

            //lblResults.Text = updated.ToString() + " record updated.";
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Stok Bulma ";
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

    protected void gv_stok_arama_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_stok_arama_listele.SelectedRow;
        Label lbl_stok_id = (Label)row.FindControl("lbl_stok_id");
        ibtn_stok_arama_ac_ModalPopupExtender.Hide();
        Response.Redirect("AlisSatisIslemleri.aspx?CariID=" + lbl_cari_id.Text+"&StokId="+lbl_stok_id.Text);

    }

    protected void StokBilgisiniGetir(int stok_id)
    {

        string queryString = "SELECT stok_id,stok_kod_no,stok_adi,birimi,kdv,satis_fiyati FROM stok_kayit WHERE stok_id=" + stok_id;

        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {

            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    txt_stok_kodu.Text = reader["stok_kod_no"].ToString();
                    txt_stok_adi.Text = reader["stok_adi"].ToString();
                    txt_birimi.Text = reader["birimi"].ToString();
                    txt_kdv.Text = reader["kdv"].ToString();
                    txt_satis_fiyati.Text = reader["satis_fiyati"].ToString();
                }
            }


        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Stok Bilgileri Getir. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }

    }

    protected void ibtn_stok_hareket_kaydet_Click(object sender, ImageClickEventArgs e)
    {
        StokHareketKaydet();
        FaturaTutarlariniHesapla(lbl_cari_id.Text);
        CariFaturaHareketListesiniGetir(Convert.ToInt32(lbl_cari_id.Text)); // fatura_stok_hareket_temp
    }

    protected void FaturaTutarlariniHesapla(string cari_id)
    {

        string queryString = "SELECT SUM(kdvsiz_tutar) AS kdvsiz_tutar,SUM(kdv_tutari) AS kdv_tutari,SUM(tutar) AS tutar FROM fatura_stok_hareket_temp WHERE onay_verildi_mi=0 and cari_id="+cari_id;

        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {

            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    txt_ara_toplam.Text = reader["kdvsiz_tutar"].ToString();
                    txt_kdv_toplam.Text= reader["kdv_tutari"].ToString();
                    txt_genel_toplam.Text = reader["tutar"].ToString();

                }
            }


        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Fatura Toplamlarını Getir. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }

    }

    protected void StokHareketKaydet()
    {
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("FaturaStokHareketEkleTemp", connection);

        int insert_sql = 0;
        try
        {
            txt_satis_fiyati.Text = txt_satis_fiyati.Text.Replace(".", ",");
            txt_stok_kdv_tutar.Text = txt_stok_kdv_tutar.Text.Replace(".", ",");
            txt_tutar.Text = txt_tutar.Text.Replace(".", ",");

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@stok_id", SqlDbType.Int).Value = Convert.ToInt32(lbl_stok_id.Text);
            cmd.Parameters.Add("@cari_id", SqlDbType.Int).Value = Convert.ToInt32(lbl_cari_id.Text);
            cmd.Parameters.Add("@islem_tipi", SqlDbType.NVarChar).Value = "fatura";
            cmd.Parameters.Add("@giris_or_cikis", SqlDbType.NVarChar).Value = dd_giris_or_cikis.SelectedValue;
            cmd.Parameters.Add("@miktar", SqlDbType.Int).Value = Convert.ToInt32(txt_miktar.Text);
            cmd.Parameters.Add("@birim", SqlDbType.NVarChar).Value = txt_birimi.Text;
            cmd.Parameters.Add("@aciklama1", SqlDbType.NVarChar).Value = "";
            cmd.Parameters.Add("@iskonto", SqlDbType.Float).Value = 0;
            cmd.Parameters.Add("@birim_fiyat", SqlDbType.Decimal).Value = Convert.ToDecimal(txt_satis_fiyati.Text);
            cmd.Parameters.Add("@kdvsiz_tutar", SqlDbType.Decimal).Value = Convert.ToDecimal(txt_kdvsiz_tutar.Text);
            cmd.Parameters.Add("@kdv_oran", SqlDbType.Int).Value = Convert.ToInt32(txt_kdv.Text);
            cmd.Parameters.Add("@kdv_tutari", SqlDbType.Decimal).Value = Convert.ToDecimal(txt_stok_kdv_tutar.Text);
            cmd.Parameters.Add("@tutar", SqlDbType.Decimal).Value = Convert.ToDecimal(txt_tutar.Text);
            cmd.Parameters.Add("@onay_verildi_mi", SqlDbType.Bit).Value = "False";


            
            insert_sql = cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error INSERT FATURA STOK HAREKET. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            cmd.Parameters.Clear();
            baglan.VeritabaniBaglantiyiKapat(connection);


        }
    }

    protected void gv_stok_arama_listele_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gv_stok_arama_listele_RowDataBound(object sender, GridViewRowEventArgs e)
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
}