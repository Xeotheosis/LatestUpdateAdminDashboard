<%@ Page Language="C#" Async="true"  AutoEventWireup="true" CodeBehind="CentralizatorScari.aspx.cs" Inherits="WebAppNet472.Rapoarte.CentralizatorScari" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <div>
             <asp:ListView ID="lvCentralizator" runat="server" DataKeyNames="idScara">
     <LayoutTemplate>
         <table style="border: solid 2px #336699;" cellspacing="0" cellpadding="3" rules="all">
             <tr style="background-color: #336699; color: White;">
                 <th>Scara</th>
                 <th>Suprafata</th>
                 <th>C.P.I.</th>
                 <th>AR (m3)</th>
                 <th>ACM (m3)</th>
                 <th>AR pt ACM (m3)</th>
                 <th>Total AR (lei)</th>
                 <th>Apa pluviala (lei)</th>
                 <th>Total ACM (lei)</th>
                 <th>Total AR pt ACM (lei)</th>
                 <th>Caldura (lei)</th>
                 <th>Cpp1den</th>
                 <th>Cpp2den</th>
                 <th>Cpp3den</th>
                 <th>Cpp4den</th>
                 <th>Cpiscara1den</th>
                 <th>cpiscara2den</th>
                 <th>cpiscara3den</th>
                 <th>Cheltuieli pe CPI</th>
                 <th>Total Luna</th>
                 <th>Restante</th>
                 <th>Penalitati</th>
                 <th>TOTAL</th>
                 <th>Actiuni</th>
             </tr>
             <tbody>
                 <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
             </tbody>
         </table>
     </LayoutTemplate>

     <ItemTemplate>
         <tr>
             <td><%# Eval("Scara")%></td>
             <td><%# Eval("TotalNrPers")%></td>
             <td><%# Eval("TotalCPI")%></td>
             <td><%# Eval("TotalARm3")%></td>
             <td><%# Eval("TotalACMm3")%></td>
             <td><%# Eval("TotalARptACMm3")%></td>
             <td><%# Eval("TotalARlei")%></td>
             <td><%# Eval("TotalApaPluviala")%></td>
             <td><%# Eval("TotalACMlei")%></td>
             <td><%# Eval("TotalARptACMlei")%></td>
             <td><%# Eval("TotalCaldura")%></td>
             <td><%# Eval("TotalCpp1")%></td>
             <td><%# Eval("TotalCpp2")%></td>
             <td><%# Eval("TotalCpp3")%></td>
             <td><%# Eval("TotalCpp4")%></td>
             <td><%# Eval("TotalCpiscara1")%></td>
             <td><%# Eval("TotalCpiscara2")%></td>
             <td><%# Eval("TotalCpiscara3")%></td>
             <td><%# Eval("TotalCpiasoc")%></td>
             <td><%# Eval("totalluna")%></td>
             <td><%# Eval("TotalRestante")%></td>
             <td><%# Eval("TotalPenalitati")%></td>
             <td><%# Eval("total")%></td>
             <td>
                 <asp:HyperLink ID="lnkEdit" runat="server"
                                NavigateUrl='<%# "/AdminAsoc/Rapoarte/AfisScara.aspx?idScara=" + Eval("idScara") %>'
                                Text="Vizualizare" CssClass="btn-lnk" />
             </td>
         </tr>
     </ItemTemplate>
 </asp:ListView>
        </div>
    </form>
</body>
</html>
