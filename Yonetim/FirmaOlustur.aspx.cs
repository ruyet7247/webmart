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

public partial class Firma_FirmaOlustur : System.Web.UI.Page
{

    int aktif_firma_id = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ConnectionString"] = "WebMart_Master";
        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
            lbl_firma_id.Text = "0";

        }

        lbl_mesaj.Text = "";
        VeriListele();
    }

    protected void ibtn_guncelle_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_firma_id.Text == "0")
        {
            VeriEkle();
            VeriListele();
        }
        else
        {
            VeriGuncelle(Convert.ToInt32(lbl_firma_id.Text));
            VeriListele();
        }

    }

    protected void VeriEkle()
    {

        string queryString = "INSERT INTO firma_kayit (kayit_tarihi,firma_adi,veritabani_adi,connection_string_adi) VALUES \n" +
                              "(@kayit_tarihi,@firma_adi,@veritabani_adi,@connection_string_adi)";
        ConnVt baglan = new ConnVt(); 
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); 
        SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_kurulus_tarihi.Text);
            cmd.Parameters.Add("@firma_adi", SqlDbType.NVarChar).Value = txt_firma_adi.Text;
            cmd.Parameters.Add("@veritabani_adi", SqlDbType.NVarChar).Value = txt_firma_adi.Text;
            cmd.Parameters.Add("@connection_string_adi", SqlDbType.NVarChar).Value = txt_connection_string_adi.Text;
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

        string queryString = "UPDATE firma_kayit SET kayit_tarihi=@kayit_tarihi,firma_adi=@firma_adi,veritabani_adi=@veritabani_adi,connection_string_adi=@connection_string_adi WHERE firma_id=" + numarator_id;
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(queryString, connection);



        try
        {

            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_kurulus_tarihi.Text);
            cmd.Parameters.Add("@firma_adi", SqlDbType.NVarChar).Value = txt_firma_adi.Text;
            cmd.Parameters.Add("@veritabani_adi", SqlDbType.NVarChar).Value = txt_firma_adi.Text;
            cmd.Parameters.Add("@connection_string_adi", SqlDbType.NVarChar).Value = txt_connection_string_adi.Text;
            cmd.ExecuteNonQuery();

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
        string hareketSQL = "SELECT * FROM firma_kayit";
        ConnVt baglan = new ConnVt(); 
        SqlConnection connection = baglan.VeritabaninaBaglan("WebMart_Master");
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

    protected void FirmaBilgileriniGetir(int numarator_id)
    {


        string queryString = "SELECT * FROM firma_kayit WHERE firma_id=" + numarator_id;
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {


            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_firma_id.Text = reader["firma_id"].ToString();
                    DateTime kayit_tarihi = Convert.ToDateTime(reader["kayit_tarihi"].ToString());
                    txt_kurulus_tarihi.Text = kayit_tarihi.ToString("dd.MM.yyyy");
                    txt_firma_adi.Text= reader["firma_adi"].ToString();
                    txt_veritabani_adi.Text = reader["veritabani_adi"].ToString();
                    txt_connection_string_adi.Text = reader["connection_string_adi"].ToString();

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

    protected void gv_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_listele.SelectedRow;
        Label lbl_firma_id = (Label)row.FindControl("lbl_firma_id"); // label kasa id numarasını alıyoruz detay için.

        FirmaBilgileriniGetir(Convert.ToInt32(lbl_firma_id.Text));
    }
}