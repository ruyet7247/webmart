<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RaporStokKarti.aspx.cs" Inherits="Stok_RaporStokKarti" %>


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
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:Panel ID="pnl_cari_bilgi" runat="server" BorderStyle="Solid">
    <table style="width:100%;">
        <tr>
            <td class="style3">
                &nbsp;STOK EXTRESİ</td>
            <td class="style4">
                <asp:Label ID="lbl_stok_id" runat="server" Text="0"></asp:Label>
                </td>
                <td class="style3"></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Stok Adı</td>
            <td class="style4">
                <asp:TextBox ID="txt_stok_adi" runat="server" Width="250px" ReadOnly="True" 
                    Font-Size="16pt" Height="30px"></asp:TextBox>
                <asp:ImageButton ID="ibtn_stok_bul" runat="server" 
                    AlternateText="StokBul" ImageUrl="~/Icons/res3232/arama2.png" />
                <asp:ModalPopupExtender ID="ibtn_stok_bul_ModalPopupExtender" runat="server" 
                    DynamicServicePath="" Enabled="True" 
                    PopupControlID="pnl_stok_arama" TargetControlID="ibtn_stok_bul" 
                    BackgroundCssClass="popupPanel" CancelControlID="btn_stok_bul_kapat">
                </asp:ModalPopupExtender>
            </td>
            <td class="style3">Filtreler</td>
            <td class="style4">
                <asp:ImageButton ID="ibtn_raporla" runat="server" 
                    onclick="ibtn_raporla_Click" ImageUrl="~/Icons/res3232/ok.png" />
            </td>
        </tr>
        <tr>
            <td class="style3">
                Grubu</td>
            <td class="style4">
                 <asp:DropDownList ID="dd_grup_id" runat="server" DataSourceID="SqlDataSource2" 
                    DataTextField="stok_grubu_adi" DataValueField="stok_grubu_id" Width="150px" 
                     Enabled="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                     
                    SelectCommand="SELECT * FROM [stok_grubu_tanimlama]"></asp:SqlDataSource>
            </td>
            <td class="style3">Giriş / Çıkış</td>
            <td>
                <asp:DropDownList ID="dd_giris_or_cikis" runat="server">
                    <asp:ListItem Value="tum">Tüm</asp:ListItem>
                    <asp:ListItem Value="giris">Giriş</asp:ListItem>
                    <asp:ListItem Value="cikis">Çıkış</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                GİRİŞ TOPLAMLARI</td>
            <td class="style4">
                <asp:TextBox ID="txt_giren" runat="server" Width="80px" ReadOnly="True" 
                    CssClass="sagaDayaliFormat" Font-Size="16pt" Height="30px"></asp:TextBox>
            </td>
            <td class="style3">İşlem Tipi</td>
            <td>
                <asp:DropDownList ID="dd_islem_tipi" runat="server" 
                    DataSourceID="SqlDataSource_islem_tipi" DataTextField="islem_tipi_adi" 
                    DataValueField="islem_tipi" ondatabound="dd_islem_tipi_DataBound">
                    <asp:ListItem Value="tum">Tümü</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_islem_tipi" runat="server" 
                    SelectCommand="SELECT [islem_tipi], [islem_tipi_adi] FROM [stok_islem_tipi_tanimlama]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style3">
                ÇIKIŞ TOPLAMLARI</td>
            <td class="style4">
                <asp:TextBox ID="txt_cikan" runat="server" Width="80px" 
                    ReadOnly="True" CssClass="sagaDayaliFormat" Font-Size="16pt" Height="30px"></asp:TextBox>
            </td>
            <td class="style3">Tarih Aralığı</td>
            <td>
                <asp:TextBox ID="txt_bas_tarih" runat="server" Width="80px"></asp:TextBox>
                <asp:CalendarExtender ID="txt_bas_tarih_CalendarExtender" runat="server" 
                    Enabled="True" Format="dd.MM.yyyy" TargetControlID="txt_bas_tarih">
                </asp:CalendarExtender>
                <asp:TextBox ID="txt_son_tarih" runat="server" Width="80px"></asp:TextBox>
                <asp:CalendarExtender ID="txt_son_tarih_CalendarExtender" runat="server" 
                    Enabled="True" Format="dd.MM.yyyy" TargetControlID="txt_son_tarih">
                </asp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="style3">
                TOPLAM KALAN</td>
            <td class="style4">
                <asp:TextBox ID="txt_stok_miktari" runat="server" Width="80px" ReadOnly="True" 
                    CssClass="sagaDayaliFormat" Font-Size="16pt" Height="30px"></asp:TextBox>
            </td>
            <td class="style3"></td>
            <td>
                &nbsp;</td>
        </tr>
