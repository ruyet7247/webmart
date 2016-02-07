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

public partial class Kasa_PosHareket : System.Web.UI.Page
{
    String dataconnect = WebConfigurationManager.ConnectionStrings["CnnStr"].ConnectionString;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["PosID"] != null)
        {
            try
            {
                lbl_pos_id.Text = Request.QueryString["PosID"];
            }
            catch
            {
                // deal with it
            }
        }


        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {


            if (lbl_pos_id.Text != "0")
            {
                PosBilgileriniGetir(Convert.ToInt32(lbl_pos_id.Text));  // aramadan gelen
                PosHareketListesiniGetir(Convert.ToInt32(lbl_pos_id.Text));
                //bankaGirisCikisGetir (Convert.ToInt32(lbl_banka_id.Text));  // miktar bilgilerini getir
            }

        }

    }

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // banka arama modal popup
    {
        PosArama(txt_arama.Text);
    }

    protected void PosArama(string pos_banka_adi) //banka arama modal popup
    {

        string hareketSQL = "SELECT  * FROM banka_pos_kayit WHERE pos_banka_adi LIKE '%" + pos_banka_adi + "%'";
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
            lbl_mesaj.Text = "Error Pos Bulma ";
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

    protected void PosBilgileriniGetir(int pos_id)
    {

        int deger = 0;

        SqlConnection connection = new SqlConnection(dataconnect);

        string queryString = "SELECT     pos_id,pos_banka_adi, bagli_olan_banka_hesap_id, tahakkuk_gun_sayisi, \n" +
                          " (SELECT     SUM(tutar) AS giren1 \n" +
                          "   FROM          dbo.banka_pos_hareket \n" +
                          "   WHERE      (pos_id =   " + pos_id + " ) AND (giris_or_cikis = 'giris')) AS giren,  \n" +
                          " (SELECT     SUM(tutar) AS cikan1 \n" +
                          "   FROM          dbo.banka_pos_hareket \n" +
                          "   WHERE      (pos_id =   " + pos_id + " ) AND (giris_or_cikis = 'cikis')) AS cikan  \n" +
                          "   FROM         dbo.banka_pos_kayit \n" +
                          "   WHERE      (pos_id =   " + pos_id + " )";


        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    lbl_pos_id.Text = reader["pos_id"].ToString();
                    txt_pos_banka_adi.Text = reader["pos_banka_adi"].ToString();
                    txt_tahakkuk_gun_sayisi.Text = reader["tahakkuk_gun_sayisi"].ToString();
                    dd_bagli_olan_banka_hesap_id.SelectedValue = reader["bagli_olan_banka_hesap_id"].ToString();
                    txt_giren.Text = reader["giren"].ToString();
                    txt_cikan.Text = reader["cikan"].ToString();
                    if (txt_giren.Text != "" && txt_cikan.Text != "")
                    {
                        decimal banka_bakiyesi = Convert.ToDecimal(txt_giren.Text) - Convert.ToDecimal(txt_cikan.Text);
                        txt_pos_bakiyesi.Text = banka_bakiyesi.ToString();
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
            connection.Close();
        }


    }

    protected void PosHareketListesiniGetir(int pos_id)
    {
        string hareketSQL = "SELECT * FROM banka_pos_hareket WHERE pos_id=" + pos_id + " ORDER BY kayit_tarihi DESC,odeme_tarihi DESC,pos_hareket_id DESC";
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
            lbl_mesaj.Text = "Error Pos Hareket Listeleme ";
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

            PosHareketGirisCikisKaydet(Convert.ToInt32(lbl_pos_id.Text), txt_kayit_tarihi.Text,  dd_giris_or_cikis.SelectedValue, txt_aciklama.Text, Convert.ToDecimal(txt_tutar.Text), "Personel");

        } // if kontroller

        PosHareketListesiniGetir(Convert.ToInt32(lbl_pos_id.Text));
        PosBilgileriniGetir(Convert.ToInt32(lbl_pos_id.Text));

    }

    protected bool Kontroller()
    {

        return true;
    }

    protected void PosHareketGirisCikisKaydet(int pos_id, string kayit_tarihi, string giris_or_cikis, string aciklama1, decimal tutar, string personel_adi)
    {

        SqlConnection connection = new SqlConnection(dataconnect);

        SqlCommand cmd = new SqlCommand("PosHareketEkle", connection);

        int insert_sql = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@pos_id", SqlDbType.Int).Value = pos_id;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(kayit_tarihi);
            cmd.Parameters.Add("@giris_or_cikis", SqlDbType.NVarChar).Value = giris_or_cikis;
            cmd.Parameters.Add("@aciklama1", SqlDbType.NVarChar).Value = aciklama1;
            cmd.Parameters.Add("@tutar", SqlDbType.Decimal).Value = tutar;
            cmd.Parameters.Add("@personel_adi", SqlDbType.NVarChar).Value = personel_adi;



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
        int banka_pos_hareket_id = Convert.ToInt32(gv_listele.DataKeys[e.RowIndex].Value);
        SqlConnection connection = new SqlConnection(dataconnect);
        SqlCommand cmd = new SqlCommand("PosHareketSil", connection);

        int sql_query = 0;
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@pos_hareket_id", SqlDbType.Int).Value = banka_pos_hareket_id;
            connection.Open();
            sql_query = cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Pos HAREKET SİLME. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            cmd.Parameters.Clear();
            connection.Close();
            PosBilgileriniGetir(Convert.ToInt32(lbl_pos_id.Text));  // aramadan gelen
            PosHareketListesiniGetir(Convert.ToInt32(lbl_pos_id.Text));
        }

    }

    protected void gv_arama_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_arama_listele.SelectedRow;
        Label pos_hareket_id_si = (Label)row.FindControl("lbl_pos_id"); // label banka id numarasını alıyoruz detay için.
        pos_ModalPopupExtender.Hide();
        Response.Redirect("PosHareket.aspx?PosID=" + pos_hareket_id_si.Text);

    }

}