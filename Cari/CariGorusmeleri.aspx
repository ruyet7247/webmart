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

     
  <table width="100%"> 
            <tr>
            <td class="style3">
                <asp:Label ID="lbl_cari_hasta_id" runat="server" Text="0"></asp:Label>
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
                            onclick="ibtn_cari_gorusme_kaydet_Click" style="width: 14px" />
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
                     onrowdeleting="gv_arama_listele_RowDeleting">
                     <Columns>
                         <asp:BoundField DataField="cari_gorusmeleri_id" 
                             HeaderText="cari_gorusmeleri_id" InsertVisible="False" ReadOnly="True" 
                             SortExpression="cari_gorusmeleri_id" />
                         <asp:BoundField DataField="cari_id" HeaderText="cari_id" 
                             SortExpression="cari_id" />
                         <asp:BoundField DataField="cari_adi" HeaderText="cari_adi" 
                             SortExpression="cari_adi" />
                         <asp:BoundField DataField="personel_adi" HeaderText="personel_adi" 
                             SortExpression="personel_adi" />
                         <asp:BoundField DataField="gorusme_tarihi_saati" 
                             HeaderText="gorusme_tarihi_saati" SortExpression="gorusme_tarihi_saati" />
                         <asp:BoundField DataField="icerik" HeaderText="icerik" 
                             SortExpression="icerik" />
                         <asp:BoundField DataField="firma_adi" HeaderText="firma_adi" 
                             SortExpression="firma_adi" />
                         <asp:TemplateField ShowHeader="False">
                             <ItemTemplate>
                                 <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                     CommandName="Delete" Text="Delete" OnClientClick="return confirm ('SİLME İşlemi Gerçekleşecek Eminmisiniz!!!');"></asp:LinkButton>
                             </ItemTemplate>
                         </asp:TemplateField>
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


