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

public partial class Yonetim_StokListesi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_mesaj.Text = "";
        SqlDataSource_firmalar.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;

        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {

        }



    }

    protected void ibtn_raporla_Click(object sender, ImageClickEventArgs e)
    {
        StokHareketListesiniGetir(dd_firma.SelectedValue);

    }

    protected void TabloAyarla()
    {
        // Total number of rows.
        int rowCnt;
        // Current row count.
        int rowCtr;
        // Total number of cells per row (columns).
        int cellCtr;
        // Current cell counter
        int cellCnt;

        // Create new row and add it to the table.
        TableRow tRow = new TableRow();
        Table1.Rows.Add(tRow); TableCell tCell = new TableCell(); tCell.Text = "Kasa Adı "; tCell.Width = 150; tRow.Cells.Add(tCell);
        Table1.Rows.Add(tRow); tCell = new TableCell(); tCell.Text = "Giriş Bakiye "; tCell.Width = 150; tRow.Cells.Add(tCell);
        Table1.Rows.Add(tRow); tCell = new TableCell(); tCell.Text = "Çıkış Bakiye "; tCell.Width = 150; tRow.Cells.Add(tCell);
        Table1.Rows.Add(tRow); tCell = new TableCell(); tCell.Text = "Bakiye "; tCell.Width = 150; tRow.Cells.Add(tCell);

        /*
        rowCnt = 1;
        cellCnt = 3;
        for (rowCtr = 1; rowCtr <= rowCnt; rowCtr++)
        {
            // Create new row and add it to the table.
            TableRow tRow = new TableRow();
            Table1.Rows.Add(tRow);
            for (cellCtr = 1; cellCtr <= cellCnt; cellCtr++)
            {
                // Create a new cell and add it to the row.
                TableCell tCell = new TableCell();
                tCell.Text = "Kasa Adı " + rowCtr + ", Kasa " + cellCtr;
                tRow.Cells.Add(tCell);
            }
        }
        */
    }

    protected void StokHareketListesiniGetir(string conn_adi)
    {

        string queryString = "SELECT *,giren-cikan AS kalan FROM stok_kayit";
        queryString += " ORDER BY stok_adi";
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(conn_adi); SqlCommand cmd = new SqlCommand(queryString, connection);

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

    protected void dd_firma_DataBound(object sender, EventArgs e)
    {
        dd_firma.Items.Insert(0, new ListItem("- Firma Seçiniz -", "tum"));
    }

    protected void gv_listele_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_listele.PageIndex = e.NewPageIndex;
        StokHareketListesiniGetir(dd_firma.SelectedValue);
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