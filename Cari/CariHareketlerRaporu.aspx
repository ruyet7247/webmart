<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CariHareketlerRaporu.aspx.cs" Inherits="Cari_CariHareketlerRaporu" %>

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
             CARİ HESAP HAREKET RAPORU</asp:Panel>
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
                    Borç/Alacak</td>
                <td class="style2">
                    <asp:DropDownList ID="dd_borc_or_alacak" runat="server">
                        <asp:ListItem Value="tum">- Seçiniz -</asp:ListItem>
                        <asp:ListItem Value="borc">BORÇ</asp:ListItem>
                        <asp:ListItem Value="alacak">ALACAK</asp:ListItem>
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
                        SelectCommand="SELECT [islem_tipi], [islem_tipi_adi] FROM [cari_islem_tipi_tanimlama]">
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
            AutoGenerateColumns="False" DataKeyNames="cari_hareket_id" 
            AllowPaging="True" onpageindexchanging="gv_listele_PageIndexChanging" 
            PageSize="20" CssClass="GridViewClass" 
            onrowcreated="gv_listele_RowCreated" onrowdatabound="gv_listele_RowDataBound">

            <Columns>
                <asp:TemplateField HeaderText="cari_hareket_id" InsertVisible="False" 
                    SortExpression="cari_hareket_id" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("cari_hareket_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("cari_hareket_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="cari_id" SortExpression="cari_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cari_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("cari_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Kayıt Tarihi" SortExpression="kayit_tarihi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("kayit_tarihi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("kayit_tarihi", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Borç / Alacak" SortExpression="borc_or_alacak">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("borc_or_alacak") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("borc_or_alacak") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="İşlem Tipi" SortExpression="islem_tipi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("islem_tipi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("islem_tipi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ödeme Şekli" SortExpression="odeme_sekli">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("odeme_sekli") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("odeme_sekli") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="vade_tarihi" SortExpression="vade_tarihi" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("vade_tarihi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("vade_tarihi") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Belge No" SortExpression="belge_no">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("belge_no") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("belge_no") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="70px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Açıklama" SortExpression="aciklama1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("aciklama1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("aciklama1") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="personel" SortExpression="personel" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("personel") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("personel") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Borç" SortExpression="borc">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("borc") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("borc") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" Width="70px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Alacak" SortExpression="alacak">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("alacak") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("alacak") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" Width="70px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="fis_id" SortExpression="fis_id" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("fis_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("fis_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="kasa_id" SortExpression="kasa_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("kasa_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Bind("kasa_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="pos_id" SortExpression="pos_id" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("pos_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label15" runat="server" Text='<%# Bind("pos_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="banka_hesap_id" SortExpression="banka_hesap_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("banka_hesap_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label16" runat="server" Text='<%# Bind("banka_hesap_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
    </asp:Panel>
    <!-- ARAMA PANELİ son-->
     <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>   
</asp:Content>

