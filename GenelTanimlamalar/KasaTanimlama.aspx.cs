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

public partial class GenelTanimlamar_KasaTanimi : System.Web.UI.Page
{
    
    int kullanici_id = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;

        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
            lbl_kasa_id.Text = "0";

        }

        lbl_mesaj.Text = "";
        KasaListele();
         
    }

    protected void dd_para_birimi_DataBound(object sender, EventArgs e)
    {
        dd_para_birimi.Items.Insert(0, "Seçiniz");
    }

    protected void ibtn_post_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_kasa_id.Text == "0")
        {
            KasaEkle();
            KasaListele();
        }
        else
        {
            KasaGuncelle(Convert.ToInt32(lbl_kasa_id.Text));
            KasaListele();
        }
    }

    protected void KasaEkle()
    {
        
        string queryString = "INSERT INTO kasa_kayit (kasa_adi,para_birimi_id,aciklama1) VALUES \n" +
                              "(@kasa_adi,@para_birimi_id,@aciklama1)";
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {
            cmd.Parameters.Add("@kasa_adi", SqlDbType.NVarChar).Value = txt_kasa_adi.Text;
            cmd.Parameters.Add("@para_birimi_id", SqlDbType.Int).Value = Convert.ToInt32(dd_para_birimi.SelectedValue);
            cmd.Parameters.Add("@aciklama1", SqlDbType.NVarChar).Value = txt_aciklama.Text;
         
            
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

    protected void KasaGuncelle(int kasa_id)
    {
        
        string queryString = "UPDATE kasa_kayit SET kasa_adi=@kasa_adi,para_birimi_id=@para_birimi_id,aciklama1=@aciklama1 WHERE kasa_id=" + kasa_id;
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);



        try
        {

            cmd.Parameters.Add("@kasa_adi", SqlDbType.NVarChar).Value = txt_kasa_adi.Text;
            cmd.Parameters.Add("@para_birimi_id", SqlDbType.Int).Value = Convert.ToInt32(dd_para_birimi.SelectedValue);
            cmd.Parameters.Add("@aciklama1", SqlDbType.NVarChar).Value = txt_aciklama.Text;

          

            //Response.Write(cmd.CommandText);

            
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

    protected void KasaListele()
    {
        string hareketSQL = "SELECT dbo.kasa_kayit.*, dbo.firma_para_birimi_tanimlama.para_birimi FROM dbo.kasa_kayit INNER JOIN dbo.firma_para_birimi_tanimlama ON dbo.kasa_kayit.para_birimi_id = dbo.firma_para_birimi_tanimlama.para_birimi_id ORDER BY dbo.kasa_kayit.kasa_adi";
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(hareketSQL, connection);

        int updated = 0;
        try
        {
            
            updated = cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds_hareket = new DataSet();
            da.Fill(ds_hareket);

            gv_kasa_listele.DataSource = ds_hareket;
            gv_kasa_listele.DataBind();

            //lblResults.Text = updated.ToString() + " record updated.";
        }
        catch (Exception err)
        {
            //lblResults.Text = "Error updating author. ";
            //lblResults.Text += err.Message;
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

    protected void gv_kasa_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_kasa_listele.SelectedRow;
        Label lbl_kasa_id = (Label)row.FindControl("lbl_kasa_id"); // label kasa id numarasını alıyoruz detay için.

        KasaBilgileriniGetir(Convert.ToInt32(lbl_kasa_id.Text));

        // satırı renklendir
        //gv_kasa_listele.SelectedRow.Cells[2].BackColor = System.Drawing.Color.Orange;
        //gv_kasa_listele.SelectedRow.Cells[3].BackColor = System.Drawing.Color.Orange;

    }

    protected void KasaBilgileriniGetir(int kasa_id)
    {

        
        string queryString = "SELECT * FROM kasa_kayit WHERE kasa_id="+kasa_id;
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {
           
            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_kasa_id.Text = reader["kasa_id"].ToString();
                    dd_para_birimi.SelectedValue = reader["para_birimi_id"].ToString(); 
                    txt_kasa_adi.Text= reader["kasa_adi"].ToString();
                    txt_aciklama.Text= reader["aciklama1"].ToString();
                   
                   
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
            baglan.VeritabaniBaglantiyiKapat(connection);
        }

 

    }

    protected void gv_kasa_listele_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int kasa_id = Convert.ToInt32(gv_kasa_listele.DataKeys[e.RowIndex].Value);
        
        string queryString = "DELETE FROM kasa_kayit WHERE kasa_id=" + kasa_id;
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            
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
            KasaListele();
        }
    }
    protected void gv_kasa_listele_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void gv_kasa_listele_RowCreated(object sender, GridViewRowEventArgs e)
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