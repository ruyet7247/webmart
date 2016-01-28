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
    String dataconnect = WebConfigurationManager.ConnectionStrings["CnnStr"].ConnectionString;


    protected void Page_Load(object sender, EventArgs e)
    {
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
            lbl_mesaj.Text = "Error Kasa Bulma ";
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

    protected void KasaBilgileriniGetir(int kasa_id)
    {

        SqlConnection connection = new SqlConnection(dataconnect);
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

          

            connection.Open();
            cmd.ExecuteNonQuery();
            // 
            txt_kasa_adi.Text = cmd.Parameters["@kasa_adi"].Value.ToString();
            dd_para_birimi_id.SelectedValue = cmd.Parameters["@para_birimi_id"].Value.ToString();
            txt_giren.Text = cmd.Parameters["@giren_miktar"].Value.ToString();
            txt_cikan.Text = cmd.Parameters["@cikan_miktar"].Value.ToString();
            txt_kasa_bakiyesi.Text = cmd.Parameters["@kasa_bakiye"].Value.ToString();
          
            connection.Close();

        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Kasa Bilgilerini Getir. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();
        }

    }

    protected void KasaHareketListesiniGetir(int kasa_id)
    {
        string hareketSQL = "SELECT * FROM kasa_hareket WHERE kasa_id=" + kasa_id + " ORDER BY kayit_tarihi DESC,kasa_hareket_id DESC";
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
            lbl_mesaj.Text = "Error Kasa Hareket Listeleme ";
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

        SqlConnection connection = new SqlConnection(dataconnect);
        //string queryString = "INSERT INTO [dbo].[kasa_hareket]  ([kasa_id],[kayit_tarihi],[giris_or_cikis],[islem_tipi] ,[miktar] ,[evrak_no] ,[aciklama1]) VALUES (@kasa_id,@kayit_tarihi,@giris_or_cikis,@islem_tipi,@miktar,@evrak_no,@aciklama1)";

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
        int kasa_hareket_id = Convert.ToInt32(gv_listele.DataKeys[e.RowIndex].Value);
        SqlConnection connection = new SqlConnection(dataconnect);
        SqlCommand cmd = new SqlCommand("KasaHareketSil", connection);

        int sql_query = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@kasa_hareket_id", SqlDbType.Int).Value = kasa_hareket_id;
            connection.Open();
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
            connection.Close();
            KasaHareketListesiniGetir(Convert.ToInt32(Request.QueryString["KasaHareketID"]));
            KasaBilgileriniGetir(Convert.ToInt32(Request.QueryString["KasaHareketID"]));
        }

    }


}