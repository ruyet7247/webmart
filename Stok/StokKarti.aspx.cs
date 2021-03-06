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

public partial class Stok_StokKarti : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource2.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;
        
        if (Request.QueryString["StokID"] != null)
        {
            try
            {
                lbl_stok_id.Text = Request.QueryString["StokID"];
            }
            catch
            {
                // deal with it
            }
        }


        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {

            if (lbl_stok_id.Text != "0")
            {
                stokBilgileriniGetir(Convert.ToInt32(lbl_stok_id.Text));
            }

        }



    }

    protected void ibtn_post_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_stok_id.Text == "0")
        {
            stokEkle();
            stokBilgileriniGetir(Convert.ToInt32(lbl_stok_id.Text));
        }
        else
        {
            stokGuncelle(Convert.ToInt32(lbl_stok_id.Text));
            //stokBilgileriniGetir(Convert.ToInt32(lbl_stok_id.Text));
        }
    }

    protected void stokEkle()
    {
        
        string queryString = "INSERT INTO stok_kayit (kayit_tarihi,stok_kod_no,stok_barkod_no,stok_uretici_no,stok_adi,birimi,grubu_id,kdv,alis_fiyati,satis_fiyati) VALUES \n" +
                              "(@kayit_tarihi,@stok_kod_no,@stok_barkod_no,@stok_uretici_no,@stok_adi,@birimi,@grubu_id,@kdv,@alis_fiyati,@satis_fiyati)";
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_kayit_tarihi.Text);
            cmd.Parameters.Add("@stok_kod_no", SqlDbType.NVarChar).Value = txt_kod_no.Text;
            cmd.Parameters.Add("@stok_barkod_no", SqlDbType.NVarChar).Value = txt_barkod_no.Text;
            cmd.Parameters.Add("@stok_uretici_no", SqlDbType.NVarChar).Value = txt_uretici_no.Text;
            cmd.Parameters.Add("@stok_adi", SqlDbType.NVarChar).Value = txt_stok_adi.Text;
            cmd.Parameters.Add("@birimi", SqlDbType.NVarChar).Value = dd_birimi.SelectedValue;
            cmd.Parameters.Add("@grubu_id", SqlDbType.NVarChar).Value = dd_grup_id.SelectedValue;
            cmd.Parameters.Add("@kdv", SqlDbType.NVarChar).Value = txt_kdv.Text;
            cmd.Parameters.Add("@alis_fiyati", SqlDbType.NVarChar).Value = txt_alis_fiyati.Text;
            cmd.Parameters.Add("@satis_fiyati", SqlDbType.NVarChar).Value = txt_satis_fiyati.Text;
           


            
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

    protected void stokGuncelle(int stok_id)
    {
        
        ///string queryString = "UPDATE stok_kayit SET kayit_tarihi=@kayit_tarihi,stok_kod_no=@stok_kod_no,stok_barkod_no=@stok_barkod_no,stok_uretici_no=@stok_uretici_no,stok_adi=@stok_adi,birimi=@birimi,grubu_id=@grubu_id,kdv=@kdv,alis_fiyati=@alis_fiyati,satis_fiyati=@satis_fiyati WHERE stok_id=" + stok_id;
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("StokKartiGuncelle", connection);


        int update_flag = 0;

        try
        {
            DateTime kayit_tarihi = Convert.ToDateTime(txt_kayit_tarihi.Text);
            
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@stok_id", SqlDbType.Int).Value = stok_id;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_kayit_tarihi.Text);
            cmd.Parameters.Add("@stok_kod_no", SqlDbType.NVarChar).Value = txt_kod_no.Text;
            cmd.Parameters.Add("@stok_barkod_no", SqlDbType.NVarChar).Value = txt_barkod_no.Text;
            cmd.Parameters.Add("@stok_uretici_no", SqlDbType.NVarChar).Value = txt_uretici_no.Text;
            cmd.Parameters.Add("@stok_adi", SqlDbType.NVarChar).Value = txt_stok_adi.Text;
            cmd.Parameters.Add("@birimi", SqlDbType.NVarChar).Value = dd_birimi.SelectedValue;
            cmd.Parameters.Add("@grubu_id", SqlDbType.NVarChar).Value = dd_grup_id.SelectedValue;
            cmd.Parameters.Add("@kdv", SqlDbType.Int).Value = txt_kdv.Text;
            cmd.Parameters.Add("@alis_fiyati", SqlDbType.Decimal).Value =txt_alis_fiyati.Text;
            cmd.Parameters.Add("@satis_fiyati", SqlDbType.Decimal).Value = txt_satis_fiyati.Text;


            
            update_flag = cmd.ExecuteNonQuery();
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

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // stok arama modal popup
    {
        stokArama(txt_arama.Text);
    }

    protected void stokArama(string stok_adi) //stok arama modal popup
    {
        string hareketSQL = "SELECT TOP(20) stok_id,stok_kod_no,stok_barkod_no,stok_uretici_no,stok_adi,birimi,kdv,alis_fiyati,satis_fiyati FROM stok_kayit WHERE stok_adi LIKE '%" + stok_adi + "%'";
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
            lbl_mesaj.Text = "Error stok Bulma ";
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
        Label lbl_stok_id = (Label)row.FindControl("lbl_stok_id");
        ibtn_stok_bul_ModalPopupExtender.Hide();
        Response.Redirect("StokKarti.aspx?StokID=" + lbl_stok_id.Text);


    }

    protected void stokBilgileriniGetir(int stok_id)
    {


        
        string queryString = "SELECT * FROM stok_kayit WHERE stok_id=" + stok_id;
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_stok_id.Text = reader["stok_id"].ToString();

                    DateTime kayit_tarihi = Convert.ToDateTime(reader["kayit_tarihi"].ToString());
                    txt_kayit_tarihi.Text = kayit_tarihi.ToString("dd.MM.yyyy");
                    txt_kod_no.Text = reader["stok_kod_no"].ToString();
                    txt_barkod_no.Text = reader["stok_barkod_no"].ToString();
                    txt_uretici_no.Text = reader["stok_uretici_no"].ToString();
                    txt_stok_adi.Text = reader["stok_adi"].ToString();
                    dd_birimi.SelectedValue = reader["birimi"].ToString();
                    dd_grup_id.SelectedValue= reader["grubu_id"].ToString();
                    txt_kdv.Text = reader["kdv"].ToString();
                    txt_alis_fiyati.Text = reader["alis_fiyati"].ToString();
                    txt_satis_fiyati.Text = reader["satis_fiyati"].ToString();
                    txt_giren.Text = reader["giren"].ToString();
                    txt_cikan.Text= reader["cikan"].ToString();

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

    protected void ibtn_yeni_stok_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("StokKarti.aspx");
    }

    protected void ibtn_stok_sil_Click(object sender, ImageClickEventArgs e)
    {
        int stok_id = Convert.ToInt32(lbl_stok_id.Text);
        StokSil(stok_id);
        Response.Redirect("StokKarti.aspx");

    }

    protected void StokSil(int silinecek_stok_id)
    {
        
        string queryString = "DELETE FROM stok_kayit WHERE stok_id=" + silinecek_stok_id;
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