<%@ Page Title="" Language="C#" MasterPageFile="~/SiteYonetim.master" AutoEventWireup="true" CodeFile="YetkiGruplari.aspx.cs" Inherits="Yonetim_YetkiGruplari" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 20%;
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
    <asp:Label ID="lbl_yetki_id" runat="server" Text="0" Visible="False"></asp:Label>
    <table style="width:100%;">
        <tr>
            <td class="style1">
                Yetki Grup Adı</td>
            <td class="style2">
                <asp:TextBox ID="txt_yetki_adi" runat="server" Width="70%"></asp:TextBox>
              
            </td>
           <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Açıklama</td>
            <td class="style2">
                <asp:TextBox ID="txt_yetki_aciklama" runat="server" Width="93%" Height="21px"></asp:TextBox>
            </td>
           <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:CheckBox ID="cb_genel" runat="server" Text="Genel Tanımlamalar" />
            </td>
            <td class="style2">
                <asp:CheckBox ID="cb_kasa" runat="server" Text="Kasa Modülü" />
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:CheckBox ID="cb_cari" runat="server" Text="Cari Modülü" />
            </td>
            <td class="style2">
                <asp:CheckBox ID="cb_randevu" runat="server" Text="Randevu Modülü" />
            </td>
           <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:CheckBox ID="cb_stok" runat="server" Text="Stok Modülü" />
            </td>
            <td class="style2">
                <asp:CheckBox ID="cb_mesaj" runat="server" Text="Mesaj Modülü" />
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:CheckBox ID="cb_personel" runat="server" Text="Personel-Maaş Modülü" />
            </td>
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
                <asp:ImageButton ID="ibtn_kaydet" runat="server" 
                    onclick="ibtn_guncelle_Click" ImageUrl="~/Icons/res3232/post.png" />
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
    <asp:Panel ID="pnl_liste" runat="server">
    <asp:GridView ID="gv_listele" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="yetki_id" Width="80%" 
            onselectedindexchanged="gv_listele_SelectedIndexChanged" 
            onrowdeleting="gv_listele_RowDeleting" CssClass="GridViewClass">
            <Columns>
               
                <asp:TemplateField HeaderText="yetki_id" InsertVisible="False" 
                    SortExpression="yetki_id" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("yetki_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_yetki_id" runat="server" Text='<%# Bind("yetki_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Yetki Adı" SortExpression="yetki_adi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("yetki_adi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("yetki_adi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Açıklama" SortExpression="yetki_aciklama">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("yetki_aciklama") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("yetki_aciklama") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Genel" SortExpression="Genel">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Genel") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Genel") %>' 
                            Enabled="false" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cari" SortExpression="Cari">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Cari") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Cari") %>' 
                            Enabled="false" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Stok" SortExpression="Stok">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("Stok") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("Stok") %>' 
                            Enabled="false" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Personel" SortExpression="Personel">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Personel") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Personel") %>' 
                            Enabled="false" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Kasa" SortExpression="Kasa">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Bind("Kasa") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Bind("Kasa") %>' 
                            Enabled="false" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Randevu" SortExpression="Randevu">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Bind("Randevu") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Bind("Randevu") %>' 
                            Enabled="false" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mesaj" SortExpression="Mesaj">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Bind("Mesaj") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Bind("Mesaj") %>' 
                            Enabled="false" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                </asp:TemplateField>
				<asp:CommandField ButtonType="Image" 
                    DeleteImageUrl="~/icons/res3232/iptal2.png" ShowDeleteButton="True">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20px" />
                </asp:CommandField>

                <asp:CommandField ButtonType="Image" SelectImageUrl="~/icons/res3232/sagok.png" 
                    ShowSelectButton="True">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20px" />
                </asp:CommandField>

            </Columns>
        </asp:GridView>
    </asp:Panel>
     <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>
</asp:Content>


