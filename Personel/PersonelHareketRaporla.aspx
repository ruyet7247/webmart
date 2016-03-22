<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PersonelHareketRaporla.aspx.cs" Inherits="Personel_PersonelHareketRaporla" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
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
    .style6
    {
        width: 8%;
    }
    .style7
    {
        width: 8%;
        height: 40px;
    }
    .style9
    {
        width: 19%;
        height: 40px;
    }
        .style10
        {
            width: 19%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
     <asp:Panel ID="pnl_baslik" runat="server">
             PERSONEL BORDRO VE HAREKETLERİNİ LİSTELE</asp:Panel>
    <asp:Panel ID="Panel1" runat="server">
        <table style="width:100%;">
            <tr>
                <td class="style6">
                    &nbsp;</td>
                <td class="style10">
                    &nbsp;</td>
                <td align="right" class="style3">
                    &nbsp;</td>
                <td>
                             &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    Tarih Aralığı</td>
                <td class="style10">
                            <asp:TextBox ID="txt_bas_tarih" runat="server" Width="80px"></asp:TextBox>
                            <asp:TextBox ID="txt_son_tarih" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td align="left" class="style3">
                    <asp:ImageButton ID="ibtn_raporla" runat="server" 
                        ImageUrl="~/Icons/res3232/arama2.png" onclick="ibtn_raporla_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    Borç/Alacak</td>
                <td class="style10">
                    <asp:DropDownList ID="dd_borc_or_alacak" runat="server">
                        <asp:ListItem Value="tum">- Seçiniz -</asp:ListItem>
                        <asp:ListItem Value="borc">Borç</asp:ListItem>
                        <asp:ListItem Value="alacak">Alacak</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left" class="style3">
                    &nbsp;</td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource_islemtipi" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:WebMart0001 %>" 
                        SelectCommand="SELECT [islem_tipi_value], [islem_tipi_adi] FROM [personel_islem_tipi_tanimlama]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    İşlem Tipi</td>
                <td class="style10">
                    <asp:DropDownList ID="dd_islemtipi" runat="server" 
                        DataSourceID="SqlDataSource_islemtipi" DataTextField="islem_tipi_adi" 
                        DataValueField="islem_tipi_value" ondatabound="dd_islemtipi_DataBound" 
                        Width="150px">
                    </asp:DropDownList>
                </td>
                <td align="left" class="style3">
                    &nbsp;</td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource_odemesekli" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:WebMart0001 %>" 
                        SelectCommand="SELECT [odeme_sekli], [odeme_sekli_adi] FROM [cari_odeme_sekli_tanimlama]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Ödeme Şekli</td>
                <td class="style10">
                    <asp:CalendarExtender ID="txt_bas_tarih_CalendarExtender" runat="server" 
                        Enabled="True" Format="dd.MM.yyyy" TargetControlID="txt_bas_tarih">
                    </asp:CalendarExtender>
                    <asp:CalendarExtender ID="txt_son_tarih_CalendarExtender" runat="server" 
                        Enabled="True" Format="dd.MM.yyyy" TargetControlID="txt_son_tarih">
                    </asp:CalendarExtender>
                    <asp:DropDownList ID="dd_odemesekli" runat="server" 
                        DataSourceID="SqlDataSource_odemesekli" DataTextField="odeme_sekli_adi" 
                        DataValueField="odeme_sekli" ondatabound="dd_odemesekli_DataBound" 
                        Width="150px">
                    </asp:DropDownList>
                    </td>
                <td align="left" class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    Dönem/Yıl</td>
                <td class="style10">
                    <asp:DropDownList ID="dd_ay" runat="server">
                        <asp:ListItem Value="1">Ocak</asp:ListItem>
                        <asp:ListItem Value="2">Şubat</asp:ListItem>
                        <asp:ListItem Value="3">Mart</asp:ListItem>
                        <asp:ListItem Value="4">Nisan</asp:ListItem>
                        <asp:ListItem Value="5">Mayıs</asp:ListItem>
                        <asp:ListItem Value="6">Haziran</asp:ListItem>
                        <asp:ListItem Value="7">Temmuz</asp:ListItem>
                        <asp:ListItem Value="8">Ağustos</asp:ListItem>
                        <asp:ListItem Value="9">Eylül</asp:ListItem>
                        <asp:ListItem Value="10">Ekim</asp:ListItem>
                        <asp:ListItem Value="10">Kasım</asp:ListItem>
                        <asp:ListItem Value="12">Aralık</asp:ListItem>
                    </asp:DropDownList>
                     /
                    <asp:DropDownList ID="dd_yil" runat="server">
                        <asp:ListItem>2015</asp:ListItem>
                        <asp:ListItem>2016</asp:ListItem>
                        <asp:ListItem>2017</asp:ListItem>
                        <asp:ListItem>2018</asp:ListItem>
                        <asp:ListItem>2019</asp:ListItem>
                        <asp:ListItem>2020</asp:ListItem>
                        <asp:ListItem>2021</asp:ListItem>
                        <asp:ListItem>2022</asp:ListItem>
                        <asp:ListItem>2023</asp:ListItem>
                        <asp:ListItem>2024</asp:ListItem>
                        <asp:ListItem>2025</asp:ListItem>
                        <asp:ListItem>2026</asp:ListItem>
                        <asp:ListItem>2027</asp:ListItem>
                        <asp:ListItem>2028</asp:ListItem>
                        <asp:ListItem>2029</asp:ListItem>
                        <asp:ListItem>2030</asp:ListItem>
                    </asp:DropDownList>
                    <asp:CheckBox ID="cb_donem_secimi" runat="server" Text="Aktif Filtre" />
                </td>
                <td align="left" class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
                <td class="style4">
                </td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnl_cari_hareket" runat="server" BorderStyle="Solid" 
        BorderWidth="1px">
        <asp:GridView ID="gv_listele" runat="server" Width="100%" 
            AutoGenerateColumns="False" DataKeyNames="maas_hareket_id" 
            AllowPaging="True" onpageindexchanging="gv_listele_PageIndexChanging" 
            CssClass="GridViewClass" onrowcreated="gv_listele_RowCreated" 
            onrowdatabound="gv_listele_RowDataBound" PageSize="25" BorderStyle="Solid" 
            ShowFooter="True">
            <Columns>
                <asp:TemplateField HeaderText="maas_hareket_id" InsertVisible="False" 
                    SortExpression="maas_hareket_id" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("maas_hareket_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("maas_hareket_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="personel_id" SortExpression="personel_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("personel_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("personel_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Kayıt Tarihi" SortExpression="kayit_tarihi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("kayit_tarihi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("kayit_tarihi", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Borç/Alacak" SortExpression="borc_or_alacak">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("borc_or_alacak") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("borc_or_alacak") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ödeme Şekli" SortExpression="odeme_sekli">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("odeme_sekli") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("odeme_sekli") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="İşlem Tipi" SortExpression="islem_tipi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("islem_tipi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("islem_tipi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="60px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Belge No" SortExpression="belge_no">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("belge_no") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("belge_no") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="60px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="D.Ayı" SortExpression="maas_donem_ay">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("maas_donem_ay") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("maas_donem_ay") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="D.Yılı" SortExpression="maas_donem_yil">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("maas_donem_yil") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("maas_donem_yil") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Açıklama" SortExpression="aciklama1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("aciklama1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("aciklama1") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tutar" SortExpression="tutar">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("tutar") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_tutar" runat="server" Text='<%# Bind("tutar", "{0:0.00}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                    <asp:Label ID="lbltotal" runat="server" Text="Label"></asp:Label>
                    </FooterTemplate>
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="kasa_id" SortExpression="kasa_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("kasa_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("kasa_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="pos_id" SortExpression="pos_id" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("pos_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("pos_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="banka_hesap_id" SortExpression="banka_hesap_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("banka_hesap_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Bind("banka_hesap_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Right" VerticalAlign="Bottom" 
                BorderStyle="Solid" CssClass="FooterStyle" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />    
        </asp:GridView>
    </asp:Panel>
    <!-- ARAMA PANELİ son-->
     <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>   
</asp:Content>





