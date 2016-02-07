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

public partial class GenelTanimlamar_ParaBirimiTanimlama : System.Web.UI.Page
{
    String dataconnect = WebConfigurationManager.ConnectionStrings["CnnStr"].ConnectionString;
    int para_birimi_id = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
            lbl_para_birimi_id.Text = "0";

        }

        lbl_mesaj.Text = "";
        VeriListele();

    }


    protected void ibtn_post_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_para_birimi_id.Text == "0")
        {
            VeriEkle();
            VeriListele();
        }
        else
        {
            VeriGuncelle(Convert.ToInt32(lbl_para_birimi_id.Text));
            VeriListele();
        }
    }

    protected void VeriEkle()
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "INSERT INTO firma_para_birimi_tanimlama (para_birimi,para_birimi_adi) VALUES \n" +
                              "(@para_birimi,@para_birimi_adi)";
        SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {
            cmd.Parameters.Add("@para_birimi", SqlDbType.NVarChar).Value = txt_para_birimi.Text;
            cmd.Parameters.Add("@para_birimi_adi", SqlDbType.NVarChar).Value = txt_para_birimi_adi.Text;

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
        string queryString = "UPDATE firma_para_birimi_tanimlama SET para_birimi=@para_birimi,para_birimi_adi=@para_birimi_adi WHERE para_birimi_id=" + numarator_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);



        try
        {

            cmd.Parameters.Add("@para_birimi", SqlDbType.NVarChar).Value = txt_para_birimi.Text;
            cmd.Parameters.Add("@para_birimi_adi", SqlDbType.NVarChar).Value = txt_para_birimi_adi.Text;


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
        string hareketSQL = "SELECT * FROM firma_para_birimi_tanimlama";
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
        Label lbl_para_birimi_id = (Label)row.FindControl("lbl_para_birimi_id"); // label kasa id numarasını alıyoruz detay için.

        ParaBirimiBilgileriniGetir(Convert.ToInt32(lbl_para_birimi_id.Text));

        // satırı renklendir
        //gv_kasa_listele.SelectedRow.Cells[2].BackColor = System.Drawing.Color.Orange;
        //gv_kasa_listele.SelectedRow.Cells[3].BackColor = System.Drawing.Color.Orange;

    }

    protected void ParaBirimiBilgileriniGetir(int numarator_id)
    {

        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "SELECT * FROM firma_para_birimi_tanimlama WHERE para_birimi_id=" + numarator_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_para_birimi_id.Text = reader["para_birimi_id"].ToString();
                    txt_para_birimi.Text = reader["para_birimi"].ToString();
                    txt_para_birimi_adi.Text = reader["para_birimi_adi"].ToString();



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
        string queryString = "DELETE FROM firma_para_birimi_tanimlama WHERE para_birimi_id=" + numarator_id;
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