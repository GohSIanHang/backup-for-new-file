<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="chart.aspx.cs" Inherits="AGN.chart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script type='text/javascript'>//<![CDATA[

        $(function () {
            $('#container1').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Daily Sales Statistics',
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
                    name: 'Daily Sales',
                    data: [
                        <%=barData%>

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
                <div id="container1" style="width: 700px; height: 800px; float: right; margin: 0 auto;"></div>
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

        <a href="chart.aspx">   
            <br /><br/ >
                         Daily Sales Report </a><span class="clearfix"></span>

         <a href="monthlysales.aspx">
                        
                         Monthly Sales Report >>></a><span class="clearfix"></span>
       
      
                            


     <a href="adminmenu.aspx">
                        <br /><br/ ><br /><br/ >
                        << Back to Admin Menu</a><span class="clearfix"></span>
                            <br /><br /><br />
        </center>

</asp:Content>
