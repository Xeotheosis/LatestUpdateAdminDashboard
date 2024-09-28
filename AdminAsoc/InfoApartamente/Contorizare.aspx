<%@ Page Title="" Language="C#" Async="true" MasterPageFile="~/AdminAsoc/AdminAssociationMaster.Master" AutoEventWireup="true" CodeBehind="Contorizare.aspx.cs" Inherits="WebAppNet472.Contorizare" %>

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
        <h3>Setari apartamente (Suprafata, contorizare)
        </h3>

        <div class="form-group inline">
            <label class="control-label">Scara</label>
            <asp:DropDownList ID="ddlScara" runat="server"
                CssClass="form-control  "
                AutoPostBack="true"
                OnSelectedIndexChanged="ddlScara_SelectedIndexChanged">
            </asp:DropDownList>
        </div>


        <div class="well" style="background-color: antiquewhite">
            <asp:Label ID="Label1" runat="server" CssClass="control-label" Font-Size="X-Large">Total suprafata:</asp:Label>
            <asp:Label ID="lblSuprafataTotal" runat="server" CssClass="control-label" Font-Size="X-Large" ForeColor="Green"></asp:Label>



        </div>

        <div>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />
        </div>
        <asp:GridView ID="gvApartamente" AutoGenerateColumns="false"
            runat="server"
            CssClass="table" DataKeyNames="idApart"
            OnRowEditing="gvApartamente_RowEditing"
            OnRowCancelingEdit="gvApartamente_RowCancelingEdit"
            OnRowUpdating="gvApartamente_RowUpdating"
            OnRowDataBound="gvApartamente_RowDataBound">
            <Columns>
                <asp:BoundField ReadOnly="true" DataField="Nr" HeaderText="Nr. apt." />
                <asp:TemplateField  HeaderText ="Contorizare">
                    <ItemTemplate>
                       <asp:Label ID="lblContorization" runat="server" Text='<%# Eval("contorizare") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlContorizare" CssClass="editable-field" runat="server">
                            <asp:ListItem Text="CT" Value="CT"></asp:ListItem>
                            <asp:ListItem Text="AP" Value="AP"></asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField ControlStyle-Width="40px" DataField="cpi" ControlStyle-CssClass="editable-field " HeaderText="Suprafata" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>


    </div>
</asp:Content>
