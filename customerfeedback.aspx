<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="customerfeedback.aspx.cs" Inherits="AGN.customerfeedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h2>Leave us your feedback</h2>
                                    
                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="240px" height="170px" src="imgs/feedback1.png" />   
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                                <p style="font-weight: bold;">Your Feedback:</p>
                                <hr>
                            </div>
                        </div>
                        <div class="row">


                            <div class="col-md-12">
                                
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Type your feedback . . ." TextMode="MultiLine" OnTextChanged="TextBox2_TextChanged" style="height:150px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please Enter Feedback" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            
                            <div class="col-4 mx-auto">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Submit" OnClick="Button2_Click" />
                            </div>

                        </div>
                        <br>
                    </div>
                    <br />
                <a href="mainpage.aspx"> --<<-- Back to Main Menu</a><br>
     
                </div>
                
            </div>
             <br />
            
        </div>
         <br /> <br /> <br />
    </div>

</asp:Content>
