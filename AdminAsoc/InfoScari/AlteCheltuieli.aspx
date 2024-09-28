<%@ Page Title="" Language="C#" Async="true" MasterPageFile="~/AdminAsoc/AdminAssociationMaster.Master" AutoEventWireup="true" CodeBehind="AlteCheltuieli.aspx.cs" Inherits="WebAppNet472.AdminAsoc.InfoScari.AllteCheltuieli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Alte cheltuieli</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h3>Alte cheltuieli gospodărești</h3>

        <div>
            <div class="form-group inline">
                <label class="control-label">Scara</label>
                <asp:DropDownList ID="ddlScara" runat="server"
                    CssClass="form-control  "
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlScara_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

            <div class="well" style="background-color: antiquewhite">
                <asp:Label ID="lbl1" runat="server" CssClass="control-label" Font-Size="X-Large"></asp:Label>
                <asp:Label ID="lblTotal" runat="server" CssClass="control-label" Font-Size="X-Large" ForeColor="Green"></asp:Label>
            </div>

            <div>
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />
            </div>
            <div style="padding-top: 1em; padding-bottom: 1em">
                <asp:Button ID="btnAddAltaCheltuiala"
                    runat="server" CssClass="btn btn-primary" OnClick="btnAddAltaCheltuiala_Click"
                    Text="Adăugare" />
            </div>

            <%-- <asp:GridView ID="gvFacturi" AutoGenerateColumns="false"
                runat="server" ShowHeaderWhenEmpty="true"
                CssClass="table  table-fixed" DataKeyNames="idFacturaCG"
                OnRowDeleting="gvFacturi_RowDeleting">
                <Columns>
                    <asp:BoundField ReadOnly="true" DataField="FacturaCG" HeaderText="Nr. fact." />

                    <asp:BoundField ReadOnly="true" DataField="Valoare" ControlStyle-CssClass="editable-field " HeaderText="Valoare" />

                    <asp:BoundField ReadOnly="true" DataField="Explicatie" ControlStyle-CssClass="editable-field " HeaderText="Explicatie" />


                    <asp:BoundField ReadOnly="true" DataField="Apartamente"
                        ControlStyle-CssClass="editable-field " HeaderText="Apartamente" />




                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkEdit" runat="server"
                                NavigateUrl='<%# "EditareAlteCheltuieli.aspx?idFacturaCG=" + Eval("idFacturaCG") %>'
                                Text="Edit" CssClass="btn-lnk" />


                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Delete"
                                OnClientClick="return confirm('Sigur stergeti factura?');" CssClass="btn-lnk" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div class="alert-info">Nu sunt facturi.</div>
                </EmptyDataTemplate>
            </asp:GridView>--%>

            <asp:ListView ID="lvFacturi" runat="server" DataKeyNames="idFacturaCG"
                OnItemDeleting="lvFacturi_ItemDeleting">
                <LayoutTemplate>
                    <div style="border: solid 2px #336699; ">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <table border="1">
                        <tr>
                            <td> <label>Nr. Factura:</label></td>
                            <td><%# Eval("FacturaCG") %></td>
                        </tr >
                        <tr>
                            <td> <label>Valoare:</label></td>
                            <td><%# Eval("Valoare") %></td>
                        </tr>
                        <tr>
                            <td><label>Explicatie</label></td>
                            <td  ><%# Eval("Explicatie") %></td>
                        </tr>

                        <tr>
                            <td><label>Repartizare la:</label></td>
                            <td><%# Eval("Apartamente") %></td>
                        </tr>
                        <tr>
                            <td  >
                                <asp:HyperLink ID="lnkEdit" runat="server"
                                    NavigateUrl='<%# "EditareAlteCheltuieli.aspx?idFacturaCG=" + Eval("idFacturaCG") %>'
                                    Text="Edit" CssClass="btn-lnk" />
                                </td>
                            <td>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Delete"
                                    OnClientClick="return confirm('Sigur stergeti factura?');" CssClass="btn-lnk" />
                            </td>
                        </tr>

                    </table>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <div class="alert-info">Nu sunt facturi.</div>
                </EmptyDataTemplate>
            </asp:ListView>

        </div>
    </div>

</asp:Content>
