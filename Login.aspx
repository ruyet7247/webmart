<%@ Page Title="" Language="C#" MasterPageFile="~/Login.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        &nbsp;</h2>
    <p>
        <asp:Label ID="Lbl_login" runat="server" 
            Text="Kullanıcı Adı ve Şifreniz ile Giriş Yapınız" 
            style="text-align: left"></asp:Label>
        </p>
    <asp:Panel ID="Pnl_login" runat="server">
        <table style="width:40%;">
            <tr>
                <td class="style2" align="right">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                
            </tr>
            <tr>
                <td align="right" class="style2">
                    Kullanıcı Adı</td>
                <td class="style3">
                    <asp:TextBox ID="txt_kullanici_adi" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2" align="right">
                    Şifre</td>
                <td class="style3">
                    <asp:TextBox ID="txt_sifre" runat="server" TextMode="Password"></asp:TextBox>
                </td>
             </tr>
            <tr>
                <td class="style2" align="right">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/img.JPEG" 
                        Visible="False" />
                    <asp:TextBox ID="txt_dtext" runat="server" Visible="False"></asp:TextBox>
                   
                </td>
            </tr>   
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td align="left" class="style3">
                    <asp:ImageButton ID="ibtn_login" runat="server" Height="34px" 
                        ImageUrl="~/Images/btn_giris.png" onclick="Ibtn_login_Click" 
                        Width="38px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>
   
</asp:Content>

