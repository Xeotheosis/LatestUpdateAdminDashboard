<%@ Page Title="" Language="C#" MasterPageFile="~/AdminAsoc/AdminAssociationMaster.Master" AutoEventWireup="true" CodeBehind="InfoAsociatie.aspx.cs" Inherits="WebAppNet472.AdminAsoc.InfoAsociatie.InfoAsociatie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <ul class="navbar-nav mr-auto">

        <li class="nav-item">
            <a class="nav-link" href="UpdateAssociation.aspx?idAsoc=35">Editare Informații generale</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="ActualizarePreturiSiCoeficienti.aspx?idAsoc=35">Prețuri și coeficienți</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="CheltuieliAdministrative.aspx?idAsoc=35">Cheltuieli administrative</a>
        </li>
    </ul>

</asp:Content>

