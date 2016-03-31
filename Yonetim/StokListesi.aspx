<%@ Page Title="" Language="C#" MasterPageFile="~/SiteYonetim.master" AutoEventWireup="true" CodeFile="StokListesi.aspx.cs" Inherits="Yonetim_StokListesi" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">

      
        .style1
        {
            width: 120px;
        }
      
        .style2
        {
            width: 147px;
        }
        .style3
        {
            width: 180px;
        }
        .style4
        {
            width: 36px;
        }
      
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
        <table style="width:100%;">
        <tr>
            <td class="style2">
                FİRMA
                STOK RAPORLARI</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Firma Seçimi Yapınız</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:DropDownList ID="dd_firma" runat="server" 
                    DataSourceID="SqlDataSource_firmalar" DataTextField="firma_adi" 
                    DataValueField="connection_string_adi" Width="150px" 
                    ondatabound="dd_firma_DataBound">
                </asp:DropDownList>
                <br />
            </td>
            <td class="style3">
                <asp:ImageButton ID="ibtn_raporla" runat="server" onclick="ibtn_raporla_Click" 
                    CssClass="GridViewClass" ImageUrl="~/Icons/res3232/arama2.png" />
                   
                    </td>
            <td class="style4">
                <asp:SqlDataSource ID="SqlDataSource_firmalar" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WebMart_Master %>" 
                    SelectCommand="SELECT [firma_adi], [connection_string_adi] FROM [firma_kayit]">
                </asp:SqlDataSource>
                   
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
          <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                    &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        </table>
        <asp:Panel ID="pnl_listele" runat="server">
            <asp:Table ID="Table1" runat="server" BorderColor="#000099" BorderStyle="Solid" 
                BorderWidth="1px" GridLines="Both">
            </asp:Table>
    </asp:Panel>
     <asp:Panel ID="Panel1" runat="server">
         <asp:GridView ID="gv_listele" runat="server" Width="100%" 
            AutoGenerateColumns="False" DataKeyNames="stok_id" 
            AllowPaging="True" onpageindexchanging="gv_listele_PageIndexChanging" 
            CssClass="GridViewClass" onrowcreated="gv_listele_RowCreated" 
            onrowdatabound="gv_listele_RowDataBound">
             <Columns>
                 <asp:BoundField DataField="stok_id" HeaderText="stok_id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="stok_id" Visible="False" />
                 <asp:TemplateField HeaderText="Tarih" SortExpression="kayit_tarihi">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("kayit_tarihi") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" 
                            Text='<%# Bind("kayit_tarihi", "{0:dd/MM/yyyy}") %>'></asp:Label>
                     </ItemTemplate>
                     <ItemStyle Width="70px" />
                 </asp:TemplateField>
                 <asp:BoundField DataField="stok_kod_no" HeaderText="Kod No" 
                    SortExpression="stok_kod_no" >
                 <ItemStyle Width="80px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="stok_barkod_no" HeaderText="Barkod No" 
                    SortExpression="stok_barkod_no" >
                 <ItemStyle Width="80px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="stok_uretici_no" HeaderText="Üretici No" 
                    SortExpression="stok_uretici_no" >
                 <ItemStyle Width="80px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="stok_adi" HeaderText="Stok Adı" 
                    SortExpression="stok_adi" >
                 <ItemStyle Width="100px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="marka" HeaderText="marka" SortExpression="marka" 
                    Visible="False" />
                 <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" 
                    Visible="False" />
                 <asp:BoundField DataField="grubu_id" HeaderText="grubu_id" 
                    SortExpression="grubu_id" Visible="False" />
                 <asp:BoundField DataField="alt_grubu_id" HeaderText="alt_grubu_id" 
                    SortExpression="alt_grubu_id" Visible="False" />
                 <asp:BoundField DataField="birimi" HeaderText="Birimi" 
                    SortExpression="birimi" >
                 <ItemStyle Width="50px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="alt_birimi" HeaderText="alt_birimi" 
                    SortExpression="alt_birimi" Visible="False" />
                 <asp:BoundField DataField="aciklama1" HeaderText="Açıklama" 
                    SortExpression="aciklama1" >
                 <ItemStyle Width="100px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="giren" HeaderText="Giriş" SortExpression="giren" >
                 <ItemStyle HorizontalAlign="Center" Width="30px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="cikan" HeaderText="Çıkış" SortExpression="cikan" >
                 <ItemStyle HorizontalAlign="Center" Width="30px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="kalan" HeaderText="KALAN" SortExpression="kalan" >
                 <ItemStyle HorizontalAlign="Center" Width="30px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="kdv" HeaderText="Kdv" SortExpression="kdv" >
                 <ItemStyle HorizontalAlign="Center" Width="20px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="alis_fiyati" HeaderText="Alış Fiyatı" 
                    SortExpression="alis_fiyati" >
                 <ItemStyle HorizontalAlign="Right" Width="70px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="satis_fiyati" HeaderText="Satış Fiyatı" 
                    SortExpression="satis_fiyati" >
                 <ItemStyle HorizontalAlign="Right" Width="70px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="para_birimi" HeaderText="para_birimi" 
                    SortExpression="para_birimi" Visible="False" />
                 <asp:CheckBoxField DataField="aktif_or_pasif" HeaderText="aktif_or_pasif" 
                    SortExpression="aktif_or_pasif" Visible="False" />
                 <asp:BoundField DataField="resim" HeaderText="resim" SortExpression="resim" 
                    Visible="False" />
             </Columns>
         </asp:GridView>
          
    </asp:Panel>
    <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>
</asp:Content>



