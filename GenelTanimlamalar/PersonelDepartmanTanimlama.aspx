<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PersonelDepartmanTanimlama.aspx.cs" Inherits="GenelTanimlamar_PersonelDepartmanTanimlama" %>

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
        PERSONEL DEPARTMAN TANIMLAMA
    </p>
<asp:Panel ID="pnl_kasa_ekle" runat="server" BorderWidth="1px" Width="60%">
    <table style="width:100%;">
        <tr>
            <td class="style3">
                <asp:Label ID="lbl_personel_departman_id" runat="server" Text="0" 
                    Visible="False"></asp:Label>
            </td>
            <td class="style4">
                </td>
        </tr>
        <tr>
            <td class="style3">
                Departman Adi</td>
            <td class="style4">
                <asp:TextBox ID="txt_personel_departman_adi" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Açıklama</td>
            <td class="style4">
                <asp:TextBox ID="txt_personel_departman_aciklama1" runat="server" 
                    Width="300px"></asp:TextBox>
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
                    onclick="ibtn_post_Click" ImageUrl="~/Icons/res3232/arti.png" />
            </td>
        </tr>
</table>
</asp:Panel>
    <p>
        
    </p>
    <asp:Panel ID="Panel1" runat="server" BorderStyle="Solid">
        <asp:GridView ID="gv_listele" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="personel_departman_id" 
            onselectedindexchanged="gv_listele_SelectedIndexChanged"
            onrowdeleting="gv_listele_RowDeleting" 
            onrowcreated="gv_listele_RowCreated" 
            onrowdatabound="gv_listele_RowDataBound">
            <Columns>
               
                <asp:TemplateField HeaderText="PD id" SortExpression="personel_departman_id" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_personel_departman_id" runat="server" Text='<%# Bind("personel_departman_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_personel_departman_id" runat="server" Text='<%# Bind("personel_departman_id") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="10%" />
                </asp:TemplateField>               
                <asp:TemplateField HeaderText="Departman Adı" 
                    SortExpression="personel_departman_adi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("personel_departman_adi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("personel_departman_adi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Açıklama" 
                    SortExpression="personel_departman_aciklama1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("personel_departman_aciklama1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("personel_departman_aciklama1") %>'></asp:Label>
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