<%@ Page Title="" Language="C#" Async="true" MasterPageFile="~/AdminAsoc/AdminAssociationMaster.Master" AutoEventWireup="true" CodeBehind="ActualizarePreturiSiCoeficienti.aspx.cs" Inherits="WebAppNet472.ActualizarePreturiSiCoeficienti" %>

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
    <h2>Prețuri și coeficienți</h2>

    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />

    <asp:Panel ID="pnlUpdateAssociation" runat="server">
        <table class="table table-bordered compact-table">
            <tr>
                <td style="width: 75%">
                    <asp:Label ID="lblPretGCAL" runat="server" Text="Preț GCal:" AssociatedControlID="txtPretGCAL" /></td>
                <td>
                    <asp:TextBox ID="txtPretGCAL" runat="server" CssClass="form-control editable-field" />
                  <%--  <asp:RegularExpressionValidator ID="revPretGCAL" runat="server" ControlToValidate="txtPretGCAL"
                        ErrorMessage="Please enter a valid number with up to two decimal places."
                        ValidationExpression="^\d+(\.\d{1,2})?$" Display="Dynamic" CssClass="text-danger" />--%>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPretAR" runat="server" Text="Preț Apă rece (m3):" AssociatedControlID="txtPretAR" /></td>
                <td>
                    <asp:TextBox ID="txtPretAR" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPretARptACM" runat="server" Text="Preț Apă rece pentru pentru prep. apă caldă (m3):" AssociatedControlID="txtPretARptACM" /></td>
                <td>
                    <asp:TextBox ID="txtPretARptACM" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPretARptACMconventii" runat="server" Text="Preț Apă rece pentru prep. apă caldă convenții (m3):" AssociatedControlID="txtPretARptACMconventii" /></td>
                <td>
                    <asp:TextBox ID="txtPretARptACMconventii" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCoefPausalAR" runat="server" Text="Coeficient paușal Apă rece:" AssociatedControlID="txtCoefPausalAR" /></td>
                <td>
                    <asp:TextBox ID="txtCoefPausalAR" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCoefPausalACM" runat="server" Text="Coeficient paușal Apă caldă:" AssociatedControlID="txtCoefPausalACM" /></td>
                <td>
                    <asp:TextBox ID="txtCoefPausalACM" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <!-- Add more fields as needed -->
        </table>

        <asp:Button ID="btnUpdate" runat="server" Text="Salveaza" CssClass="btn btn-primary mt-2" OnClick="btnUpdate_Click" />
    </asp:Panel>
</asp:Content>
