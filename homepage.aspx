<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="AGN.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        #load {
            width:100%;
            height:100%;
            position:fixed;
            z-index:9999;
            background:url("imgs/1.gif") no-repeat center center rgba(255,255,255,255)
           
        }
    </style>

    <script>
        document.onreadystatechange=function() {
            var state = document.readyState
            if( state == 'interactive' ){
                document.getElementById('contents').style.visibility = "hidden";
            }else if(state == 'complete'){
                setTimeout(function(){
                    document.getElementById('interactive');
                    document.getElementById('load').style.visibility="hidden";
                    document.getElementById('contents').style.visibility = "visible";
                },100);
            }
        }
    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="load"></div>
    <div id="contents">


    <section>
        <img src="imgs/homepage1.png" class="img-fluid" />
    </section>
    <section>

        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Our Services</h2>
                    <p><b>Our 3 Primary Features</b></p>
                    </center>          
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <center>
                    <img width="100px" src="imgs/service.png" />      
                    <h4>Golf Services</h4>
                    <p class="text-justify">The services component contains the services offered by AGN. 
                        Click view services at the top menu to view list of services provided by AGN and login to make reservation. 
                        We are welcoming all types of participants to take participation in our golf activities and programs</p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                    <img width="100px" src="imgs/drivingrange.png" />    
                    <h4>Driving Range</h4>
                    <p class="text-justify">The driving range component contains the services range golf balls and golf clubs rent offered by AGN. 
                        Click view driving range at the top menu for more detail of price. 
                        We are welcoming you to use our golf facility as a daily training </p>
                    <center>
                </div>
                <div class="col-md-4">
                    <center>
                    <img width="100px" src="imgs/contactuspng.png" />
                    <h4>Contact Us</h4>
                    <p class="text-justify">Contact us if you have any quirey. We try our best to reply the useful information for you</p>
                    </center>
                </div>
            </div>
        </div>
    </section>
    <section>
        <img src="imgs/homepage4.jpg" class="img-fluid" />
    </section>
    </div>
    

</asp:Content>
