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

public partial class Kasa_KasaRapor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;

        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
            DateTime.Now.Year.ToString();
            DateTime date = DateTime.Today;

            txt_bas_tarih.Text = "01-01-" + DateTime.Now.Year.ToString();
            txt_son_tarih.Text = date.ToString("dd-MM-yyyy");

        }

    }
   
    protected void ibtn_raporla_Click(object sender, ImageClickEventArgs e)
    {
        KasaHareketListesiniGetir();
        KasaHareketToplamlariGetir();
    }

    protected void KasaHareketListesiniGetir()
    {
        DateTime ilktarih = Convert.ToDateTime(txt_bas_tarih.Text);
        DateTime sontarih = Convert.ToDateTime(txt_son_tarih.Text);
        string queryString = "SELECT * FROM kasa_hareket WHERE kasa_id=" + dd_kasa.SelectedValue + " and (kayit_tarihi BETWEEN '" + ilktarih + "' and '" + sontarih + "') ";
        if (dd_giris_or_cikis.SelectedValue != "tum")
        { queryString += " and giris_or_cikis='" + dd_giris_or_cikis.SelectedValue + "'"; }
      
        queryString += " ORDER BY kayit_tarihi DESC,kasa_hareket_id DESC";
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(queryString, connection);

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
            lbl_mesaj.Text = "Error KASA HAREKET LİSTELEME ";
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

    protected void KasaHareketToplamlariGetir()
    {
        
        DateTime ilktarih = Convert.ToDateTime(txt_bas_tarih.Text);
        DateTime sontarih = Convert.ToDateTime(txt_son_tarih.Text);
        double giren_toplam = 0;
        double cikan_toplam = 0;
        txt_giren.Text = "0"; txt_cikan.Text = "0";

        string queryStringGiren = "SELECT sum(tutar) AS giren FROM kasa_hareket WHERE giris_or_cikis='giris' and kasa_id='" + dd_kasa.SelectedValue + "' and (kayit_tarihi BETWEEN '" + ilktarih + "' and '" + sontarih + "')";
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(queryStringGiren, connection);
        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    txt_giren.Text = reader["giren"].ToString();
                    giren_toplam = Convert.ToDouble(reader["giren"].ToString());
                }
            }
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Kasa Hesaplama Giriş. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }
     
        string queryStringCikan = "SELECT sum(tutar) AS cikan FROM kasa_hareket WHERE giris_or_cikis='cikis' and kasa_id='" + dd_kasa.SelectedValue + "' and (kayit_tarihi BETWEEN '" + ilktarih + "' and '" + sontarih + "')";
        ConnVt baglan2 = new ConnVt(); SqlConnection connection2 = baglan2.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd2 = new SqlCommand(queryStringCikan, connection2);
        try
        {
            SqlDataReader reader2 = cmd2.ExecuteReader();
            if (reader2.HasRows)
            {
                while (reader2.Read())
                {
                    txt_cikan.Text = reader2["cikan"].ToString();
                    cikan_toplam = Convert.ToDouble(reader2["cikan"].ToString());
                    
                }
            }
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Kasa Hesaplama Çıkış. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan2.VeritabaniBaglantiyiKapat(connection2);
        }
       
        ////////////////////////////////////////////////////////////////////////////////////////////
        try
        {
            double bakiye = giren_toplam - cikan_toplam;
            txt_bakiye.Text = String.Format("{0:#,#.00}", bakiye);
            if (dd_giris_or_cikis.SelectedValue == "giris") { txt_cikan.Text = ""; txt_bakiye.Text = ""; }
            if (dd_giris_or_cikis.SelectedValue == "cikis") { txt_giren.Text = ""; txt_bakiye.Text = ""; }
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Kasa GirisCikisToplaminiGetir. ";
            lbl_mesaj.Text += err.Message;
        }
       
       

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_listele.PageIndex = e.NewPageIndex;
        KasaHareketListesiniGetir();
        KasaHareketToplamlariGetir();
    }


    protected void gv_listele_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gv_listele_RowDataBound(object sender, GridViewRowEventArgs e)
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

}