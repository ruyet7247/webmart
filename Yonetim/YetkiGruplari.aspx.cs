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

public partial class Yonetim_YetkiGruplari : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ConnectionString"] = "WebMart_Master";
        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
            lbl_yetki_id.Text = "0";

        }

        lbl_mesaj.Text = "";
        VeriListele();
    }

    protected void ibtn_guncelle_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_yetki_id.Text == "0")
        {
            VeriEkle();
            VeriListele();
        }
        else
        {
            VeriGuncelle(Convert.ToInt32(lbl_yetki_id.Text));
            VeriListele();
        }

    }

    protected void VeriEkle()
    {

        string queryString = "INSERT INTO yetki_grubu (yetki_adi,yetki_aciklama,Genel,Cari,Stok,Personel,Kasa,Randevu,Mesaj) VALUES \n" +
                              "(@yetki_adi,@yetki_aciklama,@Genel,@Cari,@Stok,@Personel,@Kasa,@Randevu,@Mesaj)";
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand(queryString, connection);

        try
        {
            cmd.Parameters.Add("@yetki_adi", SqlDbType.NVarChar).Value = txt_yetki_adi.Text;
            cmd.Parameters.Add("@yetki_aciklama", SqlDbType.NVarChar).Value = txt_yetki_aciklama.Text;
            cmd.Parameters.Add("@Genel", SqlDbType.Bit).Value = cb_genel.Checked;
            cmd.Parameters.Add("@Cari", SqlDbType.Bit).Value = cb_cari.Checked;
            cmd.Parameters.Add("@Stok", SqlDbType.Bit).Value = cb_stok.Checked;
            cmd.Parameters.Add("@Personel", SqlDbType.Bit).Value = cb_personel.Checked;
            cmd.Parameters.Add("@Kasa", SqlDbType.Bit).Value = cb_kasa.Checked;
            cmd.Parameters.Add("@Randevu", SqlDbType.Bit).Value = cb_randevu.Checked;
            cmd.Parameters.Add("@Mesaj", SqlDbType.Bit).Value = cb_mesaj.Checked;
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

        string queryString = "UPDATE yetki_grubu SET yetki_adi=@yetki_adi,yetki_aciklama=@yetki_aciklama,Genel=@Genel,Cari=@Cari,Stok=@Stok,Personel=@Personel,Kasa=@Kasa,Randevu=@Randevu,Mesaj=@Mesaj WHERE yetki_id=" + numarator_id;
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(queryString, connection);



        try
        {

            cmd.Parameters.Add("@yetki_adi", SqlDbType.NVarChar).Value = txt_yetki_adi.Text;
            cmd.Parameters.Add("@yetki_aciklama", SqlDbType.NVarChar).Value = txt_yetki_aciklama.Text;
            cmd.Parameters.Add("@Genel", SqlDbType.Bit).Value = cb_genel.Checked;
            cmd.Parameters.Add("@Cari", SqlDbType.Bit).Value = cb_cari.Checked;
            cmd.Parameters.Add("@Stok", SqlDbType.Bit).Value = cb_stok.Checked;
            cmd.Parameters.Add("@Personel", SqlDbType.Bit).Value = cb_personel.Checked;
            cmd.Parameters.Add("@Kasa", SqlDbType.Bit).Value = cb_kasa.Checked;
            cmd.Parameters.Add("@Randevu", SqlDbType.Bit).Value = cb_randevu.Checked;
            cmd.Parameters.Add("@Mesaj", SqlDbType.Bit).Value = cb_mesaj.Checked;
            cmd.ExecuteNonQuery();

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
        string hareketSQL = "SELECT * FROM yetki_grubu";
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan("WebMart_Master");
        SqlCommand cmd = new SqlCommand(hareketSQL, connection);

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

    protected void YetkiGrubuBilgileriniGetir(int numarator_id)
    {


        string queryString = "SELECT * FROM yetki_grubu WHERE yetki_id=" + numarator_id;
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {


            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_yetki_id.Text = reader["yetki_id"].ToString();
                    txt_yetki_adi.Text = reader["yetki_adi"].ToString();
                    txt_yetki_aciklama.Text = reader["yetki_aciklama"].ToString();
                    cb_genel.Checked =Convert.ToBoolean(reader["Genel"].ToString());
                    cb_cari.Checked=Convert.ToBoolean(reader["Cari"].ToString());
                    cb_stok.Checked=Convert.ToBoolean(reader["Stok"].ToString());
                    cb_personel.Checked=Convert.ToBoolean(reader["Personel"].ToString());
                    cb_kasa.Checked=Convert.ToBoolean(reader["Kasa"].ToString());
                    cb_randevu.Checked=Convert.ToBoolean(reader["Randevu"].ToString());
                    cb_mesaj.Checked=Convert.ToBoolean(reader["Mesaj"].ToString());

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

    protected void gv_listele_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = this.gv_listele.SelectedRow;
        Label lbl_yetki_id = (Label)row.FindControl("lbl_yetki_id"); // label kasa id numarasını alıyoruz detay için.

        YetkiGrubuBilgileriniGetir(Convert.ToInt32(lbl_yetki_id.Text));
    }

    protected void gv_listele_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int numarator_id = Convert.ToInt32(gv_listele.DataKeys[e.RowIndex].Value);

        string queryString = "DELETE FROM yetki_grubu WHERE yetki_id=" + numarator_id;
        ConnVt baglan = new ConnVt(); 
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); 
        SqlCommand cmd = new SqlCommand(queryString, connection);
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



}