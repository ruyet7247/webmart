<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="KasaRapor.aspx.cs" Inherits="Kasa_KasaRapor" %>

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
                KASA RAPORLARI</td>
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
                Kasa Seçimi Yapınız</td>
            <td class="style1">
                İlk Tarih -
                Son Tarih</td>
            <td class="style1">
                Giriş/Çıkış</td>
            <td class="style1">
                <asp:ImageButton ID="ibtn_raporla" runat="server" onclick="ibtn_raporla_Click" 
                    CssClass="GridViewClass" ImageUrl="~/Icons/res3232/arama2.png" />
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:DropDownList ID="dd_kasa" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="kasa_adi" DataValueField="kasa_id">
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
                    SelectCommand="SELECT [kasa_id], [kasa_adi] FROM [kasa_kayit]">
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
            DataKeyNames="kasa_hareket_id" AllowPaging="True" 
            onpageindexchanging="GridView1_PageIndexChanging" PageSize="20" 
            CssClass="GridViewClass" onrowcreated="gv_listele_RowCreated" 
            onrowdatabound="gv_listele_RowDataBound">
            <Columns>
                <asp:BoundField DataField="kasa_hareket_id" HeaderText="kasa_hareket_id" 
                    InsertVisible="False" ReadOnly="True" SortExpression="kasa_hareket_id" 
                    Visible="False" />
                <asp:BoundField DataField="kasa_id" HeaderText="kasa_id" 
                    SortExpression="kasa_id" Visible="False" />
                <asp:TemplateField HeaderText="Tarih" SortExpression="kayit_tarihi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("kayit_tarihi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("kayit_tarihi", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="70px" />
                </asp:TemplateField>
                <asp:BoundField DataField="evrak_no" HeaderText="Evrak No" 
                    SortExpression="evrak_no" >
                <ItemStyle Width="70px" />
                </asp:BoundField>
                <asp:BoundField DataField="islem_tipi" HeaderText="İşlem Tipi" 
                    SortExpression="islem_tipi" >
                <ItemStyle Width="70px" />
                </asp:BoundField>
                <asp:BoundField DataField="giris_or_cikis" HeaderText="Giriş / Çıkış" 
                    SortExpression="giris_or_cikis" >
                <ItemStyle Width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="aciklama1" HeaderText="Açıklama" 
                    SortExpression="aciklama1" >
                <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="personel" HeaderText="personel" 
                    SortExpression="personel" />
                <asp:BoundField DataField="tutar" HeaderText="Tutar" 
                    SortExpression="tutar" >
                <ItemStyle HorizontalAlign="Right" Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="cari_id" HeaderText="cari_id" 
                    SortExpression="cari_id" Visible="False" />
                <asp:BoundField DataField="fis_id" HeaderText="fis_id" 
                    SortExpression="fis_id" Visible="False" />
                <asp:BoundField DataField="banka_id" HeaderText="banka_id" 
                    SortExpression="banka_id" Visible="False" />
                <asp:BoundField DataField="cari_hareket_id" HeaderText="cari_hareket_id" 
                    SortExpression="cari_hareket_id" Visible="False" />
                <asp:BoundField DataField="personel_cari_maas_hareket_id" 
                    HeaderText="personel_cari_maas_hareket_id" 
                    SortExpression="personel_cari_maas_hareket_id" Visible="False" />
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>   
</asp:Content>

