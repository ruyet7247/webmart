<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CariDurumRaporu.aspx.cs" Inherits="Cari_CariDurumRaporu" %>


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
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
     <asp:Panel ID="pnl_baslik" runat="server">
             CARİ/HASTA BORÇ/ALACAK RAPORU</asp:Panel>
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
                    Borçlular/Alacaklılar</td>
                <td class="style2">
                    <asp:DropDownList ID="dd_borc_or_alacak" runat="server">
                        <asp:ListItem Value="tum">- Seçiniz -</asp:ListItem>
                        <asp:ListItem Value="borclular">BORÇLULAR</asp:ListItem>
                        <asp:ListItem Value="alacaklilar">ALACAKLILAR</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style3" align="right">
                    Grubu</td>
                <td>
                    <asp:DropDownList ID="dd_islem_tipi" runat="server" 
                        DataSourceID="SqlDataSource_islem_tipi" DataTextField="cari_grubu_adi" 
                        DataValueField="cari_grubu_id" ondatabound="dd_islem_tipi_DataBound" 
                        Width="160px">
                        <asp:ListItem Value="tum">- Seçiniz -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_islem_tipi" runat="server" 
                        
                        SelectCommand="SELECT [cari_grubu_id], [cari_grubu_adi] FROM [cari_grubu_tanimlama]" 
                        ConnectionString="<%$ ConnectionStrings:WebMart0001 %>">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Listeleme Şekli</td>
                <td class="style2">
                    <asp:DropDownList ID="dd_listeleme_sekli" runat="server">
                        <asp:ListItem Value="bakiye">Bakiye ArtanSıra</asp:ListItem>
                        <asp:ListItem Value="bakiye DESC">Bakiye AzalanSıra</asp:ListItem>
                        <asp:ListItem Value="adi">Ada Göre</asp:ListItem>
                        <asp:ListItem Value="soyadi">Soyada Göre</asp:ListItem>
                        <asp:ListItem Value="unvan">Ünvana Göre</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Borç Toplam</td>
                <td class="style2">
                    <asp:TextBox ID="txt_borc_bakiye" runat="server" CssClass="sagaDayaliFormat" 
                        ReadOnly="True" Width="180px"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    <asp:ImageButton ID="ibtn_raporla" runat="server" 
                        onclick="ibtn_raporla_Click" ImageUrl="~/Icons/res3232/guncelle.png" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Alacak Toplam</td>
                <td class="style2">
                    <asp:TextBox ID="txt_alacak_bakiye" runat="server" CssClass="sagaDayaliFormat" 
                        ReadOnly="True" Width="180px"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Bakiye</td>
                <td class="style2">
                    <asp:TextBox ID="txt_bakiye" runat="server" CssClass="sagaDayaliFormat" 
                        ReadOnly="True" Width="180px"></asp:TextBox>
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
            AutoGenerateColumns="False" DataKeyNames="cari_id" 
            AllowPaging="True" onpageindexchanging="gv_listele_PageIndexChanging" 
            PageSize="20" CssClass="GridViewClass" 
            onrowcreated="gv_listele_RowCreated" onrowdatabound="gv_listele_RowDataBound">
            <Columns>
                <asp:BoundField DataField="cari_id" HeaderText="cari_id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="cari_id" Visible="False" />
                <asp:BoundField DataField="unvan" HeaderText="Unvan" SortExpression="unvan" >
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="adi" HeaderText="Adı" SortExpression="adi" >
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="soyadi" HeaderText="Soyadı" 
                    SortExpression="soyadi" >
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="grup_id" HeaderText="grup_id" 
                    SortExpression="grup_id" Visible="False" />
                <asp:BoundField DataField="gsm1" HeaderText="Gsm" SortExpression="gsm1">
                <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="borc_bakiye" HeaderText="Borç Bakiye" 
                    SortExpression="borc_bakiye" >
                <ItemStyle HorizontalAlign="Right" Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="alacak_bakiye" HeaderText="Alacak Bakiye" 
                    SortExpression="alacak_bakiye" >
                <ItemStyle HorizontalAlign="Right" Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="bakiye" HeaderText="Bakiye" 
                    SortExpression="bakiye" >
                <ItemStyle HorizontalAlign="Right" Width="80px" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <!-- ARAMA PANELİ son-->
     <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>   
</asp:Content>

