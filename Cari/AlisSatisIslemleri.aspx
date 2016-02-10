<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AlisSatisIslemleri.aspx.cs" Inherits="Cari_AlisSatisIslemleri" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  <script type="text/javascript">
      function Changed(text1) {

          var miktar = document.getElementById('<%=txt_miktar.ClientID %>').value;
          var kdv = document.getElementById('<%=txt_kdv.ClientID %>').value;
          var satis_fiyati = document.getElementById('<%=txt_satis_fiyati.ClientID %>').value;

          satis_fiyati = satis_fiyati.replace(",", ".");
          kdv = kdv.replace(",", ".");

          var kdvsiz_tutar = satis_fiyati * miktar;
          var kdv_tutari = kdvsiz_tutar * kdv / 100;
          var tutar = kdv_tutari + kdvsiz_tutar;

          document.getElementById('<%=txt_kdvsiz_tutar.ClientID %>').value = kdvsiz_tutar;
          document.getElementById('<%=txt_stok_kdv_tutar.ClientID %>').value = kdv_tutari;
          document.getElementById('<%=txt_tutar.ClientID %>').value = tutar;
          

      }
        </script>
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
            width: 5%;
           
        }
          .style6
        {
            width: 50%;
           
        }




    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:Panel ID="pnl_fatura_basligi" runat="server">
        <table width="100%">
            <tr>
                <td class="style3">
                    <asp:Label ID="lbl_cari_id" runat="server" Text="0"></asp:Label>
                </td>
                <td class="style4">
                </td>
                <td class="style5">
                </td>
                <td class="style6" rowspan="7">
                    <asp:TabContainer ID="pnl_tab1" runat="server" ActiveTabIndex="0" Width="100%">
                        <asp:TabPanel ID="TabPanel1" runat="server" 
                            HeaderText="CARİYİ BORÇLANDIR / ALACAKLANDIR" style="float:left;">
                            <HeaderTemplate>
                                FATURA BİLGİLERİ
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:Panel ID="Panel1" runat="server">
                                    <table style="width:100%;">
                                        <tr>
                                            <td class="style5">
                                                <asp:Label ID="lbl_fatura_stok_hareket_id" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td class="style10">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                ALIŞ / SATIŞ</td>
                                            <td class="style10">
                                                <asp:DropDownList ID="dd_giris_or_cikis" runat="server">
                                                    <asp:ListItem Selected="True" Value="cikis">SATIŞ FATURASI</asp:ListItem>
                                                    <asp:ListItem Value="giris">ALIŞ FATURASI</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:ImageButton ID="ibtn_yeni_borc_alacak" runat="server" 
                                                    AlternateText="Yeni" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                Fatura Tarihi</td>
                                            <td class="style10">
                                                <asp:TextBox ID="txt_fatura_tarihi" runat="server" placeholder="DD/MM/YYYY"></asp:TextBox>
                                                <asp:CalendarExtender ID="txt_fatura_tarihi_CalendarExtender" runat="server" 
                                                    Enabled="True" Format="dd/MM/yyyy" TargetControlID="txt_fatura_tarihi">
                                                </asp:CalendarExtender>
                                            </td>
                                            <td>
                                                <asp:ImageButton ID="ibtn_kaydet" runat="server" AlternateText="Kaydet" 
                                                    OnClick="ibtn_kaydet_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                Fatura No</td>
                                            <td class="style10">
                                                <asp:TextBox ID="txt_fatura_no" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                &nbsp;</td>
                                            <td class="style10">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                Ara Toplam</td>
                                            <td class="style10">
                                                <asp:TextBox ID="txt_ara_toplam" runat="server" CssClass="sagaDayaliFormat" 
                                                    ReadOnly="True"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style10">
                                                Kdv Tutar</td>
                                            <td class="style10">
                                                <asp:TextBox ID="txt_kdv_toplam" runat="server" CssClass="sagaDayaliFormat" 
                                                    ReadOnly="True"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                Genel Toplam</td>
                                            <td class="style10">
                                                <asp:TextBox ID="txt_genel_toplam" runat="server" CssClass="sagaDayaliFormat" 
                                                    ReadOnly="True"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                &nbsp;</td>
                                            <td class="style10">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:TabPanel>
                    </asp:TabContainer>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Cari/Hasta Ünvanı</td>
                <td class="style4">
                    <asp:TextBox ID="txt_unvan" runat="server" Font-Size="16pt" Height="30px" 
                        ReadOnly="True" Width="250px"></asp:TextBox>
                </td>
                <td class="style5">
                    <asp:ImageButton ID="ibtn_cari_bul" runat="server" AlternateText="CariBul" 
                        Height="30px" Width="50px" />
                    <asp:ModalPopupExtender ID="ibtn_cari_bul_ModalPopupExtender" runat="server" 
                        BackgroundCssClass="popupPanel" CancelControlID="btn_cari_bul_kapat" 
                        DynamicServicePath="" Enabled="True" PopupControlID="pnl_cari_arama" 
                        TargetControlID="ibtn_cari_bul">
                    </asp:ModalPopupExtender>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Grubu</td>
                <td class="style4">
                    <asp:DropDownList ID="dd_grup_id" runat="server" DataSourceID="SqlDataSource2" 
                        DataTextField="cari_grubu_adi" DataValueField="cari_grubu_id" Enabled="False" 
                        Width="150px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                         
                        SelectCommand="SELECT * FROM [cari_grubu_tanimlama]"></asp:SqlDataSource>
                </td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Vergi Dairesi / No</td>
                <td class="style4">
                    <asp:TextBox ID="txt_vergi_dairesi" runat="server" Width="100px"></asp:TextBox>
                    <asp:TextBox ID="txt_vergi_no" runat="server" Width="100px"></asp:TextBox>
                </td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Adres</td>
                <td class="style4">
                    <asp:TextBox ID="txt_adres" runat="server" TextMode="MultiLine" Width="90%"></asp:TextBox>
                </td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Not/ Açıklama</td>
                <td class="style4">
                    <asp:TextBox ID="txt_aciklama" runat="server" TextMode="MultiLine" Width="90%"></asp:TextBox>
                </td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnl_butonlar" runat="server" BorderStyle="Solid">
        <table style="width:100%;">
            <tr>
                <td rowspan="2">
                    <asp:Label ID="lbl_stok_id" runat="server" Text="0"></asp:Label>
                    <asp:ImageButton ID="ibtn_stok_arama_ac" runat="server" />
                    <asp:ModalPopupExtender ID="ibtn_stok_arama_ac_ModalPopupExtender" 
                        runat="server" BackgroundCssClass="popupPanel" 
                        CancelControlID="btn_stok_arama_kapat" DynamicServicePath="" Enabled="True" 
                        PopupControlID="pnl_stok_arama" TargetControlID="ibtn_stok_arama_ac">
                    </asp:ModalPopupExtender>
                </td>
                <td>
                    Stok Kodu</td>
                <td>
                    Stok Adı</td>
                <td>
                    Birimi</td>
                <td>
                    Kdv %</td>
                <td>
                    Miktarı</td>
                <td>
                    Birim Fiyat</td>
                <td>
                    Kdv siz Toplam</td>
                <td>
                    &nbsp;</td>
                <td>
                    Kdv Tutarı</td>
                <td>
                    Tutar</td>
                <td rowspan="2">
                    <asp:ImageButton ID="ibtn_stok_hareket_kaydet" runat="server" 
                        onclick="ibtn_stok_hareket_kaydet_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txt_stok_kodu" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txt_stok_adi" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txt_birimi" runat="server" 
                        Width="40px"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txt_kdv" runat="server"  onchange="javascript: Changed(this);" Width="40px"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txt_miktar" runat="server" onchange="javascript: Changed(this);" Width="40px"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txt_satis_fiyati" runat="server" 
                        onchange="javascript: Changed(this);" Width="100px" 
                        CssClass="sagaDayaliFormat" ></asp:TextBox>
                </td>
                <td>
                   <asp:TextBox ID="txt_kdvsiz_tutar" runat="server" Width="100px" 
                        CssClass="sagaDayaliFormat"></asp:TextBox>
               </td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="txt_stok_kdv_tutar" runat="server" Width="100px" 
                        CssClass="sagaDayaliFormat"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txt_tutar" runat="server" Width="100px" 
                        CssClass="sagaDayaliFormat"></asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnl_cari_hareket" runat="server" BorderStyle="Solid" 
        BorderWidth="1px">
        <asp:GridView ID="gv_listele" runat="server" Width="100%" 
            AutoGenerateColumns="False" DataKeyNames="fatura_stok_hareket_id" 
            onrowdeleting="gv_listele_RowDeleting">

            <Columns>
                <asp:TemplateField HeaderText="fatura_stok_hareket_id" InsertVisible="False" 
                    SortExpression="fatura_stok_hareket_id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" 
                            Text='<%# Eval("fatura_stok_hareket_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" 
                            Text='<%# Bind("fatura_stok_hareket_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="fatura_id" SortExpression="fatura_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fatura_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("fatura_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="stok_id" SortExpression="stok_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("stok_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("stok_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="cari_id" SortExpression="cari_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("cari_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("cari_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="islem_tipi" SortExpression="islem_tipi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("islem_tipi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("islem_tipi") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="giris_or_cikis" SortExpression="giris_or_cikis">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("giris_or_cikis") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("giris_or_cikis") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="miktar" SortExpression="miktar">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("miktar") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("miktar") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="birim" SortExpression="birim">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("birim") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("birim") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="aciklama1" SortExpression="aciklama1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("aciklama1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("aciklama1") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="iskonto" SortExpression="iskonto">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("iskonto") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("iskonto") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="birim_fiyat" SortExpression="birim_fiyat">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("birim_fiyat") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("birim_fiyat") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="kdvsiz_tutar" SortExpression="kdvsiz_tutar">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("kdvsiz_tutar") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("kdv_tutari") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="kdv_oran" SortExpression="kdv_oran">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("kdv_oran") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("kdv_oran") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="kdv_tutari" SortExpression="kdv_tutari">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("kdv_tutari") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Bind("kdv_tutari") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="tutar" SortExpression="tutar">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("tutar") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label15" runat="server" Text='<%# Bind("tutar") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="onay_verildi_mi" 
                    SortExpression="onay_verildi_mi">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" 
                            Checked='<%# Bind("onay_verildi_mi") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" 
                            Checked='<%# Bind("onay_verildi_mi") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" OnClientClick="return confirm ('SİLME İşlemi Gerçekleşecek Eminmisiniz!!!');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
        
    </asp:Panel>
        <!-- ARAMA PANELİ-->
    <asp:Panel ID="pnl_cari_arama" runat="server" BackColor="#B6B7BC" Width="60%" Height="500px" > <!-- CssClass="Popup" align="center" style = "display:none"  -->
     <table width="100%"> 
            <tr>
            <td class="style3">
                <asp:Label ID="lbl_baslik" runat="server" Font-Bold="True">C/H Kartı Bul</asp:Label>
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
                    <td class="style11">
                        Unvan&amp;Adı</td>
                    <td width="20%" class="style12">
                        <asp:TextBox ID="txt_arama" runat="server"></asp:TextBox>
                    </td>
                    <td width="20%" class="style12">
                        <asp:ImageButton ID="ibtn_arama" runat="server" onclick="ibtn_arama_Click"/>
                    </td>
                    <td width="20%" class="style12">
                        </td>
                    <td width="20%" class="style12">
                        </td>
                </tr>
      
    </table> 
    
    
       <!-- <iframe style=" width: 99%; height: 90%;" id="ifrm" src="CariBul.aspx" runat="server"></iframe> -->

         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
     
                 <asp:GridView ID="gv_arama_listele" runat="server" AutoGenerateColumns="False" 
                     DataKeyNames="cari_id" Width="100%" BackColor="#CCFFFF" 
                     onselectedindexchanged="gv_arama_listele_SelectedIndexChanged">
                     <Columns>
                         <asp:TemplateField HeaderText="Cari id" InsertVisible="False" 
                             SortExpression="cari_id">
                             <EditItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("cari_id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="lbl_cari_id" runat="server" Text='<%# Bind("cari_id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Unvan" SortExpression="unvan">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("unvan") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("unvan") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="adi" SortExpression="adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("adi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("adi") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="soyadi" SortExpression="soyadi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("soyadi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("soyadi") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Gsm" SortExpression="adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("gsm1") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("gsm1") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Borç Bakiye" SortExpression="borc_bakiye">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("borc_bakiye") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Bind("borc_bakiye") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Alacak Bakiye" SortExpression="alacak_bakiye">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("alacak_bakiye") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label6" runat="server" Text='<%# Bind("alacak_bakiye") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Bakiye" SortExpression="bakiye">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("bakiye") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label7" runat="server" Text='<%# Bind("bakiye") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField ShowHeader="False">
                             <ItemTemplate>
                                 <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                     CommandName="Select" Text="Select"></asp:LinkButton>
                             </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                 </asp:GridView>
             </ContentTemplate>
             <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="ibtn_arama" EventName="Click" />
             </Triggers>
      </asp:UpdatePanel> 
    </asp:Panel>

    <!-- cari/HASTA ARAMA PANELİ son-->
    <!-- STOK ARAMA PANELİ BAŞ-->
    <asp:Panel ID="pnl_stok_arama" runat="server" runat="server" 
        BackColor="#B6B7BC" Width="60%" Height="500px" >
     <table width="100%"> 
            <tr>
            <td class="style3">
                <asp:Label ID="lbl_stok_baslik" runat="server" Font-Bold="True">Stok Kartı Bul</asp:Label>
                    </td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%" align="right" valign="middle">
                <asp:Button ID="btn_stok_arama_kapat" runat="server" Height="20px"
                 Text="X" Width="20px" />
                    </td>
        </tr>
      
                <tr>
                    <td class="style11">
                        Stok Adı</td>
                    <td width="20%" class="style12">
                        <asp:TextBox ID="txt_stok_arama" runat="server"></asp:TextBox>
                    </td>
                    <td width="20%" class="style12">
                        <asp:ImageButton ID="ibtn_stok_arama" runat="server" 
                            onclick="ibtn_stok_arama_Click"/>
                    </td>
                    <td width="20%" class="style12">
                        </td>
                    <td width="20%" class="style12">
                        </td>
                </tr>
      
    </table> 
    
    
       <!-- <iframe style=" width: 99%; height: 90%;" id="ifrm2" src="CariBul.aspx" runat="server"></iframe> -->

         <asp:UpdatePanel ID="UpdatePanel2" runat="server">
             <ContentTemplate>
     
                 <asp:GridView ID="gv_stok_arama_listele" runat="server" AutoGenerateColumns="False" 
                     DataKeyNames="stok_id" Width="100%" BackColor="#CCFFFF" 
                     onselectedindexchanged="gv_stok_arama_listele_SelectedIndexChanged">
                     <Columns>
                         <asp:TemplateField HeaderText="stok_id" InsertVisible="False" 
                             SortExpression="stok_id">
                             <EditItemTemplate>
                                 <asp:Label ID="lbl_stok_id" runat="server" Text='<%# Eval("stok_id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="lbl_stok_id" runat="server" Text='<%# Bind("stok_id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="stok_kod_no" SortExpression="stok_kod_no">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("stok_kod_no") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("stok_kod_no") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="stok_barkod_no" SortExpression="stok_barkod_no">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("stok_barkod_no") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("stok_barkod_no") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="stok_uretici_no" 
                             SortExpression="stok_uretici_no">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("stok_uretici_no") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("stok_uretici_no") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="stok_adi" SortExpression="stok_adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("stok_adi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Bind("stok_adi") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="giren" SortExpression="giren">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("giren") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label6" runat="server" Text='<%# Bind("giren") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="cikan" SortExpression="cikan">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("cikan") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label7" runat="server" Text='<%# Bind("cikan") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="kdv" SortExpression="kdv">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("kdv") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label8" runat="server" Text='<%# Bind("kdv") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="alis_fiyati" SortExpression="alis_fiyati">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("alis_fiyati") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label9" runat="server" Text='<%# Bind("alis_fiyati") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="satis_fiyati" SortExpression="satis_fiyati">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("satis_fiyati") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label10" runat="server" Text='<%# Bind("satis_fiyati") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField ShowHeader="False">
                             <ItemTemplate>
                                 <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                     CommandName="Select" Text="Select"></asp:LinkButton>
                             </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                 </asp:GridView>
             </ContentTemplate>
             <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="ibtn_stok_arama" EventName="Click" />
             </Triggers>
      </asp:UpdatePanel> 
     </asp:Panel>
         <!-- STOK ARAMA PANELİ son-->
     <p>
         
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>   
</asp:Content>



