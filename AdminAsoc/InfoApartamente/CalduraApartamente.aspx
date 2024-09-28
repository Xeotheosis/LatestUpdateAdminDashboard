<%@ Page Title="" Language="C#" Async="true" MasterPageFile="~/AdminAsoc/AdminAssociationMaster.Master" AutoEventWireup="true" CodeBehind="CalduraApartamente.aspx.cs" Inherits="WebAppNet472.CalduraApartamente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
       .editable-field {
           background-color: #f0f8ff; /* Light blue background for editable fields */
           border: 1px solid #ccc; /* Light gray border for better visibility */
       }
       .control-label {
           font-weight:bold;
       }
       .table {
           width:100%;
           padding:1rem;
           background-color: #1b263b;
          
           color:white;
       }
       .table th {
           border:1px solid white;
       }
       table td input {
           width:100%;
           color:black;
       }
           table td input:focus, table td input:focus-visible {
               outline:1px solid #5A189A;
               border:none;
               
           }
       table tr td:last-child {
           display:flex;
           justify-content:center;
           align-items:center;
           gap:0.5rem;
       }
           table tr td:last-child a {
                text-align:center;
font-weight:bold;
opacity:80%;
background-color:#0d1b2a;
padding:0.25rem 1rem;
border-radius:5px;
           }
           table tr td:last-child a:hover {
               color:#5A189A;
               cursor:pointer;
               opacity:100%;
           }
           .table td {
               padding:0.35rem;
               border-right:1px solid white;
               border-bottom:1px solid white;
           }
           .table td:first-of-type{
               border-left:1px solid white;
           }
               .table td:last-of-type {
                   border-right:2px solid white;
               }
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1>Caldura</h1>

        <div class="form-group inline">
            <label class="control-label">Scara</label>
            <asp:DropDownList ID="ddlScara" runat="server"
                CssClass="form-control"
                AutoPostBack="true"
                OnSelectedIndexChanged="ddlScara_SelectedIndexChanged">
            </asp:DropDownList>
        </div>


        <div class="well" style="background-color: antiquewhite">
            <asp:Label ID="Label1" runat="server" CssClass="control-label" Font-Size="X-Large">Total caldura:</asp:Label>
            <asp:Label ID="lblCalduraTotal" runat="server" CssClass="control-label" Font-Size="X-Large" ForeColor="Green"></asp:Label>
        </div>

        <div>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />
        </div>

        <asp:GridView ID="gvApartamente" AutoGenerateColumns="false"
            runat="server"
            CssClass="table" DataKeyNames="idApart"
            OnRowEditing="gvApartamente_RowEditing"
            OnRowCancelingEdit="gvApartamente_RowCancelingEdit"
            OnRowUpdating="gvApartamente_RowUpdating">
            <Columns>
                <asp:BoundField ReadOnly="true" DataField="Nr" HeaderText="Nr. apt." />
                <asp:BoundField DataField="contorizare" ReadOnly="true" ControlStyle-CssClass="editable-field " HeaderText="CT/AP" />
                <asp:BoundField DataField="caldura" ControlStyle-CssClass="editable-field " HeaderText="Caldura" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>

    </div>

</asp:Content>
