<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BankaPosTanimlama.aspx.cs" Inherits="GenelTanimlamar_BankaPosTanimlama" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        
        .style3
        {
            width: 20%;
        }
     
        .style4
        {
            width: 80%;
        }
       
     
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        POS TANIMLAMA
    </p>
<asp:Panel ID="pnl_kasa_ekle" runat="server" BorderWidth="1px" Width="60%">
    <table style="width:100%;">
        <tr>
            <td class="style3">
                <asp:Label ID="lbl_pos_id" runat="server" Text="0"></asp:Label>
            </td>
            <td class="style4">
                </td>
        </tr>
        <tr>
            <td class="style3">
                Pos Banka Adi</td>
            <td class="style4">
                <asp:TextBox ID="txt_pos_banka_adi" runat="server" Width="120px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Bağlı Hesap Adı</td>
            <td class="style4">
                <asp:DropDownList ID="dd_bagli_olan_banka_hesap_id" runat="server" 
                    DataSourceID="SqlDataSource_banka_hesap_listesi" DataTextField="banka_hesap_adi" 
                    DataValueField="banka_hesap_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_banka_hesap_listesi" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CnnStr %>" 
                    SelectCommand="SELECT  dbo.banka_kayit.banka_hesap_id, dbo.firma_para_birimi_tanimlama.para_birimi + ' -  ' + dbo.banka_kayit.banka_adi AS banka_hesap_adi FROM dbo.banka_kayit INNER JOIN dbo.firma_para_birimi_tanimlama ON dbo.banka_kayit.para_birimi_id = dbo.firma_para_birimi_tanimlama.para_birimi_id">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Tahakkuk Gün Sayısı</td>
            <td class="style4">
                <asp:TextBox ID="txt_tahakkuk_gun_sayisi" runat="server" Width="120px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                <asp:ImageButton ID="ibtn_post" runat="server" Height="25px" 
                    onclick="ibtn_post_Click" Width="71px" />
            </td>
        </tr>
</table>
</asp:Panel>
    <p>
        
    </p>
    <asp:Panel ID="Panel1" runat="server">
        <asp:GridView ID="gv_listele" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="pos_id" Width="60%" 
            onselectedindexchanged="gv_listele_SelectedIndexChanged"
            onrowdeleting="gv_listele_RowDeleting">
            <Columns>
               
                <asp:TemplateField HeaderText="Pos id" SortExpression="pos_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_pos_id" runat="server" Text='<%# Bind("pos_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_pos_id" runat="server" Text='<%# Bind("pos_id") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="10%" />
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="POS BANKA ADI" SortExpression="pos_banka_adi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pos_banka_adi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("pos_banka_adi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="40%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Kaç Gün Sonra Tahakkuk Edecek">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("tahakkuk_gun_sayisi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("tahakkuk_gun_sayisi") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Select" Text="Select"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="10%" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete"  OnClientClick="return confirm ('SİLME İşlemi Gerçekleşecek Eminmisiniz!!!');"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="10%" />
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </asp:Panel>
    <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>
</asp:Content>
