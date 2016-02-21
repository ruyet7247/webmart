<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RandevuKarti.aspx.cs" Inherits="Randevu_RandevuKarti" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 12%;
        }
        .style3
        {
            width: 15%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>

    <asp:Panel ID="Panel1" runat="server">
        <table style="width: 100%;">
            <tr>
                <td class="style1">
                    Randevu Tarihi</td>
                <td class="style3">
                   <asp:TextBox ID="txt_randevu_tarihi" runat="server" 
                        ontextchanged="txt_randevu_tarihi_TextChanged" Width="80px" 
                        AutoPostBack="True"></asp:TextBox>
                <asp:CalendarExtender ID="txt_randevu_tarihi_CalendarExtender" runat="server"  Format="dd.MM.yyyy" 
                    Enabled="True" TargetControlID="txt_randevu_tarihi">
                </asp:CalendarExtender>
                    <asp:ImageButton ID="ibtn_randevu_listele" runat="server" 
                        onclick="ibtn_randevu_listele_Click" 
                        ImageUrl="~/Icons/res3232/randevu.png" />
                </td>
                <td class="style1">
                    
                    <asp:ImageButton ID="ibtn_kaydet" runat="server" AlternateText="Randevu Kaydet" 
                        onclick="ibtn_kaydet_Click" ImageUrl="~/Icons/res3232/save2.png" />
                    
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Saati / Dakika</td>
                <td class="style3">
                    <asp:DropDownList ID="dd_randevu_saati" runat="server" Width="45px">
                        <asp:ListItem Value="8">08</asp:ListItem>
                        <asp:ListItem Value="9">09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                    </asp:DropDownList>:
                    <asp:DropDownList ID="dd_randevu_dakika" runat="server">
                        <asp:ListItem Value="0">00</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>45</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style1" align="right">
                    Adı Soyadı</td>
                <td>
                    <asp:TextBox ID="txt_adi_soyadi" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Cep Telefonu</td>
                <td class="style3">
                    <asp:TextBox ID="txt_gsm" runat="server" Width="250px"></asp:TextBox>
                </td>
                <td class="style1" align="right">
                    Hangi Doktor</td>
                <td class="style1">
                    <asp:DropDownList ID="dd_doktor_adi_soyadi" runat="server" 
                        DataSourceID="SqlDataSource_doktorlar" DataTextField="adi" 
                        DataValueField="adi">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_doktorlar" runat="server" 
                         
                        SelectCommand="SELECT dbo.personel_karti.adi+' '+ dbo.personel_karti.soyadi AS adi, dbo.personel_departman_tanimlama.personel_departman_adi FROM dbo.personel_departman_tanimlama INNER JOIN dbo.personel_karti ON dbo.personel_departman_tanimlama.personel_departman_id = dbo.personel_karti.departman_id WHERE personel_departman_adi='DOKTOR'">
                    </asp:SqlDataSource>
                </td>
                    <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    İş Telefonu</td>
                <td class="style3">
                    <asp:TextBox ID="txt_tel" runat="server" Width="250px"></asp:TextBox>
                </td>
                <td class="style1" align="right">
                    Not</td>
                    <td>
                        <asp:TextBox ID="txt_randevu_notu" runat="server" TextMode="MultiLine" 
                            Width="100%"></asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server">
        <asp:GridView ID="gv_arama_listele" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="randevu_id" Width="100%" 
            onrowdeleting="gv_arama_listele_RowDeleting" 
            onselectedindexchanged="gv_arama_listele_SelectedIndexChanged" 
            CssClass="GridViewClass" onrowcreated="gv_arama_listele_RowCreated" 
            onrowdatabound="gv_arama_listele_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="randevu_id" InsertVisible="False" 
                    SortExpression="randevu_id" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("randevu_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("randevu_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Kayıt Tarihi" SortExpression="kayit_tarihi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("kayit_tarihi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("kayit_tarihi", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="70px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Doktor Adı Soyadı" 
                    SortExpression="doktor_adi_soyadi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" 
                            Text='<%# Bind("doktor_adi_soyadi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("doktor_adi_soyadi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Randevu Tarihi" SortExpression="randevu_tarihi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("randevu_tarihi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("randevu_tarihi", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="70px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Randevu Saati" SortExpression="randevu_saati">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("randevu_saati") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("randevu_saati") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Randevu Dakika" SortExpression="randevu_dakika">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("randevu_dakika") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("randevu_dakika") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Adı ve Soyadı" SortExpression="adi_soyadi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("adi_soyadi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("adi_soyadi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gsm" SortExpression="gsm">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("gsm") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("gsm") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tel" SortExpression="tel">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("tel") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("tel") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Randevu Not" SortExpression="randevu_notu">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("randevu_notu") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("randevu_notu") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
				<asp:CommandField ButtonType="Image" 
                    DeleteImageUrl="~/icons/res3232/iptal2.png" ShowDeleteButton="True">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20px" />
                </asp:CommandField>
                  <asp:TemplateField HeaderText="geldi_mi" SortExpression="geldi_mi">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtStatus" runat="server" Text='<%# Bind("geldi_mi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("geldi_mi").ToString().Equals("True") ? "" : "" %>'></asp:Label>
                            <a href='RandevuKarti.aspx?Status=<%# Eval("geldi_mi") %>&RandevuID=<%# Eval("randevu_id") %>'><img src='../icons/res3232/<%# Eval("geldi_mi") %>.png' /></a>
                            
                    </ItemTemplate>
                      <ItemStyle Width="30px" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <p>
        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
    </p>
</asp:Content>

