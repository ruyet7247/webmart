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
                <asp:Label ID="lbl_stok_id" runat="server" Text="0" Visible="False"></asp:Label>
            </td>
            <td class="style4">
                </td>
            <td class="style5" align="left" rowspan="6" valign="top">
                <asp:TabContainer ID="pnl_tab1" runat="server" ActiveTabIndex="0" 
                    Height="100%" Width="100%">
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="CARİYİ BORÇLANDIR / ALACAKLANDIR"  style="float:left;"><HeaderTemplate>STOK GİRİŞ / ÇIKIŞ</HeaderTemplate><ContentTemplate><asp:Panel ID="Panel1" runat="server"><table style="width:100%;"><tr><td class="style3">
                        <asp:Label 
                        ID="lbl_stok_hareket_id" runat="server" Text="0" Visible="False"></asp:Label></td><td>&#160;</td><td>&#160;</td></tr><tr><td class="style3">GİRİŞ/ÇIKIŞ</td><td>
                        <asp:DropDownList 
                        ID="dd_giris_or_cikis" runat="server"><asp:ListItem Selected="True" Value="giris">Stok Giriş</asp:ListItem>
                            <asp:ListItem Value="cikis">Stok Çıkış</asp:ListItem></asp:DropDownList></td><td>&#160;</td></tr><tr><td class="style3">Tarih</td><td><asp:TextBox ID="txt_kayit_tarihi" placeholder="DD/MM/YYYY"  runat="server"></asp:TextBox><asp:CalendarExtender ID="txt_kayit_tarihi_CalendarExtender" runat="server" Format="dd/MM/yyyy" 
                                                Enabled="True" TargetControlID="txt_kayit_tarihi"></asp:CalendarExtender></td><td>
                            <asp:ImageButton 
                            ID="ibtn_yeni_giris_cikis" runat="server" 
                                                AlternateText="Yeni" ImageUrl="~/Icons/res3232/arti.png" /></td></tr><tr><td class="style3">Belge No</td><td><asp:TextBox ID="txt_belge_no" runat="server"></asp:TextBox></td><td>
                            <asp:ImageButton ID="ibtn_kaydet" runat="server" AlternateText="Kaydet" 
                                onclick="ibtn_kaydet_Click" ImageUrl="~/Icons/res3232/save2.png" /></td></tr><tr><td class="style3">Açıklama</td><td><asp:TextBox 
                            ID="txt_aciklama" runat="server" Width="200px"></asp:TextBox></td><td>&#160;</td></tr><tr><td class="style3">Adet</td><td>
                        <asp:TextBox 
                        ID="txt_miktar" runat="server" Width="80px"></asp:TextBox></td><td>&#160;</td></tr><tr><td 
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
                <asp:ImageButton ID="ibtn_stok_bul" runat="server" 
                    AlternateText="StokBul" ImageUrl="~/Icons/res3232/arama2.png" />
                <asp:ModalPopupExtender ID="ibtn_stok_bul_ModalPopupExtender" runat="server" 
                    DynamicServicePath="" Enabled="True" 
                    PopupControlID="pnl_stok_arama" TargetControlID="ibtn_stok_bul" 
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
    <asp:Panel ID="pnl_stok_hareket" runat="server" BorderStyle="Solid" 
        BorderWidth="1px">
        <asp:GridView ID="gv_listele" runat="server" Width="100%" 
            AutoGenerateColumns="False" DataKeyNames="stok_hareket_id" 
            onrowdeleting="gv_listele_RowDeleting" 
            onrowcreated="gv_listele_RowCreated" onrowdatabound="gv_listele_RowDataBound">

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
                <asp:TemplateField HeaderText="Tarih" SortExpression="kayit_tarihi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("kayit_tarihi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("kayit_tarihi", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="75px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="İşlem Tipi" SortExpression="islem_tipi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("islem_tipi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("islem_tipi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="30px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Giriş/Çıkış" SortExpression="giris_or_cikis">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("giris_or_cikis") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("giris_or_cikis") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="30px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Miktar" SortExpression="miktar">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("miktar") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("miktar") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Birim" SortExpression="birim">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("birim") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("birim") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="30px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Açıklama" SortExpression="aciklama1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("aciklama1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("aciklama1") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Birim Fiyat" SortExpression="birim_fiyat">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("birim_fiyat") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("birim_fiyat") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" Width="70px" />
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
                <asp:TemplateField HeaderText="Kdv Oran" SortExpression="kdv_oran">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("kdv_oran") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("kdv_oran") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="20px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tutar" SortExpression="tutar">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("tutar") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("tutar") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" Width="70px" />
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
				<asp:CommandField ButtonType="Image" 
                    DeleteImageUrl="~/icons/res3232/iptal2.png" ShowDeleteButton="True">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20px" />
                </asp:CommandField>
            </Columns>

        </asp:GridView>
      
    </asp:Panel>
        <!-- ARAMA PANELİ-->
    <asp:Panel ID="pnl_stok_arama" runat="server" BackColor="#B6B7BC" Width="60%" 
        Height="500px" > <!-- CssClass="Popup" align="center" style = "display:none"  -->
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
                        <asp:ImageButton ID="ibtn_arama" runat="server" onclick="ibtn_arama_Click" 
                            ImageUrl="~/Icons/res3232/arama2.png"/>
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
                     onselectedindexchanged="gv_arama_listele_SelectedIndexChanged" 
                     CssClass="GridViewClass" onrowcreated="gv_arama_listele_RowCreated" 
                     onrowdatabound="gv_arama_listele_RowDataBound">
                     <Columns>
                         <asp:TemplateField HeaderText="stok_id" InsertVisible="False" 
                             SortExpression="stok_id" Visible="False">
                             <EditItemTemplate>
                                 <asp:Label ID="lbl_stok_id" runat="server" Text='<%# Bind("stok_id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="lbl_stok_id" runat="server" Text='<%# Bind("stok_id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Kod No" SortExpression="stok_kod_no">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("stok_kod_no") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("stok_kod_no") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="100px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Barkod No" SortExpression="stok_barkod_no">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("stok_barkod_no") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label7" runat="server" Text='<%# Bind("stok_barkod_no") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="100px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Stok Adı" SortExpression="stok_adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("stok_adi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("stok_adi") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="150px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Birim" SortExpression="birimi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("birimi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("birimi") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="50px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="KDV" SortExpression="kdv">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("kdv") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("kdv") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="30px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Alış Fiyatı" SortExpression="alis_fiyati">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("alis_fiyati") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label6" runat="server" Text='<%# Bind("alis_fiyati") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Right" Width="70px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Satış Fiyatı" SortExpression="satis_fiyati">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("satis_fiyati") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Bind("satis_fiyati") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Right" Width="70px" />
                         </asp:TemplateField>
                         <asp:CommandField ButtonType="Image" SelectImageUrl="~/icons/res3232/sagok.png" 
                            ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20px" />
                        </asp:CommandField>
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



