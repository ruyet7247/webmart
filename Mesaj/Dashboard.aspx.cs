using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

using System.Data; // veritabanı
using System.Web.Configuration;
using System.Threading;


/*
    Bu sayfa ile beraber AjaxProcessor.php sayfasınıda düzelt.
 */

public partial class Mesaj_Dashboard : System.Web.UI.Page
{
    public string deneme="";
    string database_master = "WebMart_Master"; // Bu sayfaya özel veriler Master Database e eklendiği için sabit yaptık
  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //lbl_banka_hesap_id.Text = "0";

        }

        // dashboard deger


        Session["Aralik"] = "0";
        lbl_mesaj.Text = "";
        MesajlariGetir();

    }

    protected void ibtn_post_Click(object sender, ImageClickEventArgs e)
    {
        MesajKaydet();
    }

    protected void MesajKaydet()
    {
        string queryString;
        string kayit_tarihi = DateTime.Now.ToString("dd.MM.yyyy hh:mm:ss");

        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(database_master);

        try
        {

            queryString = "INSERT INTO dashboard (tarih,gonderici_id,gonderici_adi_soyadi,mesaj,resim_adi) VALUES \n" +
                             "(@tarih,@gonderici_id,@gonderici_adi_soyadi,@mesaj,@resim_adi)";
            SqlCommand cmd = new SqlCommand(queryString, connection);
            cmd.Parameters.Add("@tarih", SqlDbType.DateTime).Value = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
            cmd.Parameters.Add("@gonderici_id", SqlDbType.Int).Value = Session["kullanici_id"].ToString();
            cmd.Parameters.Add("@gonderici_adi_soyadi", SqlDbType.NVarChar).Value = Session["adi_soyadi"].ToString();
            cmd.Parameters.Add("@mesaj", SqlDbType.NVarChar).Value = txt_mesaj.Text;
            cmd.Parameters.Add("@resim_adi", SqlDbType.NVarChar).Value = lbl_resim_adi.Text;
            cmd.ExecuteNonQuery();

        }//end TRY
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error INSERT. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
            MesajlariGetir();

        }
    }

    protected void MesajlariGetir()
    {
        string hareketSQL = "SELECT TOP 25 * FROM dashboard ORDER BY id DESC,tarih DESC";
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(database_master);
        SqlCommand cmd = new SqlCommand(hareketSQL, connection);

        int updated = 0;
        try
        {

            updated = cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds_hareket = new DataSet();
            da.Fill(ds_hareket);

            gv_mesaj_listele.DataSource = ds_hareket;
            gv_mesaj_listele.DataBind();

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

    protected void gv_mesaj_listele_RowCreated(object sender, GridViewRowEventArgs e)
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

    protected void gv_mesaj_listele_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void gv_mesaj_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_mesaj_listele.SelectedRow;
        Label lbl_mesaj_id = (Label)row.FindControl("lbl_mesaj_id");
        
     

    }

    protected void Button1_Click(object sender, EventArgs e)  // Resim Yükleme
    {
       
        if (FileUpload1.HasFile)
            try
            {

                string strFileExtension = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
                string tarih_saat_uzanti = DateTime.Now.ToString("ddMMyyyyhhmmss") + strFileExtension;
                FileUpload1.SaveAs(Server.MapPath("~/Uploads/" + tarih_saat_uzanti));
                /*
                 * Label1.Text = "Dosya Adı: " +
                    FileUpload1.PostedFile.FileName +
                    "<br />Dosya Boyutu: " +
                    FileUpload1.PostedFile.ContentLength +
                    "<br />Dosya Türü: " +
                    FileUpload1.PostedFile.ContentType;
                lbl_resim.Text = FileUpload1.PostedFile.FileName;
                 */
                lbl_resim_adi.Text = tarih_saat_uzanti;
                img_resim.ImageUrl = "~/Uploads/" + tarih_saat_uzanti;
                
                
            }
            catch (Exception ex)
            {
                lbl_mesaj.Text = "Hata Oluştu: " + ex.Message.ToString();
            }
        else
        {
            lbl_mesaj.Text = "Dosya Seçin ve Yükleyin";
        }

    }

    protected string GetResimGetir(String resim_adi)
    {

        string a = "";
        if (String.IsNullOrEmpty(resim_adi))
        {
            a = "Resim Yok";
        }
        else
        {
            a = "Resim var "+resim_adi.ToString();
        }
        return a;
        
    }



}