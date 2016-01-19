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

public partial class Cari_CariHareket : System.Web.UI.Page
{
    String dataconnect = WebConfigurationManager.ConnectionStrings["CnnStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["CariID"] != null)
        {
            try
            {
                lbl_cari_id.Text = Request.QueryString["CariID"];
            }
            catch
            {
                // deal with it
            }
        }


        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {

            if (lbl_cari_id.Text != "0")
            {
                CariBilgileriniGetir(Convert.ToInt32(lbl_cari_id.Text));
            }

        }
    }

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // cari arama modal popup
    {
        cariArama(txt_arama.Text);
    } 


    protected void cariArama(string unvan) //cari arama modal popup
    {
        string hareketSQL = "SELECT cari_id,unvan,gsm1,borc_bakiye,alacak_bakiye,bakiye FROM cari_karti WHERE unvan LIKE '%" + unvan + "%'";
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
        Response.Redirect("CariHareket.aspx?CariID=" + lbl_cari_id.Text);


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

                    lbl_cari_id.Text = reader["cari_id"].ToString();

                    txt_unvan.Text = reader["unvan"].ToString();
                    dd_grup_id.SelectedValue = reader["grup_id"].ToString();
                    txt_borc_bakiye.Text = reader["borc_bakiye"].ToString();
                    txt_alacak_bakiye.Text= reader["alacak_bakiye"].ToString();
                    txt_bakiye.Text = reader["bakiye"].ToString();

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
}