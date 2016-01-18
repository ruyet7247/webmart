<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CariHareket.aspx.cs" Inherits="Cari_CariHareket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
        
        .style3
        {
            width: 15%;
        }
     
        .style4
        {
            width: 30%;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="pnl_cari_bilgi" runat="server" BorderStyle="Solid">
    <table style="width:100%;">
        <tr>
            <td class="style3">
                <asp:Label ID="lbl_cari_id" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style4">
                </td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Cari Ünvanı</td>
            <td class="style4">
                <asp:TextBox ID="txt_gelir_gider_adi" runat="server" Width="120px"></asp:TextBox>
            </td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Grubu</td>
            <td class="style4">
                <asp:DropDownList ID="dd_gelir_or_gider" runat="server">
                    <asp:ListItem Selected="True" Value="gelir">GELİR</asp:ListItem>
                    <asp:ListItem Value="gider">GİDER</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Borç Bakiye</td>
            <td class="style4">
                &nbsp;&nbsp;</td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Alacak Bakiye</td>
            <td class="style4">
                <asp:ImageButton ID="ibtn_post" runat="server" Height="25px" Width="71px" />
            </td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Bakiye</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
        </tr>
</table>
    </asp:Panel>
    <asp:Panel ID="pnl_butonlar" runat="server" BorderStyle="Solid">
    </asp:Panel>
    <asp:Panel ID="pnl_cari_hareket" runat="server" BorderStyle="Solid" 
        BorderWidth="1px">
        <asp:GridView ID="gv_listele" runat="server" Width="100%">

        </asp:GridView>
    </asp:Panel>
</asp:Content>

