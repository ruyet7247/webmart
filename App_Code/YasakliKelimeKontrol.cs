using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for YasakliKelimeKontrol
/// </summary>
public class YasakliKelimeKontrol
{

    public YasakliKelimeKontrol()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public bool YasakKelimeyiKontrolEt(string kontrol_edilecek_string)
    {
           string[] strList = kontrol_edilecek_string.Split(' ');
            string[] yasakliKelimeler = { "where", "select", "from", "delete", "drop", "alter table", "table",
                                             "insert into", "update", "set", "join", "script", "body", "alert","insert","or" };

            for (int i = 0; i < strList.Length; i++)
            {
                for (int j = 0; j < yasakliKelimeler.Length; j++)
                {
                    if (strList[i] == yasakliKelimeler[j])
                    {
                        return false;
                    }
                }
            }
            return true;
    }


}