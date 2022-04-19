<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="AGN.forgotpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/jstarbox.css" type="text/css" media="screen" charset="utf-8" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br /><br /><br />
    <div class="container">

        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="imgs/reset.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Reset Password</h3>
                                </center>
                            </div>
                        </div>

                      

                        <div class="content">
                            <div class="login">
                                <div class="main-agileits">
                                    <div class="form-w3agile">
                                        <br /><br /><br />
                                        <div class="form-group">
                                        <div class="key">
                                            <asp:TextBox CssClass="form-control" ID="tbEmailID" placeholder="Email ID" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbEmailID" ErrorMessage="Please Enter Your Email" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <div class="clearfix"></div>
                                        </div>
                                            </div>
                                        <asp:Button class="btn btn-dark btn-block btn-lg" ID="btPassRec" OnClick="btPassRec_Click" runat="server" Text="SEND" />
                                    </div>
                                </div>
                            </div>
                        </div>


                        



                    </div>
                    <br />
                    <a href="homepage.aspx"><< Back to Home</a><br>
                    <br>
                </div>

            </div>
        </div>
    </div>
    <br /><br /><br />



</asp:Content>
