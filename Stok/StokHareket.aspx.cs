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
        string hareketSQL = "SELECT stok_id,stok_adi,birimi,giren,cikan,alis_fiyati,satis_fiyati FROM stok_kayit WHERE stok_adi LIKE '%" + stok_adi + "%'";
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

    protected void StokBilgileriniGetir(int stok_id)
    {


        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "SELECT stok_id,stok_adi,grubu_id,giren,cikan FROM stok_kayit WHERE stok_id=" + stok_id;
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
            connection.Close();
        }

    }

    protected void StokHareketListesiniGetir(int stok_id)
    {
        string hareketSQL = "SELECT * FROM stok_hareket WHERE stok_id=" + stok_id + " ORDER BY kayit_tarihi DESC,stok_hareket_id DESC";
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
            connection.Close();
        }
        * */


    }

    protected void StokHareketGirisCikisKaydet(string stok_id, string kayit_tarihi, string giris_or_cikis, string islem_tipi, string miktar,string birim,string aciklama1,string birim_fiyat,string iskonto,string kdv,string tutar,string cari_id,string evrak_no,string fis,string fatura)
    {

        SqlConnection connection = new SqlConnection(dataconnect);
        //string queryString = "INSERT INTO [dbo].[stok_hareket]  ([stok_id],[kayit_tarihi],[giris_or_cikis],[islem_tipi] ,[miktar] ,[evrak_no] ,[aciklama1]) VALUES (@stok_id,@kayit_tarihi,@giris_or_cikis,@islem_tipi,@miktar,@evrak_no,@aciklama1)";

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
        int stok_hareket_id = Convert.ToInt32(gv_listele.DataKeys[e.RowIndex].Value);
        SqlConnection connection = new SqlConnection(dataconnect);
        SqlCommand cmd = new SqlCommand("StokHareketSil", connection);

        int sql_query = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@stok_hareket_id", SqlDbType.Int).Value = stok_hareket_id;
            connection.Open();
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
            connection.Close();
            StokHareketListesiniGetir(Convert.ToInt32(Request.QueryString["StokID"]));
            StokBilgileriniGetir(Convert.ToInt32(Request.QueryString["StokID"]));
        }

    }


   
}