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

public partial class Mesaj_AjaxProcessor : System.Web.UI.Page
{
   
    
    protected void Page_Load(object sender, EventArgs e)
    {
        int deger = 0;

        if (Session["Aralik"] != null)
        {
            try
            {
                deger = Convert.ToInt32(Session["Aralik"].ToString());
                deger = deger + 50;
                Session["Aralik"] = deger.ToString();
                MesajlariGetir(Session["Aralik"].ToString());

            }
            catch
            {
                // deal with it
            }
        }
        else {
            Session["Aralik"] = "0";
        }

       
    }

    protected void MesajlariGetir(string aralik_degeri)
    {
        string hareketSQL = "SELECT * FROM dashboard ORDER BY id DESC,tarih DESC";
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(database_master);
        SqlCommand cmd = new SqlCommand(hareketSQL, connection);

        int updated = 0;
        try
        {

            updated = cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds_hareket = new DataSet();
            da.Fill(ds_hareket);

            gv_mesaj_listele.DataSource = ds_hareket;
            gv_mesaj_listele.DataBind();

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




}