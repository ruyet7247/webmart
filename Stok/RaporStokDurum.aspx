<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RaporStokDurum.aspx.cs" Inherits="Stok_RaporStokDurum" %>


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
             STOK DURUM RAPORU (ENVANTER)</asp:Panel>
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
                    Stok Durumu</td>
                <td class="style2">
                    <asp:DropDownList ID="dd_stok_durumu" runat="server">
                        <asp:ListItem Value="tum">Tümü</asp:ListItem>
                        <asp:ListItem Value="var">Stok ta Var</asp:ListItem>
                        <asp:ListItem Value="yok">Stok Olmayanlar</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style3" align="right">
                    <asp:ImageButton ID="ibtn_raporla" runat="server" onclick="ibtn_raporla_Click" 
                        ImageUrl="~/Icons/res3232/arama2.png" />
                </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource_islem_tipi" runat="server" 
                        SelectCommand="SELECT * FROM [stok_grubu_tanimlama]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    İşlem Tipi</td>
                <td class="style4">
                    <asp:DropDownList ID="dd_grup" runat="server" 
                        DataSourceID="SqlDataSource_islem_tipi" DataTextField="stok_grubu_adi" 
                        DataValueField="stok_grubu_id" ondatabound="dd_islem_tipi_DataBound" 
                        Width="160px">
                        <asp:ListItem Value="tum">- Seçiniz -</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style4">
                </td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Toplam Alış Fiyatı</td>
                <td class="style2">
                    <asp:TextBox ID="txt_alis_toplam" runat="server" CssClass="sagaDayaliFormat" 
                        ReadOnly="True" Width="120px"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Toplam Satış Fiyatı</td>
                <td class="style2">
                    <asp:TextBox ID="txt_satis_toplam" runat="server" CssClass="sagaDayaliFormat" 
                        ReadOnly="True" Width="120px"></asp:TextBox>
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
            AutoGenerateColumns="False" DataKeyNames="stok_id" 
            AllowPaging="True" onpageindexchanging="gv_listele_PageIndexChanging" 
            CssClass="GridViewClass" onrowcreated="gv_listele_RowCreated" 
            onrowdatabound="gv_listele_RowDataBound">
            <Columns>
                <asp:BoundField DataField="stok_id" HeaderText="stok_id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="stok_id" Visible="False" />
                <asp:TemplateField HeaderText="Tarih" SortExpression="kayit_tarihi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("kayit_tarihi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("kayit_tarihi", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="70px" />
                </asp:TemplateField>
                <asp:BoundField DataField="stok_kod_no" HeaderText="Kod No" 
                    SortExpression="stok_kod_no" >
                <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="stok_barkod_no" HeaderText="Barkod No" 
                    SortExpression="stok_barkod_no" >
                <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="stok_uretici_no" HeaderText="Üretici No" 
                    SortExpression="stok_uretici_no" >
                <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="stok_adi" HeaderText="Stok Adı" 
                    SortExpression="stok_adi" >
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="marka" HeaderText="marka" SortExpression="marka" 
                    Visible="False" />
                <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" 
                    Visible="False" />
                <asp:BoundField DataField="grubu_id" HeaderText="grubu_id" 
                    SortExpression="grubu_id" Visible="False" />
                <asp:BoundField DataField="alt_grubu_id" HeaderText="alt_grubu_id" 
                    SortExpression="alt_grubu_id" Visible="False" />
                <asp:BoundField DataField="birimi" HeaderText="Birimi" 
                    SortExpression="birimi" >
                <ItemStyle Width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="alt_birimi" HeaderText="alt_birimi" 
                    SortExpression="alt_birimi" Visible="False" />
                <asp:BoundField DataField="aciklama1" HeaderText="Açıklama" 
                    SortExpression="aciklama1" >
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="giren" HeaderText="Giriş" SortExpression="giren" >
                <ItemStyle HorizontalAlign="Center" Width="30px" />
                </asp:BoundField>
                <asp:BoundField DataField="cikan" HeaderText="Çıkış" SortExpression="cikan" >
                <ItemStyle HorizontalAlign="Center" Width="30px" />
                </asp:BoundField>
                <asp:BoundField DataField="kdv" HeaderText="Kdv" SortExpression="kdv" >
                <ItemStyle HorizontalAlign="Center" Width="20px" />
                </asp:BoundField>
                <asp:BoundField DataField="alis_fiyati" HeaderText="Alış Fiyatı" 
                    SortExpression="alis_fiyati" >
                <ItemStyle HorizontalAlign="Right" Width="70px" />
                </asp:BoundField>
                <asp:BoundField DataField="satis_fiyati" HeaderText="Satış Fiyatı" 
                    SortExpression="satis_fiyati" >
                <ItemStyle HorizontalAlign="Right" Width="70px" />
                </asp:BoundField>
                <asp:BoundField DataField="para_birimi" HeaderText="para_birimi" 
                    SortExpression="para_birimi" Visible="False" />
                <asp:CheckBoxField DataField="aktif_or_pasif" HeaderText="aktif_or_pasif" 
                    SortExpression="aktif_or_pasif" Visible="False" />
                <asp:BoundField DataField="resim" HeaderText="resim" SortExpression="resim" 
                    Visible="False" />
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <!-- ARAMA PANELİ son-->
     <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>   
</asp:Content>


