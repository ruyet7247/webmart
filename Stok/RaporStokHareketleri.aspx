<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RaporStokHareketleri.aspx.cs" Inherits="Stok_RaporStokHareketleri" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 15%;
        }
        .style2
        {
            width: 15%;
        }
        .style3
        {
            width: 15%;
        }
        .style4
        {
            width: 15%;
            height: 40px;
        }
        .style5
        {
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
     <asp:Panel ID="pnl_baslik" runat="server">
             STOK HAREKET RAPORU</asp:Panel>
    <asp:Panel ID="Panel1" runat="server">
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td align="right" class="style3">
                    &nbsp;</td>
                <td>
                             &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Giriş / Çıkış</td>
                <td class="style2">
                    <asp:DropDownList ID="dd_giris_or_cikis" runat="server">
                        <asp:ListItem Value="tum">- Seçiniz -</asp:ListItem>
                        <asp:ListItem Value="giris">GİRİŞ</asp:ListItem>
                        <asp:ListItem Value="cikis">ÇIKIŞ</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style3" align="right">
                    İşlem Tipi</td>
                <td>
                    <asp:DropDownList ID="dd_islem_tipi" runat="server" 
                        DataSourceID="SqlDataSource_islem_tipi" DataTextField="islem_tipi_adi" 
                        DataValueField="islem_tipi" ondatabound="dd_islem_tipi_DataBound" Width="160px">
                        <asp:ListItem Value="tum">- Seçiniz -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_islem_tipi" runat="server" 
                        
                        SelectCommand="SELECT [islem_tipi], [islem_tipi_adi] FROM [stok_islem_tipi_tanimlama]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Tarih Aralığı</td>
                <td class="style4">
                    <asp:TextBox ID="txt_bas_tarih" runat="server" Width="80px"></asp:TextBox>
                    <asp:TextBox ID="txt_son_tarih" runat="server" Width="80px"></asp:TextBox>
                    <asp:CalendarExtender ID="txt_bas_tarih_CalendarExtender" runat="server" 
                        Enabled="True" Format="dd.MM.yyyy" TargetControlID="txt_bas_tarih">
                    </asp:CalendarExtender>
                    <asp:CalendarExtender ID="txt_son_tarih_CalendarExtender" runat="server" 
                        Enabled="True" Format="dd.MM.yyyy" TargetControlID="txt_son_tarih">
                    </asp:CalendarExtender>
                </td>
                <td class="style4">
                </td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Stok Giriş Toplamları</td>
                <td class="style2">
                    <asp:TextBox ID="txt_giren" runat="server" CssClass="sagaDayaliFormat" 
                        ReadOnly="True" Width="90px"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    <asp:ImageButton ID="ibtn_raporla" runat="server" 
                        onclick="ibtn_raporla_Click" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Stok Çıkış Toplamları</td>
                <td class="style2">
                    <asp:TextBox ID="txt_cikan" runat="server" CssClass="sagaDayaliFormat" 
                        ReadOnly="True" Width="90px"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Kalan Stok Toplam</td>
                <td class="style2">
                    <asp:TextBox ID="txt_stok_miktari" runat="server" CssClass="sagaDayaliFormat" 
                        ReadOnly="True" Width="90px"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnl_cari_hareket" runat="server" BorderStyle="Solid" 
        BorderWidth="1px">
        <asp:GridView ID="gv_listele" runat="server" Width="100%" 
            AutoGenerateColumns="False" DataKeyNames="stok_hareket_id" 
            AllowPaging="True" onpageindexchanging="gv_listele_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="stok_hareket_id" HeaderText="stok_hareket_id" 
                    InsertVisible="False" ReadOnly="True" SortExpression="stok_hareket_id" />
                <asp:BoundField DataField="stok_id" HeaderText="stok_id" 
                    SortExpression="stok_id" />
                <asp:BoundField DataField="kayit_tarihi" HeaderText="kayit_tarihi" 
                    SortExpression="kayit_tarihi" />
                <asp:BoundField DataField="islem_tipi" HeaderText="islem_tipi" 
                    SortExpression="islem_tipi" />
                <asp:BoundField DataField="giris_or_cikis" HeaderText="giris_or_cikis" 
                    SortExpression="giris_or_cikis" />
                <asp:BoundField DataField="miktar" HeaderText="miktar" 
                    SortExpression="miktar" />
                <asp:BoundField DataField="birim" HeaderText="birim" SortExpression="birim" />
                <asp:BoundField DataField="aciklama1" HeaderText="aciklama1" 
                    SortExpression="aciklama1" />
                <asp:BoundField DataField="birim_fiyat" HeaderText="birim_fiyat" 
                    SortExpression="birim_fiyat" />
                <asp:BoundField DataField="iskonto" HeaderText="iskonto" 
                    SortExpression="iskonto" />
                <asp:BoundField DataField="kdv_oran" HeaderText="kdv_oran" 
                    SortExpression="kdv_oran" />
                <asp:BoundField DataField="tutar" HeaderText="tutar" SortExpression="tutar" />
                <asp:BoundField DataField="cari_id" HeaderText="cari_id" 
                    SortExpression="cari_id" />
                <asp:BoundField DataField="evrak_no" HeaderText="evrak_no" 
                    SortExpression="evrak_no" />
                <asp:BoundField DataField="fis_id" HeaderText="fis_id" 
                    SortExpression="fis_id" />
                <asp:BoundField DataField="fatura_id" HeaderText="fatura_id" 
                    SortExpression="fatura_id" />
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <!-- ARAMA PANELİ son-->
     <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>   
</asp:Content>

