<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CariGorusmeleri.aspx.cs" Inherits="Cari_CariGorusmeleri" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>


    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>

     
        HASTA GÖRÜŞME NOTLARI<table width="100%"> 
            <tr>
            <td class="style3">
                <asp:Label ID="lbl_cari_hasta_id" runat="server" Text="0" Visible="False"></asp:Label>
                    </td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
            <td width="20%" align="right" valign="middle">
                &nbsp;</td>
        </tr>
      
                <tr>
                    <td class="style3">
                        Hasta Adı:</td>
                    <td width="20%">
                        <asp:TextBox ID="txt_hasta_adi" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td width="20%">
                        <asp:ImageButton ID="ibtn_cari_gorusme_kaydet" runat="server" 
                            onclick="ibtn_cari_gorusme_kaydet_Click" 
                            ImageUrl="~/Icons/res3232/save2.png" />
                    </td>
                    <td width="20%">
                        &nbsp;</td>
                    <td align="right" valign="middle" width="20%">
                        &nbsp;</td>
            </tr>
      
                <tr>
                    <td class="style3">
                        &nbsp;Tarihi ve Saati:</td>
                    <td width="20%">
                        <asp:TextBox ID="txt_gorusme_tarihi_saati" runat="server" Width="200px"></asp:TextBox>
                        <asp:MaskedEditExtender ID="txt_gorusme_tarihi_saati_MaskedEditExtender" 
                            runat="server" Century="2000" CultureAMPMPlaceholder="" 
                            CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                            CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                            Mask="99/99/9999 99:99:99" MaskType="DateTime" 
                            TargetControlID="txt_gorusme_tarihi_saati">
                        </asp:MaskedEditExtender>
                    </td>
                    <td width="20%">
                        &nbsp;</td>
                    <td width="20%">
                        &nbsp;</td>
                    <td width="20%">
                        &nbsp;</td>
                </tr>
      
            <tr>
                <td class="style3">
                    Not:</td>
                <td colspan="4">
                    <asp:TextBox ID="txt_not" runat="server" Height="50px" TextMode="MultiLine" 
                        Width="80%"></asp:TextBox>
                </td>
            </tr>
      
    </table> 
     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
             <ContentTemplate>   
                 <asp:GridView ID="gv_arama_listele" runat="server" AutoGenerateColumns="False" 
                     DataKeyNames="cari_gorusmeleri_id" Width="100%" BackColor="#CCFFFF" 
                     onselectedindexchanged="gv_arama_listele_SelectedIndexChanged" 
                     onrowdeleting="gv_arama_listele_RowDeleting" 
                     onrowcreated="gv_arama_listele_RowCreated" 
                     onrowdatabound="gv_arama_listele_RowDataBound" CssClass="GridViewClass">
                     <Columns>
                         <asp:BoundField DataField="cari_gorusmeleri_id" 
                             HeaderText="cari_gorusmeleri_id" InsertVisible="False" ReadOnly="True" 
                             SortExpression="cari_gorusmeleri_id" Visible="False" />
                         <asp:BoundField DataField="cari_id" HeaderText="cari_id" 
                             SortExpression="cari_id" Visible="False" />
                         <asp:BoundField DataField="cari_adi" HeaderText="HASTA ADI" 
                             SortExpression="cari_adi" >
                         <ItemStyle Width="200px" />
                         </asp:BoundField>
                         <asp:BoundField DataField="personel_adi" HeaderText="Personel Adı" 
                             SortExpression="personel_adi" >
                         <ItemStyle Width="100px" />
                         </asp:BoundField>
                         <asp:BoundField DataField="gorusme_tarihi_saati" 
                             HeaderText="GÖRÜŞME TARİHİ SAATİ" SortExpression="gorusme_tarihi_saati" >
                         <ItemStyle Width="150px" />
                         </asp:BoundField>
                         <asp:BoundField DataField="icerik" HeaderText="NOT" 
                             SortExpression="icerik" >
                         <ItemStyle Width="300px" />
                         </asp:BoundField>
                         <asp:BoundField DataField="firma_adi" HeaderText="firma_adi" 
                             SortExpression="firma_adi" Visible="False" />
                         <asp:CommandField ButtonType="Image" 
                            DeleteImageUrl="~/icons/res3232/iptal2.png" ShowDeleteButton="True">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20px" />
                        </asp:CommandField>
                     </Columns>
                 </asp:GridView>
                   </ContentTemplate>
             <Triggers>
                 
                 <asp:AsyncPostBackTrigger ControlID="ibtn_cari_gorusme_kaydet" EventName="Click" />
             </Triggers>
      </asp:UpdatePanel> 
          <p><asp:Label ID="lbl_mesaj1" runat="server"></asp:Label></p>
</div>
    </form>
</body>
</html>


