<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mainpage.aspx.cs" Inherits="AGN.mainpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #load {
             top: 0; 
  left: 0; 
            width:100%;
            height:100%;
            position:fixed;
            z-index:9999;
            background:url("imgs/1.gif") no-repeat center center rgba(255,255,255,255)
           
        }
    </style>

    <script>
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
            background-image: url("imgs/wallpaper.jpg");
            background-color: #cccccc;
            background-size: 2000px 2000px;
        }

        .w3-container {
            opacity: 0.85;
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

        .row1 {
            margin-bottom: 60px;
            margin-left: 60px;
        }

        .row {
            margin-right: 140px;
            margin-left: 140px;
        }
        
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    
    <div id="load"></div>

    <div class="row">

        <a href="customerfeedback.aspx">
            <div class="col-md-4" style="vertical-align: middle; text-align: center;">
                <div class="w3-container">
                    <div class="w3-panel w3-dark w3-round-xlarge">
                        <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-primary"></i><i class="far fa-comment-alt fa-stack-1x fa-inverse"></i></span>
                        <h2 class="StepTitle" style="color: white">Feedback</h2>

                        <p class="links cl-effect-1">
                            <a href="customerfeedback.aspx" style="color: white">Give Your Feedback
												</a>
                        </p>
                    </div>
                </div>

            </div>
        </a>



        <a href="adminservice.aspx">
            <div class="col-md-4" style="vertical-align: middle; text-align: center;">
                <div class="w3-container">
                    <div class="w3-panel w3-dark w3-round-xlarge">
                        <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-primary"></i><i class="fas fa-pen-alt fa-stack-1x fa-inverse"></i></span>
                        <h2 class="StepTitle" style="color: white">Service Register</h2>

                        <p class="links cl-effect-1">
                            <a href="adminservice.aspx" style="color: white">Make Service Registration
												</a>
                        </p>
                    </div>
                </div>
            </div>
        </a>

        <a href="customerdrivingrange.aspx">
            <div class="col-md-4" style="vertical-align: middle; text-align: center;">
                <div class="w3-container">
                    <div class="w3-panel w3-dark w3-round-xlarge">
                        <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-primary"></i><i class="fas fa-user-edit fa-stack-1x fa-inverse"></i></span>
                        <h2 class="StepTitle" style="color: white">Driving Range Register</h2>

                        <p class="links cl-effect-1">
                            <a href="customerdrivingrange.aspx" style="color: white">Make Driving Range Registration
												</a>
                        </p>
                    </div>
                </div>
            </div>
        </a>
    </div>

    <div class="row">
    <a href="paymenthistory.aspx">
        
            <div class="col-md-4" style="vertical-align: middle; text-align: center;">
                <div class="w3-container">
                    <div class="w3-panel w3-dark w3-round-xlarge">
                        <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-primary"></i><i class="far fa-clipboard fa-stack-1x fa-inverse"></i></span>
                        <h2 class="StepTitle" style="color: white">Payment History</h2>

                        <p class="links cl-effect-1">
                            <a href="paymenthistory.aspx" style="color: white">Check Payment Record
												</a>
                        </p>
                    </div>
                </div>
            </div>
    </a>

    <a href="customercancel.aspx">
        <div class="col-md-4" style="vertical-align: middle; text-align: center;">
            <div class="w3-container">
                    <div class="w3-panel w3-dark w3-round-xlarge">
                    <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-primary"></i><i class="fas fa-money-check-alt fa-stack-1x fa-inverse"></i></span>
                    <h2 class="StepTitle" style="color: white">Refund Payment</h2>

                    <p class="links cl-effect-1">
                        <a href="customercancel.aspx" style="color: white">Ask for refund
												</a>
                    </p>
                </div>
            </div>
        </div>
    </a>
        
        </div>

    <div class ="row1">


    </div>
   



</asp:Content>
