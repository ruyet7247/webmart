<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StokKarti.aspx.cs" Inherits="Stok_StokKarti" %>


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
    <asp:Panel ID="pnl_form" runat="server">
   

    <table ID="form" style="width:100%;">
        <tr>
            <td width="20%">
                STOK KARTI KAYIT </td>
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
                <asp:ImageButton ID="ibtn_yeni_stok" runat="server" 
                    onclick="ibtn_yeni_stok_Click" AlternateText="Yeni Kayıt" />
                <asp:ImageButton ID="ibtn_stok_sil" runat="server"
                    onclick="ibtn_stok_sil_Click"  
                    OnClientClick="return confirm ('SİLME İşlemi Gerçekleşecek Eminmisiniz!!!');" 
                    AlternateText="stok Sil" />
            </td>
            
        </tr>
              
    </table>
    <table style="width:100%;">
        <tr>
            <td class="style1">
                <asp:Label ID="lbl_stok_id" runat="server">0</asp:Label>
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
                Unvan</td>
            <td class="style2">
                <asp:TextBox ID="txt_unvan" runat="server" Width="70%"></asp:TextBox>
                <asp:ImageButton ID="ibtn_stok_bul" runat="server" Height="30px" Width="50px" 
                    AlternateText="stokBul" />
                <asp:ModalPopupExtender ID="ibtn_stok_bul_ModalPopupExtender" runat="server" 
                    DynamicServicePath="" Enabled="True" 
                    PopupControlID="pnl_stok_arama" TargetControlID="ibtn_stok_bul" 
                    BackgroundCssClass="popupPanel" CancelControlID="btn_stok_bul_kapat">
                </asp:ModalPopupExtender>
            </td>
           <td class="style1">
                Faks</td>
            <td class="style2">
                <asp:TextBox ID="txt_fax" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Adı</td>
            <td class="style2">
                <asp:TextBox ID="txt_adi" runat="server" Width="70%"></asp:TextBox>
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
                Vergi Dairesi</td>
            <td class="style2">
                <asp:TextBox ID="txt_vergi_dairesi" runat="server"></asp:TextBox>
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
                Vergi No</td>
            <td class="style2">
                <asp:TextBox ID="txt_vergi_no" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Grup Adı</td>
            <td class="style2">
                <asp:DropDownList ID="dd_grup_id" runat="server" DataSourceID="SqlDataSource2" 
                    DataTextField="stok_grubu_adi" DataValueField="stok_grubu_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CnnStr %>" 
                    SelectCommand="SELECT * FROM [stok_grubu_tanimlama]"></asp:SqlDataSource>
            </td>
            <td class="style1">
                Adres1.Satır</td>
            <td class="style2">
                <asp:TextBox ID="txt_adres1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                stok Kod</td>
            <td class="style2">
                <asp:TextBox ID="txt_stok_kod_no" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Adres2.Satır</td>
            <td class="style2">
                <asp:TextBox ID="txt_adres2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;Tc No</td>
            <td class="style2">
                <asp:TextBox ID="txt_tc_no" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Posta Kodu</td>
            <td class="style2">
                <asp:TextBox ID="txt_posta_kodu" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Meslek</td>
            <td class="style2">
                <asp:TextBox ID="txt_meslek" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                İlçe</td>
            <td class="style2">
                <asp:TextBox ID="txt_ilce" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Banka Adı</td>
            <td class="style2">
                <asp:TextBox ID="txt_banka_adi" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Şehir</td>
            <td class="style2">
                <asp:TextBox ID="txt_sehir" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Baka Hesap No</td>
            <td class="style2">
                <asp:TextBox ID="txt_banka_hesap_no" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Ülke</td>
            <td class="style2">
                <asp:TextBox ID="txt_ulke" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Banka IBAN No</td>
            <td class="style2">
                <asp:TextBox ID="txt_banka_iban_no" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Telefon-1</td>
            <td class="style2">
                <asp:TextBox ID="txt_tel1" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
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
                <asp:TextBox ID="txt_borc_bakiye" runat="server"></asp:TextBox>
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
                <asp:TextBox ID="txt_alacak_bakiye" runat="server"></asp:TextBox>
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
                <asp:TextBox ID="txt_bakiye" runat="server"></asp:TextBox>
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
                <asp:ImageButton ID="ibtn_post" runat="server" Height="30px" 
                    onclick="ibtn_post_Click" Width="120px" />
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
    <asp:Panel ID="pnl_stok_arama" runat="server" BackColor="#B6B7BC" Width="60%" Height="500px" > <!-- CssClass="Popup" align="center" style = "display:none"  -->
     <table width="100%"> 
            <tr>
            <td class="style3">
                <asp:Label ID="lbl_baslik" runat="server" Font-Bold="True">stok Kartı Bul</asp:Label>
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
    
       <!-- <iframe style=" width: 99%; height: 90%;" id="ifrm" src="stokBul.aspx" runat="server"></iframe> -->

         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
     
                 <asp:GridView ID="gv_arama_listele" runat="server" AutoGenerateColumns="False" 
                     DataKeyNames="stok_id" Width="100%" BackColor="#CCFFFF" 
                     onselectedindexchanged="gv_arama_listele_SelectedIndexChanged">
                     <Columns>
                         <asp:TemplateField HeaderText="stok id" InsertVisible="False" 
                             SortExpression="stok_id">
                             <EditItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("stok_id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="lbl_stok_id" runat="server" Text='<%# Bind("stok_id") %>'></asp:Label>
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

    <!-- ARAMA PANELİ son-->

</asp:Content>



