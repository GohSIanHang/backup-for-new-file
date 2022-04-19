<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="resetpassword.aspx.cs" Inherits="AGN.resetpassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
                                <hr>
                            </div>
                        </div>
 <div class="content">
        <div class="login">
            <div class="form-w3agile form1">
                <div class="form-group">
                <h3>Reset Password</h3>
                    <br />
                <div class="key">
                    <asp:TextBox ID="tbNewPass" CssClass="form-control" Visible="True" placeholder="New Password" runat="server"></asp:TextBox>
                    <div class="clearfix"></div>
                </div>
                    <br />
                <div class="key">
                    <asp:TextBox ID="tbConfirmPass" CssClass="form-control" Visible="true" placeholder="Confirm Password" runat="server"></asp:TextBox>
                    <div class="clearfix"></div>
                </div>
                    <br /><br />
                <asp:Button class="btn btn-success btn-block btn-lg" ID="btRecPass" Visible="true" OnClick="btRecPass_Click" runat="server" Text="RESET" />
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
