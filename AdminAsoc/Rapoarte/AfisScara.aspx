<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="AfisScara.aspx.cs" Inherits="WebAppNet472.Rapoarte.AfisScara" %>

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
            <asp:ListView ID="lvAfis" runat="server">
                <LayoutTemplate>
                    <table style="border: solid 2px #336699;" cellspacing="0" cellpadding="3" rules="all">
                        <tr style="background-color: #336699; color: White;">
                            <th>Nr.</th>
                            <th>Suprafata</th>
                            <th>C.P.I.</th>
                            <th>Contorizare</th>
                            <th>Nr. pers.</th>
                            <th>Consum AR</th>
                            <th>Consum ACM</th>
                            <th>Consum AR pt ACM</th>
                            <th>Corectie AR</th>
                            <th>Total AR</th>
                            <th>CppAsoc2den</th>
                            <th>Corectie ACM</th>
                            <th>Total ACM</th>
                            <th>Total AR pt ACM</th>
                            <th>Caldura</th>
                            <th>cpp1den</th>
                            <th>cpp2den</th>
                            <th>cpp3den</th>
                            <th>cpp4den</th>
                            <th>cpiscara2den</th>
                            <th>cpiscara3den</th>
                            <th>cpiscara1den</th>
                            <th>Cheltuieli pe CPI</th>
                            <th>Total Luna</th>
                            <th>Restante</th>
                            <th>Penalitati</th>
                            <th>TOTAL</th>
                            <th>nr</th>
                        </tr>
                        <tbody>
                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                        </tbody>
                    </table>
                </LayoutTemplate>

                <ItemTemplate>
                    <tr>
                        <td><%# Eval("nr")%></td>
                        <td><%# Eval("suprafata")%></td>
                        <td><%# Eval("cpi")%></td>
                        <td><%# Eval("contorizare")%></td>
                        <td><%# Eval("nrpers")%></td>
                        <td><%# Eval("consumar")%></td>
                        <td><%# Eval("consumacm")%></td>
                        <td>consum ar pt acm</td> 
                        <td><%# Eval("pierderiar")%></td>
                        <td><%# Eval("arval")%></td>
                        <td><%# Eval("cppasoc2")%></td>
                        <td><%# Eval("pierderiacm")%></td>
                        <td><%# Eval("acmval")%></td>
                        <td><%# Eval("arptacm")%></td>
                        <td><%# Eval("caldura")%></td>
                        <td><%# Eval("cpp1vala")%></td>
                        <td><%# Eval("cpp2vala")%></td>
                        <td><%# Eval("cpp3vala")%></td>
                        <td><%# Eval("cpp4vala")%></td>
                        <td><%# Eval("cpiscara2")%></td>
                        <td><%# Eval("cpiscara3")%></td>
                        <td><%# Eval("cpiscara1")%></td>
                        <td><%# Eval("cpiasoc")%></td>
                        <td><%# Eval("totalluna")%></td>
                        <td><%# Eval("restante")%></td>
                        <td><%# Eval("penalitati")%></td>
                        <td><%# Eval("total")%></td>
                        <td><%# Eval("nr")%></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </form>
</body>
</html>
