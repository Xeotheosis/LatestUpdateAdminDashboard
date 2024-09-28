<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AdminAppMaster.Master" CodeBehind="AdminApp.aspx.cs" Inherits="WebAppNet472.AdminApp" Async="true"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Admin App - Manage Association Administrators and Logs</h2>

    <!-- Section for Managing Association Administrators -->
    <h3>Manage Association Administrators</h3>
    <div>
        <asp:TextBox ID="txtUsername" runat="server" Placeholder="UserId" CssClass="form-control" />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password" CssClass="form-control mt-2" />
        <asp:Button ID="btnAddUser" runat="server" Text="Add User" CssClass="btn btn-primary mt-2" OnClick="btnAddUser_Click" />
        <asp:Label ID="lblUserMessage" runat="server" CssClass="text-success mt-2" />
    </div>
    <h3 class="mt-4">Association Administrators</h3>
    <asp:GridView ID="gvUsers" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" OnRowDeleting="gvUsers_RowDeleting">
        <Columns>
            <asp:BoundField DataField="UserId" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="UserName" HeaderText="Utilizator" />
            <asp:BoundField DataField="Role" HeaderText="Role" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>

    <!-- Section for Viewing Access Logs -->
    <h3 class="mt-4">Access Logs (Last 7 Days)</h3>
    <asp:GridView ID="gvAccessLogs" runat="server" CssClass="table table-striped" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="LogId" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="UserId" HeaderText="User ID" />
            <asp:BoundField DataField="Username" HeaderText="Username" />
            <asp:BoundField DataField="Action" HeaderText="Action" />
            <asp:BoundField DataField="Timestamp" HeaderText="Timestamp" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
            <asp:BoundField DataField="Details" HeaderText="Details" />
        </Columns>
    </asp:GridView>
    <asp:Button ID="btnPreviousAccessLogs" runat="server" Text="Previous" CssClass="btn btn-secondary mt-2" OnClick="btnPreviousAccessLogs_Click" />
    <asp:Button ID="btnNextAccessLogs" runat="server" Text="Next" CssClass="btn btn-secondary mt-2" OnClick="btnNextAccessLogs_Click" />

    <!-- Section for Viewing and Deleting Error Logs -->
    <h3 class="mt-4">Error Logs</h3>
    <asp:GridView ID="gvErrorLogs" runat="server" DataKeyNames="LogId" CssClass="table table-striped" AutoGenerateColumns="False" OnRowDeleting="gvErrorLogs_RowDeleting">
        <Columns>
            <asp:BoundField DataField="LogId" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="UserId" HeaderText="User ID" />
            <asp:BoundField DataField="Username" HeaderText="Username" />
            <asp:BoundField DataField="ErrorMessage" HeaderText="Error Message" />
            <asp:BoundField DataField="StackTrace" HeaderText="Stack Trace" />
            <asp:BoundField DataField="Timestamp" HeaderText="Timestamp" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <asp:Button ID="btnPreviousErrorLogs" runat="server" Text="Previous" CssClass="btn btn-secondary mt-2" OnClick="btnPreviousErrorLogs_Click" />
    <asp:Button ID="btnNextErrorLogs" runat="server" Text="Next" CssClass="btn btn-secondary mt-2" OnClick="btnNextErrorLogs_Click" />
</asp:Content>
