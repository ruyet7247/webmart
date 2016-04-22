<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjaxProcessor.aspx.cs" Inherits="Mesaj_AjaxProcessor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

 .GridViewClass td,th
{
     padding-left:5px;
}</style>
</head>
<body>
    <form id="form1" runat="server">

       
        <% //Response.Write(DateTime.Now.ToShortDateString()); %>        <% //=Session["Aralik"].ToString() %>
 <table style="width:100%;">
       
        <tr>
            <td class="style1">
                &nbsp;</td>
             <td class="style2" align="left">
            <asp:GridView ID="gv_mesaj_listele" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                DataKeyNames="id" Width="60%" BackColor="#F7FFF8" 
                                onselectedindexchanged="gv_mesaj_listele_SelectedIndexChanged" 
                                onrowcreated="gv_mesaj_listele_RowCreated" 
                                onrowdatabound="gv_mesaj_listele_RowDataBound" 
                        CssClass="GridViewClass">
                     <Columns>
                         <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id" 
                             Visible="False">
                             <EditItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="tarih" SortExpression="tarih" Visible="False">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tarih") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("tarih") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="gonderici_id" SortExpression="gonderici_id" 
                             Visible="False">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("gonderici_id") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("gonderici_id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="gonderici_adi_soyadi" 
                             SortExpression="gonderici_adi_soyadi" Visible="False">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" 
                                     Text='<%# Bind("gonderici_adi_soyadi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" 
                                     Text='<%# Bind("gonderici_adi_soyadi") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="mesaj" SortExpression="mesaj">
                            <ItemTemplate>
                                <asp:Label ID="lbl_item_tarih" runat="server"  ForeColor="#336699" Text='<%# Bind("tarih") %>'></asp:Label> <% =" - " %>
                                <asp:Label ID="lbl_item_adi_soyadi" runat="server"  ForeColor="#000099" Font-Bold="true" Text='<%# Bind("gonderici_adi_soyadi") %>'></asp:Label><br><br>
                                <asp:Label ID="lbl_item_mesaj" runat="server" Text='<%# Bind("mesaj") %>'></asp:Label><br><br>
                                <%# GetResimGetir((String)Eval("resim_adi")) %>
                                

                            </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="resim_adi" SortExpression="resim_adi" 
                             Visible="False">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("resim_adi") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label6" runat="server" Text='<%# Bind("resim_adi") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                 </asp:GridView>
                    </td>
        </tr>
    </table>

    </form>
</body>
</html>
