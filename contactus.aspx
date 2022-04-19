<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="AGN.contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    body {
        font-family: Arial, Helvetica, sans-serif;
    }

    * {
        box-sizing: border-box;
    }

    input[type=text], select, textarea {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        margin-top: 6px;
        margin-bottom: 16px;
        resize: vertical;
    }

    input[type=submit] {
        background-color: #4CAF50;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

        input[type=submit]:hover {
            background-color: #45a049;
        }

    #1 {
        border-radius: 5px;
        background-color: #f2f2f2;
        padding: 20px;
    }
</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    

     <br />
    <br />
<div class="container id="1"">
    <h3>Contact Us</h3>
    </br>
  <form action="/action_page.php">
    <label for="fname">Your Name</label>
    <%--<input type="text" id="name" name="firstname" placeholder="Your name..">--%>
    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Full Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>

      <br />
    <label for="lname">Your Email Address</label>
    <%--<input type="text" id="email" name="lastname" placeholder="Your email..">--%>   
    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Your Email"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>

      <br />
    <label for="subject">Subject</label>
    <%--<textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>--%>
    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Write something.." style="height:200px" TextMode="MultiLine"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please Enter Feedback" ForeColor="Red"></asp:RequiredFieldValidator>
      <br />
    <%--<input type="submit" value="Submit">--%>
    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
  </form>
</div>
    <br />
    <br />
    <br />

</asp:Content>
