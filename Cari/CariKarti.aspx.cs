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

public partial class Cari_CariKarti : System.Web.UI.Page
{
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
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
  
            if (lbl_cari_id.Text != "0")
            {
                CariBilgileriniGetir(Convert.ToInt32(lbl_cari_id.Text));
            }
           
        }

       

    }

    protected void ibtn_post_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_cari_id.Text == "0")
        {
            CariEkle();
            CariBilgileriniGetir(Convert.ToInt32(lbl_cari_id.Text));
        }
        else
        {
            CariGuncelle(Convert.ToInt32(lbl_cari_id.Text));
            //CariBilgileriniGetir(Convert.ToInt32(lbl_cari_id.Text));
        }
    }

    protected void CariEkle()
    {

        string queryString = "INSERT INTO cari_karti (unvan,adi,soyadi,kayit_tarihi,grup_id,cari_kod_no,tc_no,meslek,ilce,sehir,posta_kodu,ulke,vergi_dairesi,vergi_no,banka_adi,banka_hesap_no,banka_iban_no,tel1,tel2,fax,gsm1,gsm2,mail,adres1,adres2) VALUES \n" +
                              "(@unvan,@adi,@soyadi,@kayit_tarihi,@grup_id,@cari_kod_no,@tc_no,@meslek,@ilce,@sehir,@posta_kodu,@ulke,@vergi_dairesi,@vergi_no,@banka_adi,@banka_hesap_no,@banka_iban_no,@tel1,@tel2,@fax,@gsm1,@gsm2,@mail,@adres1,@adres2)";
        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {
            cmd.Parameters.Add("@unvan", SqlDbType.NVarChar).Value = txt_unvan.Text;
            cmd.Parameters.Add("@adi", SqlDbType.NVarChar).Value = txt_adi.Text;
            cmd.Parameters.Add("@soyadi", SqlDbType.NVarChar).Value = txt_soyadi.Text;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value =Convert.ToDateTime(txt_kayit_tarihi.Text);
            cmd.Parameters.Add("@grup_id", SqlDbType.NVarChar).Value = dd_grup_id.SelectedValue;
            cmd.Parameters.Add("@cari_kod_no", SqlDbType.NVarChar).Value = txt_cari_kod_no.Text;
            cmd.Parameters.Add("@tc_no", SqlDbType.NVarChar).Value = txt_tc_no.Text;
            cmd.Parameters.Add("@meslek", SqlDbType.NVarChar).Value = txt_meslek.Text;
            cmd.Parameters.Add("@ilce", SqlDbType.NVarChar).Value = txt_ilce.Text;
            cmd.Parameters.Add("@sehir", SqlDbType.NVarChar).Value = txt_sehir.Text;
            cmd.Parameters.Add("@posta_kodu", SqlDbType.NVarChar).Value = txt_posta_kodu.Text;
            cmd.Parameters.Add("@ulke", SqlDbType.NVarChar).Value = txt_ulke.Text;
            cmd.Parameters.Add("@vergi_dairesi", SqlDbType.NVarChar).Value = txt_vergi_dairesi.Text;
            cmd.Parameters.Add("@vergi_no", SqlDbType.NVarChar).Value = txt_vergi_no.Text;
            cmd.Parameters.Add("@banka_adi", SqlDbType.NVarChar).Value = txt_banka_adi.Text;
            cmd.Parameters.Add("@banka_hesap_no", SqlDbType.NVarChar).Value = txt_banka_hesap_no.Text;
            cmd.Parameters.Add("@banka_iban_no", SqlDbType.NVarChar).Value = txt_banka_iban_no.Text;
            cmd.Parameters.Add("@tel1", SqlDbType.NVarChar).Value = txt_tel1.Text;
            cmd.Parameters.Add("@tel2", SqlDbType.NVarChar).Value = txt_tel2.Text;
            cmd.Parameters.Add("@fax", SqlDbType.NVarChar).Value = txt_fax.Text;
            cmd.Parameters.Add("@gsm1", SqlDbType.NVarChar).Value = txt_gsm1.Text;
            cmd.Parameters.Add("@gsm2", SqlDbType.NVarChar).Value = txt_gsm2.Text;
            cmd.Parameters.Add("@mail", SqlDbType.NVarChar).Value = txt_mail.Text;
            cmd.Parameters.Add("@adres1", SqlDbType.NVarChar).Value = txt_adres1.Text;
            cmd.Parameters.Add("@adres2", SqlDbType.NVarChar).Value = txt_adres2.Text;


            
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

    protected void CariGuncelle(int cari_id)
    {
        string queryString = "UPDATE cari_karti SET unvan=@unvan,adi=@adi,soyadi=@soyadi,kayit_tarihi=@kayit_tarihi,grup_id=@grup_id,cari_kod_no=@cari_kod_no,tc_no=@tc_no,meslek=@meslek,ilce=@ilce,sehir=@sehir,posta_kodu=@posta_kodu,ulke=@ulke,vergi_dairesi=@vergi_dairesi,vergi_no=@vergi_no,banka_adi=@banka_adi,banka_hesap_no=@banka_hesap_no, banka_iban_no=@banka_iban_no,tel1=@tel1,tel2=@tel2,fax=@fax,gsm1=@gsm1,gsm2=@gsm2,mail=@mail,adres1=@adres1,adres2=@adres2 WHERE cari_id=" + cari_id;

        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);


        int update_flag=0;

        try
        {
            DateTime kayit_tarihi = Convert.ToDateTime(txt_kayit_tarihi.Text);


            cmd.Parameters.Add("@unvan", SqlDbType.NVarChar).Value = txt_unvan.Text;
            cmd.Parameters.Add("@adi", SqlDbType.NVarChar).Value = txt_adi.Text;
            cmd.Parameters.Add("@soyadi", SqlDbType.NVarChar).Value =txt_soyadi.Text;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = kayit_tarihi;
            cmd.Parameters.Add("@grup_id", SqlDbType.Int).Value =Convert.ToInt32(dd_grup_id.SelectedValue);
            cmd.Parameters.Add("@cari_kod_no", SqlDbType.NVarChar).Value = txt_cari_kod_no.Text;
            cmd.Parameters.Add("@tc_no", SqlDbType.NVarChar).Value = txt_tc_no.Text;
            cmd.Parameters.Add("@meslek", SqlDbType.NVarChar).Value = txt_meslek.Text;
            cmd.Parameters.Add("@ilce", SqlDbType.NVarChar).Value = txt_ilce.Text;
            cmd.Parameters.Add("@sehir", SqlDbType.NVarChar).Value = txt_sehir.Text;
            cmd.Parameters.Add("@posta_kodu", SqlDbType.NVarChar).Value = txt_posta_kodu.Text;
            cmd.Parameters.Add("@ulke", SqlDbType.NVarChar).Value = txt_ulke.Text;
            cmd.Parameters.Add("@vergi_dairesi", SqlDbType.NVarChar).Value = txt_vergi_dairesi.Text;
            cmd.Parameters.Add("@vergi_no", SqlDbType.NVarChar).Value = txt_vergi_no.Text;
            cmd.Parameters.Add("@banka_adi", SqlDbType.NVarChar).Value = txt_banka_adi.Text;
            cmd.Parameters.Add("@banka_hesap_no", SqlDbType.NVarChar).Value = txt_banka_hesap_no.Text;
            cmd.Parameters.Add("@banka_iban_no", SqlDbType.NVarChar).Value = txt_banka_iban_no.Text;
            cmd.Parameters.Add("@tel1", SqlDbType.NVarChar).Value = txt_tel1.Text;
            cmd.Parameters.Add("@tel2", SqlDbType.NVarChar).Value = txt_tel2.Text;
            cmd.Parameters.Add("@fax", SqlDbType.NVarChar).Value = txt_fax.Text;
            cmd.Parameters.Add("@gsm1", SqlDbType.NVarChar).Value = txt_gsm1.Text;
            cmd.Parameters.Add("@gsm2", SqlDbType.NVarChar).Value = txt_gsm2.Text;
            cmd.Parameters.Add("@mail", SqlDbType.NVarChar).Value = txt_mail.Text;
            cmd.Parameters.Add("@adres1", SqlDbType.NVarChar).Value = txt_adres1.Text;
            cmd.Parameters.Add("@adres2", SqlDbType.NVarChar).Value = txt_adres2.Text;


            
            update_flag=cmd.ExecuteNonQuery();
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

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // cari arama modal popup
    {
        cariArama(txt_arama.Text);
    } 

    protected void cariArama(string unvan) //cari arama modal popup
    {
        string hareketSQL = "SELECT cari_id,unvan,gsm1,borc_bakiye,alacak_bakiye,bakiye FROM cari_karti WHERE unvan LIKE '%"+unvan+"%'";
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
        Response.Redirect("CariKarti.aspx?CariID=" + lbl_cari_id.Text);

        
    }

    protected void CariBilgileriniGetir(int cari_id)
    {

        string queryString = "SELECT * FROM cari_karti WHERE cari_id=" + cari_id;

        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {

            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                 
                  lbl_cari_id.Text = reader["cari_id"].ToString();

                  txt_unvan.Text = reader["unvan"].ToString();
                  txt_adi.Text = reader["adi"].ToString();
                  txt_soyadi.Text = reader["soyadi"].ToString();
                  DateTime kayit_tarihi=Convert.ToDateTime(reader["kayit_tarihi"].ToString());
                  txt_kayit_tarihi.Text = kayit_tarihi.ToString("dd.MM.yyyy");
                  dd_grup_id.SelectedValue = reader["grup_id"].ToString();
                  txt_cari_kod_no.Text = reader["cari_kod_no"].ToString();
                  txt_tc_no.Text = reader["tc_no"].ToString();
                  txt_meslek.Text = reader["meslek"].ToString();
                  txt_ilce.Text = reader["ilce"].ToString();
                  txt_sehir.Text = reader["sehir"].ToString();
                  txt_posta_kodu.Text = reader["posta_kodu"].ToString();
                  txt_ulke.Text = reader["ulke"].ToString();
                  txt_vergi_dairesi.Text = reader["vergi_dairesi"].ToString();
                  txt_vergi_no.Text = reader["vergi_no"].ToString();
                  txt_banka_adi.Text = reader["banka_adi"].ToString();
                  txt_banka_hesap_no.Text = reader["banka_hesap_no"].ToString();
                  txt_banka_iban_no.Text = reader["banka_iban_no"].ToString();
                  txt_tel1.Text = reader["tel1"].ToString();
                  txt_tel2.Text = reader["tel2"].ToString();
                  txt_fax.Text = reader["fax"].ToString();
                  txt_gsm1.Text = reader["gsm1"].ToString();
                  txt_gsm2.Text = reader["gsm2"].ToString();
                  txt_mail.Text = reader["mail"].ToString();
                  txt_adres1.Text = reader["adres1"].ToString();
                  txt_adres2.Text = reader["adres2"].ToString();
                  txt_borc_bakiye.Text = reader["borc_bakiye"].ToString();
                  txt_alacak_bakiye.Text = reader["alacak_bakiye"].ToString();
                  txt_bakiye.Text = reader["bakiye"].ToString();

                  


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

    protected void ibtn_yeni_cari_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CariKarti.aspx");
    }
    
    protected void ibtn_cari_sil_Click(object sender, ImageClickEventArgs e)
    {
        int cari_id = Convert.ToInt32(lbl_cari_id.Text);
        CariSil(cari_id);
        Response.Redirect("CariKarti.aspx");
       
    }

    protected void CariSil(int silinecek_cari_id)
    {
        string queryString = "DELETE FROM cari_karti WHERE cari_id=" + silinecek_cari_id;

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