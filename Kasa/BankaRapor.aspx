<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BankaRapor.aspx.cs" Inherits="Kasa_BankaRapor" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
      
        .style1
        {
            width: 120px;
        }
      
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <table style="width:100%;">
        <tr>
            <td class="style1">
                BANKA RAPORLARI</td>
            <td class="style1">
                &nbsp;</td>
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
                Banka Seçimi Yapınız</td>
            <td class="style1">
                İlk Tarih -
                Son Tarih</td>
            <td class="style1">
                Giriş/Çıkış</td>
            <td class="style1">
                <asp:ImageButton ID="ibtn_raporla" runat="server" onclick="ibtn_raporla_Click" 
                    style="width: 14px" />
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:DropDownList ID="dd_banka" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="banka_adi" DataValueField="banka_hesap_id">
                </asp:DropDownList>
            </td>
            <td class="style1">
                    <asp:TextBox ID="txt_bas_tarih" runat="server" Width="80px"></asp:TextBox>
                    <asp:CalendarExtender ID="txt_bas_tarih_CalendarExtender" runat="server" 
                        Enabled="True" Format="dd.MM.yyyy" TargetControlID="txt_bas_tarih">
                    </asp:CalendarExtender>
                    <asp:TextBox ID="txt_son_tarih" runat="server" Width="80px"></asp:TextBox>
                    <asp:CalendarExtender ID="txt_son_tarih_CalendarExtender" runat="server" 
                        Enabled="True" Format="dd.MM.yyyy" TargetControlID="txt_son_tarih">
                    </asp:CalendarExtender>
                    </td>
            <td class="style1">
                <asp:DropDownList ID="dd_giris_or_cikis" runat="server">
                    <asp:ListItem Value="tum">Tüm</asp:ListItem>
                    <asp:ListItem Value="giris">Giriş (+)</asp:ListItem>
                    <asp:ListItem Value="cikis">Çıkış (-)</asp:ListItem>
                </asp:DropDownList>
                </td>
            <td class="style1">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    SelectCommand="SELECT [banka_hesap_id], [banka_adi] FROM [banka_kayit]">
                </asp:SqlDataSource>
            </td>
            <td class="style1">
                &nbsp;</td>
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
        <asp:GridView ID="gv_listele" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="banka_hareket_id" AllowPaging="True" 
            onpageindexchanging="gv_listele_PageIndexChanging" PageSize="20">
            <Columns>
                <asp:BoundField DataField="banka_hareket_id" HeaderText="banka_hareket_id" 
                    InsertVisible="False" ReadOnly="True" SortExpression="banka_hareket_id" />
                <asp:BoundField DataField="banka_hesap_id" HeaderText="banka_hesap_id" 
                    SortExpression="banka_hesap_id" />
                <asp:BoundField DataField="banka_hesap_adi" HeaderText="banka_hesap_adi" 
                    SortExpression="banka_hesap_adi" />
                <asp:BoundField DataField="giris_or_cikis" HeaderText="giris_or_cikis" 
                    SortExpression="giris_or_cikis" />
                <asp:BoundField DataField="kayit_tarihi" HeaderText="kayit_tarihi" 
                    SortExpression="kayit_tarihi" />
                <asp:BoundField DataField="odeme_tarihi" HeaderText="odeme_tarihi" 
                    SortExpression="odeme_tarihi" />
                <asp:BoundField DataField="cari_unvani" HeaderText="cari_unvani" 
                    SortExpression="cari_unvani" />
                <asp:BoundField DataField="odeme_kategorisi" HeaderText="odeme_kategorisi" 
                    SortExpression="odeme_kategorisi" />
                <asp:BoundField DataField="tutar" HeaderText="tutar" 
                    SortExpression="tutar" />
                <asp:BoundField DataField="personel_adi" HeaderText="personel_adi" 
                    SortExpression="personel_adi" />
                <asp:BoundField DataField="aciklama1" HeaderText="aciklama1" 
                    SortExpression="aciklama1" />
                <asp:BoundField DataField="cari_id" HeaderText="cari_id" 
                    SortExpression="cari_id" />
                <asp:BoundField DataField="pos_id" HeaderText="pos_id" 
                    SortExpression="pos_id" />
                <asp:BoundField DataField="cari_hareket_id" 
                    HeaderText="cari_hareket_id" 
                    SortExpression="cari_hareket_id" />
                <asp:BoundField DataField="personel_cari_maas_hareket_id" 
                    HeaderText="personel_cari_maas_hareket_id" 
                    SortExpression="personel_cari_maas_hareket_id" />
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>   
</asp:Content>



