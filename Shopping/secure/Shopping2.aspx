<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Shopping2.aspx.cs" Inherits="AspNetHome3.secure.Shopping2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
<p>
        Welcome,
        <asp:LoginName ID="LoginName1" runat="server" />&nbsp;&nbsp;
        <asp:LoginStatus ID="LoginStatus1" runat="server" LoginText="Click here to logout." LogoutAction="RedirectToLoginPage" />
    &nbsp;
        </p>
    
    <h3>
        Shopping Cart:</h3>

    <asp:BulletedList ID="BulletedList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" ></asp:BulletedList>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:533hw3ConnectionString %>" SelectCommand="SELECT [name] FROM [items] where id='';" 
                     UpdateCommand="UPDATE [items] SET [quantity]=@quantity WHERE [id]=@id"></asp:SqlDataSource>
                 &nbsp;Total Cost is :&nbsp;
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Checkout" />
    <asp:Label ID="Label2" runat="server" ForeColor="Red" ></asp:Label>
    <br />
    <br />
    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/secure/Shopping.aspx">Click here go back to list of items</asp:LinkButton>
</asp:Content>
