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

public partial class Yonetim_KasaListesi : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_mesaj.Text = "";
        SqlDataSource_firmalar.ConnectionString = WebConfigurationManager.ConnectionStrings[Session["ConnectionString"].ToString()].ConnectionString;

        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
            DateTime.Now.Year.ToString();
            DateTime date = DateTime.Today;

            txt_bas_tarih.Text = "01-01-" + DateTime.Now.Year.ToString();
            txt_son_tarih.Text = date.ToString("dd-MM-yyyy");
        }

       

    }

    protected void ibtn_raporla_Click(object sender, ImageClickEventArgs e)
    {
        TabloAyarla();
        if (dd_firma.SelectedValue == "tum") { return; }

        //KasaHareketListesiniGetir(dd_firma.SelectedValue);
        //KasaHareketToplamlariGetir(dd_firma.SelectedValue);
        //string queryStringGiren = "SELECT TOP (100) PERCENT dbo.kasa_kayit.kasa_id, dbo.kasa_kayit.kasa_adi + ' - ' + dbo.firma_para_birimi_tanimlama.para_birimi AS kasa, dbo.kasa_kayit.kasa_adi, dbo.kasa_kayit.para_birimi_id, dbo.kasa_kayit.aciklama1, dbo.firma_para_birimi_tanimlama.para_birimi FROM dbo.kasa_kayit INNER JOIN dbo.firma_para_birimi_tanimlama ON dbo.kasa_kayit.para_birimi_id = dbo.firma_para_birimi_tanimlama.para_birimi_id ORDER BY dbo.kasa_kayit.kasa_adi";
        
        string queryStringGiren = "SELECT TOP (100) PERCENT dbo.kasa_kayit.kasa_id, dbo.kasa_kayit.kasa_adi + ' - ' + dbo.firma_para_birimi_tanimlama.para_birimi AS kasa, dbo.kasa_kayit.kasa_adi, dbo.kasa_kayit.para_birimi_id, dbo.kasa_kayit.aciklama1, dbo.firma_para_birimi_tanimlama.para_birimi FROM dbo.kasa_kayit INNER JOIN dbo.firma_para_birimi_tanimlama ON dbo.kasa_kayit.para_birimi_id = dbo.firma_para_birimi_tanimlama.para_birimi_id ORDER BY dbo.kasa_kayit.kasa_adi";
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(dd_firma.SelectedValue); SqlCommand cmd = new SqlCommand(queryStringGiren, connection);
        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    KasaHareketToplamlariGetir(dd_firma.SelectedItem.Text,dd_firma.SelectedValue,reader["kasa_id"].ToString());
                    
                }
            }
        }
        catch (Exception err)
        {
            lbl_mesaj.Text += "Error Kasa İsimleri Çağırma. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }

    }

    protected void TabloAyarla() {
        // Total number of rows.
        int rowCnt;
        // Current row count.
        int rowCtr;
        // Total number of cells per row (columns).
        int cellCtr;
        // Current cell counter
        int cellCnt;

        // Create new row and add it to the table.
            TableRow tRow = new TableRow();
            Table1.Rows.Add(tRow); TableCell tCell = new TableCell(); tCell.Text = "Kasa Adı "; tCell.Width = 200; tRow.Cells.Add(tCell);
            Table1.Rows.Add(tRow); tCell = new TableCell(); tCell.Text = "Giriş Bakiye "; tCell.Width = 200; tRow.Cells.Add(tCell);
            Table1.Rows.Add(tRow); tCell = new TableCell(); tCell.Text = "Çıkış Bakiye "; tCell.Width = 200; tRow.Cells.Add(tCell);
            Table1.Rows.Add(tRow); tCell = new TableCell(); tCell.Text = "Bakiye "; tCell.Width = 200; tRow.Cells.Add(tCell);

        /*
        rowCnt = 1;
        cellCnt = 3;
        for (rowCtr = 1; rowCtr <= rowCnt; rowCtr++)
        {
            // Create new row and add it to the table.
            TableRow tRow = new TableRow();
            Table1.Rows.Add(tRow);
            for (cellCtr = 1; cellCtr <= cellCnt; cellCtr++)
            {
                // Create a new cell and add it to the row.
                TableCell tCell = new TableCell();
                tCell.Text = "Kasa Adı " + rowCtr + ", Kasa " + cellCtr;
                tRow.Cells.Add(tCell);
            }
        }
        */
    }

   
    protected void KasaHareketToplamlariGetir(string kasa_adi,string ConnStr,string kasa_id)
    {

        DateTime ilktarih = Convert.ToDateTime(txt_bas_tarih.Text);
        DateTime sontarih = Convert.ToDateTime(txt_son_tarih.Text);
        double giren_toplam = 0;
        double cikan_toplam = 0;
        double bakiye = 0;
        txt_giren.Text = "0"; txt_cikan.Text = "0";

        TableRow tRow = new TableRow();
        TableCell tCell;
        Table1.Rows.Add(tRow); tCell = new TableCell(); tCell.Text = kasa_adi + " "; tCell.Width = 200; tRow.Cells.Add(tCell);

        string queryStringGiren = "SELECT sum(tutar) AS giren FROM kasa_hareket WHERE giris_or_cikis='giris' and kasa_id='" + kasa_id + "' and (kayit_tarihi BETWEEN '" + ilktarih + "' and '" + sontarih + "')";
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(ConnStr); SqlCommand cmd = new SqlCommand(queryStringGiren, connection);
        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                        txt_giren.Text = reader["giren"].ToString();
                        giren_toplam = Convert.ToDouble(reader["giren"].ToString());
                        Table1.Rows.Add(tRow); tCell = new TableCell(); tCell.Text = String.Format("{0:#,#.00}", giren_toplam) + " "; tCell.Width = 200; tRow.Cells.Add(tCell);
       
                }
              
            }
            
        }
        catch (Exception err)
        {
            lbl_mesaj.Text += "Error Kasa Hesaplama Giriş. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan.VeritabaniBaglantiyiKapat(connection);
        }

        string queryStringCikan = "SELECT sum(tutar) AS cikan FROM kasa_hareket WHERE giris_or_cikis='cikis' and kasa_id='" + kasa_id + "' and (kayit_tarihi BETWEEN '" + ilktarih + "' and '" + sontarih + "')";
        ConnVt baglan2 = new ConnVt(); SqlConnection connection2 = baglan2.VeritabaninaBaglan(ConnStr); SqlCommand cmd2 = new SqlCommand(queryStringCikan, connection2);
        try
        {
            SqlDataReader reader2 = cmd2.ExecuteReader();
            if (reader2.HasRows)
            {
                while (reader2.Read())
                {
                        txt_cikan.Text = reader2["cikan"].ToString();
                        cikan_toplam = Convert.ToDouble(reader2["cikan"].ToString());
                        Table1.Rows.Add(tRow); tCell = new TableCell(); tCell.Text = String.Format("{0:#,#.00}", cikan_toplam) + " "; tCell.Width = 200; tRow.Cells.Add(tCell);
                }

            }
            
        }
        catch (Exception err)
        {
            lbl_mesaj.Text += "Error Kasa Hesaplama Çıkış. ";
            lbl_mesaj.Text += err.Message;
        }
        finally
        {
            baglan2.VeritabaniBaglantiyiKapat(connection2);
        }

        ////////////////////////////////////////////////////////////////////////////////////////////
        try
        {
            bakiye = giren_toplam - cikan_toplam;
            txt_bakiye.Text = String.Format("{0:#,#.00}", bakiye);
            Table1.Rows.Add(tRow);  tCell = new TableCell(); tCell.Text = String.Format("{0:#,#.00}", bakiye)+" "; tCell.Width = 200; tRow.Cells.Add(tCell);
            
            
        }
        catch (Exception err)
        {
            lbl_mesaj.Text += "Error Kasa GirisCikisToplaminiGetir. ";
            lbl_mesaj.Text += err.Message;
        }



    }
    

    protected void dd_firma_DataBound(object sender, EventArgs e)
    {
        dd_firma.Items.Insert(0, new ListItem("- Firma Seçiniz -", "tum"));
    }



}