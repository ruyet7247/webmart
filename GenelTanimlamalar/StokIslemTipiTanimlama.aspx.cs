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

public partial class GenelTanimlamar_StokIslemTipiTanimlama : System.Web.UI.Page
{
    
    int stok_islem_tipi_id = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
            lbl_stok_islem_tipi_id.Text = "0";

        }

        lbl_mesaj.Text = "";
        VeriListele();

    }


    protected void ibtn_post_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_stok_islem_tipi_id.Text == "0")
        {
            VeriEkle();
            VeriListele();
        }
        else
        {
            VeriGuncelle(Convert.ToInt32(lbl_stok_islem_tipi_id.Text));
            VeriListele();
        }
    }

    protected void VeriEkle()
    {
        
        string queryString = "INSERT INTO stok_islem_tipi_tanimlama (islem_tipi_adi,islem_tipi_aciklama1) VALUES \n" +
                              "(@islem_tipi_adi,@islem_tipi_aciklama1)";
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {
            cmd.Parameters.Add("@islem_tipi_adi", SqlDbType.NVarChar).Value = txt_stok_islem_tipi_adi.Text;
            cmd.Parameters.Add("@islem_tipi_aciklama1", SqlDbType.NVarChar).Value = txt_stok_islem_tipi_islem_tipi_aciklama1.Text;

            
            cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error INSERT. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);

        }
    }

    protected void VeriGuncelle(int numarator_id)
    {
        
        string queryString = "UPDATE stok_islem_tipi_tanimlama SET islem_tipi_adi=@islem_tipi_adi,islem_tipi_aciklama1=@islem_tipi_aciklama1 WHERE islem_tipi_id=" + numarator_id;
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);



        try
        {

            cmd.Parameters.Add("@islem_tipi_adi", SqlDbType.NVarChar).Value = txt_stok_islem_tipi_adi.Text;
            cmd.Parameters.Add("@islem_tipi_aciklama1", SqlDbType.NVarChar).Value = txt_stok_islem_tipi_islem_tipi_aciklama1.Text;


            //Response.Write(cmd.CommandText);

            
            cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error UPDATE. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);

        }
    }

    protected void VeriListele()
    {
        string hareketSQL = "SELECT * FROM stok_islem_tipi_tanimlama";
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(hareketSQL, connection);

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

    protected void gv_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_listele.SelectedRow;
        Label lbl_islem_tipi_id = (Label)row.FindControl("lbl_islem_tipi_id"); // label kasa id numarasını alıyoruz detay için.

        CariBilgileriniGetir(Convert.ToInt32(lbl_islem_tipi_id.Text));

        // satırı renklendir
        //gv_kasa_listele.SelectedRow.Cells[2].BackColor = System.Drawing.Color.Orange;
        //gv_kasa_listele.SelectedRow.Cells[3].BackColor = System.Drawing.Color.Orange;

    }

    protected void CariBilgileriniGetir(int numarator_id)
    {

        
        string queryString = "SELECT * FROM stok_islem_tipi_tanimlama WHERE islem_tipi_id=" + numarator_id;
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_stok_islem_tipi_id.Text = reader["islem_tipi_id"].ToString();
                    txt_stok_islem_tipi_adi.Text = reader["islem_tipi_adi"].ToString();
                    txt_stok_islem_tipi_islem_tipi_aciklama1.Text = reader["islem_tipi_aciklama1"].ToString();



                }
            }


        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error VeriSorgula. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }



    }

    protected void gv_listele_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int numarator_id = Convert.ToInt32(gv_listele.DataKeys[e.RowIndex].Value);
        
        string queryString = "DELETE FROM stok_islem_tipi_tanimlama WHERE islem_tipi_id=" + numarator_id;
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            
            cmd.ExecuteNonQuery();

        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error DELETE. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
            VeriListele();
        }
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