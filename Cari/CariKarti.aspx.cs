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

public partial class Cari_CariKarti : System.Web.UI.Page
{
    String dataconnect = WebConfigurationManager.ConnectionStrings["CnnStr"].ConnectionString;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_cari_id.Text = Request.QueryString["CariID"];

        if (lbl_cari_id.Text != "")
        {
            CariBilgileriniGetir(Convert.ToInt32(lbl_cari_id.Text));
        }
    }

    protected void ibtn_guncelle_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_cari_id.Text == "0")
        {
            CariEkle();
            CariBilgileriniGetir(Convert.ToInt32(lbl_cari_id.Text));
        }
        else
        {
            CariGuncelle(Convert.ToInt32(lbl_cari_id.Text));
            CariBilgileriniGetir(Convert.ToInt32(lbl_cari_id.Text));
        }
    }

    protected void CariEkle()
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "INSERT INTO cari_karti (cari_grubu_adi) VALUES \n" +
                              "(@cari_grubu_adi)";
        SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {
            cmd.Parameters.Add("@cari_grubu_adi", SqlDbType.NVarChar).Value = txt_mail.Text;

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

    protected void CariGuncelle(int cari_id)
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "UPDATE cari_karti SET cari_grubu_adi=@cari_grubu_adi WHERE cari_grubu_id=" + cari_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);



        try
        {

            cmd.Parameters.Add("@cari_grubu_adi", SqlDbType.NVarChar).Value = txt_mail.Text;


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



    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // cari arama modal popup
    {
        cariArama(Convert.ToInt32(txt_arama.Text));
    } 

    protected void cariArama(int cari_id) //cari arama modal popup
    {
        string hareketSQL = "SELECT cari_id,unvan,gsm1,borc_bakiye,alacak_bakiye,bakiye FROM cari_karti WHERE cari_id=" + cari_id;
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
            lbl_mesaj.Text = "Error Cari Bulma ";
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


    protected void gv_arama_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_arama_listele.SelectedRow;
        Label lbl_cari_id = (Label)row.FindControl("lbl_cari_id");             
        ibtn_cari_bul_ModalPopupExtender.Hide();
        Response.Redirect("CariKarti.aspx?CariID=" + lbl_cari_id.Text);

        
    }

    protected void CariBilgileriniGetir(int cari_id)
    {

     
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "SELECT * FROM cari_karti WHERE cari_id=" + cari_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                  txt_tam_unvani.Text = reader["unvan"].ToString();

                  


                }
            }


        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Login. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
     

    }
   

}