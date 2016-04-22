<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="HizliSatis.aspx.cs" Inherits="Cari_HizliSatis" %>

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
        
         .style7
        {
            width: 15%;
        }




        .style8
        {
            width: 268px;
        }




        .style9
        {
            width: 15%;
            height: 21px;
        }
        .style10
        {
            width: 268px;
            height: 21px;
        }
        .style11
        {
            height: 21px;
        }




        .style12
        {
            width: 54px;
        }
        .style13
        {
            width: 100%;
        }




        .style14
        {
            width: 24px;
        }




        .style16
        {
            height: 21px;
            width: 70px;
        }
        .style17
        {
            width: 70px;
        }
        .style18
        {
            width: 147px;
        }
        .style19
        {
            width: 147px;
            height: 21px;
        }




    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:Panel ID="pnl_hizli_satis" runat="server"   DefaultButton ="ibtn_barkod_arama" >
        <table width="100%">
            <tr>
                <td class="style7" align="right">
                    Sepet No</td>
                <td class="style8">
                    <asp:Label ID="lbl_sepet_no" runat="server" Text="0"></asp:Label>
                </td>
                <td class="style17">
                </td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7" align="right">
                    Barkod No</td>
                <td class="style8">
                    <asp:TextBox ID="txt_stok_barkod" runat="server" Width="250px" 
                        Font-Size="X-Large" Height="35px"></asp:TextBox>
                    <asp:ImageButton ID="ibtn_barkod_arama" runat="server" 
                        onclick="ibtn_barkod_arama_Click" style="width: 14px" />
                </td>
                <td class="style17">
                    <asp:ImageButton ID="ibtn_stok_arama_ac" runat="server" Height="24px" 
                        ImageUrl="~/Icons/res3232/arama2.png" Width="24px" />
                    <asp:ModalPopupExtender ID="ibtn_stok_arama_ac_ModalPopupExtender" 
                        runat="server" BackgroundCssClass="popupPanel" 
                        CancelControlID="btn_stok_arama_kapat" DynamicServicePath="" Enabled="True" 
                        PopupControlID="pnl_stok_arama" TargetControlID="ibtn_stok_arama_ac">
                    </asp:ModalPopupExtender>
                </td>
                <td class="style18">
                    <asp:Label ID="lbl_sepet_tutar" runat="server" Font-Bold="True" 
                        Font-Size="X-Large" Text="0,00TL"></asp:Label>
                </td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9">
                    </td>
                <td class="style10">
                    </td>
                <td class="style16">
                    </td>
                <td class="style19">
                    <asp:ImageButton ID="ImageButton1" runat="server" />
                </td>
                <td class="style11">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnl_butonlar" runat="server" BorderStyle="Solid"  
        DefaultButton ="ibtn_barkod_arama" Width="80%" >
        <table style="width:100%;">
            <tr>
                <td rowspan="2">
                    <asp:Label ID="lbl_stok_id" runat="server" Text="0" Visible="False"></asp:Label>
                </td>
                <td>
                    Stok Kodu</td>
                <td class="style13">
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
                <td rowspan="2" class="style14">
                    <asp:ImageButton ID="ibtn_stok_hareket_kaydet" runat="server" 
                        onclick="ibtn_stok_hareket_kaydet_Click" Height="24px" 
                        ImageUrl="~/Icons/res3232/save2.png" Width="24px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txt_stok_kodu" runat="server"></asp:TextBox>
                </td>
                <td class="style13">
                    <asp:TextBox ID="txt_stok_adi" runat="server" Width="100%"></asp:TextBox>
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
        BorderWidth="1px" Width="80%">
        <asp:GridView ID="gv_listele" runat="server" Width="100%" 
            AutoGenerateColumns="False" DataKeyNames="hizlisatis_hareket_id" 
            onrowdeleting="gv_listele_RowDeleting" 
            onrowcreated="gv_listele_RowCreated" 
            onrowdatabound="gv_listele_RowDataBound">

            <Columns>
                <asp:BoundField DataField="hizlisatis_hareket_id" 
                    HeaderText="hizlisatis_hareket_id" InsertVisible="False" ReadOnly="True" 
                    SortExpression="hizlisatis_hareket_id" />
                <asp:BoundField DataField="stok_id" HeaderText="stok_id" 
                    SortExpression="stok_id" />
                <asp:BoundField DataField="miktar" HeaderText="miktar" 
                    SortExpression="miktar" />
                <asp:BoundField DataField="birim" HeaderText="birim" SortExpression="birim" />
                <asp:BoundField DataField="aciklama1" HeaderText="aciklama1" 
                    SortExpression="aciklama1" />
                <asp:BoundField DataField="iskonto" HeaderText="iskonto" 
                    SortExpression="iskonto" />
                <asp:BoundField DataField="birim_fiyat" HeaderText="birim_fiyat" 
                    SortExpression="birim_fiyat" />
                <asp:BoundField DataField="kdvsiz_tutar" HeaderText="kdvsiz_tutar" 
                    SortExpression="kdvsiz_tutar" />
                <asp:BoundField DataField="kdv_oran" HeaderText="kdv_oran" 
                    SortExpression="kdv_oran" />
                <asp:BoundField DataField="kdv_tutari" HeaderText="kdv_tutari" 
                    SortExpression="kdv_tutari" />
                <asp:BoundField DataField="tutar" HeaderText="tutar" SortExpression="tutar" />
                <asp:CheckBoxField DataField="onay_verildi_mi" HeaderText="onay_verildi_mi" 
                    SortExpression="onay_verildi_mi" />
            </Columns>

        </asp:GridView>
        
    </asp:Panel>
        <!-- ARAMA PANELİ-->

    <!-- cari/HASTA ARAMA PANELİ son-->
    <!-- STOK ARAMA PANELİ BAŞ-->
    <asp:Panel ID="pnl_stok_arama" runat="server" runat="server" DefaultButton="ibtn_stok_arama" 
        BackColor="#B6B7BC" Width="60%" Height="500px" >
     <table width="100%"> 
            <tr>
            <td class="style3">&nbsp;&nbsp;&nbsp;
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
                        &nbsp;&nbsp;&nbsp;&nbsp;Stok Adı</td>
                    <td width="20%" class="style12">
                        <asp:TextBox ID="txt_stok_arama" runat="server"></asp:TextBox>
                    </td>
                    <td width="20%" class="style12">
                        <asp:ImageButton ID="ibtn_stok_arama" runat="server" 
                            onclick="ibtn_stok_arama_Click" ImageUrl="~/Icons/res3232/arama2.png"/>
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
                     onselectedindexchanged="gv_stok_arama_listele_SelectedIndexChanged" 
                     CssClass="GridViewClass" onrowcreated="gv_stok_arama_listele_RowCreated" 
                     onrowdatabound="gv_stok_arama_listele_RowDataBound">
                     <Columns>
                         <asp:TemplateField HeaderText="stok_id" InsertVisible="False" 
                             SortExpression="stok_id" Visible="False">
                             <EditItemTemplate>
                                 <asp:Label ID="lbl_stok_id" runat="server" Text='<%# Eval("stok_id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="lbl_stok_id" runat="server" Text='<%# Bind("stok_id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Kod No" SortExpression="stok_kod_no">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("stok_kod_no") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("stok_kod_no") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="100px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Barkod No" SortExpression="stok_barkod_no">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("stok_barkod_no") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("stok_barkod_no") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="100px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Üretici No" 
                             SortExpression="stok_uretici_no">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("stok_uretici_no") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("stok_uretici_no") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="100px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Stok Adı" SortExpression="stok_adi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("stok_adi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Bind("stok_adi") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="150px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Giriş Miktar" SortExpression="giren">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("giren") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label6" runat="server" Text='<%# Bind("giren") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" Width="50px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Çıkış Miktar" SortExpression="cikan">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("cikan") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label7" runat="server" Text='<%# Bind("cikan") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" Width="50px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Kdv" SortExpression="kdv">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("kdv") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label8" runat="server" Text='<%# Bind("kdv") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle Width="30px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Alış Fiyatı" SortExpression="alis_fiyati">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("alis_fiyati") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label9" runat="server" Text='<%# Bind("alis_fiyati") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Right" Width="70px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Satış Fiyatı" SortExpression="satis_fiyati">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("satis_fiyati") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label10" runat="server" Text='<%# Bind("satis_fiyati") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Right" Width="70px" />
                         </asp:TemplateField>
                         <asp:CommandField ButtonType="Image" SelectImageUrl="~/icons/res3232/sagok.png" 
                            ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20px" />
                        </asp:CommandField>
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

