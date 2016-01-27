<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StokHareket.aspx.cs" Inherits="Stok_StokHareket" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
        .style5
        {
            width: 50%;
            
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:Panel ID="pnl_cari_bilgi" runat="server" BorderStyle="Solid">
    <table style="width:100%;">
        <tr>
            <td class="style3">
                <asp:Label ID="lbl_stok_id" runat="server" Text="0"></asp:Label>
            </td>
            <td class="style4">
                </td>
            <td class="style5" align="left" rowspan="6" valign="top">
                <asp:TabContainer ID="pnl_tab1" runat="server" ActiveTabIndex="0" 
                    Height="100%" Width="100%">
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="CARİYİ BORÇLANDIR / ALACAKLANDIR"  style="float:left;"><HeaderTemplate>STOK GİRİŞ / ÇIKIŞ</HeaderTemplate><ContentTemplate><asp:Panel ID="Panel1" runat="server"><table style="width:100%;"><tr><td class="style3"><asp:Label 
                        ID="lbl_stok_hareket_id" runat="server" Text="0"></asp:Label></td><td>&#160;</td><td>&#160;</td></tr><tr><td class="style3">GİRİŞ/ÇIKIŞ</td><td>
                        <asp:DropDownList 
                        ID="dd_giris_or_cikis" runat="server"><asp:ListItem Selected="True" Value="giris">Stok Giriş</asp:ListItem>
                            <asp:ListItem Value="cikis">Stok Çıkış</asp:ListItem></asp:DropDownList></td><td>&#160;</td></tr><tr><td class="style3">Tarih</td><td><asp:TextBox ID="txt_kayit_tarihi" placeholder="DD/MM/YYYY"  runat="server"></asp:TextBox><asp:CalendarExtender ID="txt_kayit_tarihi_CalendarExtender" runat="server" Format="dd/MM/yyyy" 
                                                Enabled="True" TargetControlID="txt_kayit_tarihi"></asp:CalendarExtender></td><td><asp:ImageButton 
                            ID="ibtn_yeni_giris_cikis" runat="server" 
                                                AlternateText="Yeni" /></td></tr><tr><td class="style3">Belge No</td><td><asp:TextBox ID="txt_belge_no" runat="server"></asp:TextBox></td><td><asp:ImageButton ID="ibtn_kaydet" runat="server" AlternateText="Kaydet" 
                                onclick="ibtn_kaydet_Click" /></td></tr><tr><td class="style3">Açıklama</td><td><asp:TextBox 
                            ID="txt_aciklama" runat="server" Width="200px"></asp:TextBox></td><td>&#160;</td></tr><tr><td class="style3">Adet</td><td><asp:TextBox 
                        ID="txt_adet" runat="server" Width="80px"></asp:TextBox></td><td>&#160;</td></tr><tr><td 
                        class="style3">&#160;</td><td>&#160;</td><td>&#160;</td></tr></table></asp:Panel></ContentTemplate></asp:TabPanel>
                </asp:TabContainer>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Stok Adı</td>
            <td class="style4">
                <asp:TextBox ID="txt_stok_adi" runat="server" Width="250px" ReadOnly="True" 
                    Font-Size="16pt" Height="30px"></asp:TextBox>
                <asp:ImageButton ID="ibtn_stok_bul" runat="server" Height="30px" Width="50px" 
                    AlternateText="CariBul" onclick="ibtn_stok_bul_Click" />
                <asp:ModalPopupExtender ID="ibtn_stok_bul_ModalPopupExtender" runat="server" 
                    DynamicServicePath="" Enabled="True" 
                    PopupControlID="pnl_cari_arama" TargetControlID="ibtn_stok_bul" 
                    BackgroundCssClass="popupPanel" CancelControlID="btn_stok_bul_kapat">
                </asp:ModalPopupExtender>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Grubu</td>
            <td class="style4">
                 <asp:DropDownList ID="dd_grup_id" runat="server" DataSourceID="SqlDataSource2" 
                    DataTextField="stok_grubu_adi" DataValueField="stok_grubu_id" Width="150px" 
                     Enabled="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CnnStr %>" 
                    SelectCommand="SELECT * FROM [stok_grubu_tanimlama]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Toplam Giriş</td>
            <td class="style4">
                <asp:TextBox ID="txt_giren" runat="server" Width="80px" ReadOnly="True" 
                    CssClass="sagaDayaliFormat" Font-Size="16pt" Height="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Toplam Çıkış</td>
            <td class="style4">
                <asp:TextBox ID="txt_cikan" runat="server" Width="80px" 
                    ReadOnly="True" CssClass="sagaDayaliFormat" Font-Size="16pt" Height="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Stok Miktarı</td>
            <td class="style4">
                <asp:TextBox ID="txt_stok_miktari" runat="server" Width="80px" ReadOnly="True" 
                    CssClass="sagaDayaliFormat" Font-Size="16pt" Height="30px"></asp:TextBox>
            </td>
        </tr>
</table>
    </asp:Panel>
    <asp:Panel ID="pnl_butonlar" runat="server" BorderStyle="Solid">
    </asp:Panel>
    <asp:Panel ID="pnl_cari_hareket" runat="server" BorderStyle="Solid" 
        BorderWidth="1px">
        <asp:GridView ID="gv_listele" runat="server" Width="100%" 
            AutoGenerateColumns="False" DataKeyNames="stok_hareket_id" 
            onrowdeleting="gv_listele_RowDeleting">

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
                <asp:BoundField DataField="kdv" HeaderText="kdv" SortExpression="kdv" />
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
        <!-- ARAMA PANELİ-->
    <asp:Panel ID="pnl_cari_arama" runat="server" BackColor="#B6B7BC" Width="60%" Height="500px" > <!-- CssClass="Popup" align="center" style = "display:none"  -->
     <table width="100%"> 
            <tr>
            <td class="style3">
                <asp:Label ID="lbl_baslik" runat="server" Font-Bold="True">Stok Kartı Bul</asp:Label>
                    </td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%" align="right" valign="middle">
                <asp:Button ID="btn_stok_bul_kapat" runat="server" Height="20px"
                 Text="X" Width="20px" />
                    </td>
        </tr>
      
                <tr>
                    <td class="style3">
                        Unvan Adı</td>
                    <td width="20%">
                        <asp:TextBox ID="txt_arama" runat="server"></asp:TextBox>
                    </td>
                    <td width="20%">
                        <asp:ImageButton ID="ibtn_arama" runat="server" onclick="ibtn_arama_Click"/>
                    </td>
                    <td width="20%">
                        &nbsp;</td>
                    <td width="20%">
                        &nbsp;</td>
                </tr>
      
    </table> 
    
    
       <!-- <iframe style=" width: 99%; height: 90%;" id="ifrm" src="CariBul.aspx" runat="server"></iframe> -->

         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
     
                 <asp:GridView ID="gv_arama_listele" runat="server" AutoGenerateColumns="False" 
                     DataKeyNames="stok_id" Width="100%" BackColor="#CCFFFF" 
                     onselectedindexchanged="gv_arama_listele_SelectedIndexChanged">
                     <Columns>
                         <asp:BoundField DataField="stok_id" HeaderText="stok_id" InsertVisible="False" 
                             ReadOnly="True" SortExpression="stok_id" />
                         <asp:BoundField DataField="stok_adi" HeaderText="stok_adi" 
                             SortExpression="stok_adi" />
                         <asp:BoundField DataField="birimi" HeaderText="birimi" 
                             SortExpression="birimi" />
                         <asp:BoundField DataField="giren" HeaderText="giren" SortExpression="giren" />
                         <asp:BoundField DataField="cikan" HeaderText="cikan" SortExpression="cikan" />
                         <asp:BoundField DataField="alis_fiyati" HeaderText="alis_fiyati" 
                             SortExpression="alis_fiyati" />
                         <asp:BoundField DataField="satis_fiyati" HeaderText="satis_fiyati" 
                             SortExpression="satis_fiyati" />
                     </Columns>
                 </asp:GridView>
             </ContentTemplate>
             <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="ibtn_arama" EventName="Click" />
             </Triggers>
      </asp:UpdatePanel> 
    </asp:Panel>

    <!-- ARAMA PANELİ son-->

       <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>   
</asp:Content>



