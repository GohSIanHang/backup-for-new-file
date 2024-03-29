﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="paymentfail.aspx.cs" Inherits="AGN.paymentfail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style type="text/css">
        body {
            background: #f2f2f2;
        }

        .payment {
            border: 1px solid #f2f2f2;
            height: 280px;
            border-radius: 20px;
            background: #fff;
        }

        .payment_header {
            background: rgba(255,102,0,1);
            padding: 20px;
            border-radius: 20px 20px 0px 0px;
        }

        .check {
            margin: 0px auto;
            width: 50px;
            height: 50px;
            border-radius: 100%;
            background: #fff;
            text-align: center;
        }

            .check i {
                vertical-align: middle;
                line-height: 50px;
                font-size: 30px;
            }

        .content {
            text-align: center;
        }

            .content h1 {
                font-size: 25px;
                padding-top: 25px;
            }

            .content a {
                width: 200px;
                height: 35px;
                color: #fff;
                border-radius: 30px;
                padding: 5px 10px;
                background: rgba(255, 99, 71, 1);
                transition: all ease-in-out 0.3s;
            }

                .content a:hover {
                    text-decoration: none;
                    background: #000;
                }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto mt-5">
                <div class="payment">
                    <div class="payment_header">
                        <div class="check"><i class="fa fa-times" aria-hidden="true"></i></div>
                    </div>
                    <div class="content">
                        <h1>Payment Fail !</h1>
                        <br />

                        <p>Try Again Later! </p>
                        <br />
                        <a href="mainpage.aspx">Continue</a>
                        <br />
                    </div>

                </div>

            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
