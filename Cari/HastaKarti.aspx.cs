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

public partial class Cari_HastaKarti : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["HastaID"] != null)
        {
            try
            {
                lbl_cari_id.Text = Request.QueryString["HastaID"];
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
                ifrm_cari_gorusmeleri.Attributes["src"] = "CariGorusmeleri.aspx?HastaID=" + Request.QueryString["HastaID"];
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

        string queryString = "INSERT INTO cari_karti (adi,soyadi,kayit_tarihi,cinsiyet,tc_no,meslek,dogum_yeri,dogum_tarihi,uyruk,tel1,tel2,gsm1,gsm2,mail,kimlik_seri_no,baba_adi,anne_adi,adres1,adres2,posta_kodu,ilce,sehir,ulke,hasta_mi) VALUES \n" +
                              "(@adi,@soyadi,@kayit_tarihi,@cinsiyet,@tc_no,@meslek,@dogum_yeri,@dogum_tarihi,@uyruk,@tel1,@tel2,@gsm1,@gsm2,@mail,@kimlik_seri_no,@baba_adi,@anne_adi,@adres1,@adres2,@posta_kodu,@ilce,@sehir,@ulke,@hasta_mi)";

        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {

            cmd.Parameters.Add("@adi", SqlDbType.NVarChar).Value = txt_adi.Text;
            cmd.Parameters.Add("@soyadi", SqlDbType.NVarChar).Value = txt_soyadi.Text;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_kayit_tarihi.Text);
            cmd.Parameters.Add("@cinsiyet", SqlDbType.NVarChar).Value = dd_cinsiyet.SelectedValue;
            cmd.Parameters.Add("@tc_no", SqlDbType.NVarChar).Value = txt_tc_no.Text;
            cmd.Parameters.Add("@meslek", SqlDbType.NVarChar).Value = txt_meslek.Text;
            cmd.Parameters.Add("@dogum_yeri", SqlDbType.NVarChar).Value = txt_dogum_yeri.Text;
            cmd.Parameters.Add("@dogum_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_dogum_tarihi.Text);
            cmd.Parameters.Add("@uyruk", SqlDbType.NVarChar).Value = txt_uyruk.Text;
            cmd.Parameters.Add("@tel1", SqlDbType.NVarChar).Value = txt_tel1.Text;
            cmd.Parameters.Add("@tel2", SqlDbType.NVarChar).Value = txt_tel2.Text;
            cmd.Parameters.Add("@gsm1", SqlDbType.NVarChar).Value = txt_gsm1.Text;
            cmd.Parameters.Add("@gsm2", SqlDbType.NVarChar).Value = txt_gsm2.Text;
            cmd.Parameters.Add("@mail", SqlDbType.NVarChar).Value = txt_mail.Text;
            cmd.Parameters.Add("@kimlik_seri_no", SqlDbType.NVarChar).Value = txt_kimlik_seri_no.Text;
            cmd.Parameters.Add("@baba_adi", SqlDbType.NVarChar).Value = txt_baba_adi.Text;
            cmd.Parameters.Add("@anne_adi", SqlDbType.NVarChar).Value = txt_anne_adi.Text;
            cmd.Parameters.Add("@adres1", SqlDbType.NVarChar).Value = txt_adres1.Text;
            cmd.Parameters.Add("@adres2", SqlDbType.NVarChar).Value = txt_adres2.Text;
            cmd.Parameters.Add("@posta_kodu", SqlDbType.NVarChar).Value = txt_posta_kodu.Text;
            cmd.Parameters.Add("@ilce", SqlDbType.NVarChar).Value = txt_ilce.Text;
            cmd.Parameters.Add("@sehir", SqlDbType.NVarChar).Value = txt_sehir.Text;
            cmd.Parameters.Add("@ulke", SqlDbType.NVarChar).Value = txt_ulke.Text;
            cmd.Parameters.Add("@hasta_mi", SqlDbType.NVarChar).Value = "HASTA";


            
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

        string queryString = "UPDATE cari_karti SET adi=@adi,soyadi=@soyadi,kayit_tarihi=@kayit_tarihi,cinsiyet=@cinsiyet,tc_no=@tc_no,meslek=@meslek,dogum_yeri=@dogum_yeri,dogum_tarihi=@dogum_tarihi,uyruk=@uyruk,tel1=@tel1,tel2=@tel2,gsm1=@gsm1,gsm2=@gsm2,mail=@mail,kimlik_seri_no=@kimlik_seri_no,baba_adi=@baba_adi,anne_adi=@anne_adi,adres1=@adres1,adres2=@adres2,posta_kodu=@posta_kodu,ilce=@ilce,sehir=@sehir,ulke=@ulke WHERE cari_id=" + cari_id;

        ConnVt baglan = new ConnVt();SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());SqlCommand cmd = new SqlCommand(queryString, connection);


        int update_flag = 0;

        try
        {
            DateTime kayit_tarihi = Convert.ToDateTime(txt_kayit_tarihi.Text);

            cmd.Parameters.Add("@adi", SqlDbType.NVarChar).Value = txt_adi.Text;
            cmd.Parameters.Add("@soyadi", SqlDbType.NVarChar).Value = txt_soyadi.Text;
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_kayit_tarihi.Text);
            cmd.Parameters.Add("@cinsiyet", SqlDbType.NVarChar).Value = dd_cinsiyet.SelectedValue;
            cmd.Parameters.Add("@tc_no", SqlDbType.NVarChar).Value = txt_tc_no.Text;
            cmd.Parameters.Add("@meslek", SqlDbType.NVarChar).Value = txt_meslek.Text;
            cmd.Parameters.Add("@dogum_yeri", SqlDbType.NVarChar).Value = txt_dogum_yeri.Text;
            cmd.Parameters.Add("@dogum_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_dogum_tarihi.Text);
            cmd.Parameters.Add("@uyruk", SqlDbType.NVarChar).Value = txt_uyruk.Text;
            cmd.Parameters.Add("@tel1", SqlDbType.NVarChar).Value = txt_tel1.Text;
            cmd.Parameters.Add("@tel2", SqlDbType.NVarChar).Value = txt_tel2.Text;
            cmd.Parameters.Add("@gsm1", SqlDbType.NVarChar).Value = txt_gsm1.Text;
            cmd.Parameters.Add("@gsm2", SqlDbType.NVarChar).Value = txt_gsm2.Text;
            cmd.Parameters.Add("@mail", SqlDbType.NVarChar).Value = txt_mail.Text;
            cmd.Parameters.Add("@kimlik_seri_no", SqlDbType.NVarChar).Value = txt_kimlik_seri_no.Text;
            cmd.Parameters.Add("@baba_adi", SqlDbType.NVarChar).Value = txt_baba_adi.Text;
            cmd.Parameters.Add("@anne_adi", SqlDbType.NVarChar).Value = txt_anne_adi.Text;
            cmd.Parameters.Add("@adres1", SqlDbType.NVarChar).Value = txt_adres1.Text;
            cmd.Parameters.Add("@adres2", SqlDbType.NVarChar).Value = txt_adres2.Text;
            cmd.Parameters.Add("@posta_kodu", SqlDbType.NVarChar).Value = txt_posta_kodu.Text;
            cmd.Parameters.Add("@ilce", SqlDbType.NVarChar).Value = txt_ilce.Text;
            cmd.Parameters.Add("@sehir", SqlDbType.NVarChar).Value = txt_sehir.Text;
            cmd.Parameters.Add("@ulke", SqlDbType.NVarChar).Value = txt_ulke.Text;


            
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

    protected void ibtn_arama_Click(object sender, ImageClickEventArgs e) // cari arama modal popup
    {
        cariArama(txt_arama.Text);
    }

    protected void cariArama(string adi) //cari arama modal popup
    {
        string hareketSQL = "SELECT cari_id,adi,soyadi,gsm1,borc_bakiye,alacak_bakiye,bakiye FROM cari_karti WHERE  hasta_mi='HASTA' and adi LIKE '%" + adi + "%'";
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
        Response.Redirect("HastaKarti.aspx?HastaID=" + lbl_cari_id.Text);


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

                    txt_adi.Text = reader["adi"].ToString();
                    txt_soyadi.Text = reader["soyadi"].ToString();
                    DateTime kayit_tarihi = Convert.ToDateTime(reader["kayit_tarihi"].ToString());
                    txt_kayit_tarihi.Text = kayit_tarihi.ToString("dd.MM.yyyy");
                    dd_cinsiyet.SelectedValue = reader["cinsiyet"].ToString();
                    txt_tc_no.Text = reader["tc_no"].ToString();
                    txt_meslek.Text = reader["meslek"].ToString();
                    txt_dogum_yeri.Text = reader["dogum_yeri"].ToString();
                    txt_dogum_tarihi.Text= reader["dogum_tarihi"].ToString();
                    txt_uyruk.Text = reader["uyruk"].ToString();
                    txt_tel1.Text = reader["tel1"].ToString();
                    txt_tel2.Text = reader["tel2"].ToString();
                    txt_gsm1.Text = reader["gsm1"].ToString();
                    txt_gsm2.Text = reader["gsm2"].ToString();
                    txt_mail.Text = reader["mail"].ToString();
                    txt_kimlik_seri_no.Text = reader["kimlik_seri_no"].ToString();
                    txt_baba_adi.Text = reader["baba_adi"].ToString();
                    txt_anne_adi.Text = reader["anne_adi"].ToString();
                    txt_adres1.Text = reader["adres1"].ToString();
                    txt_adres2.Text = reader["adres2"].ToString();
                    txt_posta_kodu.Text = reader["posta_kodu"].ToString();
                    txt_ilce.Text = reader["ilce"].ToString();
                    txt_sehir.Text = reader["sehir"].ToString();
                    txt_ulke.Text = reader["ulke"].ToString();

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
        Response.Redirect("HastaKarti.aspx");
    }

    protected void ibtn_cari_sil_Click(object sender, ImageClickEventArgs e)
    {
        int cari_id = Convert.ToInt32(lbl_cari_id.Text);
        CariSil(cari_id);
        Response.Redirect("HastaKarti.aspx");

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

  
}