<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Mesaj.aspx.cs" Inherits="Mesaj_Mesaj" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 40%;
        }
        .style3
        {
            width: 3%;
        }
        .style4
        {
            width: 38%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td class="style1">
                Kullanıcı 
                veya Grup Seçiniz</td>
            <td class="style2">
                <asp:DropDownList ID="dd_kullanici_listele" runat="server" 
                    DataSourceID="SqlDataSource_kullanici" DataTextField="adi_soyadi" 
                    DataValueField="kullanici_id" ondatabound="dd_kullanici_listele_DataBound" 
                    AutoPostBack="True" 
                    onselectedindexchanged="dd_kullanici_listele_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:DropDownList ID="dd_grup_listele" runat="server" 
                    DataSourceID="SqlDataSource_grup" DataTextField="yetki_adi" 
                    DataValueField="yetki_id" ondatabound="dd_grup_listele_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_grup" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WebMart_Master %>" 
                    SelectCommand="SELECT [yetki_id], [yetki_adi] FROM [yetki_grubu]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource_kullanici" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WebMart_Master %>" 
                    SelectCommand="SELECT [kullanici_id], [adi_soyadi] FROM [firma_kullanici_kayit] WHERE aktif_or_pasif='True'">
                </asp:SqlDataSource>
            </td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                Okunmamış Gelen Mesajlar</td>
        </tr>
        <tr>
            <td class="style1">
                Mesajınız</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                <asp:TextBox ID="txt_mesaj" runat="server" Height="100%" Rows="5" 
                    TextMode="MultiLine" Width="100%"></asp:TextBox>
            </td>
            <td class="style3">
                &nbsp;</td>
            <td>
                <asp:GridView ID="gv_okunmamis_mesajlar" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="id" Width="100%" AllowPaging="True" BorderStyle="Solid" 
                    onpageindexchanging="gv_okunmamis_mesajlar_PageIndexChanging" PageSize="5" 
                    onselectedindexchanged="gv_okunmamis_mesajlar_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="tarih" SortExpression="tarih">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tarih") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("tarih") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="gonderici_id" SortExpression="gonderici_id">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("gonderici_id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_gonderici_id" runat="server" Text='<%# Bind("gonderici_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="gonderici_adi_soyadi" 
                            SortExpression="gonderici_adi_soyadi">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" 
                                    Text='<%# Bind("gonderici_adi_soyadi") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" 
                                    Text='<%# Bind("gonderici_adi_soyadi") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="mesaj" SortExpression="mesaj" Visible="False">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("mesaj") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("mesaj") %>'></asp:Label>
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
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2" align="right">
                <asp:ImageButton ID="ibtn_post" runat="server" Height="21px" Width="48px" 
                    onclick="ibtn_post_Click" />
            </td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server">
    <p>
        <asp:Label ID="lbl_baslik" runat="server"></asp:Label></p>
        <asp:GridView ID="gv_listele" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" Width="100%" 
            onselectedindexchanged="gv_listele_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="grubu_id" SortExpression="grubu_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("grubu_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("grubu_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="tarih" SortExpression="tarih">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("tarih") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("tarih") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="gonderici_id" SortExpression="gonderici_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("gonderici_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("gonderici_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="gonderici_adi_soyadi" 
                    SortExpression="gonderici_adi_soyadi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" 
                            Text='<%# Bind("gonderici_adi_soyadi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" 
                            Text='<%# Bind("gonderici_adi_soyadi") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="alici_id" SortExpression="alici_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("alici_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("alici_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="mesaj" SortExpression="mesaj">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("mesaj") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("mesaj") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="okundu_mu" SortExpression="okundu_mu">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" 
                            Checked='<%# Bind("okundu_mu") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("okundu_mu") %>' 
                            Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <p><asp:Label ID="lbl_mesaj" runat="server" Text=""></asp:Label>
        </p>
        
    </asp:Panel>
</asp:Content>



