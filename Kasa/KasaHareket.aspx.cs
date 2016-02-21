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

public partial class Kasa_KasaHareket : System.Web.UI.Page
{
    


    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource_para_birimi.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;

        if (Request.QueryString["KasaHareketID"] != null)
        {
            try
            {
                lbl_kasa_id.Text = Request.QueryString["KasaHareketID"];
            }
            catch
            {
                // deal with it
            }
        }


        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {


            if (lbl_kasa_id.Text != "0")
            {
                KasaBilgileriniGetir(Convert.ToInt32(lbl_kasa_id.Text));  // aramadan gelen
                KasaHareketListesiniGetir(Convert.ToInt32(lbl_kasa_id.Text));
                //kasaGirisCikisGetir (Convert.ToInt32(lbl_kasa_id.Text));  // miktar bilgilerini getir
            }

        }

    }

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // kasa arama modal popup
    {
        KasaArama(txt_arama.Text);
    }

    protected void gv_arama_listele_SelectedIndexChanged1(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_arama_listele.SelectedRow;
        Label Lbl_kasa_id = (Label)row.FindControl("lbl_kasa_id");
        ibtn_kasa_bul_ModalPopupExtender.Hide();
        Response.Redirect("KasaHareket.aspx?KasaHareketID=" + Lbl_kasa_id.Text);

    }

    protected void KasaArama(string kasa_adi) //kasa arama modal popup
    {
        
        string hareketSQL = "SELECT  dbo.kasa_kayit.kasa_id, dbo.kasa_kayit.kasa_adi, dbo.firma_para_birimi_tanimlama.para_birimi, dbo.firma_para_birimi_tanimlama.para_birimi_adi, dbo.kasa_kayit.aciklama1 \n"
                           +"FROM  dbo.kasa_kayit INNER JOIN dbo.firma_para_birimi_tanimlama ON dbo.kasa_kayit.para_birimi_id = dbo.firma_para_birimi_tanimlama.para_birimi_id WHERE dbo.kasa_kayit.kasa_adi LIKE '%" + kasa_adi + "%'";
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
            lbl_mesaj.Text = "Error Kasa Bulma ";
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

    protected void KasaBilgileriniGetir(int kasa_id)
    {

        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("KasaBilgileriGetir", connection);
        try
        {
            // GİDEN DEĞER  varsaylan 0 verdik zaten içerde değişiyor
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@kasa_id", kasa_id);

            // GELEN DEĞER 
            cmd.Parameters.Add("@kasa_adi", SqlDbType.NVarChar,50).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@para_birimi_id", SqlDbType.Int).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@giren_miktar", SqlDbType.Decimal,18).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@cikan_miktar", SqlDbType.Decimal, 18).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@kasa_bakiye", SqlDbType.Decimal, 18).Direction = ParameterDirection.Output;

          

            
            cmd.ExecuteNonQuery();
            // 
            txt_kasa_adi.Text = cmd.Parameters["@kasa_adi"].Value.ToString();
            dd_para_birimi_id.SelectedValue = cmd.Parameters["@para_birimi_id"].Value.ToString();
            txt_giren.Text = cmd.Parameters["@giren_miktar"].Value.ToString();
            txt_cikan.Text = cmd.Parameters["@cikan_miktar"].Value.ToString();
            txt_kasa_bakiyesi.Text = cmd.Parameters["@kasa_bakiye"].Value.ToString();
          
            baglan.VeritabaniBaglantiyiKapat(connection);

        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Kasa Bilgilerini Getir. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }

    }

    protected void KasaHareketListesiniGetir(int kasa_id)
    {
        string hareketSQL = "SELECT * FROM kasa_hareket WHERE kasa_id=" + kasa_id + " ORDER BY kayit_tarihi DESC,kasa_hareket_id DESC";
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
            lbl_mesaj.Text = "Error Kasa Hareket Listeleme ";
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

            KasaHareketGirisCikisKaydet(lbl_kasa_id.Text, txt_kayit_tarihi.Text,txt_belge_no.Text, dd_giris_or_cikis.SelectedValue, dd_giris_or_cikis.SelectedValue, txt_aciklama.Text,txt_tutar.Text,"Personel");

        } // if kontroller

        KasaHareketListesiniGetir(Convert.ToInt32(lbl_kasa_id.Text));
        KasaBilgileriniGetir(Convert.ToInt32(lbl_kasa_id.Text));

    }

    protected bool Kontroller()
    {

        return true;
    }

    protected void KasaHareketGirisCikisKaydet(string kasa_id, string kayit_tarihi, string evrak_no, string islem_tipi, string giris_or_cikis, string aciklama1, string tutar, string personel)
    {

        
        //string queryString = "INSERT INTO [dbo].[kasa_hareket]  ([kasa_id],[kayit_tarihi],[giris_or_cikis],[islem_tipi] ,[miktar] ,[evrak_no] ,[aciklama1]) VALUES (@kasa_id,@kayit_tarihi,@giris_or_cikis,@islem_tipi,@miktar,@evrak_no,@aciklama1)";
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("KasaHareketEkle", connection);

        int insert_sql = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@kasa_id", SqlDbType.Int).Value = kasa_id;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(kayit_tarihi);
            cmd.Parameters.Add("@evrak_no", SqlDbType.NVarChar).Value = evrak_no;
            cmd.Parameters.Add("@islem_tipi", SqlDbType.NVarChar).Value = islem_tipi;
            cmd.Parameters.Add("@giris_or_cikis", SqlDbType.NVarChar).Value = giris_or_cikis;
            cmd.Parameters.Add("@aciklama1", SqlDbType.NVarChar).Value = aciklama1;
            cmd.Parameters.Add("@tutar", SqlDbType.NVarChar).Value = tutar;
            cmd.Parameters.Add("@personel", SqlDbType.NVarChar).Value = personel;


            
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
        int kasa_hareket_id = Convert.ToInt32(gv_listele.DataKeys[e.RowIndex].Value);
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("KasaHareketSil", connection);

        int sql_query = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@kasa_hareket_id", SqlDbType.Int).Value = kasa_hareket_id;
            
            sql_query = cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error kasa HAREKET SİLME. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            cmd.Parameters.Clear();
            baglan.VeritabaniBaglantiyiKapat(connection);
            KasaHareketListesiniGetir(Convert.ToInt32(Request.QueryString["KasaHareketID"]));
            KasaBilgileriniGetir(Convert.ToInt32(Request.QueryString["KasaHareketID"]));
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