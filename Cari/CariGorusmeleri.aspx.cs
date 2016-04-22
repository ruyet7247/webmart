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
using System.IO;

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
            string queryString = "INSERT INTO cari_gorusmeleri (cari_id,cari_adi,personel_adi,gorusme_tarihi_saati,icerik,firma_adi,resim_adi) VALUES \n" +
                                  "(@cari_id,@cari_adi,@personel_adi,@gorusme_tarihi_saati,@icerik,@firma_adi,@resim_adi)";

            ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);

            try
            {
                cmd.Parameters.Add("@cari_id", SqlDbType.NVarChar).Value = lbl_cari_hasta_id.Text;
                cmd.Parameters.Add("@cari_adi", SqlDbType.NVarChar).Value = txt_hasta_adi.Text;
                cmd.Parameters.Add("@personel_adi", SqlDbType.NVarChar).Value = "personel";
                cmd.Parameters.Add("@gorusme_tarihi_saati", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_gorusme_tarihi_saati.Text);
                cmd.Parameters.Add("@icerik", SqlDbType.NVarChar).Value = txt_not.Text;
                cmd.Parameters.Add("@firma_adi", SqlDbType.NVarChar).Value = "";
                cmd.Parameters.Add("@resim_adi", SqlDbType.NVarChar).Value = lbl_resim_adi.Text;

                
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
        string hareketSQL = "SELECT * FROM cari_gorusmeleri WHERE  cari_id="+cari_id+" ORDER BY gorusme_tarihi_saati DESC,cari_gorusmeleri_id DESC";
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
    protected void gv_arama_listele_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowState == DataControlRowState.Alternate)
            {
                e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#FFFF99';");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#f7fff8';");
            }
            else
            {
                e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#FFFF99';");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#eefef0';");
            }
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            for (int i = 0; i < e.Row.Cells.Count; i++)
            {
                Response.Write(e.Row.Cells[i].Text);
            }
        }
    }
    protected void gv_arama_listele_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //e.Row.Cells[6].BackColor = System.Drawing.Color.LightYellow;
            // e.Row.Cells[7].BackColor = System.Drawing.Color.LightYellow;
            // e.Row.Cells[8].BackColor = System.Drawing.Color.LightYellow;
            //e.Row.Cells[9].BackColor = System.Drawing.Color.LightYellow;
            /*
            Image buttonCommandField = e.Row.Cells[1].Controls[0] as Image;
            buttonCommandField.Attributes["onClick"] =
                   string.Format("return confirm('Silme İşleminden Emin misiniz? ')");
             * */

            // loop all data rows
            foreach (DataControlFieldCell cell in e.Row.Cells)
            {
                // check all cells in one row
                foreach (Control control in cell.Controls)
                {
                    // Must use LinkButton here instead of ImageButton
                    // if you are having Links (not images) as the command button.
                    ImageButton button = control as ImageButton;
                    if (button != null && button.CommandName == "Delete")
                        // Add delete confirmation
                        button.OnClientClick = "if (!confirm('Are you sure " +
                               "you want to delete this record?')) return;";
                }
            }

        }
    }
    
    protected void ibtn_dosya_yukle_Click(object sender, ImageClickEventArgs e)
    {
        if (FileUpload1.HasFile)
            try
            {

                string strFileExtension = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
                string tarih_saat_uzanti = DateTime.Now.ToString("ddMMyyyyhhmmss") + strFileExtension;
                string hasta_id = lbl_cari_hasta_id.Text + "-" + tarih_saat_uzanti;
                FileUpload1.SaveAs(Server.MapPath(string.Format("~/WebcamCaptures/{0}", hasta_id)));

                /*
                 * Label1.Text = "Dosya Adı: " +
                    FileUpload1.PostedFile.FileName +
                    "<br />Dosya Boyutu: " +
                    FileUpload1.PostedFile.ContentLength +
                    "<br />Dosya Türü: " +
                    FileUpload1.PostedFile.ContentType;
                lbl_resim.Text = FileUpload1.PostedFile.FileName;
                 */
                lbl_resim_adi.Text = hasta_id;
                img_foto.ImageUrl = "~/WebcamCaptures/" + hasta_id;





            }
            catch (Exception ex)
            {
                //lbl_mesaj.Text = "Hata Oluştu: " + ex.Message.ToString();
            }
        else
        {
            //lbl_mesaj.Text = "Dosya Seçin ve Yükleyin";
        }


        CariGorusmeleriniGetir(Convert.ToInt32(lbl_cari_hasta_id.Text));

    }


    protected string GetResimGetir(String resim_adi)
    {

        string a = "";
        if (String.IsNullOrEmpty(resim_adi))
        {
            a = "";
        }
        else
        {
            // a = "Resim var "+resim_adi.ToString();
            // a = "<img src='../Uploads/" + resim_adi.ToString() + "' alt='' width='80' height='80'>";
            // a = "<a href='../Uploads/" + resim_adi.ToString() + "' data-lightbox='example-set' data-title='Click anywhere outside the image or the X to the right to close.'><img src='../Uploads/" + resim_adi.ToString() + "' alt='' width='80' height='80' /></a>";
            a = "<a href='../WebcamCaptures/" + resim_adi.ToString() + "' target='_blank' ><img src='../WebcamCaptures/" + resim_adi.ToString() + "' alt='' width='80' height='80' /></a>";

        }
        return a;

    }


    protected void ibtn_resim_sil_Click(object sender, ImageClickEventArgs e)
    {
        img_foto.ImageUrl = "~/WebcamCaptures/bos.png";
        lbl_resim_adi.Text = null;
    }
}