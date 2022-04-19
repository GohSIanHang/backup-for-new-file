<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="AGN.userlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>

        function checkforblank() {
            if (document.getElementById('TextBox1').value == "") {
                alert('Please enter your member id');
                document.getElementById('TextBox1').style.borderColor = "red";
                return false;
            }

        }

    </script>

    <style>
body {
  background-color: #5f6163;
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <br /><br />
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="imgs/people.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Login</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Member ID</label>
                                <div class="form-group">

                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please Enter Member ID" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" UseSystemPasswordChar="true" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                                </div>
                                
                                <div class="form-group">
                                    <a href="usersignup.aspx">
                                        <input class="btn btn-dark btn-block btn-lg" id="Button2" type="button" value="Sign Up" /></a>
                                </div>
                                <div class="form-group">
                                    <a href="forgotpassword.aspx">
                                        <input class="btn btn-danger btn-block btn-lg" id="Button3" type="button" value="Forgot Password" /></a>
                                </div>

                            </div>
                        </div>



                    </div>
                    <center>
                    <a href="homepage.aspx"><< Back to Home</a><br>
                    <br>
                        </center>
                </div>

            </div>
        </div>
        <br /><br />
    </div>

</asp:Content>
