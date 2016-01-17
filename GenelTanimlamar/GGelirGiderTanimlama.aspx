﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GGelirGiderTanimlama.aspx.cs" Inherits="GenelTanimlamar_KasaGelirGiderTanimlama" %>


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
       
     
        .style5
        {
            width: 30%;
            height: 26px;
        }
        .style6
        {
            width: 70%;
            height: 26px;
        }
       
     
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        GELİR GİDER TANIMLAMA
    </p>
<asp:Panel ID="pnl_kasa_ekle" runat="server" BorderWidth="1px" Width="60%">
    <table style="width:100%;">
        <tr>
            <td class="style3">
                <asp:Label ID="lbl_gelir_gider_id" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style4">
                </td>
        </tr>
        <tr>
            <td class="style5">
                Gelir-Gider Adi</td>
            <td class="style6">
                <asp:TextBox ID="txt_gelir_gider_adi" runat="server" Width="120px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Gelir / Gider</td>
            <td class="style4">
                <asp:DropDownList ID="dd_gelir_or_gider" runat="server">
                    <asp:ListItem Selected="True" Value="gelir">GELİR</asp:ListItem>
                    <asp:ListItem Value="gider">GİDER</asp:ListItem>
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
                <asp:ImageButton ID="ibtn_post" runat="server" Height="25px" 
                    onclick="ibtn_post_Click" Width="71px" />
            </td>
        </tr>
</table>
</asp:Panel>
    <p>
        
    </p>
    <asp:Panel ID="Panel1" runat="server">
        <asp:GridView ID="gv_gelir_gider_listele" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="gelir_gider_id" Width="60%" 
            onselectedindexchanged="gv_gelir_gider_listele_SelectedIndexChanged"
            onrowdeleting="gv_gelir_gider_listele_RowDeleting">
            <Columns>
               
                <asp:TemplateField HeaderText="GG id" SortExpression="gelir_gider_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_gelir_gider_id" runat="server" Text='<%# Bind("gelir_gider_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_gelir_gider_id" runat="server" Text='<%# Bind("gelir_gider_id") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="10%" />
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Gelir Gider Adı" 
                    SortExpression="gelir_gider_adi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("gelir_gider_adi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("gelir_gider_adi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="30%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gelir / Gider" SortExpression="gelir_or_gider">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("gelir_or_gider") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("gelir_or_gider") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="20%" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Select" Text="Select"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete"  OnClientClick="return confirm ('SİLME İşlemi Gerçekleşecek Eminmisiniz!!!');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </asp:Panel>
    <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>
</asp:Content>



