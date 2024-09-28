<%@ Page Title="" Language="C#" Async="true" MasterPageFile="~/AdminAsoc/AdminAssociationMaster.Master" AutoEventWireup="true" CodeBehind="CheltuieliAdministrative.aspx.cs" Inherits="WebAppNet472.CheltuieliAdministrative" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



    <style>
        .editable-field {
            background-color: #f0f8ff; /* Light blue background for editable fields */
            border: 1px solid #ccc; /* Light gray border for better visibility */

        }
    </style>


   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Cheltuieli administrative</h2>

    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />

    <asp:Panel ID="pnlUpdateAssociation" runat="server">
        <table class="table table-bordered compact-table">

            <tr>
                <td style="background-color: black; width: 75%">
                    <asp:TextBox ID="txtCpiA0den" runat="server" BackColor="Black" ForeColor="White" CssClass="form-control editable-field" /></td>
                <td>
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCpiA1den" runat="server" CssClass="form-control editable-field" /></td>
                <td>
                    <asp:TextBox ID="txtCpiA1val"  runat="server" onkeyup="formatNumber(this)" onblur="onBlurFormat(this)"  CssClass="form-control editable-field" /></td>
                
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCpiA2den" runat="server" CssClass="form-control editable-field" /></td>
                <td>
                    <asp:TextBox ID="txtCpiA2val" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCpiA3den" runat="server" CssClass="form-control editable-field" /></td>
                <td>
                    <asp:TextBox ID="txtCpiA3val" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCpiA4den" runat="server" CssClass="form-control editable-field" /></td>
                <td>
                    <asp:TextBox ID="txtCpiA4val" runat="server" CssClass="form-control editable-field" /></td>
            </tr>

            <!-- Add more fields as needed -->

            <tr>
                <td style="background-color: black; width: 75%">
                    <asp:TextBox ID="txtCpiB0den" runat="server" BackColor="Black" ForeColor="White" CssClass="form-control editable-field" /></td>
                <td>
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCpiB1den" runat="server" CssClass="form-control editable-field" /></td>
                <td>
                    <asp:TextBox ID="txtCpiB1val" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCpiB2den" runat="server" CssClass="form-control editable-field" /></td>
                <td>
                    <asp:TextBox ID="txtCpiB2val" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCpiB3den" runat="server" CssClass="form-control editable-field" /></td>
                <td>
                    <asp:TextBox ID="txtCpiB3val" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCpiB4den" runat="server" CssClass="form-control editable-field" /></td>
                <td>
                    <asp:TextBox ID="txtCpiB4val" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCpiB5den" runat="server" CssClass="form-control editable-field" /></td>
                <td>
                    <asp:TextBox ID="txtCpiB5val" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCpiB6den" runat="server" CssClass="form-control editable-field" /></td>
                <td>
                    <asp:TextBox ID="txtCpiB6val" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <!-- Add more fields as needed -->

            <tr>
                <td style="background-color: black; width: 75%">
                    <asp:TextBox ID="txtCpiC0den" runat="server" BackColor="Black" ForeColor="White" CssClass="form-control editable-field" /></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCpiC1den" runat="server" CssClass="form-control editable-field" /></td>
                <td>
                    <asp:TextBox ID="txtCpiC1val" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCpiC2den" runat="server" CssClass="form-control editable-field" /></td>
                <td>
                    <asp:TextBox ID="txtCpiC2val" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCpiC3den" runat="server" CssClass="form-control editable-field" /></td>
                <td>
                    <asp:TextBox ID="txtCpiC3val" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCpiC4den" runat="server" CssClass="form-control editable-field" /></td>
                <td>
                    <asp:TextBox ID="txtCpiC4val" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCpiC5den" runat="server" CssClass="form-control editable-field" /></td>
                <td>
                    <asp:TextBox ID="txtCpiC5val" runat="server" CssClass="form-control editable-field" /></td>
            </tr>
         
            <!-- Add more fields as needed -->

        </table>

        <asp:Button ID="btnUpdate" runat="server" Text="Salveaza" CssClass="btn btn-primary mt-2"   OnClick="btnUpdate_Click" />
    </asp:Panel>

    

</asp:Content>