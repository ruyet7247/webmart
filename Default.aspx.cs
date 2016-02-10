using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.Security;
using System.Drawing.Imaging;

public partial class _Default : System.Web.UI.Page
{
   
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["GirisVar"] != "True")
        {
            //Response.Redirect("Login.aspx");  //BURASI EN SON AKTİF OLSUN

        }
        else
        {
           
        }

        if (!IsPostBack)
        {
            
        }
    }

  

   
}
