<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Mesaj_Dashboard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 10%;
        }
        .style2
        {
            width: 40%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td class="style1">
                Mesajınız</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                <asp:TextBox ID="txt_mesaj" runat="server" Height="100%" Rows="5" 
                    TextMode="MultiLine" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2" align="left">
                <asp:ImageButton ID="ibtn_post" runat="server" 
                    onclick="ibtn_post_Click" ImageUrl="~/Icons/res3232/save2.png" />
            </td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server">
    <p>
        <asp:Label ID="lbl_baslik" runat="server"></asp:Label></p>
        <p>
        ...
        </p>
        <p><asp:Label ID="lbl_mesaj" runat="server" Text=""></asp:Label>
        </p>
        
    </asp:Panel>
</asp:Content>

