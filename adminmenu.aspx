<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminmenu.aspx.cs" Inherits="AGN.adminmenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        #load {
            top: 0; 
  left: 0; 

  /* Preserve aspet ratio */
  min-width: 100%;
  min-height: 100%;
            position:fixed;
            z-index:9999;
            background:url("imgs/1.gif") no-repeat center center rgba(255,255,255,255)
           
        }
    </style>

    <script>
        $(window).scroll(function () {
            sessionStorage.scrollTop = $(this).scrollTop();
        });
        $(document).ready(function () {
            if (sessionStorage.scrollTop != "undefined") {
                $(window).scrollTop(sessionStorage.scrollTop);
            }
        });

        document.onreadystatechange = function () {
            var state = document.readyState
            if (state == 'interactive') {
                document.getElementById('contents').style.visibility = "hidden";
            } else if (state == 'complete') {
                setTimeout(function () {
                    document.getElementById('interactive');
                    document.getElementById('load').style.visibility = "hidden";
                    document.getElementById('contents').style.visibility = "visible";
                }, 100);
            }
        }
    </script>
    <style>
        body {
            background-image: url("imgs/green.jpg");
            background-color: #cccccc;
            background-size: auto;
            background-size: 2000px 3000px;
            width: 100%;
            height: auto;
            min-height: 100%;
            min-width: 1024px;
            top: 0;
            left: 0;
        }

        .w3-container {
            /*border-style: solid;*/
            /*border-color: coral;*/
            opacity: 0.9;
            background: #273746;
            margin: 30px;
            border-radius: 10px;
            padding: 50px;
            box-shadow: 300px;
            margin-top: 70px;
            margin-right: 5px;
            margin-left: 5px;
            margin-bottom: 10px;
        }

        .panel1 {
            min-width: 100px;
            width: 100px;
            height: 120px;
            margin-bottom: 100px;
            box-shadow: 100px;
        }

        .row {
            margin-right: 140px;
            margin-left: 140px;
        }

        .row1 {
            margin-bottom: 60px;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="load"></div>




    <div class="row">

        <a href="adminrefund.aspx" >
            <div class="col-md-4" style="vertical-align: middle; text-align: center;">
                <div class="w3-container" >
                    <div class="w3-panel w3-dark w3-round-xlarge">
                        <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-primary"></i><i class="fas fa-money-check-alt fa-stack-1x fa-inverse"></i></span>
                        <h2 class="StepTitle" style="color: white">Refund Customer</h2>

                        <p class="links cl-effect-1">
                            <a href="adminrefund.aspx" style="color: white">Refund Customer Cancelled Service
                            </a>
                        </p>
                    </div>
                </div>

            </div>
        </a>


        <a href="adminpayment.aspx">
            <div class="col-md-4" style="vertical-align: middle; text-align: center;">
                <div class="w3-container">
                    <div class="w3-panel w3-dark w3-round-xlarge">
                        <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-success"></i><i class="fas fa-hand-holding-usd fa-stack-1x fa-inverse"></i></span>
                        <h2 class="StepTitle" style="color: white">User Payment History</h2>

                        <p class="links cl-effect-1">
                            <a href="adminpayment.aspx" style="color: white">Check all user payment record
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </a>

        <a href="adminSManagement.aspx">
            <div class="col-md-4" style="vertical-align: middle; text-align: center;">
                <div class="w3-container">
                    <div class="w3-panel w3-dark w3-round-xlarge">
                        <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-warning"></i><i class="fas fa-comments fa-stack-1x fa-inverse"></i></span>
                        <h2 class="StepTitle" style="color: white">Feedback Management</h2>
                        <p class="links cl-effect-1">
                            <a href="adminSManagement.aspx" style="color: white">Manage feedback from customer
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </a>
    </div>

    <div class="row">
        <a href="adminmembermanagement.aspx">
            <div class="col-md-4" style="vertical-align: middle; text-align: center;">
                <div class="w3-container">
                    <div class="w3-panel w3-dark w3-round-xlarge">
                        <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-danger"></i><i class="fas fa-users fa-stack-1x fa-inverse"></i></span>
                        <h2 class="StepTitle" style="color: white">User Management</h2>

                        <p class="links cl-effect-1">
                            <a href="adminmembermanagement.aspx" style="color: white">To approve user profile status
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </a>

        <a href="coachpage.aspx">
            <div class="col-md-4" style="vertical-align: middle; text-align: center;">
                <div class="w3-container">
                    <div class="w3-panel w3-dark w3-round-xlarge">
                        <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-primary"></i><i class="fas fa-chalkboard-teacher fa-stack-1x fa-inverse"></i></span>
                        <h2 class="StepTitle" style="color: white">Coach Management</h2>

                        <p class="links cl-effect-1">
                            <a href="coachpage.aspx" style="color: white">Add, edit, update coach details
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </a>

        <a href="adminserviceinventory.aspx">
            <div class="col-md-4" style="vertical-align: middle; text-align: center;">
                <div class="w3-container">
                    <div class="w3-panel w3-dark w3-round-xlarge">
                        <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-success"></i><i class="fas fa-golf-ball fa-stack-1x fa-inverse"></i></span>
                        <h2 class="StepTitle" style="color: white">Service Inventory</h2>

                        <p class="links cl-effect-1">
                            <a href="adminserviceinventory.aspx" style="color: white">Manage Service Inventory
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </a>

    </div>

    <div class="row">
        <a href="adminDrivingRange.aspx">

            <div class="col-md-4" style="vertical-align: middle; text-align: center;">
                <div class="w3-container">
                    <div class="w3-panel w3-dark w3-round-xlarge">
                        <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-warning"></i><i class="fas fa-running fa-stack-1x fa-inverse"></i></span>
                        <h2 class="StepTitle" style="color: white">Driving Range Component</h2>

                        <p class="links cl-effect-1">
                            <a href="adminDrivingRange.aspx" style="color: white">Manage Driving Range Inventory
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </a>

        
            <div class="col-md-4" style="vertical-align: middle; text-align: center;">
                <a href="serviceapproval.aspx">
                <div class="w3-container">
                    
                    <div class="w3-panel w3-dark w3-round-xlarge">
                        <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-danger"></i><i class="fab fa-wpforms fa-stack-1x fa-inverse"></i></span>
                        <h2 class="StepTitle" style="color: white">Customer Service Reservation List</h2>

                        <p class="links cl-effect-1">
                            <a href="serviceapproval.aspx" style="color: white">To approve customer service status
                            </a>
                        </p>

                    </div>
                        
                </div>
                    </a>
            </div>
        

        
            <div class="col-md-4" style="vertical-align: middle; text-align: center;">
                <a href="drapproval.aspx">
                <div class="w3-container">
                    
                    <div class="w3-panel w3-dark w3-round-xlarge">
                        <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-primary"></i><i class="fas fa-align-left fa-stack-1x fa-inverse"></i></span>
                        <h2 class="StepTitle" style="color: white">Customer Driving Range Reservation List</h2>

                        <p class="links cl-effect-1">
                            <a href="drapproval.aspx" style="color: white">To approve driving range status
                            </a>
                        </p>
                    </div>
                         
                </div>
                </a>
            </div>
       



    </div>

    <div class="row">
              
            <div class="col-md-4" style="vertical-align: middle; text-align: center;">
                <a href="totalsales.aspx">
                <div class="w3-container">
                    <div class="w3-panel w3-dark w3-round-xlarge">
                        <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-success"></i><i class="fas fa-align-left fa-stack-1x fa-inverse"></i></span>
                        <h2 class="StepTitle" style="color: white">Sales Report</h2>

                        <p class="links cl-effect-1">
                            <a href="totalsales.aspx" style="color: white">To view the sales report by service
                            </a>
                        </p>
                    </div>
                </div>
                </a>


                <a href="chart.aspx">
                <div class="w3-container">
                    <div class="w3-panel w3-dark w3-round-xlarge">
                        <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-primary"></i><i class="fab fa-wpforms fa-stack-1x fa-inverse"></i></span>
                        <h2 class="StepTitle" style="color: white">Sales Statistic</h2>

                        <p class="links cl-effect-1">
                            <a href="chart.aspx" style="color: white">To view the sales graph
                            </a>
                        </p>
                    </div>
                </div>
                </a>
            </div>
        


        <div class="col-md-8" style="vertical-align: middle; text-align: center;">
            <a href="schedule.aspx">
                <div class="w3-container">
                    <center>

                    <p style="text-align: center">
                        <b></b>
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial Black" Font-Size="large"
                            ForeColor="#ffffff">Customer Service Schedule</asp:Label>
                    </p>
                       
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="	#cff6ff" BorderColor="#004d00"
                        BorderWidth="3px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="12pt"
                        ForeColor="#663399" Font-Bold="True" ShowGridLines="True" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged"
                        OnVisibleMonthChanged="Calendar1_VisibleMonthChanged">
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TodayDayStyle BackColor="#351b50" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <TitleStyle BackColor="#450039" Font-Bold="True" Font-Size="12pt" ForeColor="#FFFFCC" />
                    </asp:Calendar>
                    <b></b>
                    <%--<asp:Label ID="LabelAction" runat="server"></asp:Label><br />--%>
</center>
                </div>

            </a>

        </div>



    </div>

    <div class="row1">
    </div>


</asp:Content>
