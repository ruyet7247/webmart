<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="KasaHareket.aspx.cs" Inherits="Kasa_KasaHareket" %>


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
    <asp:Panel ID="pnl_kasa_bilgi" runat="server" BorderStyle="Solid">
    <table style="width:100%;">
        <tr>
            <td class="style3">
                <asp:Label ID="lbl_kasa_id" runat="server" Text="0"></asp:Label>
            </td>
            <td class="style4">
                </td>
            <td class="style5" align="left" rowspan="6" valign="top">
                <asp:TabContainer ID="pnl_tab1" runat="server" ActiveTabIndex="0" 
                    Height="100%" Width="100%">
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="CARİYİ BORÇLANDIR / ALACAKLANDIR"  style="float:left;"><HeaderTemplate>
                        KASA GİRİŞ / ÇIKIŞ</HeaderTemplate><ContentTemplate><asp:Panel ID="Panel1" runat="server"><table style="width:100%;"><tr><td class="style3">
                            <asp:Label 
                        ID="lbl_kasa_hareket_id" runat="server" Text="0"></asp:Label></td><td>&#160;</td><td>&#160;</td></tr><tr><td class="style3">GİRİŞ/ÇIKIŞ</td><td>
                        <asp:DropDownList 
                        ID="dd_giris_or_cikis" runat="server"><asp:ListItem Selected="True" Value="giris">KASA GİRİŞ [ + ]</asp:ListItem>
                            <asp:ListItem Value="cikis">KASA ÇIKIŞ [ - ]</asp:ListItem></asp:DropDownList></td><td>&#160;</td></tr><tr><td class="style3">Tarih</td><td><asp:TextBox ID="txt_kayit_tarihi" placeholder="DD/MM/YYYY"  runat="server"></asp:TextBox><asp:CalendarExtender ID="txt_kayit_tarihi_CalendarExtender" runat="server" Format="dd/MM/yyyy" 
                                                Enabled="True" TargetControlID="txt_kayit_tarihi"></asp:CalendarExtender></td><td><asp:ImageButton 
                            ID="ibtn_yeni_giris_cikis" runat="server" 
                                                AlternateText="Yeni" /></td></tr><tr><td class="style3">Belge No</td><td><asp:TextBox ID="txt_belge_no" runat="server"></asp:TextBox></td><td><asp:ImageButton ID="ibtn_kaydet" runat="server" AlternateText="Kaydet" 
                                onclick="ibtn_kaydet_Click" /></td></tr><tr><td class="style3">Açıklama</td><td><asp:TextBox 
                            ID="txt_aciklama" runat="server" Width="200px"></asp:TextBox></td><td>&#160;</td></tr><tr><td class="style3">
                            TUTAR</td><td>
                        <asp:TextBox 
                        ID="txt_tutar" runat="server" Width="120px"></asp:TextBox></td><td>&#160;</td></tr><tr><td 
                        class="style3">&#160;</td><td>&#160;</td><td>&#160;</td></tr></table></asp:Panel></ContentTemplate></asp:TabPanel>
                </asp:TabContainer>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Kasa Adı</td>
            <td class="style4">
                <asp:TextBox ID="txt_kasa_adi" runat="server" Width="250px" ReadOnly="True" 
                    Font-Size="16pt" Height="30px"></asp:TextBox>
                <asp:ImageButton ID="ibtn_kasa_bul" runat="server" Height="30px" Width="50px" 
                    AlternateText="KasaBul" />
                <asp:ModalPopupExtender ID="ibtn_kasa_bul_ModalPopupExtender" runat="server" 
                    DynamicServicePath="" Enabled="True" 
                    PopupControlID="pnl_kasa_arama" TargetControlID="ibtn_kasa_bul" 
                    BackgroundCssClass="popupPanel" CancelControlID="btn_kasa_bul_kapat">
                </asp:ModalPopupExtender>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Para Birimi</td>
            <td class="style4">
                 <asp:DropDownList ID="dd_para_birimi_id" runat="server" DataSourceID="SqlDataSource_para_birimi" 
                    DataTextField="para_birimi" DataValueField="para_birimi_id" Width="150px" 
                     Enabled="False">
                </asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource_para_birimi" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:CnnStr %>" 
                     SelectCommand="SELECT * FROM [firma_para_birimi_tanimlama]">
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
                KASA Bakiyesi</td>
            <td class="style4">
                <asp:TextBox ID="txt_kasa_bakiyesi" runat="server" Width="150px" ReadOnly="True" 
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
            AutoGenerateColumns="False" DataKeyNames="kasa_hareket_id" 
            onrowdeleting="gv_listele_RowDeleting">

            <Columns>
                <asp:BoundField DataField="kasa_hareket_id" HeaderText="kasa_hareket_id" 
                    InsertVisible="False" ReadOnly="True" SortExpression="kasa_hareket_id" />
                <asp:BoundField DataField="kasa_id" HeaderText="kasa_id" 
                    SortExpression="kasa_id" />
                <asp:BoundField DataField="kayit_tarihi" HeaderText="kayit_tarihi" 
                    SortExpression="kayit_tarihi" />
                <asp:BoundField DataField="evrak_no" HeaderText="evrak_no" 
                    SortExpression="evrak_no" />
                <asp:BoundField DataField="islem_tipi" HeaderText="islem_tipi" 
                    SortExpression="islem_tipi" />
                <asp:BoundField DataField="giris_or_cikis" HeaderText="giris_or_cikis" 
                    SortExpression="giris_or_cikis" />
                <asp:BoundField DataField="aciklama1" HeaderText="aciklama1" 
                    SortExpression="aciklama1" />
                <asp:BoundField DataField="tutar" HeaderText="tutar" SortExpression="tutar" />
                <asp:BoundField DataField="cari_id" HeaderText="cari_id" 
                    SortExpression="cari_id" />
                <asp:BoundField DataField="fis_id" HeaderText="fis_id" 
                    SortExpression="fis_id" />
                <asp:BoundField DataField="banka_id" HeaderText="banka_id" 
                    SortExpression="banka_id" />
                <asp:BoundField DataField="personel" HeaderText="personel" 
                    SortExpression="personel" />
                <asp:BoundField DataField="cari_hareket_id" HeaderText="cari_hareket_id" 
                    SortExpression="cari_hareket_id" />
            </Columns>

        </asp:GridView>
      
    </asp:Panel>
        <!-- ARAMA PANELİ-->
    <asp:Panel ID="pnl_kasa_arama" runat="server" BackColor="#B6B7BC" Width="60%" 
        Height="500px" > <!-- CssClass="Popup" align="center" style = "display:none"  -->
     <table width="100%"> 
            <tr>
            <td class="style3">
                <asp:Label ID="lbl_baslik" runat="server" Font-Bold="True">Kasa Bul</asp:Label>
                    </td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%" align="right" valign="middle">
                <asp:Button ID="btn_kasa_bul_kapat" runat="server" Height="20px"
                 Text="X" Width="20px" />
                    </td>
        </tr>
      
                <tr>
                    <td class="style3">
                        Kasa Adı</td>
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
                     DataKeyNames="kasa_id" Width="100%" BackColor="#CCFFFF" 
                     onselectedindexchanged="gv_arama_listele_SelectedIndexChanged1">
                     <Columns>
                         <asp:TemplateField HeaderText="kasa_id" InsertVisible="False" 
                             SortExpression="kasa_id">
                             <EditItemTemplate>
                                 <asp:Label ID="lbl_kasa_id" runat="server" Text='<%# Eval("kasa_id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="lbl_kasa_id" runat="server" Text='<%# Bind("kasa_id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="kasa_adi" SortExpression="kasa_adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("kasa_adi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("kasa_adi") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="para_birimi" SortExpression="para_birimi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox_para_birimi" runat="server" Text='<%# Bind("para_birimi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label_para_birimi" runat="server" Text='<%# Bind("para_birimi") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="para_birimi_adi" SortExpression="para_birimi_adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("para_birimi_adi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("para_birimi_adi") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="aciklama1" SortExpression="aciklama1">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("aciklama1") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("aciklama1") %>'></asp:Label>
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





