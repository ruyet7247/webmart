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
    

    
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource2.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;
        
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
                StokBilgileriniGetir(Convert.ToInt32(lbl_stok_id.Text));  // aramadan gelen
                StokHareketListesiniGetir(Convert.ToInt32(lbl_stok_id.Text));
                //StokGirisCikisGetir (Convert.ToInt32(lbl_stok_id.Text));  // miktar bilgilerini getir
            }

        }

    }

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // Stok arama modal popup
    {
        StokArama(txt_arama.Text);
    }

    protected void gv_arama_listele_SelectedIndexChanged1(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_arama_listele.SelectedRow;
        Label Lbl_Stok_id = (Label)row.FindControl("lbl_Stok_id");
        ibtn_stok_bul_ModalPopupExtender.Hide();
        Response.Redirect("StokHareket.aspx?StokID=" + Lbl_Stok_id.Text);

    }

    protected void StokArama(string stok_adi) //Stok arama modal popup
    {
        string hareketSQL = "SELECT TOP(20) stok_id,stok_kod_no,stok_barkod_no,stok_uretici_no,stok_adi,birimi,kdv,alis_fiyati,satis_fiyati FROM stok_kayit WHERE stok_adi LIKE '%" + stok_adi + "%'";
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

    protected void StokBilgileriniGetir(int stok_id)
    {

        string queryString = "SELECT stok_id,stok_adi,grubu_id,giren,cikan FROM stok_kayit WHERE stok_id=" + stok_id;
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_stok_id.Text = reader["stok_id"].ToString();

                    txt_stok_adi.Text = reader["stok_adi"].ToString();
                    dd_grup_id.SelectedValue = reader["grubu_id"].ToString();
                    txt_giren.Text = reader["giren"].ToString();
                    txt_cikan.Text = reader["cikan"].ToString();
                    int stok_miktari = Convert.ToInt32(reader["giren"].ToString()) - Convert.ToInt32(reader["cikan"].ToString());
                    txt_stok_miktari.Text = stok_miktari.ToString();
       
                }
            }


        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error StokBilgileriniGetir. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }

    }

    protected void StokHareketListesiniGetir(int stok_id)
    {
        string hareketSQL = "SELECT * FROM stok_hareket WHERE stok_id=" + stok_id + " ORDER BY kayit_tarihi DESC,stok_hareket_id DESC";
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

    protected void ibtn_kaydet_Click(object sender, ImageClickEventArgs e)  //İŞLEM KAYDET 
    {
        if (Kontroller())
        {

            // SABİT TANIMLAMALAR
            Session["personel"] = "hamza";
            string queryString = "";
          
            StokHareketGirisCikisKaydet(lbl_stok_id.Text, txt_kayit_tarihi.Text,dd_giris_or_cikis.SelectedValue,dd_giris_or_cikis.SelectedValue,txt_miktar.Text,"",txt_aciklama.Text,"","","","","",txt_belge_no.Text,"","");

           

        } // if kontroller

        StokHareketListesiniGetir(Convert.ToInt32(lbl_stok_id.Text));
        StokBilgileriniGetir(Convert.ToInt32(lbl_stok_id.Text));

    }

    protected bool Kontroller()
    {

        return true;
    }

    protected void StokGirisCikisGetirXXX(int stok_id)
    {
       /*
        string hareketSQL = "SELECT (SELECT sum(miktar) FROM stok_hareket WHERE giris_or_cikis='giris') AS girenmiktar,(SELECT sum(miktar) FROM stok_hareket WHERE giris_or_cikis='cikis') AS cikannmiktar FROM stok_hareket WHERE stok_id=" + stok_id; ;
        
        SqlCommand cmd = new SqlCommand(hareketSQL, connection);


        try
        {
            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    txt_giren.Text = reader["girenmiktar"].ToString();
                    txt_cikan.Text = reader["cikannmiktar"].ToString();
                    int stok_adeti = Convert.ToInt32(reader["girenmiktar"].ToString()) - Convert.ToInt32(reader["cikannmiktar"].ToString());
                    txt_stok_miktari.Text = stok_adeti.ToString();

                }
            }
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Stok Giriş Çıkış Getir ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }
        * */


    }

    protected void StokHareketGirisCikisKaydet(string stok_id, string kayit_tarihi, string giris_or_cikis, string islem_tipi, string miktar,string birim,string aciklama1,string birim_fiyat,string iskonto,string kdv,string tutar,string cari_id,string evrak_no,string fis,string fatura)
    {

        
        //string queryString = "INSERT INTO [dbo].[stok_hareket]  ([stok_id],[kayit_tarihi],[giris_or_cikis],[islem_tipi] ,[miktar] ,[evrak_no] ,[aciklama1]) VALUES (@stok_id,@kayit_tarihi,@giris_or_cikis,@islem_tipi,@miktar,@evrak_no,@aciklama1)";
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("StokHareketEkle", connection);

        int insert_sql = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@stok_id", SqlDbType.Int).Value = stok_id;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(kayit_tarihi);
            cmd.Parameters.Add("@giris_or_cikis", SqlDbType.NVarChar).Value = giris_or_cikis;
            cmd.Parameters.Add("@islem_tipi", SqlDbType.NVarChar).Value = islem_tipi;
            cmd.Parameters.Add("@miktar", SqlDbType.Int).Value = Convert.ToInt32(miktar);
            cmd.Parameters.Add("@evrak_no", SqlDbType.NVarChar).Value = evrak_no;
            cmd.Parameters.Add("@aciklama1", SqlDbType.NVarChar).Value = aciklama1;
            

            
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
        int stok_hareket_id = Convert.ToInt32(gv_listele.DataKeys[e.RowIndex].Value);
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("StokHareketSil", connection);

        int sql_query = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@stok_hareket_id", SqlDbType.Int).Value = stok_hareket_id;
            
            sql_query = cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error STOK HAREKET SİLME. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            cmd.Parameters.Clear();
            baglan.VeritabaniBaglantiyiKapat(connection);
            StokHareketListesiniGetir(Convert.ToInt32(Request.QueryString["StokID"]));
            StokBilgileriniGetir(Convert.ToInt32(Request.QueryString["StokID"]));
        }

    }

    protected void gv_arama_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_arama_listele.SelectedRow;
        Label lbl_stok_id = (Label)row.FindControl("lbl_stok_id");
        ibtn_stok_bul_ModalPopupExtender.Hide();
        Response.Redirect("StokHareket.aspx?StokID=" + lbl_stok_id.Text);

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
    
}