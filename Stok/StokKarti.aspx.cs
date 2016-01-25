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

public partial class Stok_StokKarti : System.Web.UI.Page
{
    String dataconnect = WebConfigurationManager.ConnectionStrings["CnnStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["stokID"] != null)
        {
            try
            {
                lbl_stok_id.Text = Request.QueryString["stokID"];
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
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "INSERT INTO stok_karti (unvan,adi,soyadi,kayit_tarihi,grup_id,stok_kod_no,tc_no,meslek,ilce,sehir,posta_kodu,ulke,vergi_dairesi,vergi_no,banka_adi,banka_hesap_no,banka_iban_no,tel1,tel2,fax,gsm1,gsm2,mail,adres1,adres2) VALUES \n" +
                              "(@unvan,@adi,@soyadi,@kayit_tarihi,@grup_id,@stok_kod_no,@tc_no,@meslek,@ilce,@sehir,@posta_kodu,@ulke,@vergi_dairesi,@vergi_no,@banka_adi,@banka_hesap_no,@banka_iban_no,@tel1,@tel2,@fax,@gsm1,@gsm2,@mail,@adres1,@adres2)";
        SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {
            cmd.Parameters.Add("@unvan", SqlDbType.NVarChar).Value = txt_unvan.Text;
            cmd.Parameters.Add("@adi", SqlDbType.NVarChar).Value = txt_adi.Text;
            cmd.Parameters.Add("@soyadi", SqlDbType.NVarChar).Value = txt_soyadi.Text;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_kayit_tarihi.Text);
            cmd.Parameters.Add("@grup_id", SqlDbType.NVarChar).Value = dd_grup_id.SelectedValue;
            cmd.Parameters.Add("@stok_kod_no", SqlDbType.NVarChar).Value = txt_stok_kod_no.Text;
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


            connection.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error INSERT. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();

        }
    }

    protected void stokGuncelle(int stok_id)
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "UPDATE stok_karti SET unvan=@unvan,adi=@adi,soyadi=@soyadi,kayit_tarihi=@kayit_tarihi,grup_id=@grup_id,stok_kod_no=@stok_kod_no,tc_no=@tc_no,meslek=@meslek,ilce=@ilce,sehir=@sehir,posta_kodu=@posta_kodu,ulke=@ulke,vergi_dairesi=@vergi_dairesi,vergi_no=@vergi_no,banka_adi=@banka_adi,banka_hesap_no=@banka_hesap_no, banka_iban_no=@banka_iban_no,tel1=@tel1,tel2=@tel2,fax=@fax,gsm1=@gsm1,gsm2=@gsm2,mail=@mail,adres1=@adres1,adres2=@adres2 WHERE stok_id=" + stok_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);


        int update_flag = 0;

        try
        {
            DateTime kayit_tarihi = Convert.ToDateTime(txt_kayit_tarihi.Text);


            cmd.Parameters.Add("@unvan", SqlDbType.NVarChar).Value = txt_unvan.Text;
            cmd.Parameters.Add("@adi", SqlDbType.NVarChar).Value = txt_adi.Text;
            cmd.Parameters.Add("@soyadi", SqlDbType.NVarChar).Value = txt_soyadi.Text;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = kayit_tarihi;
            cmd.Parameters.Add("@grup_id", SqlDbType.Int).Value = Convert.ToInt32(dd_grup_id.SelectedValue);
            cmd.Parameters.Add("@stok_kod_no", SqlDbType.NVarChar).Value = txt_stok_kod_no.Text;
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


            connection.Open();
            update_flag = cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lbl_mesaj.Text = "Error UPDATE. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();

        }


    }

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // stok arama modal popup
    {
        stokArama(txt_arama.Text);
    }

    protected void stokArama(string unvan) //stok arama modal popup
    {
        string hareketSQL = "SELECT stok_id,unvan,gsm1,borc_bakiye,alacak_bakiye,bakiye FROM stok_karti WHERE unvan LIKE '%" + unvan + "%'";
        SqlConnection con = new SqlConnection(dataconnect);
        SqlCommand cmd = new SqlCommand(hareketSQL, con);

        int updated = 0;
        try
        {
            con.Open();
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
            con.Close();
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
        Response.Redirect("stokKarti.aspx?stokID=" + lbl_stok_id.Text);


    }

    protected void stokBilgileriniGetir(int stok_id)
    {


        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "SELECT * FROM stok_karti WHERE stok_id=" + stok_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_stok_id.Text = reader["stok_id"].ToString();

                    txt_unvan.Text = reader["unvan"].ToString();
                    txt_adi.Text = reader["adi"].ToString();
                    txt_soyadi.Text = reader["soyadi"].ToString();
                    DateTime kayit_tarihi = Convert.ToDateTime(reader["kayit_tarihi"].ToString());
                    txt_kayit_tarihi.Text = kayit_tarihi.ToString("dd.MM.yyyy");
                    dd_grup_id.SelectedValue = reader["grup_id"].ToString();
                    txt_stok_kod_no.Text = reader["stok_kod_no"].ToString();
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
            connection.Close();
        }

    }

    protected void ibtn_yeni_stok_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("stokKarti.aspx");
    }

    protected void ibtn_stok_sil_Click(object sender, ImageClickEventArgs e)
    {
        int stok_id = Convert.ToInt32(lbl_stok_id.Text);
        stokSil(stok_id);
        Response.Redirect("stokKarti.aspx");

    }

    protected void stokSil(int silinecek_stok_id)
    {
        SqlConnection connection = new SqlConnection(dataconnect);
        string queryString = "DELETE FROM stok_karti WHERE stok_id=" + silinecek_stok_id;
        SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {

            connection.Open();
            cmd.ExecuteNonQuery();

        }

        catch (Exception err)
        {
            lbl_mesaj.Text = "Error Deleting ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            connection.Close();
        }
    }


}