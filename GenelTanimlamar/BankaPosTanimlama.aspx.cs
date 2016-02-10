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

public partial class GenelTanimlamar_BankaPosTanimlama : System.Web.UI.Page
{
    
    int cari_gurubu_id = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

        SqlDataSource_banka_hesap_listesi.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;
        
        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
            lbl_pos_id.Text = "0";

        }

        lbl_mesaj.Text = "";
        VeriListele();

    }


    protected void ibtn_post_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_pos_id.Text == "0")
        {
            VeriEkle();
            VeriListele();
        }
        else
        {
            VeriGuncelle(Convert.ToInt32(lbl_pos_id.Text));
            VeriListele();
        }
    }

    protected void VeriEkle()
    {
        
        string queryString = "INSERT INTO banka_pos_kayit (pos_banka_adi,bagli_olan_banka_hesap_id,tahakkuk_gun_sayisi) VALUES \n" +
                              "(@pos_banka_adi,@bagli_olan_banka_hesap_id,@tahakkuk_gun_sayisi)";
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {
            cmd.Parameters.Add("@pos_banka_adi", SqlDbType.NVarChar).Value = txt_pos_banka_adi.Text;
            cmd.Parameters.Add("@bagli_olan_banka_hesap_id", SqlDbType.Int).Value = dd_bagli_olan_banka_hesap_id.SelectedValue;
            cmd.Parameters.Add("@tahakkuk_gun_sayisi", SqlDbType.Int).Value = txt_tahakkuk_gun_sayisi.Text;

            
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

    protected void VeriGuncelle(int numarator_id)
    {
        
        string queryString = "UPDATE banka_pos_kayit SET pos_banka_adi=@pos_banka_adi,bagli_olan_banka_hesap_id=@bagli_olan_banka_hesap_id,tahakkuk_gun_sayisi=@tahakkuk_gun_sayisi WHERE pos_id=" + numarator_id;
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);



        try
        {

            cmd.Parameters.Add("@pos_banka_adi", SqlDbType.NVarChar).Value = txt_pos_banka_adi.Text;
            cmd.Parameters.Add("@bagli_olan_banka_hesap_id", SqlDbType.Int).Value = dd_bagli_olan_banka_hesap_id.SelectedValue;
            cmd.Parameters.Add("@tahakkuk_gun_sayisi", SqlDbType.Int).Value = txt_tahakkuk_gun_sayisi.Text;


            //Response.Write(cmd.CommandText);

            
            cmd.ExecuteNonQuery();
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

    protected void VeriListele()
    {
        string hareketSQL = "SELECT * FROM banka_pos_kayit";
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(hareketSQL, connection);

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
            lbl_mesaj.Text = "Error Listele. ";
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

    protected void gv_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_listele.SelectedRow;
        Label lbl_pos_id = (Label)row.FindControl("lbl_pos_id"); // label kasa id numarasını alıyoruz detay için.

        CariBilgileriniGetir(Convert.ToInt32(lbl_pos_id.Text));

        // satırı renklendir
        //gv_kasa_listele.SelectedRow.Cells[2].BackColor = System.Drawing.Color.Orange;
        //gv_kasa_listele.SelectedRow.Cells[3].BackColor = System.Drawing.Color.Orange;

    }

    protected void CariBilgileriniGetir(int numarator_id)
    {

        
        string queryString = "SELECT * FROM banka_pos_kayit WHERE pos_id=" + numarator_id;
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_pos_id.Text = reader["pos_id"].ToString();
                    txt_pos_banka_adi.Text= reader["pos_banka_adi"].ToString();
                    dd_bagli_olan_banka_hesap_id.SelectedValue= reader["bagli_olan_banka_hesap_id"].ToString();
                    txt_tahakkuk_gun_sayisi.Text = reader["tahakkuk_gun_sayisi"].ToString();



                }
            }


        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error VeriSorgula. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }



    }

    protected void gv_listele_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int numarator_id = Convert.ToInt32(gv_listele.DataKeys[e.RowIndex].Value);
        
        string queryString = "DELETE FROM banka_pos_kayit WHERE pos_id=" + numarator_id;
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            
            cmd.ExecuteNonQuery();

        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error DELETE. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
            VeriListele();
        }
    }
}