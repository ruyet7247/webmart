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

public partial class GenelTanimlamar_Kullanici : System.Web.UI.Page
{
    string database_master = "WebMart_Master"; // Bu sayfaya özel veriler Master Database e eklendiği için sabit yaptık
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        SqlDataSource_departman.ConnectionString = WebConfigurationManager.ConnectionStrings[database_master].ConnectionString;
        SqlDataSource_firma.ConnectionString = WebConfigurationManager.ConnectionStrings[database_master].ConnectionString;
        SqlDataSource_firma.SelectCommand = "SELECT [firma_id], [firma_adi] FROM [firma_kayit] WHERE firma_id=" + Session["firma_id"].ToString();


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
            dd_firma_listesi.SelectedValue = Session["firma_id"].ToString();
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
        SqlConnection connection = baglan.VeritabaninaBaglan(database_master);
        SqlCommand cmd = new SqlCommand("KullaniciEkle", connection);

        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@firma_id", SqlDbType.Int).Value = Convert.ToInt32(Session["firma_id"].ToString());
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
        SqlConnection connection = baglan.VeritabaninaBaglan(database_master);
        SqlCommand cmd = new SqlCommand("KullaniciGuncelle", connection);

        int update_flag = 0;
        try
        {

            cmd.CommandType = CommandType.StoredProcedure;

            DateTime kayit_tarihi = Convert.ToDateTime(txt_kayit_tarihi.Text);

            cmd.Parameters.Add("@kullanici_id", SqlDbType.Int).Value = lbl_kullanici_id.Text;
            cmd.Parameters.Add("@firma_id", SqlDbType.Int).Value = Convert.ToInt32(Session["firma_id"].ToString());
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
        string hareketSQL = "SELECT * FROM firma_kullanici_kayit WHERE firma_id!='-1' and  firma_id=" + Convert.ToInt32(Session["firma_id"].ToString()) + " and adi_soyadi LIKE '%" + adi_soyadi + "%'";
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(database_master);
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



        string queryString = "SELECT * FROM firma_kullanici_kayit WHERE firma_id=" + Convert.ToInt32(Session["firma_id"].ToString())+ " and  kullanici_id=" + kullanici_id;
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(database_master); SqlCommand cmd = new SqlCommand(queryString, connection);
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
        int firma_id = Convert.ToInt32(Session["firma_id"].ToString());
        KullaniciSil(kullanici_id,firma_id);
        Response.Redirect("Kullanici.aspx");

    }

    protected void KullaniciSil(int silinecek_kullanici_id,int silinecek_firma_id)
    {

        string queryString = "DELETE FROM firma_kullanici_kayit WHERE firma_id=" + silinecek_firma_id + " and kullanici_id=" + silinecek_kullanici_id;
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(database_master);
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


    protected void gv_arama_listele_RowDataBound(object sender, GridViewRowEventArgs e)
    {

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
}