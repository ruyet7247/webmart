<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PersonelHareket.aspx.cs" Inherits="Personel_PersonelHareket" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        
        .style3
        {
            width: 15%;
        }
     
        .style4
        {
            width: 35%;
            
            
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
    <p>Personel Hareketleri</p>
    <asp:Panel ID="pnl_cari_bilgi" runat="server" BorderStyle="Solid">
    <table style="width:100%;">
        <tr>
            <td class="style3">
                <asp:Label ID="lbl_personel_id" runat="server" Text="0" Visible="False"></asp:Label>
            </td>
            <td class="style4">
                </td>
            <td class="style5" align="left" rowspan="10" valign="top">
                <asp:TabContainer ID="pnl_tab1" runat="server" ActiveTabIndex="0" 
                    Height="100%" Width="100%">
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="CARİYİ BORÇLANDIR / ALACAKLANDIR"  style="float:left;">
<HeaderTemplate>
PERSONEL BORÇLANDIR / ALACAKLANDIR
</HeaderTemplate>
 <ContentTemplate>
<asp:Panel ID="Panel1" runat="server">
                               <table style="width:100%;"><tr>
<td class="style3">
                                
<asp:Label ID="lbl_maas_hareket_id" runat="server" Text="0" Visible="False"></asp:Label>
                                
                            </td>
                            
 <td></td><td></td></tr>
                            
<tr><td class="style3">BORÇ/ALACAK</td>
  <td>
                                    
 <asp:DropDownList ID="dd_borc_or_alacak" runat="server">
                            <asp:ListItem Selected="True" Value="borc">BORÇLANDIR</asp:ListItem>
                            
                            <asp:ListItem Value="alacak">ALACAKLANDIR</asp:ListItem>
                            
                                    </asp:DropDownList>
                                </td>
                                
 <td></td></tr><tr>
                            
  <td class="style3">Tarih</td><td>
                            
  <asp:TextBox ID="txt_kayit_tarihi" runat="server" placeholder="DD/MM/YYYY"></asp:TextBox>
                            
    <asp:CalendarExtender ID="txt_kayit_tarihi_CalendarExtender" runat="server" 
                                Enabled="True" Format="dd/MM/yyyy" TargetControlID="txt_kayit_tarihi"></asp:CalendarExtender>
                            </td>
                            
   <td>
   <asp:ImageButton ID="ibtn_yeni_borc_alacak" runat="server" AlternateText="Yeni" 
           ImageUrl="~/Icons/res3232/arti.png" />
                            </td></tr>
                            
 <tr><td class="style3">
                                
  İşlem Tipi</td><td>
  <asp:DropDownList ID="dd_islem_tipi" runat="server" 
                                        DataSourceID="SqlDataSource_odeme_tipi" DataTextField="islem_tipi_adi" 
                                        DataValueField="islem_tipi_value">
                                    </asp:DropDownList>
                                    
Belge No<asp:TextBox ID="txt_belge_no" runat="server"></asp:TextBox>
                                    

 <asp:SqlDataSource ID="SqlDataSource_odeme_tipi" runat="server" 
                                         
                                        SelectCommand="SELECT [islem_tipi_value], [islem_tipi_adi] FROM [personel_islem_tipi_tanimlama]">
                                    </asp:SqlDataSource>
                                    
 </td><td>
                                    
  <asp:ImageButton ID="ibtn_kaydet" runat="server" AlternateText="Kaydet" 
                                        onclick="ibtn_kaydet_Click" 
             ImageUrl="~/Icons/res3232/save2.png" />
                                </td></tr><tr>
 <td class="style3">Ödeme Şekli</td>
                                
 <td>
                                    
   <asp:DropDownList ID="dd_odeme_sekli" runat="server" AutoPostBack="True" 
                                        DataSourceID="SqlDataSource_odeme_sekli" DataTextField="odeme_sekli_adi" 
                                        DataValueField="odeme_sekli" 
                                        OnSelectedIndexChanged="dd_odeme_sekli_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    


                        <asp:SqlDataSource ID="SqlDataSource_odeme_sekli" runat="server" 
                                         
                                        SelectCommand="SELECT [odeme_sekli], [odeme_sekli_adi] FROM [cari_odeme_sekli_tanimlama]">
                                    </asp:SqlDataSource>
                                    


                        </td><td></td></tr><tr>
                            

                            <td class="style3">Bağlı Hesap</td>
                            

                            <td>
                                

                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        

                                        <asp:DropDownList ID="dd_bagli_hesap" runat="server" 
                                            onselectedindexchanged="dd_islem_tipi_SelectedIndexChanged">
                                            

                                        </asp:DropDownList>
                                        
 
                                        
                                    </ContentTemplate>
                                    
                                    
                                    <triggers>
                                        
                                        <asp:AsyncPostBackTrigger ControlID="dd_odeme_sekli" 
                                        EventName="SelectedIndexChanged" />
                                        
                                    </triggers>
                                    
                                </asp:UpdatePanel>
                                


                            </td><td></td></tr><tr>
                            

                            <td class="style3">Ait Olduğu

                                <br />
                                

                        AY ve YIL</td><td>
                                

                            <asp:DropDownList ID="dd_ay" runat="server">
                                <asp:ListItem Value="1">Ocak</asp:ListItem>
                                
                                <asp:ListItem Value="2">Şubat</asp:ListItem>
                                
                                <asp:ListItem Value="3">Mart</asp:ListItem>
                                
                                <asp:ListItem Value="4">Nisan</asp:ListItem>
                                
                                <asp:ListItem Value="5">Mayıs</asp:ListItem>
                                
                                <asp:ListItem Value="6">Haziran</asp:ListItem>
                                
                                <asp:ListItem Value="7">Temmuz</asp:ListItem>
                                
                                <asp:ListItem Value="8">Ağustos</asp:ListItem>
                                
                                <asp:ListItem Value="9">Eylül</asp:ListItem>
                                
                                <asp:ListItem Value="10">Ekim</asp:ListItem>
                                
                                <asp:ListItem Value="10">Kasım</asp:ListItem>
                                
                                <asp:ListItem Value="12">Aralık</asp:ListItem>
                                
                                </asp:DropDownList>
                                /

                            <asp:DropDownList ID="dd_yil" runat="server">
                                <asp:ListItem>2015</asp:ListItem>
                                
                                <asp:ListItem>2016</asp:ListItem>
                                
                                <asp:ListItem>2017</asp:ListItem>
                                
                                <asp:ListItem>2018</asp:ListItem>
                                
                                <asp:ListItem>2019</asp:ListItem>
                                
                                <asp:ListItem>2020</asp:ListItem>
                                
                                <asp:ListItem>2021</asp:ListItem>
                                
                                <asp:ListItem>2022</asp:ListItem>
                                
                                <asp:ListItem>2023</asp:ListItem>
                                
                                <asp:ListItem>2024</asp:ListItem>
                                
                                <asp:ListItem>2025</asp:ListItem>
                                
                                <asp:ListItem>2026</asp:ListItem>
                                
                                <asp:ListItem>2027</asp:ListItem>
                                
                                <asp:ListItem>2028</asp:ListItem>
                                
                                <asp:ListItem>2029</asp:ListItem>
                                
                                <asp:ListItem>2030</asp:ListItem>
                                
                                </asp:DropDownList>
                                


                        </td><td></td></tr><tr>
                            

                            <td class="style3">Açıklama</td>
                            

                            <td>
                                

                        <asp:TextBox ID="txt_aciklama" runat="server" Width="275px"></asp:TextBox>
                                


                        </td><td></td></tr><tr>
                            

                            <td class="style3">Tutar</td><td>
                            

                            <asp:TextBox ID="txt_tutar" runat="server"></asp:TextBox>
                            </td>
                            

                            <td></td></tr><tr>
                            

                            <td class="style3"></td><td></td>
                            

                            <td></td></tr>
                            

                            </table></asp:Panel>
                            

                        </ContentTemplate>
                        
 </asp:TabPanel>
                </asp:TabContainer>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Personel Adı</td>
            <td class="style4">
                <asp:TextBox ID="txt_adi" runat="server" Width="250px" ReadOnly="True" 
                    Font-Size="16pt" Height="30px"></asp:TextBox>
                <asp:ImageButton ID="ibtn_personel_bul" runat="server" 
                    AlternateText="Personel Bul" ImageUrl="~/Icons/res3232/arama2.png" />
                <asp:ModalPopupExtender ID="ibtn_personel_bul_ModalPopupExtender" runat="server" 
                    DynamicServicePath="" Enabled="True" 
                    PopupControlID="pnl_personel_arama" TargetControlID="ibtn_personel_bul" 
                    BackgroundCssClass="popupPanel" CancelControlID="btn_personel_bul_kapat">
                </asp:ModalPopupExtender>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Departmanı</td>
            <td class="style4">
                 <asp:DropDownList ID="dd_departman_id" runat="server" DataSourceID="SqlDataSource_departman" 
                    DataTextField="personel_departman_adi" 
                     DataValueField="personel_departman_id" Width="150px" 
                     Enabled="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_departman" runat="server" 
                     
                    
                     
                     SelectCommand="SELECT [personel_departman_id], [personel_departman_adi] FROM [personel_departman_tanimlama]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Maaşı</td>
            <td class="style4">
                <asp:TextBox ID="txt_odenen_maas" runat="server" CssClass="sagaDayaliFormat" 
                    ReadOnly="True" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                </td>
            <td class="style4">
                </td>
        </tr>
        <tr>
            <td class="style3">
                Borç Bakiye</td>
            <td class="style4">
                <asp:TextBox ID="txt_borc_bakiye" runat="server" CssClass="sagaDayaliFormat" 
                    Font-Size="16pt" Height="30px" ReadOnly="True" Width="180px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Alacak Bakiye</td>
            <td class="style4">
                <asp:TextBox ID="txt_alacak_bakiye" runat="server" Width="180px" ReadOnly="True" 
                    CssClass="sagaDayaliFormat" Font-Size="16pt" Height="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Bakiye</td>
            <td class="style4">
                <asp:TextBox ID="txt_bakiye" runat="server" CssClass="sagaDayaliFormat" 
                    Font-Size="16pt" Height="30px" ReadOnly="True" Width="180px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                </td>
            <td class="style4">
                </td>
        </tr>
        <tr>
            <td class="style3">
                </td>
            <td class="style4">
                </td>
        </tr>
</table>
    </asp:Panel>
    <asp:Panel ID="pnl_butonlar" runat="server" BorderStyle="Solid">
    </asp:Panel>
    <asp:Panel ID="pnl_cari_hareket" runat="server" BorderStyle="Solid" 
        BorderWidth="1px">
        <asp:GridView ID="gv_listele" runat="server" Width="100%" 
            AutoGenerateColumns="False" DataKeyNames="maas_hareket_id" 
            onrowdeleting="gv_listele_RowDeleting" CssClass="GridViewClass" 
            onrowcreated="gv_listele_RowCreated" onrowdatabound="gv_listele_RowDataBound">

            <Columns>
                <asp:TemplateField HeaderText="maas_hareket_id" InsertVisible="False" 
                    SortExpression="maas_hareket_id" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("maas_hareket_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("maas_hareket_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="personel_id" SortExpression="personel_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("personel_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("personel_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tarih" SortExpression="kayit_tarihi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("kayit_tarihi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("kayit_tarihi", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Borç / Alacak" SortExpression="borc_or_alacak">
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
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ödeme Şekli" SortExpression="odeme_sekli">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("odeme_sekli") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("odeme_sekli") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Belge No" SortExpression="belge_no">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("belge_no") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("belge_no") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Maaş Dönemi Ay" SortExpression="maas_donem_ay">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("maas_donem_ay") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("maas_donem_ay") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Maaş Dönemi Yıl" SortExpression="maas_donem_yil">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("maas_donem_yil") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("maas_donem_yil") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Açıklama" SortExpression="aciklama1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("aciklama1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("aciklama1") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tutar" SortExpression="tutar">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("tutar") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("tutar") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="kasa_id" SortExpression="kasa_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("kasa_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("kasa_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="banka_hesap_id" SortExpression="banka_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("banka_hesap_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("banka_hesap_id") %>'></asp:Label>
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
    <asp:Panel ID="pnl_personel_arama" runat="server" BackColor="#B6B7BC" 
        Width="60%" Height="500px" > <!-- CssClass="Popup" align="center" style = "display:none"  -->
     <table width="100%"> 
            <tr>
            <td class="style3">
                <asp:Label ID="lbl_baslik" runat="server" Font-Bold="True">Personel Kartı Bul</asp:Label>
                    </td>
            <td width="20%">
                </td>
            <td width="20%">
                </td>
            <td width="20%">
                </td>
            <td width="20%" align="right" valign="middle">
                <asp:Button ID="btn_personel_bul_kapat" runat="server" Height="20px"
                 Text="X" Width="20px" />
                    </td>
        </tr>
      
                <tr>
                    <td class="style3">
                        Personel Adı</td>
                    <td width="20%">
                        <asp:TextBox ID="txt_arama" runat="server"></asp:TextBox>
                    </td>
                    <td width="20%">
                        <asp:ImageButton ID="ibtn_arama" runat="server" onclick="ibtn_arama_Click" 
                            ImageUrl="~/Icons/res3232/arama2.png"/>
                    </td>
                    <td width="20%">
                        </td>
                    <td width="20%">
                        </td>
                </tr>
      
    </table> 
    
    
       <!-- <iframe style=" width: 99%; height: 90%;" id="ifrm" src="CariBul.aspx" runat="server"></iframe> -->

         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
     
                 <asp:GridView ID="gv_arama_listele" runat="server" AutoGenerateColumns="False" 
                     DataKeyNames="personel_id" Width="100%" BackColor="#CCFFFF" 
                     onselectedindexchanged="gv_arama_listele_SelectedIndexChanged" 
                     onrowcreated="gv_arama_listele_RowCreated" 
                     onrowdatabound="gv_arama_listele_RowDataBound" CssClass="GridViewClass">
                     <Columns>
                         <asp:TemplateField HeaderText="personel_id" InsertVisible="False" 
                             SortExpression="personel_id" Visible="False">
                             <EditItemTemplate>
                                 <asp:Label ID="lbl_personel_id" runat="server" Text='<%# Eval("personel_id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="lbl_personel_id" runat="server" Text='<%# Bind("personel_id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="TC No" SortExpression="tc">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tc") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("tc") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="100px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Adı" SortExpression="adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("adi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("adi") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="150px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Soyadı" SortExpression="soyadi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("soyadi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("soyadi") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="150px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Kullanıcı Adı" SortExpression="kullanici_adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("kullanici_adi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Bind("kullanici_adi") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="100px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Gsm" 
                             SortExpression="gsm">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("gsm") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label6" runat="server" Text='<%# Bind("gsm") %>'></asp:Label>
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

    <!-- ARAMA PANELİ son-->
     <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>   
</asp:Content>



