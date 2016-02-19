<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Kullanici.aspx.cs" Inherits="GenelTanimlamar_Kullanici" %>


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
                KULLANICI KAYIT </td>
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
                <asp:ImageButton ID="ibtn_yeni_kullanici" runat="server" 
                    onclick="ibtn_yeni_kullanici_Click" AlternateText="Yeni Kayıt" 
                    ImageUrl="~/icons/res3232/arti.png" />
                Yeni Kayıt
                <asp:ImageButton ID="ibtn_kullanici_sil" runat="server"
                    onclick="ibtn_kullanici_sil_Click"  
                    OnClientClick="return confirm ('SİLME İşlemi Gerçekleşecek Eminmisiniz!!!');" 
                    AlternateText="Kullanıcı Sil" ImageUrl="~/icons/res3232/sil.png" />
                Sil</td>
            
        </tr>
              
    </table>
    <table style="width:100%;">
        <tr>
            <td class="style1">
                <asp:Label ID="lbl_kullanici_id" runat="server" Visible="False">0</asp:Label>
            </td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                FİRMA ADI</td>
            <td class="style2">
                <asp:DropDownList ID="dd_firma_listesi" runat="server" 
                    DataSourceID="SqlDataSource_firma" DataTextField="firma_adi" 
                    DataValueField="firma_id" Enabled="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_firma" runat="server" 
                    SelectCommand="SELECT [firma_id], [firma_adi] FROM [firma_kayit]">
                </asp:SqlDataSource>
                <asp:ImageButton ID="ibtn_kullanici_bul" runat="server" 
                    AlternateText="kullaniciBul" ImageUrl="~/icons/res3232/arama2.png" />
                <asp:ModalPopupExtender ID="ibtn_kullanici_bul_ModalPopupExtender" 
                    runat="server" BackgroundCssClass="popupPanel" 
                    CancelControlID="btn_kullanici_bul_kapat" DynamicServicePath="" Enabled="True" 
                    PopupControlID="pnl_kullanici_arama" TargetControlID="ibtn_kullanici_bul">
                </asp:ModalPopupExtender>
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Kayıt Tarihi</td>
            <td class="style2">
                <asp:TextBox ID="txt_kayit_tarihi" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txt_kayit_tarihi_CalendarExtender" runat="server" 
                    Enabled="True" Format="dd.MM.yyyy" TargetControlID="txt_kayit_tarihi">
                </asp:CalendarExtender>
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Yetki Grubu</td>
            <td class="style2">
                <asp:DropDownList ID="dd_yetki_grubu_id" runat="server" 
                    DataSourceID="SqlDataSource_departman" DataTextField="yetki_adi" 
                    DataValueField="yetki_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_departman" runat="server" 
                    SelectCommand="SELECT [yetki_id], [yetki_adi] FROM [yetki_grubu]">
                </asp:SqlDataSource>
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Tc No</td>
            <td class="style2">
                <asp:TextBox ID="txt_tc" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Adı Soyadı</td>
            <td class="style2">
                <asp:TextBox ID="txt_adi_soyadi" runat="server" Width="70%"></asp:TextBox>
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Kullanıcı Adı</td>
            <td class="style2">
                <asp:TextBox ID="txt_kullanici_adi" runat="server" Width="200px"></asp:TextBox>
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Kullanıcı Şifre</td>
            <td class="style2">
                <asp:TextBox ID="txt_kullanici_sifre" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Gsm</td>
            <td class="style2">
                <asp:TextBox ID="txt_gsm" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Aktif/Pasif</td>
            <td class="style2">
                <asp:DropDownList ID="dd_aktif_or_pasif" runat="server">
                    <asp:ListItem Value="True">Aktif</asp:ListItem>
                    <asp:ListItem Value="False">Pasif</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Açıklama</td>
            <td class="style2">
                <asp:TextBox ID="txt_aciklama1" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
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
                    onclick="ibtn_post_Click" ImageUrl="~/icons/res3232/guncelle.png" />
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
    <asp:Panel ID="pnl_kullanici_arama" runat="server" BackColor="#B6B7BC" 
        Width="60%" Height="500px" > <!-- CssClass="Popup" align="center" style = "display:none"  -->
     <table width="100%"> 
            <tr>
            <td class="style3">
                <asp:Label ID="lbl_baslik" runat="server" Font-Bold="True">Kullanıcı Bul</asp:Label>
                    </td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%" align="right" valign="middle">
                <asp:Button ID="btn_kullanici_bul_kapat" runat="server" Height="20px"
                 Text="X" Width="20px" />
                    </td>
        </tr>
      
                <tr>
                    <td class="style3">
                        Kullanıcı Adı</td>
                    <td width="20%">
                        <asp:TextBox ID="txt_arama" runat="server"></asp:TextBox>
                    </td>
                    <td width="20%">
                        <asp:ImageButton ID="ibtn_arama" runat="server" onclick="ibtn_arama_Click" 
                            ImageUrl="~/icons/res3232/arama.png"/>
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
                     DataKeyNames="kullanici_id" Width="100%" BackColor="#CCFFFF" 
                     onselectedindexchanged="gv_arama_listele_SelectedIndexChanged" 
                     onrowcreated="gv_arama_listele_RowCreated" 
                     onrowdatabound="gv_arama_listele_RowDataBound">
                     <Columns>
                         <asp:TemplateField HeaderText="kullanici_id" InsertVisible="False" 
                             SortExpression="kullanici_id" Visible="False">
                             <EditItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("kullanici_id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="lbl_kullanici_id" runat="server" Text='<%# Bind("kullanici_id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="firma_id" SortExpression="firma_id" 
                             Visible="False">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("firma_id") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("firma_id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="KAYIT TARİHİ" SortExpression="kayit_tarihi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("kayit_tarihi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("kayit_tarihi") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="yetki_grubu_id" SortExpression="yetki_grubu_id" 
                             Visible="False">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("yetki_grubu_id") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("yetki_grubu_id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="TC NO" SortExpression="tc">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("tc") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Bind("tc") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="ADI SOYADI" SortExpression="adi_soyadi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("adi_soyadi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label6" runat="server" Text='<%# Bind("adi_soyadi") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="KULLANICI ADI" SortExpression="kullanici_adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("kullanici_adi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label7" runat="server" Text='<%# Bind("kullanici_adi") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="kullanici_sifre" 
                             SortExpression="kullanici_sifre" Visible="False">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("kullanici_sifre") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label8" runat="server" Text='<%# Bind("kullanici_sifre") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="GSM" SortExpression="gsm">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("gsm") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label9" runat="server" Text='<%# Bind("gsm") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="YETKİ" SortExpression="yetki">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("yetki") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label10" runat="server" Text='<%# Bind("yetki") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="aciklama1" SortExpression="aciklama1" 
                             Visible="False">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("aciklama1") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label11" runat="server" Text='<%# Bind("aciklama1") %>'></asp:Label>
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

</asp:Content>


