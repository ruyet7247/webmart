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

public partial class Kasa_BankaHareket : System.Web.UI.Page
{
    


    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource_para_birimi.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;


        if (Request.QueryString["BankaID"] != null)
        {
            try
            {
                lbl_banka_id.Text = Request.QueryString["BankaID"];
            }
            catch
            {
                // deal with it
            }
        }


        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {


            if (lbl_banka_id.Text != "0")
            {
                BankaBilgileriniGetir(Convert.ToInt32(lbl_banka_id.Text));  // aramadan gelen
                BankaHareketListesiniGetir(Convert.ToInt32(lbl_banka_id.Text));
                //bankaGirisCikisGetir (Convert.ToInt32(lbl_banka_id.Text));  // miktar bilgilerini getir
            }

        }

    }

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // banka arama modal popup
    {
        BankaArama(txt_arama.Text);
    }

    protected void BankaArama(string banka_adi) //banka arama modal popup
    {

        string hareketSQL = "SELECT  * FROM banka_kayit WHERE banka_adi LIKE '%" + banka_adi + "%'";
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
            lbl_mesaj.Text = "Error Banka Bulma ";
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

    protected void BankaBilgileriniGetir(int banka_id)
    {

        int deger = 0;

        
        string queryString = "SELECT     banka_hesap_id,banka_adi, hesap_no, para_birimi_id,\n"+
                         " (SELECT     SUM(tutar) AS giren1 \n"+
                         "   FROM          dbo.banka_hareket \n"+
                         "   WHERE      (banka_hesap_id = " + banka_id + ") AND (giris_or_cikis = 'giris')) AS giren, \n" +
                         " (SELECT     SUM(tutar) AS cikan1 \n"+
                         "   FROM          dbo.banka_hareket AS banka_hareket_1 \n"+
                         "   WHERE      (banka_hesap_id = " + banka_id + ") AND (giris_or_cikis = 'cikis')) AS cikan \n" +
                         "   FROM         dbo.banka_kayit \n" +
                         "   WHERE      (banka_hesap_id = " + banka_id + ")";
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    lbl_banka_id.Text = reader["banka_hesap_id"].ToString();
                    txt_banka_adi.Text = reader["banka_adi"].ToString();
                    txt_hesap_no.Text = reader["hesap_no"].ToString();
                    dd_para_birimi_id.SelectedValue = reader["para_birimi_id"].ToString();
                    txt_giren.Text = reader["giren"].ToString();
                    txt_cikan.Text= reader["cikan"].ToString();
                    if (txt_giren.Text!="" && txt_cikan.Text!="" )
                    {
                        decimal banka_bakiyesi = Convert.ToDecimal(txt_giren.Text) - Convert.ToDecimal(txt_cikan.Text);
                        txt_banka_bakiyesi.Text = banka_bakiyesi.ToString();
                    }

                }
            }

        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Bilgileri Getir ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }


    }

    protected void BankaHareketListesiniGetir(int banka_id)
    {
        string hareketSQL = "SELECT * FROM banka_hareket WHERE banka_hesap_id=" + banka_id + " ORDER BY kayit_tarihi DESC,odeme_tarihi DESC,banka_hareket_id DESC";
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
            lbl_mesaj.Text = "Error Banka Hareket Listeleme ";
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

    protected void ibtn_kaydet_Click(object sender, ImageClickEventArgs e)  //İŞLEM KAYDET 
    {
        if (Kontroller())
        {

            // SABİT TANIMLAMALAR
            Session["personel"] = "hamza";
            string queryString = "";

            BankaHareketGirisCikisKaydet(Convert.ToInt32(lbl_banka_id.Text), txt_banka_adi.Text, txt_odeme_tarihi.Text, txt_odeme_tarihi.Text, dd_giris_or_cikis.SelectedValue, txt_aciklama.Text,Convert.ToDecimal(txt_tutar.Text), "Personel");

        } // if kontroller

        BankaHareketListesiniGetir(Convert.ToInt32(lbl_banka_id.Text));
        BankaBilgileriniGetir(Convert.ToInt32(lbl_banka_id.Text));

    }

    protected bool Kontroller()
    {

        return true;
    }

    protected void BankaHareketGirisCikisKaydet(int banka_hesap_id, string banka_hesap_adi, string kayit_tarihi, string odeme_tarihi, string giris_or_cikis, string aciklama1, decimal tutar,string personel_adi)
    {

        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());    
        SqlCommand cmd = new SqlCommand("BankaHareketEkle", connection);

        int insert_sql = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@banka_hesap_id", SqlDbType.Int).Value =banka_hesap_id;
            cmd.Parameters.Add("@banka_hesap_adi", SqlDbType.NVarChar).Value = banka_hesap_adi;
            cmd.Parameters.Add("@giris_or_cikis", SqlDbType.NVarChar).Value = giris_or_cikis;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(kayit_tarihi);
            cmd.Parameters.Add("@odeme_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(odeme_tarihi);
            cmd.Parameters.Add("@odeme_kategorisi", SqlDbType.NVarChar).Value = giris_or_cikis;
            cmd.Parameters.Add("@aciklama1", SqlDbType.NVarChar).Value = aciklama1;
            cmd.Parameters.Add("@tutar", SqlDbType.Decimal).Value = tutar;
            cmd.Parameters.Add("@personel_adi", SqlDbType.NVarChar).Value = personel_adi;


            
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
        int banka_hareket_id = Convert.ToInt32(gv_listele.DataKeys[e.RowIndex].Value);
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("BankaHareketSil", connection);

        int sql_query = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@banka_hareket_id", SqlDbType.Int).Value = banka_hareket_id;
            
            sql_query = cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Banka HAREKET SİLME. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            cmd.Parameters.Clear();
            baglan.VeritabaniBaglantiyiKapat(connection);
            BankaBilgileriniGetir(Convert.ToInt32(lbl_banka_id.Text));  // aramadan gelen
            BankaHareketListesiniGetir(Convert.ToInt32(lbl_banka_id.Text));
        }

    }

    protected void gv_arama_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_arama_listele.SelectedRow;
        Label lbl_banka_id_si= (Label)row.FindControl("lbl_banka_hesap_id"); // label banka id numarasını alıyoruz detay için.
        ibtn_banka_bul_ModalPopupExtender.Hide();
        Response.Redirect("BankaHareket.aspx?BankaID=" + lbl_banka_id_si.Text);

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