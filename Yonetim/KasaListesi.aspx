<%@ Page Title="" Language="C#" MasterPageFile="~/SiteYonetim.master" AutoEventWireup="true" CodeFile="KasaListesi.aspx.cs" Inherits="Yonetim_KasaListesi" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">

      
        .style1
        {
            width: 120px;
        }
      
        .style2
        {
            width: 147px;
        }
        .style3
        {
            width: 180px;
        }
        .style4
        {
            width: 36px;
        }
      
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
        <table style="width:100%;">
        <tr>
            <td class="style2">
                FİRMA
                KASA RAPORLARI</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Firma Seçimi Yapınız</td>
            <td class="style3">
                İlk Tarih -
                Son Tarih</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:DropDownList ID="dd_firma" runat="server" 
                    DataSourceID="SqlDataSource_firmalar" DataTextField="firma_adi" 
                    DataValueField="connection_string_adi" Width="150px" 
                    ondatabound="dd_firma_DataBound">
                </asp:DropDownList>
                <br />
            </td>
            <td class="style3">
                    <asp:TextBox ID="txt_bas_tarih" runat="server" Width="80px"></asp:TextBox>
                    <asp:CalendarExtender ID="txt_bas_tarih_CalendarExtender" runat="server" 
                        Enabled="True" Format="dd.MM.yyyy" TargetControlID="txt_bas_tarih">
                    </asp:CalendarExtender>
                    <asp:TextBox ID="txt_son_tarih" runat="server" Width="80px"></asp:TextBox>
                    <asp:CalendarExtender ID="txt_son_tarih_CalendarExtender" runat="server" 
                        Enabled="True" Format="dd.MM.yyyy" TargetControlID="txt_son_tarih">
                    </asp:CalendarExtender>
                   
                    </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style1">
                <asp:ImageButton ID="ibtn_raporla" runat="server" onclick="ibtn_raporla_Click" 
                    CssClass="GridViewClass" ImageUrl="~/Icons/res3232/arama2.png" />
            </td>
            <td class="style1">
                <asp:SqlDataSource ID="SqlDataSource_firmalar" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WebMart_Master %>" 
                    SelectCommand="SELECT [firma_adi], [connection_string_adi] FROM [firma_kayit]">
                </asp:SqlDataSource>
            </td>
            <td class="style1">
                &nbsp;</td>
        </tr>
          <tr>
            <td class="style1">
                Toplam Giriş</td>
            <td class="style1">
                    <asp:TextBox ID="txt_giren" runat="server" CssClass="sagaDayaliFormat" 
                        ReadOnly="True" Width="120px"></asp:TextBox>
                    </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Toplam Çıkış</td>
            <td class="style1">
                    <asp:TextBox ID="txt_cikan" runat="server" CssClass="sagaDayaliFormat" 
                        ReadOnly="True" Width="120px"></asp:TextBox>
                    </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Bakiye</td>
            <td class="style1">
                    <asp:TextBox ID="txt_bakiye" runat="server" CssClass="sagaDayaliFormat" 
                        ReadOnly="True" Width="120px"></asp:TextBox>
                    </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        </table>
        <asp:Panel ID="pnl_listele" runat="server">
            <asp:Table ID="Table1" runat="server" BorderColor="#000099" BorderStyle="Solid" 
                BorderWidth="1px" GridLines="Both">
            </asp:Table>
    </asp:Panel>
    <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>
</asp:Content>

