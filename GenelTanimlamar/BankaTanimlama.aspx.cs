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

public partial class GenelTanimlamar_BankaTanimlama : System.Web.UI.Page
{
    String dataconnect = WebConfigurationManager.ConnectionStrings["CnnStr"].ConnectionString;
    int banka_hesap_id = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbl_banka_hesap_id.Text = "0";
        }

        lbl_mesaj.Text = "";
        BankaListele();
    }

    protected void ibtn_post_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_banka_hesap_id.Text == "0")
        {
            BankaEkle();
            BankaListele();
        }
        else
        {
            BankaGuncelle(Convert.ToInt32(lbl_banka_hesap_id.Text));
            BankaListele();
        }
    }
    protected void BankaEkle()
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "INSERT INTO banka_kayit (banka_adi,hesap_sahibi,sube_kodu,hesap_no,iban,aktif_or_pasif,para_birimi_id) VALUES \n" +
                              "(@banka_adi,@hesap_sahibi,@sube_kodu,@hesap_no,@iban,@aktif_or_pasif,@para_birimi_id)";
        SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {
            cmd.Parameters.Add("@banka_adi", SqlDbType.NVarChar).Value = txt_banka_adi.Text;
            cmd.Parameters.Add("@hesap_sahibi", SqlDbType.NVarChar).Value = txt_hesap_sahibi.Text;
            cmd.Parameters.Add("@sube_kodu", SqlDbType.NVarChar).Value = txt_sube_kodu.Text;
            cmd.Parameters.Add("@hesap_no", SqlDbType.NVarChar).Value = txt_hesap_no.Text;
            cmd.Parameters.Add("@iban", SqlDbType.NVarChar).Value = txt_iban_no.Text;
            cmd.Parameters.Add("@aktif_or_pasif", SqlDbType.NVarChar).Value = dd_aktif_or_pasif.SelectedValue;
            cmd.Parameters.Add("@para_birimi_id", SqlDbType.Int).Value = Convert.ToInt32(dd_para_birimi.SelectedValue);
            

            connection.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error INSERT ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();

        }
    }

    protected void BankaGuncelle(int anahtar_id)
    {

        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "UPDATE banka_kayit SET banka_adi=@banka_adi,hesap_sahibi=@hesap_sahibi,sube_kodu=@sube_kodu,hesap_no=@hesap_no, \n" +
                             "iban=@iban,aktif_or_pasif=@aktif_or_pasif,para_birimi_id=@para_birimi_id WHERE banka_hesap_id=" + anahtar_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {

            cmd.Parameters.Add("@banka_adi", SqlDbType.NVarChar).Value = txt_banka_adi.Text;
            cmd.Parameters.Add("@hesap_sahibi", SqlDbType.NVarChar).Value = txt_hesap_sahibi.Text;
            cmd.Parameters.Add("@sube_kodu", SqlDbType.NVarChar).Value = txt_sube_kodu.Text;
            cmd.Parameters.Add("@hesap_no", SqlDbType.NVarChar).Value = txt_hesap_no.Text;
            cmd.Parameters.Add("@iban", SqlDbType.NVarChar).Value = txt_iban_no.Text;
            cmd.Parameters.Add("@aktif_or_pasif", SqlDbType.NVarChar).Value = dd_aktif_or_pasif.SelectedValue;
            cmd.Parameters.Add("@para_birimi_id", SqlDbType.Int).Value = Convert.ToInt32(dd_para_birimi.SelectedValue);

            //Response.Write(cmd.CommandText);

            connection.Open();
            cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Update. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();

        }
    }

    protected void BankaListele()
    {
        string hareketSQL = "SELECT * FROM banka_kayit ORDER BY banka_adi";
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
            lbl_mesaj.Text = "Error Listele. ";
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

    protected void gv_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_listele.SelectedRow;
        Label lbl_anahtar_id = (Label)row.FindControl("lbl_anahtar_id"); // label kasa id numarasını alıyoruz detay için.

        BilgileriGetir(Convert.ToInt32(lbl_anahtar_id.Text));

        // satırı renklendir
        //gv_kasa_listele.SelectedRow.Cells[2].BackColor = System.Drawing.Color.Orange;
        //gv_kasa_listele.SelectedRow.Cells[3].BackColor = System.Drawing.Color.Orange;

    }

    protected void BilgileriGetir(int anahtar_id)
    {
        int deger=0;

        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "SELECT * FROM banka_kayit WHERE banka_hesap_id=" + anahtar_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_banka_hesap_id.Text = reader["banka_hesap_id"].ToString();
                    txt_banka_adi.Text = reader["banka_adi"].ToString();
                    txt_hesap_sahibi.Text = reader["hesap_sahibi"].ToString();
                    txt_sube_kodu.Text = reader["sube_kodu"].ToString();
                    txt_hesap_no.Text = reader["hesap_no"].ToString();
                    txt_iban_no.Text = reader["iban"].ToString();                   
                    dd_para_birimi.SelectedValue = reader["para_birimi_id"].ToString();
                    string  aktif_or_pasif= reader["aktif_or_pasif"].ToString();
                    if (aktif_or_pasif == "False") { deger = 0; }
                    if (aktif_or_pasif == "True") { deger = 1; }
                    dd_aktif_or_pasif.SelectedValue = deger.ToString();
                   
                   


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

    protected void gv_listele_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int numarator_id = Convert.ToInt32(gv_listele.DataKeys[e.RowIndex].Value);
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "DELETE FROM banka_kayit WHERE banka_hesap_id=" + numarator_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            connection.Open();
            cmd.ExecuteNonQuery();

        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Deleting ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();
            BankaListele();
        }
    }

    protected void gv_listele_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TableCell statusCell = e.Row.Cells[7];
            if (e.Row.Cells[4].Text=="2261")
            {
                e.Row.Cells[7].Text = "Aktif";
            }
            else
                if (e.Row.Cells[3].Text== "22")
                {
                    e.Row.Cells[7].Text = "Pasif";
                }

         

        }
      

    }


   
}