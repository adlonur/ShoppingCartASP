<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Shopping.aspx.cs" Inherits="AspNetHome3.secure.Shopping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <p>
        Welcome,
        <asp:LoginName ID="LoginName1" runat="server" />&nbsp;&nbsp;
        <asp:LoginStatus ID="LoginStatus1" runat="server" LoginText="Click here to logout." LogoutAction="RedirectToLoginPage" />
    &nbsp;
        <asp:Button ID="Button1" runat="server" Text="Shopping Cart" OnClick="Button1_Click" />
    </p>
    
    <h3>
        Select Item to buy from the below list of items:</h3>
    <p>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1"   OnItemCommand="ListView_OnItemCommand" >
            <AlternatingItemTemplate>
                <tr style="">
                    <td>

                        <asp:Button ID="AddButton" runat="server" Text="Add"  CommandName="AddButton"  CommandArgument='<%#Eval("price") + "/" + Eval("id") + "/" + Eval("quantity") %>'/>
                    </td>
                    
                   
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                       
                    </td>
                     <td><asp:Image ID="ItemImage" Height="100px" Width="100px" runat="server" ImageUrl='<%# BuildItemImageUrl(Eval("Id", "{0}")) %>'/></td>
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    </td>
                    <td>
                        <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                    </td>
                    <td>   <asp:TextBox ID="TextBox1" runat="server" Width="20px">0</asp:TextBox></td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="quantityTextBox" runat="server" Text='<%# Bind("quantity") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="quantityTextBox" runat="server" Text='<%# Bind("quantity") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>  <asp:Button ID="AddButton" runat="server" Text="Add" CommandName="AddButton"   CommandArgument='<%#Eval("price") + "/" + Eval("id") + "/" + Eval("quantity") %>'/>  </td>
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                  <td><asp:Image ID="ItemImage" Height="100px" Width="100px" runat="server" ImageUrl='<%# BuildItemImageUrl(Eval("Id", "{0}")) %>'/></td>
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    </td>
                    <td>
                        <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                    </td>
                     <td>   <asp:TextBox ID="TextBox1" runat="server" Width="20px">0</asp:TextBox></td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
  
                                               <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th></th>
                                    <th runat="server">id</th>
                                    <th runat ="server">picture</th>
                                    <th runat="server">name</th>
                                    <th runat="server">price</th>
                                    <th runat="server">quantity</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                   
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>

                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    </td>
                    <td>
                        <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:533hw3ConnectionString %>" SelectCommand="SELECT * FROM [items]"></asp:SqlDataSource>
    </p>
</asp:Content>
