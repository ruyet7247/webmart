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

public partial class GenelTanimlamar_KasaGelirGiderTanimlama : System.Web.UI.Page
{
    
    int aktif_gelir_gider_id = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbl_gelir_gider_id.Text = "0";
        }

        lbl_mesaj.Text = "";
        GelirGiderListele();
    }

    protected void ibtn_post_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_gelir_gider_id.Text == "0")
        {
            GelirGiderEkle();
            GelirGiderListele();
        }
        else
        {
            GelirGiderGuncelle(Convert.ToInt32(lbl_gelir_gider_id.Text));
            GelirGiderListele();
        }
    }
    protected void GelirGiderEkle()
    {

        string queryString = "INSERT INTO kasa_gelir_gider_tanimlama (gelir_gider_adi,gelir_or_gider) VALUES \n" +
                              "(@gelir_gider_adi,@gelir_or_gider)";
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {
            cmd.Parameters.Add("@gelir_gider_adi", SqlDbType.NVarChar).Value = txt_gelir_gider_adi.Text;
            cmd.Parameters.Add("@gelir_or_gider", SqlDbType.NVarChar).Value = dd_gelir_or_gider.SelectedValue;

            
            cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Login. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);

        }
    }

    protected void GelirGiderGuncelle(int gelir_gider_id)
    {
        string queryString = "UPDATE kasa_gelir_gider_tanimlama SET gelir_gider_adi=@gelir_gider_adi,gelir_or_gider=@gelir_or_gider WHERE gelir_gider_id=" + gelir_gider_id;
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {

            cmd.Parameters.Add("@gelir_gider_adi", SqlDbType.NVarChar).Value = txt_gelir_gider_adi.Text;
            cmd.Parameters.Add("@gelir_or_gider", SqlDbType.NVarChar).Value = dd_gelir_or_gider.Text;

            //Response.Write(cmd.CommandText);

            
            cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Update. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);

        }
    }

    protected void GelirGiderListele()
    {
        string hareketSQL = "SELECT * FROM kasa_gelir_gider_tanimlama ORDER BY gelir_or_gider";
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

            gv_gelir_gider_listele.DataSource = ds_hareket;
            gv_gelir_gider_listele.DataBind();

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

    protected void gv_gelir_gider_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_gelir_gider_listele.SelectedRow;
        Label lbl_gelir_gider_id = (Label)row.FindControl("lbl_gelir_gider_id"); // label kasa id numarasını alıyoruz detay için.

        GelirGiderBilgileriniGetir(Convert.ToInt32(lbl_gelir_gider_id.Text));

        // satırı renklendir
        //gv_kasa_listele.SelectedRow.Cells[2].BackColor = System.Drawing.Color.Orange;
        //gv_kasa_listele.SelectedRow.Cells[3].BackColor = System.Drawing.Color.Orange;

    }

    protected void GelirGiderBilgileriniGetir(int gelir_gider_id)
    {
        string queryString = "SELECT * FROM kasa_gelir_gider_tanimlama WHERE gelir_gider_id=" + gelir_gider_id;
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_gelir_gider_id.Text = reader["gelir_gider_id"].ToString();
                    txt_gelir_gider_adi.Text = reader["gelir_gider_adi"].ToString();
                    dd_gelir_or_gider.SelectedValue = reader["gelir_or_gider"].ToString();



                }
            }


        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Bilgileri Getir ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }



    }

    protected void gv_gelir_gider_listele_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int gelir_gider_id = Convert.ToInt32(gv_gelir_gider_listele.DataKeys[e.RowIndex].Value);
        
        string queryString = "DELETE FROM kasa_gelir_gider_tanimlama WHERE gelir_gider_id=" + gelir_gider_id;
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            
            cmd.ExecuteNonQuery();

        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Deleting ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
            GelirGiderListele();
        }
    }

    protected void gv_gelir_gider_listele_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void gv_gelir_gider_listele_RowCreated(object sender, GridViewRowEventArgs e)
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
}