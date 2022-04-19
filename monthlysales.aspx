<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="monthlysales.aspx.cs" Inherits="AGN.monthlysales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script type='text/javascript'>//<![CDATA[

        $(function () {
            $('#container').highcharts({
                chart: {
                    type: 'spline'
                },
                title: {
                    text: 'Monthly Sales Statistics',
                    style: {
                        color: '#6d869f',
                        fontFamily: '"Lucida Grande", "Lucida Sans Unicode", Verdana, Arial, Helvetica, sans-serif',
                        fontSize: '20px',
                        fontWeight: 'bold',
                        fill: '#6d869f'
                    }
                },
                subtitle: {
                    text: 'Source: Sales Per Day'
                },
                xAxis: {
                    type: 'category',
                    labels: {
                        rotation: -45,
                        style: {
                            fontSize: '15px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Total Sales (RM)',
                        style: {
                            color: '#6d869f',
                            fontFamily: '"Lucida Grande", "Lucida Sans Unicode", Verdana, Arial, Helvetica, sans-serif',
                            fontSize: '20px',
                            fontWeight: 'bold',
                            fill: '#6d869f'
                        }

                    },
                    labels: {

                        style: {
                            fontSize: '15px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                },
                legend: {
                    enabled: false
                },
                tooltip: {
                    pointFormat: 'Total Sales: RM <b>{point.y:.1f} Ringgit</b>'
                },
                series: [{
                    name: 'Sales',
                    data: [
                        <%=lineData%>

                    ],

                }]

            });
        });

    </script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div id="contents">
        <div class="container-fluid">
            <br /><br />
            <div class="row">
                <div id="container" style="width: 700px; height: 800px; float: right; margin: 0 auto;"></div>
            </div>
            <br /><br />
        </div>
    </div>
  <%--  <table>
        <tr>
            <td>
                <asp:GridView ID="gvLineChart" runat="server">
                </asp:GridView> 
            </td>
            <td>
                <div id="mylinechart"></div>
            </td>
        </tr>
    </table>--%>

    <center>

        <%--<label>Monthly Sales Report</label>
             <div class="mx-auto">
         <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/imgs/report.png"
                                                        Width="150" Height="40"  CausesValidation="False" OnClick="ImageButton4_Click"/>
            </div>--%>
     <a href="monthlysales.aspx">
                        <br /><br/ >
                         Monthly Sales Report</a><span class="clearfix"></span>
       
      <a href="chart.aspx">   
                         <<< Daily Sales Report </a><span class="clearfix"></span>
                            

     <a href="adminmenu.aspx">
                        <br /><br/ ><br /><br/ >
                        << Back to Admin Menu</a><span class="clearfix"></span>
                            <br /><br /><br />
        </center>

</asp:Content>
