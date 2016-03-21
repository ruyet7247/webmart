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

public partial class Personel_PersonelHareketRaporla : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource_islemtipi.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;
        SqlDataSource_odemesekli.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;

        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {

            DateTime.Now.Year.ToString();
            DateTime date = DateTime.Today;

            txt_bas_tarih.Text = "01-01-" + DateTime.Now.Year.ToString();
            txt_son_tarih.Text = date.ToString("dd-MM-yyyy");
            string gecerli_ay = DateTime.Now.Month.ToString(); dd_ay.SelectedValue = gecerli_ay;
            string gecerli_yil = DateTime.Now.Year.ToString(); dd_yil.SelectedValue = gecerli_yil;
        }

    }

    protected void PersonelListesiGetir()
    {
        string queryString = "";
        DateTime ilktarih = Convert.ToDateTime(txt_bas_tarih.Text);
        DateTime sontarih = Convert.ToDateTime(txt_son_tarih.Text);
        if (cb_donem_secimi.Checked)
        { queryString = "SELECT * FROM personel_cari_maas_hareket WHERE maas_donem_ay='" + dd_ay.SelectedValue + "'" + " and maas_donem_yil='" + dd_yil.SelectedValue + "'"; }
        else
        { queryString = "SELECT * FROM personel_cari_maas_hareket WHERE  (kayit_tarihi BETWEEN '" + ilktarih + "' and '" + sontarih + "') "; }
        if (dd_borc_or_alacak.SelectedValue != "tum")
        { queryString += " and borc_or_alacak='" + dd_borc_or_alacak.SelectedValue + "'"; }
        if (dd_islemtipi.SelectedValue != "tum")
        { queryString += " and islem_tipi='" + dd_islemtipi.SelectedValue + "'"; }
        if (dd_odemesekli.SelectedValue != "tum")
        { queryString += " and odeme_sekli='" + dd_odemesekli.SelectedValue + "'"; }

        string toplam_sorgusu = queryString;
        queryString += " ORDER BY kayit_tarihi DESC,maas_hareket_id DESC";

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
            lbl_mesaj.Text = "Error Hareket Listeleme ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
           

        }

        if (updated > 0)
        {
            
        }

        //PersonelSorguToplaminiGetir(toplam_sorgusu);

    }

    protected void PersonelSorguToplaminiGetir(string sorgu)
    {
        
        sorgu = sorgu.Replace("*", "SUM(TUTAR) as tutar ");
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(sorgu, connection);

        try
        {
            decimal TotalSales  = Convert.ToDecimal(cmd.ExecuteScalar());
            gv_listele.Columns[1].FooterText = String.Format("{0:c}", TotalSales);
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Hareket TOPLAMA ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);

        }

       
    }

    protected void ibtn_raporla_Click(object sender, ImageClickEventArgs e)
    {
        PersonelListesiGetir();
    }

    protected void gv_listele_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_listele.PageIndex = e.NewPageIndex;
        PersonelListesiGetir();
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

    decimal sumFooterValue = 0;
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

            string totalvalue = ((Label)e.Row.FindControl("lbl_tutar")).Text;
            sumFooterValue += Convert.ToDecimal(totalvalue);

        }

        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lbl = (Label)e.Row.FindControl("lblTotal");
            lbl.Text = sumFooterValue.ToString();
        }


    }

    protected void dd_islemtipi_DataBound(object sender, EventArgs e)
    {
        dd_islemtipi.Items.Insert(0, new ListItem("- Tüm Liste -", "tum"));
    }

    protected void dd_odemesekli_DataBound(object sender, EventArgs e)
    {
        dd_odemesekli.Items.Insert(0, new ListItem("- Tüm Liste -", "tum"));
    }



}