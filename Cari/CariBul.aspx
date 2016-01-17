<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CariBul.aspx.cs" Inherits="Cari_CariBul" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WebMart Application</title>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color:#B6B7BC" >
        <p>
        <asp:Label ID="lbl_baslik" runat="server">Cari Kartı Bul</asp:Label>
        </p>
        <p>
            <asp:DropDownList ID="dd_arama_secimi" runat="server">
            </asp:DropDownList>&nbsp;
            <asp:TextBox ID="txt_arama" runat="server"></asp:TextBox>&nbsp;
            <asp:ImageButton ID="ibtn_arama" runat="server" onclick="ibtn_arama_Click" />&nbsp;
            </p>
        <asp:GridView ID="gv_arama_listele" runat="server" Width="100%">
        </asp:GridView>
    </div>
    </form>
</body>
</html>
