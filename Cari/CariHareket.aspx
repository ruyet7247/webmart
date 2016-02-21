<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CariHareket.aspx.cs" Inherits="Cari_CariHareket" %>

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
                <asp:Label ID="lbl_cari_id" runat="server" Text="0" Visible="False"></asp:Label>
            </td>
            <td class="style4">
                </td>
            <td class="style5" align="left" rowspan="6" valign="top">
                <asp:TabContainer ID="pnl_tab1" runat="server" ActiveTabIndex="0" 
                    Height="100%" Width="100%">
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="CARİYİ BORÇLANDIR / ALACAKLANDIR"  style="float:left;"><ContentTemplate><asp:Panel ID="Panel1" runat="server"><table style="width:100%;"><tr><td class="style3">
                        <asp:Label ID="lbl_cari_hareket_id" runat="server" Text="0" Visible="False"></asp:Label></td><td>&#160;</td><td>&#160;</td></tr><tr><td class="style3">BORÇ/ALACAK</td><td>
                        <asp:DropDownList ID="dd_borc_or_alacak" runat="server"><asp:ListItem Selected="True" Value="borc">BORÇLANDIR</asp:ListItem><asp:ListItem Value="alacak">ALACAKLANDIR</asp:ListItem></asp:DropDownList></td><td>&#160;</td></tr><tr><td class="style3">Tarih</td><td><asp:TextBox ID="txt_kayit_tarihi" placeholder="DD/MM/YYYY"  runat="server"></asp:TextBox><asp:CalendarExtender ID="txt_kayit_tarihi_CalendarExtender" runat="server" Format="dd/MM/yyyy" 
                                                Enabled="True" TargetControlID="txt_kayit_tarihi"></asp:CalendarExtender></td><td>
                            <asp:ImageButton ID="ibtn_yeni_borc_alacak" runat="server" 
                                                AlternateText="Yeni" ImageUrl="~/Icons/res3232/arti.png" /></td></tr><tr><td class="style3">Belge No</td><td><asp:TextBox ID="txt_belge_no" runat="server"></asp:TextBox></td><td>
                            <asp:ImageButton ID="ibtn_kaydet" runat="server" AlternateText="Kaydet" 
                                onclick="ibtn_kaydet_Click" ImageUrl="~/Icons/res3232/save2.png" /></td></tr><tr><td class="style3">Ödeme Şekli</td><td>
                        <asp:DropDownList ID="dd_odeme_sekli" runat="server" 
                            DataSourceID="SqlDataSource_odeme_sekli" DataTextField="odeme_sekli_adi" 
                            DataValueField="odeme_sekli" 
                            OnSelectedIndexChanged="dd_odeme_sekli_SelectedIndexChanged" 
                            AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource_odeme_sekli" runat="server" 
                             
                            SelectCommand="SELECT [odeme_sekli], [odeme_sekli_adi] FROM [cari_odeme_sekli_tanimlama]">
                        </asp:SqlDataSource>
                        </td><td>&#160;</td></tr><tr><td class="style3">Bağlı Hesap</td><td>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="dd_bagli_hesap" runat="server" 
                                            onselectedindexchanged="dd_islem_tipi_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="dd_odeme_sekli" 
                                            EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td><td>&#160;</td></tr><tr><td class="style3">Açıklama</td><td><asp:TextBox 
                            ID="txt_aciklama" runat="server" Width="200px"></asp:TextBox></td><td>&#160;</td></tr><tr><td class="style3">&#160;</td><td>
                        &nbsp;</td><td>&#160;</td></tr><tr><td class="style3">Tutar</td><td><asp:TextBox 
                            ID="txt_tutar" runat="server"></asp:TextBox></td><td>&#160;</td></tr><tr><td class="style3">&#160;</td><td>&#160;</td><td>&#160;</td></tr></table></asp:Panel></ContentTemplate></asp:TabPanel>
                </asp:TabContainer>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Cari Ünvanı</td>
            <td class="style4">
                <asp:TextBox ID="txt_unvan" runat="server" Width="250px" ReadOnly="True" 
                    Font-Size="16pt" Height="30px"></asp:TextBox>
                <asp:ImageButton ID="ibtn_cari_bul" runat="server" 
                    AlternateText="CariBul" ImageUrl="~/Icons/res3232/arama2.png" />
                <asp:ModalPopupExtender ID="ibtn_cari_bul_ModalPopupExtender" runat="server" 
                    DynamicServicePath="" Enabled="True" 
                    PopupControlID="pnl_cari_arama" TargetControlID="ibtn_cari_bul" 
                    BackgroundCssClass="popupPanel" CancelControlID="btn_cari_bul_kapat">
                </asp:ModalPopupExtender>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Grubu</td>
            <td class="style4">
                 <asp:DropDownList ID="dd_grup_id" runat="server" DataSourceID="SqlDataSource2" 
                    DataTextField="cari_grubu_adi" DataValueField="cari_grubu_id" Width="150px" 
                     Enabled="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                     
                    SelectCommand="SELECT * FROM [cari_grubu_tanimlama]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Borç Bakiye</td>
            <td class="style4">
                <asp:TextBox ID="txt_borc_bakiye" runat="server" Width="180px" ReadOnly="True" 
                    CssClass="sagaDayaliFormat" Font-Size="16pt" Height="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Alacak Bakiye</td>
            <td class="style4">
                <asp:TextBox ID="txt_alacak_bakiye" runat="server" Width="180px" 
                    ReadOnly="True" CssClass="sagaDayaliFormat" Font-Size="16pt" Height="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Bakiye</td>
            <td class="style4">
                <asp:TextBox ID="txt_bakiye" runat="server" Width="180px" ReadOnly="True" 
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
            AutoGenerateColumns="False" DataKeyNames="cari_hareket_id" 
            onrowdeleting="gv_listele_RowDeleting" AllowPaging="True" 
            CssClass="GridViewClass" onpageindexchanging="gv_listele_PageIndexChanging" 
            onrowcreated="gv_listele_RowCreated" onrowdatabound="gv_listele_RowDataBound" 
            PageSize="20">

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
                <asp:TemplateField HeaderText="TARİH" SortExpression="kayit_tarihi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("kayit_tarihi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("kayit_tarihi", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="75px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="borc_or_alacak" SortExpression="borc_or_alacak" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("borc_or_alacak") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("borc_or_alacak") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="İşlem Tipi" SortExpression="islem_tipi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("islem_tipi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("islem_tipi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="70px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ödeme Şekli" SortExpression="odeme_sekli">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("odeme_sekli") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("odeme_sekli") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="70px" />
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
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Açıklama" SortExpression="aciklama1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("aciklama1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("aciklama1") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="200px" />
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
                <asp:TemplateField HeaderText="Borç Tutar" SortExpression="borc">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("borc") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("borc") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="80px" HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Alacak Tutar" SortExpression="alacak">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("alacak") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("alacak") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="80px" HorizontalAlign="Right" />
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
                <asp:CommandField ButtonType="Image" 
                    DeleteImageUrl="~/icons/res3232/iptal2.png" ShowDeleteButton="True">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20px" />
                </asp:CommandField>
            </Columns>

        </asp:GridView>
        
    </asp:Panel>
        <!-- ARAMA PANELİ-->
    <asp:Panel ID="pnl_cari_arama" runat="server" BackColor="#B6B7BC" Width="60%" Height="500px" > <!-- CssClass="Popup" align="center" style = "display:none"  -->
     <table width="100%"> 
            <tr>
            <td class="style3">
                <asp:Label ID="lbl_baslik" runat="server" Font-Bold="True">Cari Kartı Bul</asp:Label>
                    </td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%" align="right" valign="middle">
                <asp:Button ID="btn_cari_bul_kapat" runat="server" Height="20px"
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
                     DataKeyNames="cari_id" Width="100%" BackColor="#CCFFFF" 
                     onselectedindexchanged="gv_arama_listele_SelectedIndexChanged" 
                     AllowPaging="True" CssClass="GridViewClass" 
                     onpageindexchanging="gv_arama_listele_PageIndexChanging" 
                     onrowcreated="gv_arama_listele_RowCreated" 
                     onrowdatabound="gv_arama_listele_RowDataBound">
                     <Columns>
                         <asp:TemplateField HeaderText="Cari id" InsertVisible="False" 
                             SortExpression="cari_id">
                             <EditItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("cari_id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="lbl_cari_id" runat="server" Text='<%# Bind("cari_id") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="20px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="ADI" SortExpression="adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("adi") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="150px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="SOYADI" SortExpression="soyadi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("soyadi") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="150px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="UNVAN" SortExpression="unvan">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("unvan") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("unvan") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="150px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="GSM" SortExpression="adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("gsm1") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("gsm1") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="100px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Borç Bakiye" SortExpression="borc_bakiye">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("borc_bakiye") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Bind("borc_bakiye") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Right" Width="100px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Alacak Bakiye" SortExpression="alacak_bakiye">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("alacak_bakiye") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label6" runat="server" Text='<%# Bind("alacak_bakiye") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Right" Width="100px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Bakiye" SortExpression="bakiye">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("bakiye") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label7" runat="server" Text='<%# Bind("bakiye") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Right" Width="100px" />
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