</table>
    </asp:Panel>
    <asp:Panel ID="pnl_butonlar" runat="server" BorderStyle="Solid">
    </asp:Panel>
    <asp:Panel ID="pnl_stok_hareket" runat="server" BorderStyle="Solid" 
        BorderWidth="1px">
        <asp:GridView ID="gv_listele" runat="server" Width="100%" 
            AutoGenerateColumns="False" DataKeyNames="stok_hareket_id" 
            onrowcreated="gv_listele_RowCreated" 
            onrowdatabound="gv_listele_RowDataBound" CssClass="GridViewClass">

            <Columns>
                <asp:TemplateField HeaderText="stok_hareket_id" InsertVisible="False" 
                    SortExpression="stok_hareket_id" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("stok_hareket_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("stok_hareket_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="stok_id" SortExpression="stok_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("stok_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("stok_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Kayıt Tarihi" SortExpression="kayit_tarihi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("kayit_tarihi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("kayit_tarihi", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="İşlem Tipi" SortExpression="islem_tipi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("islem_tipi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("islem_tipi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Giriş/Çıkış" SortExpression="giris_or_cikis">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("giris_or_cikis") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("giris_or_cikis") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Miktar" SortExpression="miktar">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("miktar") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("miktar") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Birim" SortExpression="birim">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("birim") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("birim") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Açıklama" SortExpression="aciklama1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("aciklama1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("aciklama1") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Birim Fiyat" SortExpression="birim_fiyat">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("birim_fiyat") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("birim_fiyat") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="iskonto" SortExpression="iskonto" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("iskonto") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("iskonto") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Kdv" SortExpression="kdv_oran">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("kdv_oran") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("kdv_oran") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="20px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tutar" SortExpression="tutar">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("tutar") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("tutar") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="cari_id" SortExpression="cari_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("cari_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("cari_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="evrak_no" SortExpression="evrak_no" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("evrak_no") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Bind("evrak_no") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="fis_id" SortExpression="fis_id" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("fis_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label15" runat="server" Text='<%# Bind("fis_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="fatura_id" SortExpression="fatura_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("fatura_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label16" runat="server" Text='<%# Bind("fatura_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
      
    </asp:Panel>
        <!-- ARAMA PANELİ-->
    <asp:Panel ID="pnl_stok_arama" runat="server" BackColor="#B6B7BC" Width="60%" 
        Height="500px" > <!-- CssClass="Popup" align="center" style = "display:none"  -->
     <table width="100%"> 
            <tr>
            <td class="style3">
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
                     DataKeyNames="stok_id" Width="100%" BackColor="#CCFFFF" 
                     onselectedindexchanged="gv_arama_listele_SelectedIndexChanged1" 
                     onrowcreated="gv_arama_listele_RowCreated" 
                     onrowdatabound="gv_arama_listele_RowDataBound" CssClass="GridViewClass">
                     <Columns>
                         <asp:TemplateField HeaderText="stok_id" InsertVisible="False" 
                             SortExpression="stok_id" Visible="False">
                             <EditItemTemplate>
                                 <asp:Label ID="lbl_Stok_id" runat="server" Text='<%# Eval("stok_id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="lbl_Stok_id" runat="server" Text='<%# Bind("stok_id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Stok Adı" SortExpression="stok_adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("stok_adi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("stok_adi") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="150px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Birimi" SortExpression="birimi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("birimi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("birimi") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="50px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Giriş" SortExpression="giren">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("giren") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("giren") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" Width="50px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Çıkış" SortExpression="cikan">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("cikan") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Bind("cikan") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" Width="50px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Alış Fiyatı" SortExpression="alis_fiyati">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("alis_fiyati") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label6" runat="server" Text='<%# Bind("alis_fiyati") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Right" Width="80px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Satış Fiyatı" SortExpression="satis_fiyati">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("satis_fiyati") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label7" runat="server" Text='<%# Bind("satis_fiyati") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Right" Width="80px" />
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



