<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GKullaniciTanimlama.aspx.cs" Inherits="GenelTanimlamar_GKullaniciTanimlama" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 10%;
        }
        .style2
        {
            width: 30%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table style="width:100%;">
        <tr>
            <td class="style1">
                Kod No</td>
            <td class="style2">
                <asp:Label ID="lbl_kod_no" runat="server" Text="0"></asp:Label>
            </td>
           <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Kullanıcı Departman</td>
            <td class="style2">
                <asp:DropDownList ID="dd_list_kullanici" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="adi" DataValueField="personel_id" 
                    ondatabound="dd_list_kullanici_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                     
                    SelectCommand="SELECT [personel_id], [adi] FROM [personel]">
                </asp:SqlDataSource>
            </td>
           <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Kullanıcı Adı</td>
            <td class="style2">
                <asp:TextBox ID="txt_kullanici_adi" runat="server"></asp:TextBox>
            </td>
           <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Kullanıcı Şifre</td>
            <td class="style2">
                <asp:TextBox ID="txt_kullanici_sifre" runat="server" Width="70%"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Aktif Pasif</td>
            <td class="style2">
                <asp:DropDownList ID="dd_list_aktif_or_pasif" runat="server">
                    <asp:ListItem Value="1">Aktif</asp:ListItem>
                    <asp:ListItem Value="0">Pasif</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
    </table>
    <table style="width:100%;">
        <tr>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                <asp:ImageButton ID="ibtn_ekle" runat="server" 
                    onclick="ibtn_ekle_Click" ImageUrl="~/Icons/res3232/arti.png" />
            </td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
            &nbsp;</td>
        </tr>
        <tr>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
            &nbsp;</td>
        </tr>
    </table>
     <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>
</asp:Content>

