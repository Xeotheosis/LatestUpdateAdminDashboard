<%@ Page Title="" Language="C#" MasterPageFile="~/AdminAsoc/AdminAssociationMaster.Master" AutoEventWireup="true" CodeBehind="InfoApartamente.aspx.cs" Inherits="WebAppNet472.AdminAsoc.InfoApartamente.InfoApartamente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item">
            <a class="nav-link" href="Consumuri.aspx?idAsoc=35">Consumuri de apa, numar de persoane</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="Restante.aspx?idAsoc=35">Restante, penalitati</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="CalduraApartamente.aspx?idAsoc=35">Caldura apartamente</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="Contorizare.aspx?idAsoc=35">Setari apartamente (contorizare, suprafata)</a>
        </li>
    </ul>
</asp:Content>
