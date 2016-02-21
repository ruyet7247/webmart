<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PosHareket.aspx.cs" Inherits="Kasa_PosHareket" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        
        .style3
        {
            width: 12%;
        }
     
        .style4
        {
            width: 30%;
            
            
        }
        .style5
        {
            width: 43%;
            
        }
        .style6
        {
            width: 20%;
            
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:Panel ID="pnl_kasa_bilgi" runat="server" BorderStyle="Solid">
    <table style="width:100%;">
        <tr>
            <td class="style3">
                <asp:Label ID="lbl_pos_id" runat="server" Text="0" Visible="False"></asp:Label>
            </td>
            <td class="style4">
                </td>
            <td class="style5" align="left" rowspan="7" valign="top">
                <asp:TabContainer ID="pnl_tab1" runat="server" ActiveTabIndex="0" 
                    Height="100%" Width="100%">
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="CARİYİ BORÇLANDIR / ALACAKLANDIR"  style="float:left;"><HeaderTemplate>
                        POS GİRİŞ / ÇIKIŞ</HeaderTemplate><ContentTemplate><asp:Panel ID="Panel1" runat="server"><table style="width:100%;"><tr>
                            <td class="style6">
                            <asp:Label 
                        ID="lbl_pos_hareket_id" runat="server" Text="0" Visible="False"></asp:Label></td><td>&#160;</td><td>&#160;</td></tr><tr>
                            <td class="style6">GİRİŞ/ÇIKIŞ</td><td>
                        <asp:DropDownList 
                        ID="dd_giris_or_cikis" runat="server"><asp:ListItem Selected="True" Value="giris">POS GİRİŞ [ + ]</asp:ListItem>
                            <asp:ListItem Value="cikis">POS ÇIKIŞ [ - ]</asp:ListItem></asp:DropDownList></td><td>&#160;</td></tr><tr>
                            <td class="style6">
                                İşlem Tarihi</td><td>
                                <asp:TextBox ID="txt_kayit_tarihi" placeholder="DD/MM/YYYY"  
                                    runat="server"></asp:TextBox>
                                <asp:CalendarExtender ID="txt_kayit_tarihi_CalendarExtender" runat="server" Format="dd/MM/yyyy" 
                                                Enabled="True" TargetControlID="txt_kayit_tarihi"></asp:CalendarExtender></td><td>
                                <asp:ImageButton 
                            ID="ibtn_yeni_giris_cikis" runat="server" 
                                                AlternateText="Yeni" ImageUrl="~/Icons/res3232/arti.png" /></td></tr><tr><td class="style6">Belge No</td><td>
                                <asp:TextBox ID="txt_belge_no" runat="server"></asp:TextBox>
                                </td><td>
                                    <asp:ImageButton ID="ibtn_kaydet" runat="server" AlternateText="Kaydet" 
                                onclick="ibtn_kaydet_Click" ImageUrl="~/Icons/res3232/save2.png" /></td></tr><tr><td class="style6">Açıklama</td><td>
                                <asp:TextBox ID="txt_aciklama" runat="server" Width="200px"></asp:TextBox>
                                </td><td>&#160;</td></tr><tr><td class="style6">
                            TUTAR</td><td>
                                <asp:TextBox ID="txt_tutar" runat="server" Width="120px"></asp:TextBox>
                            </td><td>&#160;</td></tr><tr><td 
                        class="style6">&nbsp;</td><td>&nbsp;</td><td>&#160;</td></tr></table></asp:Panel></ContentTemplate></asp:TabPanel>
                </asp:TabContainer>
            </td>
        </tr>
        <tr>
            <td class="style3">
                POS (Banka) Adı</td>
            <td class="style4">
                <asp:TextBox ID="txt_pos_banka_adi" runat="server" Width="250px" ReadOnly="True" 
                    Font-Size="16pt" Height="30px"></asp:TextBox>
                <asp:ImageButton ID="pos" runat="server" 
                    AlternateText="PosBul" ImageUrl="~/Icons/res3232/arama2.png" />
                <asp:ModalPopupExtender ID="pos_ModalPopupExtender" runat="server" 
                    DynamicServicePath="" Enabled="True" 
                    PopupControlID="pnl_pos_arama" TargetControlID="pos" 
                    BackgroundCssClass="popupPanel" CancelControlID="btn_pos_bul_kapat">
                </asp:ModalPopupExtender>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Tahakkuk Gün Sayısı</td>
            <td class="style4">
                <asp:TextBox ID="txt_tahakkuk_gun_sayisi" runat="server" Font-Size="16pt" Height="30px" 
                    ReadOnly="True" Width="50px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Bağlı Banka</td>
            <td class="style4">
                 <asp:DropDownList ID="dd_bagli_olan_banka_hesap_id" runat="server" DataSourceID="SqlDataSource_banka_hesap_id" 
                    DataTextField="banka_adi" DataValueField="banka_hesap_id" Width="150px" 
                     Enabled="False">
                </asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource_banka_hesap_id" runat="server" 
                      
                     SelectCommand="SELECT [banka_hesap_id], [banka_adi] FROM [banka_kayit]">
                 </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Toplam Giriş</td>
            <td class="style4">
                <asp:TextBox ID="txt_giren" runat="server" Width="150px" ReadOnly="True" 
                    CssClass="sagaDayaliFormat" Font-Size="16pt" Height="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Toplam Çıkış</td>
            <td class="style4">
                <asp:TextBox ID="txt_cikan" runat="server" Width="150px" 
                    ReadOnly="True" CssClass="sagaDayaliFormat" Font-Size="16pt" Height="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Toplam Pos Bakiyesi</td>
            <td class="style4">
                <asp:TextBox ID="txt_pos_bakiyesi" runat="server" Width="150px" ReadOnly="True" 
                    CssClass="sagaDayaliFormat" Font-Size="16pt" Height="30px"></asp:TextBox>
            </td>
        </tr>
</table>
    </asp:Panel>
    <asp:Panel ID="pnl_butonlar" runat="server" BorderStyle="Solid">
    </asp:Panel>
    <asp:Panel ID="pnl_stok_hareket" runat="server" BorderStyle="Solid" 
        BorderWidth="1px">
        <asp:GridView ID="gv_listele" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="pos_hareket_id" Width="100%" 
            onrowdeleting="gv_listele_RowDeleting" 
            onrowcreated="gv_listele_RowCreated" 
            onrowdatabound="gv_listele_RowDataBound" CssClass="GridViewClass">
            <Columns>
                <asp:TemplateField HeaderText="pos_hareket_id" InsertVisible="False" 
                    SortExpression="pos_hareket_id" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("pos_hareket_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_pos_hareket_id" runat="server" Text='<%# Bind("pos_hareket_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="pos_id" SortExpression="pos_id" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pos_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("pos_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tarih" SortExpression="kayit_tarihi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("kayit_tarihi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("kayit_tarihi", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ödeme Tarihi" SortExpression="odeme_tarihi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("odeme_tarihi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("odeme_tarihi", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Giriş / Çıkış" SortExpression="giris_or_cikis">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("giris_or_cikis") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("giris_or_cikis") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Açıklama" SortExpression="aciklama1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("aciklama1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("aciklama1") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="personel_adi" SortExpression="personel_adi" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("personel_adi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("personel_adi") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tutar" SortExpression="tutar">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("tutar") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("tutar") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="banka_hesap_id" SortExpression="banka_hesap_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("banka_hesap_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("banka_hesap_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="cari_id" SortExpression="cari_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("cari_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("cari_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="cari_hareket_id" 
                    SortExpression="cari_hareket_id" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" 
                            Text='<%# Bind("cari_hareket_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("cari_hareket_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="personel_cari_maas_hareket_id" 
                    SortExpression="personel_cari_maas_hareket_id" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" 
                            Text='<%# Bind("personel_cari_maas_hareket_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" 
                            Text='<%# Bind("personel_cari_maas_hareket_id") %>'></asp:Label>
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
    <asp:Panel ID="pnl_pos_arama" runat="server" BackColor="#B6B7BC" Width="60%" 
        Height="500px" > <!-- CssClass="Popup" align="center" style = "display:none"  -->
     <table width="100%"> 
            <tr>
            <td class="style3">
                <asp:Label ID="lbl_baslik" runat="server" Font-Bold="True">Pos Bul</asp:Label>
                    </td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%" align="right" valign="middle">
                <asp:Button ID="btn_pos_bul_kapat" runat="server" Height="20px"
                 Text="X" Width="20px" />
                    </td>
        </tr>
      
                <tr>
                    <td class="style3">
                        Pos Adı</td>
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
                     DataKeyNames="pos_id" Width="100%" BackColor="#CCFFFF" 
                     onselectedindexchanged="gv_arama_listele_SelectedIndexChanged" 
                     onrowcreated="gv_arama_listele_RowCreated" 
                     onrowdatabound="gv_arama_listele_RowDataBound" CssClass="GridViewClass" >
                     <Columns>
                         <asp:TemplateField HeaderText="pos_id" InsertVisible="False" 
                             SortExpression="pos_id" Visible="False">
                             <EditItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("pos_id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="lbl_pos_id" runat="server" Text='<%# Bind("pos_id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Pos Banka Adı" SortExpression="pos_banka_adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pos_banka_adi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("pos_banka_adi") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="150px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Tahakkuk Gün Sayısı" 
                             SortExpression="tahakkuk_gun_sayisi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" 
                                     Text='<%# Bind("tahakkuk_gun_sayisi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("tahakkuk_gun_sayisi") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" Width="100px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Bağlı Banka Adı" SortExpression="banka_adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("banka_adi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("banka_adi") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="100px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Bağlı Hesap No" SortExpression="hesap_no">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("hesap_no") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Bind("hesap_no") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="100px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="bagli_olan_banka_hesap_id" 
                             SortExpression="bagli_olan_banka_hesap_id" Visible="False">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" 
                                     Text='<%# Bind("bagli_olan_banka_hesap_id") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" 
                                     Text='<%# Bind("bagli_olan_banka_hesap_id") %>'></asp:Label>
                             </ItemTemplate>
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

