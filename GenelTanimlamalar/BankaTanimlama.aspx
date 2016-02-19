<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BankaTanimlama.aspx.cs" Inherits="GenelTanimlamar_BankaTanimlama" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        
        .style3
        {
            width: 30%;
        }
     
        .style4
        {
            width: 70%;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        BANKA TANIMLAMA
    </p>
<asp:Panel ID="pnl_kasa_ekle" runat="server" BorderWidth="1px" Width="60%">
    <table style="width:100%;">
        <tr>
            <td class="style3">
                <asp:Label ID="lbl_banka_hesap_id" runat="server" Visible="False">0</asp:Label>
            </td>
            <td class="style4">
                </td>
        </tr>
        <tr>
            <td class="style3">
                Banka Adı</td>
            <td class="style4">
                <asp:TextBox ID="txt_banka_adi" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Hesap Sahibi Adı Soyadı</td>
            <td class="style4">
                <asp:TextBox ID="txt_hesap_sahibi" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Şube Kodu</td>
            <td class="style4">
                <asp:TextBox ID="txt_sube_kodu" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Hesap No</td>
            <td class="style4">
                <asp:TextBox ID="txt_hesap_no" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                IBAN No</td>
            <td class="style4">
                <asp:TextBox ID="txt_iban_no" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Para Birimi</td>
            <td class="style4">
                <asp:DropDownList ID="dd_para_birimi" runat="server" Width="100px" 
                    DataSourceID="SqlDataSource1" DataTextField="para_birimi" 
                    DataValueField="para_birimi_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                     
                    SelectCommand="SELECT [para_birimi_id], [para_birimi] FROM [firma_para_birimi_tanimlama]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Aktif / Pasif</td>
            <td class="style4">
                <asp:DropDownList ID="dd_aktif_or_pasif" runat="server" Width="100px">
                    <asp:ListItem Selected="True" Value="1">Aktif</asp:ListItem>
                    <asp:ListItem Value="0">Pasif</asp:ListItem>
                </asp:DropDownList>
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
                <asp:ImageButton ID="ibtn_post" runat="server" 
                    onclick="ibtn_post_Click" ImageUrl="~/icons/res3232/arti.png" />
                &nbsp;Ekle / Güncelle</td>
        </tr>
</table>
</asp:Panel>
    <p>
        
    </p>
    <asp:Panel ID="Liste" runat="server">
        <asp:GridView ID="gv_listele" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="banka_hesap_id" Width="100%" 
            onselectedindexchanged="gv_listele_SelectedIndexChanged"
            onrowdeleting="gv_listele_RowDeleting" 
            onrowdatabound="gv_listele_RowDataBound" BorderStyle="Solid" 
            onrowcreated="gv_listele_RowCreated">
            <Columns>
               
                <asp:TemplateField HeaderText="B id" SortExpression="banka_hesap_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_banka_hesap_id" runat="server" Text='<%# Bind("banka_hesap_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_anahtar_id" runat="server" Text='<%# Bind("banka_hesap_id") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="10%" />
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Banka Adı" SortExpression="banka_adi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("banka_adi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("banka_adi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="20%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hesap Sahibi" SortExpression="hesap_sahibi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("hesap_sahibi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("hesap_sahibi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="15%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Şube Kodu" SortExpression="sube_kodu">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server"  Text='<%# Bind("sube_kodu") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("sube_kodu") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="15%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hesap No" SortExpression="hesap_no">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("hesap_no") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("hesap_no") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="15%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Iban No" SortExpression="iban">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("iban") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("iban") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="40%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Para Birimi" SortExpression="para_birimi_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("para_birimi_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("para_birimi_id") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="5%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Aktif/Pasif" SortExpression="aktif_or_pasif">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("aktif_or_pasif")  %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%#Eval("aktif_or_pasif").ToString().Equals("True") ? "Aktif" : "Pasif" %>'></asp:Label>
                        <!--<img src='../icons/res3232/<%# Eval("aktif_or_pasif") %>.png' />-->
                    </ItemTemplate>
                    <ItemStyle Width="5%" />
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





