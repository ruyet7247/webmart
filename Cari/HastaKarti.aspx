<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="HastaKarti.aspx.cs" Inherits="Cari_HastaKarti" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 15%;
        }
        .style2
        {
            width: 30%;
        }
        .style3
        {
            width: 11%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <!--
     <script>
        $('#ibtn_cari_gorusme_ac').live("click", function () {
            // your existing page
            var url = "CariGorusmeleri.aspx";
            // append value of textbox as querystring
            var newUrl = url + "?HastaID=" + $('#lbl_cari_id').val();
            // update the src attribute of your iframe with the newUrl
            $('#ifrm_cari_gorusmeleri').attr("src", newUrl);
        });
        </script>
    -->
    <asp:Panel ID="pnl_form" runat="server">
   

    <table ID="form" style="width:100%;">
        <tr>
            <td width="20%">
                HASTA KARTI İŞLEMLERİ</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
        </tr>
              
        <tr>
            <td colspan="5" width="20%">
                <asp:ImageButton ID="ibtn_yeni_cari" runat="server" 
                    onclick="ibtn_yeni_cari_Click" AlternateText="Yeni Kayıt" 
                    ImageUrl="~/Icons/res3232/arti.png" />
                <asp:ImageButton ID="ibtn_cari_sil" runat="server"
                    onclick="ibtn_cari_sil_Click"  
                    OnClientClick="return confirm ('SİLME İşlemi Gerçekleşecek Eminmisiniz!!!');" 
                    AlternateText="Hasta Sil" ImageUrl="~/Icons/res3232/sil.png" />
                <asp:ImageButton ID="ibtn_cari_gorusme_ac" runat="server" 
                    AlternateText="Hasta Cari Görüşmesi Aç" 
                    ImageUrl="~/Icons/res3232/randevu.png" />
                <asp:ModalPopupExtender ID="ibtn_cari_gorusme_ac_ModalPopupExtender" 
                    runat="server" DynamicServicePath="" Enabled="True" 
                    TargetControlID="ibtn_cari_gorusme_ac" BackgroundCssClass="popupPanel" 
                    CancelControlID="ibtn_cari_gorusme_kapat" 
                    PopupControlID="pnl_cari_gorusmeleri">
                </asp:ModalPopupExtender>
            </td>
            
        </tr>
              
    </table>
    <table style="width:100%;">
        <tr>
            <td class="style1">
                <asp:Label ID="lbl_cari_id" runat="server" Visible="False">0</asp:Label>
            </td>
            <td class="style2">
                &nbsp;</td>
           <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Adı</td>
            <td class="style2">
                <asp:TextBox ID="txt_adi" runat="server" Width="70%"></asp:TextBox>
                <asp:ImageButton ID="ibtn_cari_bul" runat="server" AlternateText="HastaBul" 
                    ImageUrl="~/Icons/res3232/arama2.png" />
                <asp:ModalPopupExtender ID="ibtn_cari_bul_ModalPopupExtender" runat="server" 
                    BackgroundCssClass="popupPanel" CancelControlID="btn_cari_bul_kapat" 
                    DynamicServicePath="" Enabled="True"  TargetControlID="ibtn_cari_bul" 
                    PopupControlID="pnl_cari_arama">
                </asp:ModalPopupExtender>
            </td>
           <td class="style1">
                Mail Adres</td>
            <td class="style2">
                <asp:TextBox ID="txt_mail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Soyadı</td>
            <td class="style2">
                <asp:TextBox ID="txt_soyadi" runat="server" Width="70%"></asp:TextBox>
            </td>
            <td class="style1">
                Kimlik Seri No</td>
            <td class="style2">
                <asp:TextBox ID="txt_kimlik_seri_no" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Kayıt Tarihi</td>
            <td class="style2">
                <asp:TextBox ID="txt_kayit_tarihi" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txt_kayit_tarihi_CalendarExtender" runat="server"  Format="dd.MM.yyyy" 
                    Enabled="True" TargetControlID="txt_kayit_tarihi">
                </asp:CalendarExtender>
            </td>
            <td class="style1">
                Baba Adı</td>
            <td class="style2">
                <asp:TextBox ID="txt_baba_adi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Cinsiyet</td>
            <td class="style2">
                <asp:DropDownList ID="dd_cinsiyet" runat="server">
                    <asp:ListItem>BAY</asp:ListItem>
                    <asp:ListItem>BAYAN</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style1">
                Anne Adı</td>
            <td class="style2">
                <asp:TextBox ID="txt_anne_adi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Tc No</td>
            <td class="style2">
                <asp:TextBox ID="txt_tc_no" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Adres1.Satır</td>
            <td class="style2">
                <asp:TextBox ID="txt_adres1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Meslek</td>
            <td class="style2">
                <asp:TextBox ID="txt_meslek" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Adres2.Satır</td>
            <td class="style2">
                <asp:TextBox ID="txt_adres2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Doğum Yeri</td>
            <td class="style2">
                <asp:TextBox ID="txt_dogum_yeri" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Posta Kodu</td>
            <td class="style2">
                <asp:TextBox ID="txt_posta_kodu" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Doğum Tarihi</td>
            <td class="style2">
                <asp:TextBox ID="txt_dogum_tarihi" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txt_dogum_tarihi_CalendarExtender" runat="server" 
                    Enabled="True" Format="dd.MM.yyyy" TargetControlID="txt_dogum_tarihi">
                </asp:CalendarExtender>
            </td>
            <td class="style1">
                İlçe</td>
            <td class="style2">
                <asp:TextBox ID="txt_ilce" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Uyruk</td>
            <td class="style2">
                <asp:TextBox ID="txt_uyruk" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Şehir</td>
            <td class="style2">
                <asp:TextBox ID="txt_sehir" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Telefon-1</td>
            <td class="style2">
                <asp:TextBox ID="txt_tel1" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Ülke</td>
            <td class="style2">
                <asp:TextBox ID="txt_ulke" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Telefon-2</td>
            <td class="style2">
                <asp:TextBox ID="txt_tel2" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Borç Bakiye</td>
            <td class="style2">
                <asp:TextBox ID="txt_borc_bakiye" runat="server" CssClass="sagaDayaliFormat" 
                    ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Cep Tel-1</td>
            <td class="style2">
                <asp:TextBox ID="txt_gsm1" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Alacak Bakiye</td>
            <td class="style2">
                <asp:TextBox ID="txt_alacak_bakiye" runat="server" CssClass="sagaDayaliFormat" 
                    ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Cep Tel-2</td>
            <td class="style2">
                <asp:TextBox ID="txt_gsm2" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Bakiye</td>
            <td class="style2">
                <asp:TextBox ID="txt_bakiye" runat="server" ReadOnly="True" CssClass="sagaDayaliFormat" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
    </table>
    <table style="width:100%;">
        <tr>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                <asp:ImageButton ID="ibtn_post" runat="server" 
                    onclick="ibtn_post_Click" ImageUrl="~/Icons/res3232/post.png" />
            </td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
        </tr>
      
    </table>
     <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>
     </asp:Panel>
    <!-- ARAMA PANELİ-->
    <asp:Panel ID="pnl_cari_arama" runat="server" BackColor="#B6B7BC" Width="60%" Height="500px" > <!-- CssClass="Popup" align="center" style = "display:none"  -->
     <table width="100%"> 
            <tr>
            <td class="style3">
                <asp:Label ID="lbl_baslik" runat="server" Font-Bold="True">Hasta Kartı Bul</asp:Label>
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
                        Hasta Adı</td>
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
                     CssClass="GridViewClass" onrowcreated="gv_arama_listele_RowCreated" 
                     onrowdatabound="gv_arama_listele_RowDataBound">
                     <Columns>
                         <asp:TemplateField HeaderText="Hasta id" InsertVisible="False" 
                             SortExpression="cari_id">
                             <EditItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("cari_id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="lbl_cari_id" runat="server" Text='<%# Bind("cari_id") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="20px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Adı" SortExpression="adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("adi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("adi") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="200px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Soyadi" SortExpression="soyadi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBoxsoyadi" runat="server" Text='<%# Bind("soyadi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label_soyadi" runat="server" Text='<%# Bind("soyadi") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="200px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Gsm" SortExpression="adi">
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
                             <ItemStyle Width="100px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Alacak Bakiye" SortExpression="alacak_bakiye">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("alacak_bakiye") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label6" runat="server" Text='<%# Bind("alacak_bakiye") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="100px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Bakiye" SortExpression="bakiye">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("bakiye") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label7" runat="server" Text='<%# Bind("bakiye") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="100px" />
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
    
    <asp:Panel ID="pnl_cari_gorusmeleri" runat="server" BackColor="#B6B7BC" Width="60%" Height="500px" > <!-- CssClass="Popup" align="center" style = "display:none"  -->
      <table width="100%"> 
            <tr>
           <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%" align="right" valign="middle">
                <asp:Button ID="ibtn_cari_gorusme_kapat" runat="server" Height="20px"
                 Text="X" Width="20px" />
                    </td>
        </tr> 
       </table>     
          <iframe style=" width: 99%; height: 90%;" id="ifrm_cari_gorusmeleri"  src="CariGorusmeleri.aspx" runat="server"></iframe>  
   
    </asp:Panel>
       

    <!-- ARAMA PANELİ son-->

</asp:Content>



