<%@ Page Title="" Language="C#" Async="true" MasterPageFile="~/AdminAsoc/AdminAssociationMaster.Master" AutoEventWireup="true" CodeBehind="UpdateAssociation.aspx.cs" Inherits="WebAppNet472.UpdateAssociation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .compact-table td {
            padding: 4px;
        }

        .editable-field {
            background-color: #f0f8ff; /* Light blue background for editable fields */
            border: 1px solid #ccc; /* Light gray border for better visibility */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Informații generale</h2>

    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />

    <asp:Panel ID="pnlUpdateAssociation" runat="server">
        <table class="table table-bordered compact-table">
            <tr>
                <td style="width:30%"><asp:Label ID="lblDenumire" runat="server" Text="Denumire:" AssociatedControlID="txtDenumire" /></td>
                <td><asp:TextBox ID="txtDenumire" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblDenScurta" runat="server" Text="Denumire Scurta:" AssociatedControlID="txtDenScurta" /></td>
                <td><asp:TextBox ID="txtDenScurta" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblAdresa" runat="server" Text="Adresa:" AssociatedControlID="txtAdresa" /></td>
                <td><asp:TextBox ID="txtAdresa" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblPresedinte" runat="server" Text="Presedinte:" AssociatedControlID="txtPresedinte" /></td>
                <td><asp:TextBox ID="txtPresedinte" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblAdministrator" runat="server" Text="Administrator:" AssociatedControlID="txtAdministrator" /></td>
                <td><asp:TextBox ID="txtAdministrator" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblCenzor" runat="server" Text="Cenzor:" AssociatedControlID="txtCenzor" /></td>
                <td><asp:TextBox ID="txtCenzor" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblAnLucru" runat="server" Text="An Lucru:" AssociatedControlID="txtAnLucru" /></td>
                <td><asp:TextBox ID="txtAnLucru" runat="server" Enabled="false" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblLunaLucru" runat="server"   Text="Luna Lucru:" AssociatedControlID="txtLunaLucru" /></td>
                <td><asp:TextBox ID="txtLunaLucru" runat="server" Enabled="false" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblTelefon" runat="server" Text="Telefon:" AssociatedControlID="txtTelefon" /></td>
                <td><asp:TextBox ID="txtTelefon" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <!-- Add more fields as needed -->
        </table>

        <asp:Button ID="btnUpdate" runat="server" Text="Salveaza" CssClass="btn btn-primary mt-2" OnClick="btnUpdate_Click" />
    </asp:Panel>
</asp:Content>