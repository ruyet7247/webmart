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

public partial class Cari_CariGorusmeleri : System.Web.UI.Page
{
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["HastaID"] != null)
        {
            try
            {
                lbl_cari_hasta_id.Text = Request.QueryString["HastaID"];
            }
            catch
            {
                // deal with it
            }
        }
        else
        {
            lbl_cari_hasta_id.Text = "0";
        }


        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {

            if (lbl_cari_hasta_id.Text != "0")
            {
                CariBilgileriniGetir(Convert.ToInt32(lbl_cari_hasta_id.Text));
                CariGorusmeleriniGetir(Convert.ToInt32(lbl_cari_hasta_id.Text));
            }

            DateTime dt = DateTime.Now;
            txt_gorusme_tarihi_saati.Text = String.Format("{0:dd/MM/yyyy HH:mm:ss}", dt);
            CariGorusmeleriniGetir(Convert.ToInt32(lbl_cari_hasta_id.Text));

        }
    }
   
    protected void gv_arama_listele_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    protected void ibtn_cari_gorusme_kaydet_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_cari_hasta_id.Text != "0")
        {
            string queryString = "INSERT INTO cari_gorusmeleri (cari_id,cari_adi,personel_adi,gorusme_tarihi_saati,icerik,firma_adi) VALUES \n" +
                                  "(@cari_id,@cari_adi,@personel_adi,@gorusme_tarihi_saati,@icerik,@firma_adi)";

            ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);

            try
            {
                cmd.Parameters.Add("@cari_id", SqlDbType.NVarChar).Value = lbl_cari_hasta_id.Text;
                cmd.Parameters.Add("@cari_adi", SqlDbType.NVarChar).Value = txt_hasta_adi.Text;
                cmd.Parameters.Add("@personel_adi", SqlDbType.NVarChar).Value = "personel";
                cmd.Parameters.Add("@gorusme_tarihi_saati", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_gorusme_tarihi_saati.Text);
                cmd.Parameters.Add("@icerik", SqlDbType.NVarChar).Value = txt_not.Text;
                cmd.Parameters.Add("@firma_adi", SqlDbType.NVarChar).Value = "";

                
                cmd.ExecuteNonQuery();

            }
            catch (Exception err)
            {
                lbl_mesaj1.Text = "Error INSERT. ";
                lbl_mesaj1.Text += err.Message;
            }
            finally
            {
                baglan.VeritabaniBaglantiyiKapat(connection);
                CariGorusmeleriniGetir(Convert.ToInt32(lbl_cari_hasta_id.Text));
            }
        }
    }

    protected void CariGorusmeleriniGetir(int cari_id) //cari arama modal popup
    {
        string hareketSQL = "SELECT * FROM cari_gorusmeleri WHERE  cari_id="+cari_id+" ORDER BY gorusme_tarihi_saati DESC";
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand(hareketSQL, connection);

        int updated = 0;
        try
        {
            
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
            lbl_mesaj1.Text = "Error Cari Bulma ";
            lbl_mesaj1.Text += err.Message;
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

    protected void CariBilgileriniGetir(int cari_id)
    {

        string queryString = "SELECT * FROM cari_karti WHERE cari_id=" + cari_id;

        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {

            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    txt_hasta_adi.Text = reader["adi"].ToString() +" " + reader["soyadi"].ToString();
                }
            }


        }

        catch (Exception err)
        {
            lbl_mesaj1.Text = "Error Login. ";
            lbl_mesaj1.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }

    }

    protected void gv_arama_listele_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int cari_gorusmeleri_id = Convert.ToInt32(gv_arama_listele.DataKeys[e.RowIndex].Value);
        string queryString = "DELETE FROM cari_gorusmeleri WHERE cari_gorusmeleri_id=@cari_gorusmeleri_id";

        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);

        int sql_query = 0;
        try
        {
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@cari_gorusmeleri_id", SqlDbType.Int).Value = cari_gorusmeleri_id;
            
            sql_query = cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj1.Text = "Error Delete. ";
            lbl_mesaj1.Text += err.Message;
        }
        finally
        {
            cmd.Parameters.Clear();
            baglan.VeritabaniBaglantiyiKapat(connection);
            CariBilgileriniGetir(Convert.ToInt32(lbl_cari_hasta_id.Text));
            CariGorusmeleriniGetir(Convert.ToInt32(lbl_cari_hasta_id.Text));
        }
    }
}