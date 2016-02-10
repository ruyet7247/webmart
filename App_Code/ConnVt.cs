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

/// <summary>
/// Summary description for ConnVt
/// </summary>
public class ConnVt
{
	public ConnVt()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public SqlConnection VeritabaninaBaglan(string connection_adi)
    {
        String ConnectionString = WebConfigurationManager.ConnectionStrings[connection_adi].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnectionString);
        if (conn.State != System.Data.ConnectionState.Open)
        {
            try
            {
                conn.Open();
            }
            catch
            {
                // hata
            }
        }
        return conn;

    }

    public void VeritabaniBaglantiyiKapat(SqlConnection baglanti)
    {
        baglanti.Close();
        


    }


}