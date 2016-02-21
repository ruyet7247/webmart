<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="KasaTanimlama.aspx.cs" Inherits="GenelTanimlamar_KasaTanimi" %>

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
        KASA TANIMLAMA
    </p>
<asp:Panel ID="pnl_kasa_ekle" runat="server" BorderWidth="1px" Width="60%">
    <table style="width:100%;">
        <tr>
            <td class="style3">
                <asp:Label ID="lbl_kasa_id" runat="server" Text="0" Visible="False"></asp:Label>
            </td>
            <td class="style4">
                </td>
        </tr>
        <tr>
            <td class="style3">
                Kasa Adi</td>
            <td class="style4">
                <asp:TextBox ID="txt_kasa_adi" runat="server" Width="120px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Para Birimi</td>
            <td class="style4">
                <asp:DropDownList ID="dd_para_birimi" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="para_birimi" DataValueField="para_birimi_id" 
                    ondatabound="dd_para_birimi_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                     
                    
                    SelectCommand="SELECT [para_birimi_id], [para_birimi] FROM [firma_para_birimi_tanimlama]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Açıklama</td>
            <td class="style4">
                <asp:TextBox ID="txt_aciklama" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                <asp:ImageButton ID="ibtn_post" runat="server" 
                    onclick="ibtn_post_Click" ImageUrl="~/Icons/res3232/arti.png" />
            </td>
        </tr>
</table>
</asp:Panel>
    <p>
        
    </p>
    <asp:Panel ID="Panel1" runat="server">
        <asp:GridView ID="gv_kasa_listele" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="kasa_id" 
            onselectedindexchanged="gv_kasa_listele_SelectedIndexChanged"
            onrowdeleting="gv_kasa_listele_RowDeleting" 
            onrowcreated="gv_kasa_listele_RowCreated" 
            onrowdatabound="gv_kasa_listele_RowDataBound">
            <Columns>
               
                <asp:TemplateField HeaderText="Kasa id" SortExpression="kasa_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_kasa_id" runat="server" Text='<%# Bind("kasa_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_kasa_id" runat="server" Text='<%# Bind("kasa_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Kasa Adı" SortExpression="kasa_adi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("kasa_adi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("kasa_adi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Para Birimi" SortExpression="para_birimi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("para_birimi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("para_birimi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Açıklama" SortExpression="aciklama1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("aciklama1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("aciklama1") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="300px" />
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

