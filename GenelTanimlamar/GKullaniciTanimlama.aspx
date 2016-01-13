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
                <asp:TextBox ID="txt_kurulus_tarihi0" runat="server" ReadOnly="True"></asp:TextBox>
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
                <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
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
                <asp:TextBox ID="txt_kurulus_tarihi" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
           <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Kullanıcı Soyadı</td>
            <td class="style2">
                <asp:TextBox ID="txt_firma_tipi" runat="server" ReadOnly="True" Width="70%"></asp:TextBox>
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
                <asp:TextBox ID="txt_kisa_unvani" runat="server" ReadOnly="True" Width="70%"></asp:TextBox>
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
                <asp:TextBox ID="txt_tam_unvani" runat="server" ReadOnly="True" Width="90%"></asp:TextBox>
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
                <asp:ImageButton ID="ibtn_guncelle" runat="server" Height="30px" 
                    onclick="ibtn_guncelle_Click" Width="120px" />
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

