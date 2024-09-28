<%@ Page Title="" Language="C#" Async="true" MasterPageFile="~/AdminAsoc/AdminAssociationMaster.Master" AutoEventWireup="true" CodeBehind="AltaFacturaPersoane.aspx.cs" Inherits="WebAppNet472.AdminAsoc.InfoScari.AltaFacturaPersoane" %>

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
     <section class="flex items-center justify-around flex-row bg-[#1b263b] py-4 rounded-tr-lg rounded-tl-lg">
      <div class="text-5xl text-white font-bold"><h3>Facturi Persoane</h3></div>
 
<div class="col-span-2 grid place-items-center relative max-h-80">
    <canvas  id="myChart" width="300" height="300"></canvas>
    <div class="absolute z-10">
        <asp:Label ID="lblTotal" runat="server" CssClass="control-label" Font-Size="X-Large" ForeColor="Green"></asp:Label>
        <p class="text-white text-sm text-center">RON</p>
    </div>
    </div>

  <div>
<ul class="flex flex-col gap-6 mx-auto">
    <li class="text-[0.80rem] text-white flex items-center gap-2"><span class="bg-[#b56bc9] text-black px-2 rounded-full">41%</span>Ianuarie</li>
    <li class="text-[0.80rem] text-white flex items-center gap-2"><span class="bg-[#eb427d] px-2 rounded-full text-black">29%</span>Februarie</li>
    <li class="text-[0.80rem] text-white flex items-center gap-2"><span class="bg-[#ed6d02] px-2 rounded-full text-black">23%</span>Martie</li>
    <li class="text-[0.80rem] text-white flex items-center gap-2"><span class="bg-[#fdd840] px-2 rounded-full text-black">4%</span>Aprilie</li>
    <li class="text-[0.80rem] text-white flex items-center gap-2"><span class="bg-[#68f0b0] px-2 rounded-full text-black">3%</span>Mai</li>
</ul>
  </div>
  </section>    
        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />
        <asp:GridView ID="gvFact"
            runat="server"
            CssClass="table table-condensed"
            DataKeyNames="idScara"
            AutoGenerateColumns="false"
            OnRowEditing="gvFact_RowEditing"
            OnRowCancelingEdit="gvFact_RowCancelingEdit"
            OnRowUpdating="gvFact_RowUpdating">
            <Columns>
                <asp:BoundField HeaderText="Scara" DataField="NumeScara" ReadOnly="true" />
                <asp:BoundField HeaderText="Denumire" DataField="cpp4den" ControlStyle-CssClass="editable-field " />
                <asp:BoundField HeaderText="Valoare" DataField="cpp4val" ControlStyle-CssClass="editable-field " />
                <asp:CommandField ShowEditButton="True" />
            </Columns>

        </asp:GridView>
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
 
<script>
    document.addEventListener("DOMContentLoaded", () => {
        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: {

                datasets: [{

                    data: [41, 29, 23, 4, 3],
                    backgroundColor: [
                        '#b56bc9',
                        '#eb427d',
                        '#ed6d02',
                        '#fdd840',
                        '#68f0b0'
                    ],
                    borderColor: [
                        'transparent',
                        'transparent',
                        'transparent',
                        'transparent',
                        'transparent',
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                cutoutPercentage: 80,
                responsive: true,
                legend: {
                    display: false
                },
                animation: {
                    animateScale: false, // Animates the scaling of the doughnut chart
                    animateRotate: true, // Animates the rotation of the doughnut chart
                    duration: 2000,      // Duration of the animation in milliseconds
                    easing: 'easeInOutBounce' // Easing function for the animation
                }
            }
        });
    });
</script>
</asp:Content>
