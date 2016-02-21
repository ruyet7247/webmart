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

public partial class Cari_CariExtre : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource_islem_tipi.ConnectionString =  WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;
        SqlDataSource2.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;

        if (Request.QueryString["CariID"] != null)
        {
            try
            {
                lbl_cari_id.Text = Request.QueryString["CariID"];
            }
            catch
            {
                // deal with it
            }
        }


        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
            DateTime.Now.Year.ToString();
            DateTime date = DateTime.Today;

            txt_bas_tarih.Text = "01-01-" + DateTime.Now.Year.ToString();
            txt_son_tarih.Text = date.ToString("dd-MM-yyyy");

            if (lbl_cari_id.Text != "0")
            {
                CariBilgileriniGetir(Convert.ToInt32(lbl_cari_id.Text));
                CariExtreListesiniGetir(Convert.ToInt32(lbl_cari_id.Text));
                CariBorcAlacakBilgisiniGetir(Convert.ToInt32(lbl_cari_id.Text));
            }

           
        }


    }

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // cari arama modal popup
    {
        cariArama(txt_arama.Text);
    }

    protected void cariArama(string unvan) //cari arama modal popup
    {
        string hareketSQL = "SELECT cari_id,adi,soyadi,unvan,gsm1,borc_bakiye,alacak_bakiye,bakiye FROM cari_karti WHERE unvan LIKE '%" + unvan + "%' OR adi LIKE '%" + unvan + "%'";
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
            lbl_mesaj.Text = "Error Cari Bulma ";
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

    protected void gv_arama_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_arama_listele.SelectedRow;
        Label lbl_cari_id = (Label)row.FindControl("lbl_cari_id");
        ibtn_cari_bul_ModalPopupExtender.Hide();
        Response.Redirect("CariExtre.aspx?CariID=" + lbl_cari_id.Text);


    }

    protected void CariBilgileriniGetir(int cari_id)
    {

        string queryString = "SELECT * FROM cari_karti WHERE cari_id=" + cari_id;
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {


            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_cari_id.Text = reader["cari_id"].ToString();
                    txt_unvan.Text = reader["unvan"].ToString();
                    if (reader["grup_id"].ToString() == "")
                    {
                        dd_grup_id.ID = ""; dd_grup_id.Visible = false;
                        txt_unvan.Text = reader["adi"].ToString() + " " + reader["soyadi"].ToString();
                    }
                    else
                    {
                        dd_grup_id.SelectedValue = reader["grup_id"].ToString();
                    }
                   


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

    protected void CariExtreListesiniGetir(int cari_id)
    {
        DateTime ilktarih = Convert.ToDateTime(txt_bas_tarih.Text);
        DateTime sontarih = Convert.ToDateTime(txt_son_tarih.Text);
        string queryString = "SELECT * FROM cari_hareket WHERE cari_id=" + cari_id + " and (kayit_tarihi BETWEEN '"+ilktarih+"' and '"+sontarih+"') ";
        if (dd_borc_or_alacak.SelectedValue != "tum")
        { queryString += " and borc_or_alacak='" + dd_borc_or_alacak.SelectedValue + "'"; }
        if (dd_islem_tipi.SelectedValue != "tum")
        { queryString += " and islem_tipi='" + dd_islem_tipi.SelectedValue + "'"; }
        
        queryString += " ORDER BY kayit_tarihi DESC,cari_hareket_id DESC";
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
            lbl_mesaj.Text = "Error Cari EXTRE LİSTELEME ";
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
    
    protected void CariBorcAlacakBilgisiniGetir(int cari_id)
    {
        //string queryString = "SELECT sum(borc) AS borc,sum(alacak) AS alacak,sum(borc)-sum(alacak) AS bakiye FROM cari_hareket WHERE cari_id=" + cari_id;
        DateTime ilktarih = Convert.ToDateTime(txt_bas_tarih.Text);
        DateTime sontarih = Convert.ToDateTime(txt_son_tarih.Text);
        string queryString = "SELECT sum(borc) AS borc,sum(alacak) AS alacak,sum(borc)-sum(alacak) AS bakiye FROM cari_hareket WHERE cari_id=" + cari_id + " and (kayit_tarihi BETWEEN '" + ilktarih + "' and '" + sontarih + "') ";
        if (dd_borc_or_alacak.SelectedValue != "tum")
        { queryString += " and borc_or_alacak='" + dd_borc_or_alacak.SelectedValue + "'"; }
        if (dd_islem_tipi.SelectedValue != "tum")
        { queryString += " and islem_tipi='" + dd_islem_tipi.SelectedValue + "'"; }
       
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

                    txt_borc_bakiye.Text = reader["borc"].ToString();
                    txt_alacak_bakiye.Text = reader["alacak"].ToString();
                    txt_bakiye.Text = reader["bakiye"].ToString();
                    

                }
            }
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Cari Borç Alacak Hesaplama ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }


    }

    protected void ibtn_kaydet_Click(object sender, ImageClickEventArgs e)  //İŞLEM KAYDET 
    {
        if (Kontroller())
        {


            // 

        } // if kontroller

        CariExtreListesiniGetir(Convert.ToInt32(lbl_cari_id.Text));
        CariBorcAlacakBilgisiniGetir(Convert.ToInt32(lbl_cari_id.Text));

    }

    protected bool Kontroller()
    {

        return true;
    }

    protected void gv_listele_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_listele.PageIndex = e.NewPageIndex;
        CariExtreListesiniGetir(Convert.ToInt32(lbl_cari_id.Text));
        CariBorcAlacakBilgisiniGetir(Convert.ToInt32(lbl_cari_id.Text));
    }
  
    protected void ibtn_guncelle_Click(object sender, ImageClickEventArgs e)  // Rapor güncelle butonu
    {
        CariExtreListesiniGetir(Convert.ToInt32(lbl_cari_id.Text));
        CariBorcAlacakBilgisiniGetir(Convert.ToInt32(lbl_cari_id.Text));
    }
    protected void dd_islem_tipi_DataBound(object sender, EventArgs e)
    {
        dd_islem_tipi.Items.Insert(0, new ListItem("- Seçiniz -", "tum"));
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


}