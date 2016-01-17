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

public partial class GenelTanimlamar_PersonelDepartmanTanimlama : System.Web.UI.Page
{
    String dataconnect = WebConfigurationManager.ConnectionStrings["CnnStr"].ConnectionString;
    int personel_departman_id = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
            lbl_personel_departman_id.Text = "0";

        }

        lbl_mesaj.Text = "";
        VeriListele();

    }


    protected void ibtn_post_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_personel_departman_id.Text == "0")
        {
            VeriEkle();
            VeriListele();
        }
        else
        {
            VeriGuncelle(Convert.ToInt32(lbl_personel_departman_id.Text));
            VeriListele();
        }
    }

    protected void VeriEkle()
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "INSERT INTO personel_departman_tanimlama (personel_departman_adi,personel_departman_aciklama1) VALUES \n" +
                              "(@personel_departman_adi,@personel_departman_aciklama1)";
        SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {
            cmd.Parameters.Add("@personel_departman_adi", SqlDbType.NVarChar).Value = txt_personel_departman_adi.Text;
            cmd.Parameters.Add("@personel_departman_aciklama1", SqlDbType.NVarChar).Value = txt_personel_departman_aciklama1.Text;

            connection.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error INSERT. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();

        }
    }

    protected void VeriGuncelle(int numarator_id)
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "UPDATE personel_departman_tanimlama SET personel_departman_adi=@personel_departman_adi,personel_departman_aciklama1=@personel_departman_aciklama1 WHERE personel_departman_id=" + numarator_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);



        try
        {

            cmd.Parameters.Add("@personel_departman_adi", SqlDbType.NVarChar).Value = txt_personel_departman_adi.Text;
            cmd.Parameters.Add("@personel_departman_aciklama1", SqlDbType.NVarChar).Value = txt_personel_departman_aciklama1.Text;


            //Response.Write(cmd.CommandText);

            connection.Open();
            cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error UPDATE. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();

        }
    }

    protected void VeriListele()
    {
        string hareketSQL = "SELECT * FROM personel_departman_tanimlama";
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
        Label lbl_personel_departman_id = (Label)row.FindControl("lbl_personel_departman_id"); // label kasa id numarasını alıyoruz detay için.

        CariBilgileriniGetir(Convert.ToInt32(lbl_personel_departman_id.Text));

        // satırı renklendir
        //gv_kasa_listele.SelectedRow.Cells[2].BackColor = System.Drawing.Color.Orange;
        //gv_kasa_listele.SelectedRow.Cells[3].BackColor = System.Drawing.Color.Orange;

    }

    protected void CariBilgileriniGetir(int numarator_id)
    {

        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "SELECT * FROM personel_departman_tanimlama WHERE personel_departman_id=" + numarator_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_personel_departman_id.Text = reader["personel_departman_id"].ToString();
                    txt_personel_departman_adi.Text = reader["personel_departman_adi"].ToString();
                    txt_personel_departman_aciklama1.Text = reader["personel_departman_aciklama1"].ToString();



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
            connection.Close();
        }



    }

    protected void gv_listele_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int numarator_id = Convert.ToInt32(gv_listele.DataKeys[e.RowIndex].Value);
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "DELETE FROM personel_departman_tanimlama WHERE personel_departman_id=" + numarator_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            connection.Open();
            cmd.ExecuteNonQuery();

        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error DELETE. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();
            VeriListele();
        }
    }


}