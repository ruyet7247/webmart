<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GFirmaTanimlama.aspx.cs" Inherits="GFirmaTanimlama" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <table style="width:100%;">
        <tr>
            <td class="style1">
                Kuruluş Tarihi</td>
            <td class="style2">
                <asp:TextBox ID="txt_kurulus_tarihi" placeholder="MM/DD/YYYY"  runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txt_kurulus_tarihi_CalendarExtender" runat="server" Format="MM/dd/yyyy" 
                    Enabled="True" TargetControlID="txt_kurulus_tarihi">
                </asp:CalendarExtender>
            </td>
           <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Firma Tipi</td>
            <td class="style2">
                <asp:TextBox ID="txt_firma_tipi" runat="server" Width="70%"></asp:TextBox>
            </td>
           <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Kısa Unvanı</td>
            <td class="style2">
                <asp:TextBox ID="txt_kisa_unvani" runat="server" Width="70%"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Tam Unvanı</td>
            <td class="style2">
                <asp:TextBox ID="txt_tam_unvani" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Yetkili</td>
            <td class="style2">
                <asp:TextBox ID="txt_yetkili" runat="server" Width="70%"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Vergi Dairesi</td>
            <td class="style2">
                <asp:TextBox ID="txt_vergi_dairesi" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Telefon 1</td>
            <td class="style2">
                <asp:TextBox ID="txt_tel1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Vergi No</td>
            <td class="style2">
                <asp:TextBox ID="txt_vergi_no" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Telefon 2</td>
            <td class="style2">
                <asp:TextBox ID="txt_tel2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Adres 1</td>
            <td class="style2">
                <asp:TextBox ID="txt_adres1" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Faks</td>
            <td class="style2">
                <asp:TextBox ID="txt_fax" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Adres 2</td>
            <td class="style2">
                <asp:TextBox ID="txt_adres2" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Gsm 1</td>
            <td class="style2">
                <asp:TextBox ID="txt_gsm1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Semt</td>
            <td class="style2">
                <asp:TextBox ID="txt_semt" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Gsm 2</td>
            <td class="style2">
                <asp:TextBox ID="txt_gsm2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                İlçe</td>
            <td class="style2">
                <asp:TextBox ID="txt_ilce" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Mail Adresi</td>
            <td class="style2">
                <asp:TextBox ID="txt_mail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                İl</td>
            <td class="style2">
                <asp:TextBox ID="txt_il" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Web Adresi</td>
            <td class="style2">
                <asp:TextBox ID="txt_web_adresi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Posta Kodu</td>
            <td class="style2">
                <asp:TextBox ID="txt_posta_kodu" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Açıklama</td>
            <td class="style2">
                <asp:TextBox ID="txt_aciklama1" runat="server"></asp:TextBox>
            </td>
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

