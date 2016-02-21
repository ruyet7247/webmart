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
using System.IO;
using System.Data.SqlClient;
using System.Xml;
using System.Configuration;


public partial class Firma_FirmaOlustur : System.Web.UI.Page
{
    string yerel_baglanti = "yerel";  //daha sonra kaldır bunu yukardakini kullanılacak vt EKLE, tablo oluştur VE SİLDE üç yerde var
    int aktif_firma_id = 0;
    // AddUpdateConnectionString fonksiyondaki kullanıcı adı ve şifre ve veritabanı sabit kalacaktır. Tek kullanıcı yeterlidir.

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ConnectionString"] = "WebMart_Master";    
        if (!IsPostBack)  // tıklama ile sayfa gelmemiş ise
        {
            lbl_firma_id.Text = "0";

        }

        lbl_mesaj.Text = "";
        VeriListele();
    }

    protected void ibtn_guncelle_Click(object sender, ImageClickEventArgs e)
    {
        if (lbl_firma_id.Text == "0")
        {
            VeriEkle();
            VeriListele();
        }
        else
        {
            VeriGuncelle(Convert.ToInt32(lbl_firma_id.Text));
            VeriListele();
        }

    }

    protected void VeriEkle()
    {

        string queryString = "INSERT INTO firma_kayit (kayit_tarihi,firma_adi,veritabani_adi,connection_string_adi) VALUES \n" +
                              "(@kayit_tarihi,@firma_adi,@veritabani_adi,@connection_string_adi)";
        ConnVt baglan = new ConnVt(); 
        SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); 
        SqlCommand cmd = new SqlCommand(queryString, connection);
        int sql=0;
        try
        {
            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_kurulus_tarihi.Text);
            cmd.Parameters.Add("@firma_adi", SqlDbType.NVarChar).Value = txt_firma_adi.Text;
            cmd.Parameters.Add("@veritabani_adi", SqlDbType.NVarChar).Value = txt_veritabani_adi.Text;
            cmd.Parameters.Add("@connection_string_adi", SqlDbType.NVarChar).Value = txt_connection_string_adi.Text;
            sql=cmd.ExecuteNonQuery();

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
        if (sql>0)
        {
           
            AddUpdateConnectionString(txt_connection_string_adi.Text);
            VeritabaniOlustur(txt_veritabani_adi.Text);
            VeritabaniTablolariOlustur(txt_veritabani_adi.Text);
            //Response.Redirect("Default.aspx");
        }


    }

    private void AddUpdateConnectionString(string name)
    {
        bool isNew = false;
        string path = Server.MapPath("~/Web.Config");
        XmlDocument doc = new XmlDocument();
        doc.Load(path);
        XmlNodeList list = doc.DocumentElement.SelectNodes(string.Format("connectionStrings/add[@name='{0}']", name));
        XmlNode node;
        isNew = list.Count == 0;
        if (isNew)
        {
            node = doc.CreateNode(XmlNodeType.Element, "add", null);
            XmlAttribute attribute = doc.CreateAttribute("name");
            attribute.Value = name;
            node.Attributes.Append(attribute);

            attribute = doc.CreateAttribute("connectionString");
            attribute.Value = "";
            node.Attributes.Append(attribute);

            attribute = doc.CreateAttribute("providerName");
            attribute.Value = "System.Data.SqlClient";
            node.Attributes.Append(attribute);
        }
        else
        {
            node = list[0];
        }
        string conString = node.Attributes["connectionString"].Value;
        SqlConnectionStringBuilder conStringBuilder = new SqlConnectionStringBuilder(conString);
        conStringBuilder.InitialCatalog = txt_veritabani_adi.Text;       // "TestDB";
        conStringBuilder.DataSource = "HDA\\SERVER";
        //conStringBuilder.IntegratedSecurity = false;
        conStringBuilder.Pooling = false;
        conStringBuilder.CurrentLanguage = "Turkish";
        conStringBuilder.UserID = "ruyet";
        conStringBuilder.Password = "2500648";
        node.Attributes["connectionString"].Value = conStringBuilder.ConnectionString;
        if (isNew)
        {
            doc.DocumentElement.SelectNodes("connectionStrings")[0].AppendChild(node);
        }
        doc.Save(path);
    }

    protected void VeritabaniOlustur(string veritabani_adi)
    {
        string script = "IF EXISTS(select * from sys.databases where name='" + veritabani_adi + "') BEGIN USE [master]  DROP DATABASE " + veritabani_adi + " END CREATE DATABASE " + veritabani_adi;
        
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(yerel_baglanti);
        SqlCommand cmd = new SqlCommand(script, connection);
        cmd.ExecuteNonQuery();
        baglan.VeritabaniBaglantiyiKapat(connection);
    }

    protected void VeritabaniTablolariOlustur(string vt_adi)
    {
        string script = "USE " + vt_adi;
        script += File.ReadAllText(@"D:\App\Github\webmart\Notlar\WebMart0001-Temp.sql");
        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(yerel_baglanti);
        SqlCommand cmd = new SqlCommand(script, connection);
        cmd.ExecuteNonQuery();
        baglan.VeritabaniBaglantiyiKapat(connection);

    }

    protected void VeriTabaniSil(string veritabani_adi,string connection_string)
    {
        string script = "IF EXISTS(select * from sys.databases where name='" + veritabani_adi + "') BEGIN USE [master]  DROP DATABASE " + veritabani_adi + " END";
        //"USE [master] DROP  DATABASE [" + txt_veritabani_adi.Text + "]";

        ConnVt baglan = new ConnVt();
        SqlConnection connection = baglan.VeritabaninaBaglan(yerel_baglanti);
        SqlCommand cmd = new SqlCommand(script, connection);
        cmd.ExecuteNonQuery();
        baglan.VeritabaniBaglantiyiKapat(connection);
        
        // WEB CONFİG DEN KALDIR
        RemoveConnectionString(connection_string, "", "", "", "");
    }

    protected void RemoveConnectionString(string connection_string, string server, string database, string userid, string password)
    {

        string str = "server=" + server + ";database=" + database + "; User ID=" + userid + "; Password=" + password + "";
        //Configuration myConfiguration = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
        //str = System.Web.Configuration.WebConfigurationManager.AppSettings["myKey"];
        //myConfiguration.Save();
        System.Configuration.Configuration Config1 = WebConfigurationManager.OpenWebConfiguration("~");
        ConnectionStringsSection conSetting = (ConnectionStringsSection)Config1.GetSection("connectionStrings");
        ConnectionStringSettings StringSettings = new ConnectionStringSettings(connection_string, "Data Source=" + server + ";Database=" + database + ";User ID=" + userid + ";Password=" + password + ";");
        conSetting.ConnectionStrings.Remove(StringSettings);
        //conSetting.ConnectionStrings.Add(StringSettings); // burayı kaldırdım
        Config1.Save(ConfigurationSaveMode.Modified);
        //Configuration myConfiguration = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
        //myConfiguration.AppSettings.Settings.Item("myKey").Value = txtmyKey.Text;
        //myConfiguration.Save();
    }
    
    protected void VeriGuncelle(int numarator_id)
    {

        string queryString = "UPDATE firma_kayit SET kayit_tarihi=@kayit_tarihi,firma_adi=@firma_adi,veritabani_adi=@veritabani_adi,connection_string_adi=@connection_string_adi WHERE firma_id=" + numarator_id;
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(queryString, connection);



        try
        {

            cmd.Parameters.Add("@kayit_tarihi", SqlDbType.DateTime).Value = Convert.ToDateTime(txt_kurulus_tarihi.Text);
            cmd.Parameters.Add("@firma_adi", SqlDbType.NVarChar).Value = txt_firma_adi.Text;
            cmd.Parameters.Add("@veritabani_adi", SqlDbType.NVarChar).Value = txt_firma_adi.Text;
            cmd.Parameters.Add("@connection_string_adi", SqlDbType.NVarChar).Value = txt_connection_string_adi.Text;
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
        string hareketSQL = "SELECT * FROM firma_kayit";
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

    protected void FirmaBilgileriniGetir(int numarator_id)
    {


        string queryString = "SELECT * FROM firma_kayit WHERE firma_id=" + numarator_id;
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(queryString, connection);
        try
        {


            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lbl_firma_id.Text = reader["firma_id"].ToString();
                    DateTime kayit_tarihi = Convert.ToDateTime(reader["kayit_tarihi"].ToString());
                    txt_kurulus_tarihi.Text = kayit_tarihi.ToString("dd.MM.yyyy");
                    txt_firma_adi.Text= reader["firma_adi"].ToString();
                    txt_veritabani_adi.Text = reader["veritabani_adi"].ToString();
                    txt_connection_string_adi.Text = reader["connection_string_adi"].ToString();

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
        Label lbl_firma_id = (Label)row.FindControl("lbl_firma_id"); // label kasa id numarasını alıyoruz detay için.

        FirmaBilgileriniGetir(Convert.ToInt32(lbl_firma_id.Text));
    }

    protected void gv_listele_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int numarator_id = Convert.ToInt32(gv_listele.DataKeys[e.RowIndex].Value);

        string queryString = "DELETE FROM firma_kayit WHERE firma_id=" + numarator_id;
        ConnVt baglan = new ConnVt(); SqlConnection connection = baglan.VeritabaninaBaglan(Session["ConnectionString"].ToString()); SqlCommand cmd = new SqlCommand(queryString, connection);
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

                GridView gv1 = (GridView)sender;
                GridViewRow gvr1 = (GridViewRow)gv1.Rows[e.RowIndex];

                //get hidden field value and not directly from the GridviewRow, as that will be null or empty!
                Label vt_adi = (Label)gvr1.FindControl("lbl_veritabani_adi");
                Label conn_adi = (Label)gvr1.FindControl("lbl_connection_string_adi");
                if (vt_adi != null)
                {
                   VeriTabaniSil(vt_adi.Text,conn_adi.Text);
                }


            
            VeriListele();
        }
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


    protected void ibtn_sil_Click(object sender, ImageClickEventArgs e)
    {
        VeriTabaniSil(txt_veritabani_adi.Text, txt_connection_string_adi.Text);
    }

}