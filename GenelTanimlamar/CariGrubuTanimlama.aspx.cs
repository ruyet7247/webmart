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

public partial class GenelTanimlamar_CariGrubuTanimlama : System.Web.UI.Page
{
    String dataconnect = WebConfigurationManager.ConnectionStrings["CnnStr"].ConnectionString;
    int cari_gurubu_id = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
            lbl_cari_grubu_id.Text = "0";

        }

        lbl_mesaj.Text = "";
        VeriListele();
         
    }


    protected void ibtn_post_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_cari_grubu_id.Text == "0")
        {
            VeriEkle();
            VeriListele();
        }
        else
        {
            VeriGuncelle(Convert.ToInt32(lbl_cari_grubu_id.Text));
            VeriListele();
        }
    }

    protected void VeriEkle()
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "INSERT INTO cari_grubu_tanimlama (cari_grubu_adi) VALUES \n" +
                              "(@cari_grubu_adi)";
        SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {
            cmd.Parameters.Add("@cari_grubu_adi", SqlDbType.NVarChar).Value = txt_cari_grubu_adi.Text;
         
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
        string queryString = "UPDATE cari_grubu_tanimlama SET cari_grubu_adi=@cari_grubu_adi WHERE cari_grubu_id=" + numarator_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);



        try
        {

            cmd.Parameters.Add("@cari_grubu_adi", SqlDbType.NVarChar).Value = txt_cari_grubu_adi.Text;
          

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
        string hareketSQL = "SELECT * FROM cari_grubu_tanimlama";
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
        Label lbl_cari_grubu_id = (Label)row.FindControl("lbl_cari_grubu_id"); // label kasa id numarasını alıyoruz detay için.

        CariBilgileriniGetir(Convert.ToInt32(lbl_cari_grubu_id.Text));

        // satırı renklendir
        //gv_kasa_listele.SelectedRow.Cells[2].BackColor = System.Drawing.Color.Orange;
        //gv_kasa_listele.SelectedRow.Cells[3].BackColor = System.Drawing.Color.Orange;

    }

    protected void CariBilgileriniGetir(int numarator_id)
    {

        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "SELECT * FROM cari_grubu_tanimlama WHERE cari_grubu_id="+numarator_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {
           
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_cari_grubu_id.Text = reader["cari_grubu_id"].ToString();
                    txt_cari_grubu_adi.Text = reader["cari_grubu_adi"].ToString();

                   
                   
                   
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
        string queryString = "DELETE FROM cari_grubu_tanimlama WHERE cari_grubu_id=" + numarator_id;
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