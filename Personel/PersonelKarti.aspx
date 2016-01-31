﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PersonelKarti.aspx.cs" Inherits="Personel_PersonelKarti" %>


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
        .style4
        {
            width: 15%;
            height: 26px;
        }
        .style5
        {
            width: 30%;
            height: 26px;
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
                PERSONEL KARTI KAYIT </td>
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
                <asp:ImageButton ID="ibtn_yeni_personel" runat="server" 
                    onclick="ibtn_yeni_cari_Click" AlternateText="Yeni Kayıt" />
                <asp:ImageButton ID="ibtn_personel_sil" runat="server"
                    onclick="ibtn_cari_sil_Click"  
                    OnClientClick="return confirm ('SİLME İşlemi Gerçekleşecek Eminmisiniz!!!');" 
                    AlternateText="Cari Sil" />
            </td>
            
        </tr>
              
    </table>
    <table style="width:100%;">
        <tr>
            <td class="style1">
                <asp:Label ID="lbl_cari_id" runat="server">0</asp:Label>
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
                TC NO</td>
            <td class="style2">
                <asp:TextBox ID="txt_tc" runat="server" Width="150px"></asp:TextBox>
                <asp:ImageButton ID="ibtn_personel_bul" runat="server" Height="30px" Width="50px" 
                    AlternateText="CariBul" />
                <asp:ModalPopupExtender ID="ibtn_personel_bul_ModalPopupExtender" runat="server" 
                    DynamicServicePath="" Enabled="True" 
                    PopupControlID="pnl_cari_arama" TargetControlID="ibtn_personel_bul" 
                    BackgroundCssClass="popupPanel" CancelControlID="btn_cari_bul_kapat">
                </asp:ModalPopupExtender>
            </td>
           <td class="style1">
                Cinsiyet</td>
            <td class="style2">
                <asp:TextBox ID="txt_cinsiyet" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Adı</td>
            <td class="style2">
                <asp:TextBox ID="txt_adi" runat="server" Width="70%"></asp:TextBox>
            </td>
           <td class="style1">
                Mail Adresi</td>
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
                Ehliyet Sınıfı</td>
            <td class="style2">
                <asp:TextBox ID="txt_ehliyet_belge_no" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Kullanıcı Adı</td>
            <td class="style2">
                <asp:TextBox ID="txt_kullanici_adi" runat="server" Width="200px"></asp:TextBox>
                &nbsp;</td>
            <td class="style1">
                Aktif / Pasif</td>
            <td class="style2">
                <asp:DropDownList ID="dd_aktif_or_pasif" runat="server">
                    <asp:ListItem Value="1">Aktif</asp:ListItem>
                    <asp:ListItem Value="0">Pasif</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Kullanıcı Şifre</td>
            <td class="style2">
                <asp:TextBox ID="txt_kullanici_sifre" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style1">
                Açıklama</td>
            <td class="style2">
                <asp:TextBox ID="txt_aciklama1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Sicil No</td>
            <td class="style2">
                <asp:TextBox ID="txt_sicil_no" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td class="style1">
                Ev Telefonu</td>
            <td class="style2">
                <asp:TextBox ID="txt_tel" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Başvuru Tarihi</td>
            <td class="style2">
                <asp:TextBox ID="txt_basvuru_tarihi" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txt_basvuru_tarihi_CalendarExtender" runat="server" 
                    Enabled="True" Format="dd.MM.yyyy" TargetControlID="txt_basvuru_tarihi">
                </asp:CalendarExtender>
            </td>
            <td class="style1">
                Cep Telefonu</td>
            <td class="style2">
                <asp:TextBox ID="txt_gsm" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Departman</td>
            <td class="style2">
                <asp:DropDownList ID="dd_departman_id" runat="server" 
                    DataSourceID="SqlDataSource_departman" DataTextField="personel_departman_adi" 
                    DataValueField="personel_departman_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_departman" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CnnStr %>" 
                    SelectCommand="SELECT [personel_departman_id], [personel_departman_adi] FROM [personel_departman_tanimlama]">
                </asp:SqlDataSource>
            </td>
            <td class="style1">
                Adres 1</td>
            <td class="style2">
                <asp:TextBox ID="txt_adres1" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Giriş Tarihi</td>
            <td class="style2">
                <asp:TextBox ID="txt_giris_tarihi" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txt_giris_tarihi_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txt_giris_tarihi">
                </asp:CalendarExtender>
            </td>
            <td class="style1">
                Adres 2</td>
            <td class="style2">
                <asp:TextBox ID="txt_adres2" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Banka Adı</td>
            <td class="style2">
                <asp:TextBox ID="txt_banka_adi" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                İlçe</td>
            <td class="style2">
                <asp:TextBox ID="txt_ilce" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Banka Hesap No</td>
            <td class="style2">
                <asp:TextBox ID="txt_banka_hesap_no" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                İl</td>
            <td class="style2">
                <asp:TextBox ID="txt_il" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Banka IBAN No</td>
            <td class="style5">
                <asp:TextBox ID="txt_banka_iban_no" runat="server"></asp:TextBox>
            </td>
            <td class="style4">
                </td>
            <td class="style5">
            </td>
        </tr>
        <tr>
            <td class="style1">
                Ödenen Maaş</td>
            <td class="style2">
                <asp:TextBox ID="txt_odenen_maas" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
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
    <asp:Panel ID="pnl_cari_arama" runat="server" BackColor="#B6B7BC" Width="60%" Height="500px" > <!-- CssClass="Popup" align="center" style = "display:none"  -->
     <table width="100%"> 
            <tr>
            <td class="style3">
                <asp:Label ID="lbl_baslik" runat="server" Font-Bold="True">Personel Kartı Bul</asp:Label>
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

