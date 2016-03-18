<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Mesaj_Dashboard" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
   

    <style type="text/css">
        .style1
        {
            width: 10%;
        }
        .style2
        {
            width: 40%;
        }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <table style="width:100%;">
        <tr>
            <td class="style1" align="right" valign="top">
                DASHBOARD</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1" align="right" valign="top">
                Mesajınız</td>
            <td class="style2">
                <asp:TextBox ID="txt_mesaj" runat="server" Height="100%" Rows="5" 
                    TextMode="MultiLine" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
             <td class="style2" align="left">
                <asp:ImageButton ID="ibtn_post" runat="server" 
                    onclick="ibtn_post_Click" ImageUrl="~/Icons/res3232/save2.png" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2" align="left">
                &nbsp;</td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server">
    <p>
        <asp:Label ID="lbl_baslik" runat="server"></asp:Label></p>
        <asp:Panel ID="Panel2" runat="server">
            
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                
                <ContentTemplate>
               
  <asp:GridView ID="gv_mesaj_listele" runat="server" AutoGenerateColumns="False" 
                     DataKeyNames="id" Width="100%" BackColor="#CCFFFF" 
                     onselectedindexchanged="gv_mesaj_listele_SelectedIndexChanged" 
                     onrowcreated="gv_mesaj_listele_RowCreated" 
                     onrowdatabound="gv_mesaj_listele_RowDataBound" CssClass="GridViewClass">
                     <Columns>
                         <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id" 
                             Visible="False">
                             <EditItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="lbl_mesaj_id" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Tarih" SortExpression="tarih">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tarih") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("tarih") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="gonderici_id" SortExpression="gonderici_id" 
                             Visible="False">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("gonderici_id") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Bind("gonderici_id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Adı Soyadı" 
                             SortExpression="gonderici_adi_soyadi">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" 
                                     Text='<%# Bind("gonderici_adi_soyadi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" 
                                     Text='<%# Bind("gonderici_adi_soyadi") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="200px" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Mesaj" SortExpression="mesaj">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("mesaj") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("mesaj") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                 </asp:GridView>
             </ContentTemplate>
             <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="ibtn_post" EventName="Click" />
             </Triggers>
                
            </asp:UpdatePanel>
            
        </asp:Panel>


    <div id='bodyContent' class='bodyContent'>
         Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus id ipsum odio. Integer non nisl nisl. Integer id adipiscing diam. Maecenas ipsum mauris, auctor hendrerit porttitor vitae, hendrerit eu orci. Aliquam erat volutpat. Morbi dignissim arcu id lorem semper viverra. Donec libero elit, semper et ullamcorper id, dapibus tempus neque. Nullam id dui a quam elementum sagittis non sit amet mi. Cras sed quam eget erat pretium porttitor. Curabitur tincidunt ultricies rutrum. Donec et arcu in risus condimentum laoreet. Curabitur ut diam urna, at venenatis magna. Phasellus tincidunt sapien quis felis ultrices ultricies. Suspendisse vitae nibh id diam imperdiet aliquet ut nec ante. Phasellus ac arcu quis nibh mollis mattis.
    <br/>Nulla tristique vestibulum lacinia. Donec bibendum urn
    </div>
    <!-- <div id="loadButton" class="loadButton">Icerik EKLE</div> -->


        <p><asp:Label ID="lbl_mesaj" runat="server" Text=""></asp:Label>
        </p>
        
    </asp:Panel>
</asp:Content>

