﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // veritabanı
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Threading;

public partial class Stok_RaporStokDurum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource_islem_tipi.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;

        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
          

        }

    }

    protected void dd_islem_tipi_DataBound(object sender, EventArgs e)
    {
        dd_grup.Items.Insert(0, new ListItem("- Seçiniz -", "tum"));
    }

    protected void StokHareketListesiniGetir()
    {

        string queryString = "SELECT * FROM stok_kayit";
        if (dd_stok_durumu.SelectedValue != "tum")
        {
            if (dd_stok_durumu.SelectedValue == "var")
            { queryString = "SELECT * FROM stok_kayit WHERE giren>cikan"; }  
            if (dd_stok_durumu.SelectedValue == "yok")
            { queryString = "SELECT * FROM stok_kayit WHERE (giren)<(cikan)"; }
        }
        if (dd_grup.SelectedValue != "tum")
        { queryString = " SELECT * FROM stok_kayit WHERE grubu_id='" + dd_grup.SelectedValue + "'"; }

        queryString += " ORDER BY stok_adi";
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
            lbl_mesaj.Text = "Error Stok Listeleme ";
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

    protected void StokHareketToplamlariGetir()
    {
        string queryString = "SELECT SUM(alis_fiyati) AS alis_fiyati,SUM(satis_fiyati) AS satis_fiyati FROM stok_kayit";
        if (dd_stok_durumu.SelectedValue != "tum")
        {
            if (dd_stok_durumu.SelectedValue == "var")
            { queryString = "SELECT SUM(alis_fiyati) AS alis_fiyati,SUM(satis_fiyati) AS satis_fiyati FROM stok_kayit WHERE giren>cikan"; }  
            if (dd_stok_durumu.SelectedValue == "yok")
            { queryString = "SELECT SUM(alis_fiyati) AS alis_fiyati,SUM(satis_fiyati) AS satis_fiyati FROM stok_kayit WHERE (giren)<(cikan)"; }
        }
        if (dd_grup.SelectedValue != "tum")
        { queryString = " SELECT SUM(alis_fiyati) AS alis_fiyati,SUM(satis_fiyati) AS satis_fiyati FROM stok_kayit WHERE grubu_id='" + dd_grup.SelectedValue + "'"; }

        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    txt_alis_toplam.Text = reader["alis_fiyati"].ToString();
                    txt_satis_toplam.Text = reader["satis_fiyati"].ToString();
                }
            }
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Stok Toplam ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }

      
    }

    protected void ibtn_raporla_Click(object sender, ImageClickEventArgs e)
    {
        StokHareketListesiniGetir();
        StokHareketToplamlariGetir();
    }

    protected void gv_listele_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_listele.PageIndex = e.NewPageIndex;
        StokHareketListesiniGetir();
        StokHareketToplamlariGetir();
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