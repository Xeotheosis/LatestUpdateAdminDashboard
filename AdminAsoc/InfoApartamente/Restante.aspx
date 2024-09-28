<%@ Page Title="" Language="C#" Async="true" MasterPageFile="~/AdminAsoc/AdminAssociationMaster.Master" AutoEventWireup="true" CodeBehind="Restante.aspx.cs" Inherits="WebAppNet472.Restante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Consumuri</title>
    <style>
        .editable-field {
            background-color: #f0f8ff; /* Light blue background for editable fields */
            border: 1px solid #ccc; /* Light gray border for better visibility */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h3>Restante si penalitati
        </h3>

        <div class="form-group inline">
            <label class="control-label">Scara</label>
            <asp:DropDownList ID="ddlScara" runat="server"
                CssClass="form-control  "
                AutoPostBack="true"
                OnSelectedIndexChanged="ddlScara_SelectedIndexChanged" >
            </asp:DropDownList>
        </div>

        
        <div class="well" style="background-color: antiquewhite">            
            <asp:Label ID="Label1" runat="server" CssClass="control-label" Font-Size="X-Large">Total restante:</asp:Label>
            <asp:Label ID="lblRestanteTotal" runat="server" CssClass="control-label" Font-Size="X-Large" ForeColor="Green"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" CssClass="control-label" Font-Size="X-Large">Total penalitati:</asp:Label>
            <asp:Label ID="lblPenalitatiTotal" runat="server" CssClass="control-label" Font-Size="X-Large" ForeColor="Green"></asp:Label>


        </div>

        <div>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />
        </div>
        <asp:GridView ID="gvApartamente" AutoGenerateColumns="false"
            runat="server"
            CssClass="table" DataKeyNames="idApart"
            OnRowEditing="gvApartamente_RowEditing" 
            OnRowCancelingEdit="gvApartamente_RowCancelingEdit" 
            OnRowUpdating="gvApartamente_RowUpdating" >
            <Columns>
                <asp:BoundField ReadOnly="true" DataField="Nr" HeaderText="Nr. apt." />
               
                <asp:BoundField ControlStyle-Width="45px" DataField="Restante" ControlStyle-CssClass="editable-field " HeaderText="Restante"/>
                <asp:BoundField ControlStyle-Width="45px" DataField="Penalitati" ControlStyle-CssClass="editable-field " HeaderText="Penalitati"/>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>


    </div>
</asp:Content>
