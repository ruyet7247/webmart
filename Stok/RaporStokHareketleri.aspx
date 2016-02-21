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
                        onclick="ibtn_raporla_Click" ImageUrl="~/Icons/res3232/ok.png" />
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
            onrowcreated="gv_listele_RowCreated" 
            onrowdatabound="gv_listele_RowDataBound" CssClass="GridViewClass">

            <Columns>
                <asp:TemplateField HeaderText="stok_hareket_id" InsertVisible="False" 
                    SortExpression="stok_hareket_id" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("stok_hareket_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("stok_hareket_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="stok_id" SortExpression="stok_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("stok_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("stok_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Kayıt Tarihi" SortExpression="kayit_tarihi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("kayit_tarihi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("kayit_tarihi", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="İşlem Tipi" SortExpression="islem_tipi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("islem_tipi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("islem_tipi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Giriş/Çıkış" SortExpression="giris_or_cikis">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("giris_or_cikis") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("giris_or_cikis") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Miktar" SortExpression="miktar">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("miktar") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("miktar") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Birim" SortExpression="birim">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("birim") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("birim") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Açıklama" SortExpression="aciklama1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("aciklama1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("aciklama1") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Birim Fiyat" SortExpression="birim_fiyat">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("birim_fiyat") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("birim_fiyat") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="iskonto" SortExpression="iskonto" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("iskonto") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("iskonto") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Kdv" SortExpression="kdv_oran">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("kdv_oran") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("kdv_oran") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="20px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tutar" SortExpression="tutar">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("tutar") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("tutar") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="cari_id" SortExpression="cari_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("cari_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("cari_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="evrak_no" SortExpression="evrak_no" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("evrak_no") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Bind("evrak_no") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="fis_id" SortExpression="fis_id" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("fis_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label15" runat="server" Text='<%# Bind("fis_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="fatura_id" SortExpression="fatura_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("fatura_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label16" runat="server" Text='<%# Bind("fatura_id") %>'></asp:Label>
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

