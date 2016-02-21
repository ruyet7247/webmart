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

public partial class Yonetim_Kullanici : System.Web.UI.Page
{
    /*
     Sistem Üzerinde Mutlaka firma_id = '-1' ve yetkisi 'master'olan bir kayıt eklenmesi gerekir.
     * Bu Sayfada Firma Seçilebiliyor - Diğerinde Seçilmiyor ÖNEMLİ FARK
     */

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ConnectionString"] = "WebMart_Master";  
        SqlDataSource_departman.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;
        SqlDataSource_firma.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;

        if (Request.QueryString["KullaniciID"] != null)
        {
            try
            {
                lbl_kullanici_id.Text = Request.QueryString["KullaniciID"];
            }
            catch
            {
                // deal with it
            }
        }


        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {

            if (lbl_kullanici_id.Text != "0")
            {
                KullaniciBilgileriniGetir(Convert.ToInt32(lbl_kullanici_id.Text));
            }

        }



    }

    protected void ibtn_post_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_kullanici_id.Text == "0")
        {
            KullaniciEkle();
            KullaniciBilgileriniGetir(Convert.ToInt32(lbl_kullanici_id.Text));
        }
        else
        {
            KullaniciGuncelle(Convert.ToInt32(lbl_kullanici_id.Text));
            //KullaniciBilgileriniGetir(Convert.ToInt32(lbl_kullanici_id.Text));
        }
    }

    protected void KullaniciEkle()
    {
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("KullaniciEkle", connection);

        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@firma_id", SqlDbType.Int).Value = dd_firma_listesi.SelectedValue;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_kayit_tarihi.Text);
            cmd.Parameters.Add("@yetki_grubu_id", SqlDbType.Int).Value = dd_yetki_grubu_id.SelectedValue;
            cmd.Parameters.Add("@tc", SqlDbType.NVarChar).Value = txt_tc.Text;
            cmd.Parameters.Add("@adi_soyadi", SqlDbType.NVarChar).Value = txt_adi_soyadi.Text;
            cmd.Parameters.Add("@kullanici_adi", SqlDbType.NVarChar).Value = txt_kullanici_adi.Text;
            cmd.Parameters.Add("@kullanici_sifre", SqlDbType.NVarChar).Value = txt_kullanici_sifre.Text;
            cmd.Parameters.Add("@gsm", SqlDbType.NVarChar).Value = txt_gsm.Text;
            cmd.Parameters.Add("@aktif_or_pasif", SqlDbType.NVarChar).Value = dd_aktif_or_pasif.SelectedValue;
            cmd.Parameters.Add("@aciklama1", SqlDbType.NVarChar).Value = txt_aciklama1.Text;


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

    protected void KullaniciGuncelle(int kullanici_id)
    {
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("KullaniciGuncelle", connection);

        int update_flag = 0;
        try
        {

            cmd.CommandType = CommandType.StoredProcedure;

            DateTime kayit_tarihi = Convert.ToDateTime(txt_kayit_tarihi.Text);

            cmd.Parameters.Add("@kullanici_id", SqlDbType.Int).Value = lbl_kullanici_id.Text;
            cmd.Parameters.Add("@firma_id", SqlDbType.Int).Value = dd_firma_listesi.SelectedValue;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = kayit_tarihi;
            cmd.Parameters.Add("@yetki_grubu_id", SqlDbType.Int).Value = dd_yetki_grubu_id.SelectedValue;
            cmd.Parameters.Add("@tc", SqlDbType.NVarChar).Value = txt_tc.Text;
            cmd.Parameters.Add("@adi_soyadi", SqlDbType.NVarChar).Value = txt_adi_soyadi.Text;
            cmd.Parameters.Add("@kullanici_adi", SqlDbType.NVarChar).Value = txt_kullanici_adi.Text;
            cmd.Parameters.Add("@kullanici_sifre", SqlDbType.NVarChar).Value = txt_kullanici_sifre.Text;
            cmd.Parameters.Add("@gsm", SqlDbType.NVarChar).Value = txt_gsm.Text;
            cmd.Parameters.Add("@aktif_or_pasif", SqlDbType.NVarChar).Value = dd_aktif_or_pasif.SelectedValue;
            cmd.Parameters.Add("@aciklama1", SqlDbType.NVarChar).Value = txt_aciklama1.Text;

          

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

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // kullanici arama modal popup
    {
        KullaniciArama(txt_arama.Text);
    }

    protected void KullaniciArama(string adi_soyadi) //kullanici arama modal popup
    {
        string hareketSQL = "SELECT * FROM firma_kullanici_kayit WHERE firma_id!='-1' and  adi_soyadi LIKE '%" + adi_soyadi + "%'";
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
            lbl_mesaj.Text = "Error Kullanıcı Bulma ";
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
        Label lbl_kullanici_id = (Label)row.FindControl("lbl_kullanici_id");
        ibtn_kullanici_bul_ModalPopupExtender.Hide();
        Response.Redirect("Kullanici.aspx?KullaniciID=" + lbl_kullanici_id.Text);


    }

    protected void KullaniciBilgileriniGetir(int kullanici_id)
    {



        string queryString = "SELECT * FROM firma_kullanici_kayit WHERE kullanici_id=" + kullanici_id;
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {


            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    dd_firma_listesi.SelectedValue = reader["firma_id"].ToString();
                    txt_tc.Text = reader["tc"].ToString();
                    DateTime kayit_tarihi = Convert.ToDateTime(reader["kayit_tarihi"].ToString());
                    txt_kayit_tarihi.Text = kayit_tarihi.ToString("dd.MM.yyyy");
                    dd_yetki_grubu_id.SelectedValue = reader["yetki_grubu_id"].ToString();
                    txt_adi_soyadi.Text = reader["adi_soyadi"].ToString();
                    txt_kullanici_adi.Text = reader["kullanici_adi"].ToString();
                    txt_kullanici_sifre.Text = reader["kullanici_sifre"].ToString();
                    txt_gsm.Text = reader["gsm"].ToString();
                    dd_aktif_or_pasif.SelectedValue = reader["aktif_or_pasif"].ToString();
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

    protected void ibtn_yeni_kullanici_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Kullanici.aspx");
    }

    protected void ibtn_kullanici_sil_Click(object sender, ImageClickEventArgs e)
    {
        int kullanici_id = Convert.ToInt32(lbl_kullanici_id.Text);
        KullaniciSil(kullanici_id);
        Response.Redirect("Kullanici.aspx");

    }

    protected void KullaniciSil(int silinecek_kullanici_id)
    {

        string queryString = "DELETE FROM firma_kullanici_kayit WHERE kullanici_id=" + silinecek_kullanici_id;
        ConnVt baglan = new ConnVt(); 
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); 
        SqlCommand cmd = new SqlCommand(queryString, connection);
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