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
                Kayıt Tarihi</td>
            <td class="style2">
                <asp:TextBox ID="txt_kayit_tarihi" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txt_kayit_tarihi_CalendarExtender" runat="server" 
                    Enabled="True" Format="dd.MM.yyyy" TargetControlID="txt_kayit_tarihi">
                </asp:CalendarExtender>
                <asp:ImageButton ID="ibtn_stok_bul" runat="server" Height="30px" Width="50px" 
                    AlternateText="stokBul" />
                <asp:ModalPopupExtender ID="ibtn_stok_bul_ModalPopupExtender" runat="server" 
                    DynamicServicePath="" Enabled="True" 
                    PopupControlID="pnl_stok_arama" TargetControlID="ibtn_stok_bul" 
                    BackgroundCssClass="popupPanel" CancelControlID="btn_stok_bul_kapat">
                </asp:ModalPopupExtender>
            </td>
           <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Stok Kodu</td>
            <td class="style2">
                <asp:TextBox ID="txt_kod_no" runat="server" Width="70%"></asp:TextBox>
            </td>
           <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Barkod No</td>
            <td class="style2">
                <asp:TextBox ID="txt_barkod_no" runat="server" Width="70%"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Üretici No</td>
            <td class="style2">
                <asp:TextBox ID="txt_uretici_no" runat="server" Width="70%"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Stok Adı</td>
            <td class="style2">
                <asp:TextBox ID="txt_stok_adi" runat="server" Width="250px"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Birimi</td>
            <td class="style2">
                <asp:DropDownList ID="dd_birimi" runat="server">
                    <asp:ListItem>Adet</asp:ListItem>
                    <asp:ListItem>Paket</asp:ListItem>
                    <asp:ListItem>Dz</asp:ListItem>
                    <asp:ListItem>Kg</asp:ListItem>
                    <asp:ListItem>Top</asp:ListItem>
                    <asp:ListItem>Balya</asp:ListItem>
                    <asp:ListItem>Gram</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Stok Grubu</td>
            <td class="style2">
                <asp:DropDownList ID="dd_grup_id" runat="server" DataSourceID="SqlDataSource2" 
                    DataTextField="stok_grubu_adi" DataValueField="stok_grubu_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CnnStr %>" 
                    SelectCommand="SELECT * FROM [stok_grubu_tanimlama]"></asp:SqlDataSource>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Kdv</td>
            <td class="style2">
                <asp:TextBox ID="txt_kdv" runat="server" Width="50px"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Alış Fiyatı</td>
            <td class="style2">
                <asp:TextBox ID="txt_alis_fiyati" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Satış Fiyatı</td>
            <td class="style2">
                <asp:TextBox ID="txt_satis_fiyati" runat="server"></asp:TextBox>
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
        <tr>
            <td class="style1">
                Giren Miktar</td>
            <td class="style2">
                <asp:TextBox ID="txt_giren" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Çıkan Miktar</td>
            <td class="style2">
                <asp:TextBox ID="txt_cikan" runat="server" ReadOnly="True"></asp:TextBox>
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
    
     </asp:Panel>
    <!-- ARAMA PANELİ-->
    <asp:Panel ID="pnl_stok_arama" runat="server" BackColor="#B6B7BC" Width="60%" Height="500px" > <!-- CssClass="Popup" align="center" style = "display:none"  -->
     <table width="100%"> 
            <tr>
            <td width="20%">
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
                        Stok Adı</td>
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
                         <asp:TemplateField HeaderText="stok_id" InsertVisible="False" 
                             SortExpression="stok_id">
                             <EditItemTemplate>
                                 <asp:Label ID="lbl_stok_id" runat="server" Text='<%# Eval("stok_id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="lbl_stok_id" runat="server" Text='<%# Bind("stok_id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="stok_adi" SortExpression="stok_adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("stok_adi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("stok_adi") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="birimi" SortExpression="birimi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("birimi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("birimi") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="kdv" SortExpression="kdv">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("kdv") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("kdv") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="alis_fiyati" SortExpression="alis_fiyati">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("alis_fiyati") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label6" runat="server" Text='<%# Bind("alis_fiyati") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="satis_fiyati" SortExpression="satis_fiyati">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("satis_fiyati") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Bind("satis_fiyati") %>'></asp:Label>
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
     <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>
</asp:Content>



