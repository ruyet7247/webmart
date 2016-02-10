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

public partial class Randevu_RandevuKarti : System.Web.UI.Page
{
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource_doktorlar.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;

        if (Request.QueryString["RandevuID"] != null)
        {
            try
            {
                int randevu_id = Convert.ToInt32(Request.QueryString["RandevuID"]);
                bool randevu_statusu =Convert.ToBoolean(Request.QueryString["Status"]);if (randevu_statusu) { randevu_statusu = false; } else { randevu_statusu = true; }
                RandevuyuStatusunuDegistir(randevu_id,randevu_statusu);
            }
            catch
            {
                // deal with it
            }
        }

        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
            if (txt_randevu_tarihi.Text == "")
            {
                DateTime dt = DateTime.Now;
                txt_randevu_tarihi.Text = String.Format("{0:dd/MM/yyyy}", dt);
            }

            RandevulistesiGetir();  

        }

        RandevulistesiGetir(); 

      

    }

    protected void txt_randevu_tarihi_TextChanged(object sender, EventArgs e)
    {
        
    }

    protected void ibtn_randevu_listele_Click(object sender, ImageClickEventArgs e)
    {
        RandevulistesiGetir();         
    }

    private void RandevulistesiGetir()
    {
        DateTime tarih = Convert.ToDateTime(txt_randevu_tarihi.Text);
        //string hareketSQL = "SELECT * FROM randevu_kayit  ORDER BY randevu_saati DESC,randevu_dakika DESC";
        string hareketSQL = "SELECT * FROM randevu_kayit WHERE  randevu_tarihi='" + tarih.ToString("yyyy-dd-MM") + "' ORDER BY randevu_saati ,randevu_dakika ";
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

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Cari Görüşmelerini Listele ";
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

    protected void ibtn_kaydet_Click(object sender, ImageClickEventArgs e)
    {
        if (txt_randevu_tarihi.Text != "")
        {
            DateTime kayit_tarihi = DateTime.Now;
            
            string queryString = "INSERT INTO randevu_kayit (kayit_tarihi,randevu_tarihi,randevu_saati,randevu_dakika,adi_soyadi,gsm,tel,randevu_notu,geldi_mi,doktor_adi_soyadi) VALUES \n" +
                                  "(@kayit_tarihi,@randevu_tarihi,@randevu_saati,@randevu_dakika,@adi_soyadi,@gsm,@tel,@randevu_notu,@geldi_mi,@doktor_adi_soyadi)";
            ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);

            try
            {

                cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = kayit_tarihi;
                cmd.Parameters.Add("@randevu_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_randevu_tarihi.Text);
                cmd.Parameters.Add("@randevu_saati", SqlDbType.NVarChar).Value = dd_randevu_saati.SelectedValue;
                cmd.Parameters.Add("@randevu_dakika", SqlDbType.NVarChar).Value = dd_randevu_dakika.SelectedValue;
                cmd.Parameters.Add("@adi_soyadi", SqlDbType.NVarChar).Value = txt_adi_soyadi.Text;
                cmd.Parameters.Add("@gsm", SqlDbType.NVarChar).Value = txt_gsm.Text;
                cmd.Parameters.Add("@tel", SqlDbType.NVarChar).Value = txt_tel.Text;
                cmd.Parameters.Add("@randevu_notu", SqlDbType.NVarChar).Value = txt_randevu_notu.Text;
                cmd.Parameters.Add("@geldi_mi", SqlDbType.Bit).Value = "False";
                cmd.Parameters.Add("@doktor_adi_soyadi", SqlDbType.NVarChar).Value = dd_doktor_adi_soyadi.SelectedValue;

                
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
                RandevulistesiGetir();
            }
        }
    }

    protected void gv_arama_listele_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int randevu_id = Convert.ToInt32(gv_arama_listele.DataKeys[e.RowIndex].Value);
        
        string query_string = "DELETE FROM randevu_kayit WHERE randevu_id=@randevu_id";
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand(query_string, connection);

        int sql_query = 0;
        try
        {
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@randevu_id", SqlDbType.Int).Value = randevu_id;
            
            sql_query = cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Delete. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            cmd.Parameters.Clear();
            baglan.VeritabaniBaglantiyiKapat(connection);
            RandevulistesiGetir();
        }
    }

    protected void RandevuyuStatusunuDegistir(int randevu_idsi,bool randevu_statusu)
    {
        
        string hareketSQL = "UPDATE randevu_kayit SET geldi_mi = @geldi_mi WHERE randevu_id=@randevu_id";
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand(hareketSQL, connection);

        int updated = 0;
        try
        {
            
            cmd.Parameters.Add("@geldi_mi", SqlDbType.Bit).Value = randevu_statusu;
            cmd.Parameters.Add("@randevu_id", SqlDbType.Int).Value = randevu_idsi;
            updated = cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Randevu Update : ";
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
        
    }
}