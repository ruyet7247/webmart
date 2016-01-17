<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CariKarti.aspx.cs" Inherits="Cari_CariKarti" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 10%;
        }
        .style2
        {
            width: 30%;
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
                CARİ KARTI KAYIT </td>
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
    <table style="width:100%;">
        <tr>
            <td class="style1">
                <asp:Label ID="lbl_cari_id" runat="server"></asp:Label>
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
                Kuruluş Tarihi</td>
            <td class="style2">
                <asp:TextBox ID="txt_kurulus_tarihi" placeholder="MM/DD/YYYY"  runat="server"></asp:TextBox>
                <asp:ImageButton ID="ibtn_cari_bul" runat="server" Height="30px" Width="50px" />
                <asp:ModalPopupExtender ID="ibtn_cari_bul_ModalPopupExtender" runat="server" 
                    DynamicServicePath="" Enabled="True" 
                    PopupControlID="pnl_cari_arama" TargetControlID="ibtn_cari_bul" 
                    BackgroundCssClass="popupPanel" CancelControlID="btn_cari_bul_kapat">
                </asp:ModalPopupExtender>
            </td>
           <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Firma Tipi</td>
            <td class="style2">
                <asp:TextBox ID="txt_firma_tipi" runat="server" Width="70%"></asp:TextBox>
            </td>
           <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Kısa Unvanı</td>
            <td class="style2">
                <asp:TextBox ID="txt_kisa_unvani" runat="server" Width="70%"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Tam Unvanı</td>
            <td class="style2">
                <asp:TextBox ID="txt_tam_unvani" runat="server" Width="90%"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Yetkili</td>
            <td class="style2">
                <asp:TextBox ID="txt_yetkili" runat="server" Width="70%"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Vergi Dairesi</td>
            <td class="style2">
                <asp:TextBox ID="txt_vergi_dairesi" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Telefon 1</td>
            <td class="style2">
                <asp:TextBox ID="txt_tel1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Vergi No</td>
            <td class="style2">
                <asp:TextBox ID="txt_vergi_no" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Telefon 2</td>
            <td class="style2">
                <asp:TextBox ID="txt_tel2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Adres 1</td>
            <td class="style2">
                <asp:TextBox ID="txt_adres1" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Faks</td>
            <td class="style2">
                <asp:TextBox ID="txt_fax" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Adres 2</td>
            <td class="style2">
                <asp:TextBox ID="txt_adres2" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Gsm 1</td>
            <td class="style2">
                <asp:TextBox ID="txt_gsm1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Semt</td>
            <td class="style2">
                <asp:TextBox ID="txt_semt" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Gsm 2</td>
            <td class="style2">
                <asp:TextBox ID="txt_gsm2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                İlçe</td>
            <td class="style2">
                <asp:TextBox ID="txt_ilce" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Mail Adresi</td>
            <td class="style2">
                <asp:TextBox ID="txt_mail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                İl</td>
            <td class="style2">
                <asp:TextBox ID="txt_il" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Web Adresi</td>
            <td class="style2">
                <asp:TextBox ID="txt_web_adresi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Posta Kodu</td>
            <td class="style2">
                <asp:TextBox ID="txt_posta_kodu" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Açıklama</td>
            <td class="style2">
                <asp:TextBox ID="txt_aciklama1" runat="server"></asp:TextBox>
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
                <asp:ImageButton ID="ibtn_guncelle" runat="server" Height="30px" 
                    onclick="ibtn_guncelle_Click" Width="120px" />
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
     <table> 
            <tr>
            <td width="20%">
                <asp:Label ID="lbl_baslik" runat="server" Font-Bold="True">Cari Kartı Bul</asp:Label>
                    </td>
            <td width="20%">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CnnStr %>" 
                    SelectCommand="SELECT * FROM [cari_grubu_tanimlama]"></asp:SqlDataSource>
                    </td>
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
                    <td width="20%">
                        <asp:DropDownList ID="dd_arama_secimi" runat="server" 
                            DataSourceID="SqlDataSource1" DataTextField="cari_grubu_adi" 
                            DataValueField="cari_grubu_id">
                        </asp:DropDownList>
                    </td>
                    <td width="20%">
                        <asp:TextBox ID="txt_arama" runat="server"></asp:TextBox>
                    </td>
                    <td width="20%">
                        <asp:ImageButton ID="ibtn_arama" runat="server" onclick="ibtn_arama_Click" />
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

