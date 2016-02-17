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

public partial class Cari_CariDurumRaporu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource_islem_tipi.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;

        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
           

        }

    }

    protected void dd_islem_tipi_DataBound(object sender, EventArgs e)
    {
        dd_islem_tipi.Items.Insert(0, new ListItem("- Seçiniz -", "tum"));
        dd_islem_tipi.Items.Insert(1, new ListItem("- HASTA -", "HASTA"));
    }

    protected void CariDurumListesiniGetir()
    {
      
        string queryString = "";

        if (dd_borc_or_alacak.SelectedValue == "tum") { queryString = "SELECT * FROM cari_karti"; }
        if (dd_borc_or_alacak.SelectedValue == "borclular") { queryString = " SELECT * FROM cari_karti WHERE  bakiye>'0'"; }
        if (dd_borc_or_alacak.SelectedValue == "alacaklilar") { queryString = "SELECT * FROM cari_karti WHERE  bakiye<'0'"; }

        if (dd_islem_tipi.SelectedValue != "tum")  
        {
            if (dd_borc_or_alacak.SelectedValue == "tum")  // bir önceki borç alacak tüm seçilmiş ise AND ifadesi gelmemesi gerekir
            {
                if (dd_islem_tipi.SelectedValue == "HASTA") { queryString += " WHERE hasta_mi='HASTA'"; } else { queryString += " WHERE grup_id='" + dd_islem_tipi.SelectedValue + "'"; }
            }
            else
            {
                if (dd_islem_tipi.SelectedValue == "HASTA")  { queryString += " and hasta_mi='HASTA'"; } else { queryString += " and grup_id='" + dd_islem_tipi.SelectedValue + "'"; }
            }
        }

        queryString += " ORDER BY "+dd_listeleme_sekli.SelectedValue;


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

    protected void CariDurumToplamlariGetir()
    {
  
        string queryString = "";

        if (dd_borc_or_alacak.SelectedValue == "tum") { queryString = "SELECT  sum(borc_bakiye) AS borc,sum(alacak_bakiye) AS alacak,sum(borc_bakiye)-sum(alacak_bakiye) AS bakiye FROM cari_karti"; }
        if (dd_borc_or_alacak.SelectedValue == "borclular") { queryString = "SELECT  sum(borc_bakiye) AS borc,sum(alacak_bakiye) AS alacak,sum(borc_bakiye)-sum(alacak_bakiye) AS bakiye FROM cari_karti WHERE  bakiye>'0'"; }
        if (dd_borc_or_alacak.SelectedValue == "alacaklilar") { queryString = "SELECT  sum(borc_bakiye) AS borc,sum(alacak_bakiye) AS alacak,sum(borc_bakiye)-sum(alacak_bakiye) AS bakiye FROM cari_karti WHERE  bakiye<'0'"; }

        if (dd_islem_tipi.SelectedValue != "tum")  
        {
            if (dd_borc_or_alacak.SelectedValue == "tum")  // bir önceki borç alacak tüm seçilmiş ise AND ifadesi gelmemesi gerekir
            {
                if (dd_islem_tipi.SelectedValue == "HASTA") { queryString += " WHERE hasta_mi='HASTA'"; } else { queryString += " WHERE grup_id='" + dd_islem_tipi.SelectedValue + "'"; }
            }
            else
            {
                if (dd_islem_tipi.SelectedValue == "HASTA")  { queryString += " and hasta_mi='HASTA'"; } else { queryString += " and grup_id='" + dd_islem_tipi.SelectedValue + "'"; }
            }
        }


        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(queryString, connection);

        int updated = 0;
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
            lbl_mesaj.Text = "Error Cari EXTRE TOPLAMLAR ";
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

    protected void ibtn_raporla_Click(object sender, ImageClickEventArgs e)
    {
        CariDurumListesiniGetir();
        CariDurumToplamlariGetir();
    }

    protected void gv_listele_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_listele.PageIndex = e.NewPageIndex;
        CariDurumListesiniGetir();
        CariDurumToplamlariGetir();
    }


}