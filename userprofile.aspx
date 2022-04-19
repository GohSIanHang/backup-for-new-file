<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="AGN.userprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: #5f6163;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $('#<%= GridView1.ClientID %>').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                paging: true,
                scrollY: "500px",
                searching: true,
                info: true,
                //order: [],
                columnDefs: [{ orderable: true, targets: [0, 1] }],
                //order: [[0, "asc"]],
                //aoColumnDefs: [{ "bSortable": false, "aTargets": [1, 8, 9] }]
                drawCallback: function () {
                    $('.paginate_button', this.api().table().container())
                        .on('click', function () {
                            //alert(this.innerText);
                            $.ajax({
                                type: "POST",
                                url: "GridviewDatatableDemo.aspx/InsertPage",
                                data: '{pagenum: "' + this.innerText + '" }',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () { alert('success') },
                                failure: function (response) {
                                    alert(response.d);
                                }
                            });
                        });
                }
            });
        });

    </script>
    <style>
        #load {
            width: 100%;
            height: 100%;
            position: fixed;
            z-index: 9999;
            background: url("imgs/1.gif") no-repeat center center rgba(255,255,255,255);
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="load"></div>
    <div id="contents">
        <div class="container-fluid">
            <br />
            <br />
            <div class="row">
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                    <img width="100px" src="imgs/people.png" />
                                </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <center>
                                    <h4>User Profile</h4>
                                    <span>Account Status - </span>
                                    <asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" 
                                        Text="Your Status"></asp:Label>

                                </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Full Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Full Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please Enter Full Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <asp:Label ID="a" runat="server">Date of Birth</asp:Label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Date"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please Enter DOB" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label ID="b" runat="server">Contact No</asp:Label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Contact Number" TextMode="Number"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please Enter Contact No" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <asp:Label ID="c" runat="server">Email ID</asp:Label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="Please Enter Email ID" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label ID="d" runat="server">User Type</asp:Label>
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                            <asp:ListItem Text="Select" Value="select" />
                                            <asp:ListItem Text="Non-Club Member" Value="Non-Club Member" />
                                            <asp:ListItem Text="Club Member" Value="Club Member" />
                                            <asp:ListItem Text="School Student" Value="School Student" />
                                            <asp:ListItem Text="Special Case" Value="Special Case" />
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <asp:Label ID="e" runat="server">Gender</asp:Label>
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                                            <asp:ListItem Text="Select" Value="select" />
                                            <asp:ListItem Text="Male" Value="Male" />
                                            <asp:ListItem Text="Female" Value="Female" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div class="col">
                                    <center>
                                <br><span class="badge rounded-pill bg-warning text-dark">Login Credentials</span><br><br>
                                </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>User ID</label>
                                    <div class="form-group">
                                        <asp:TextBox Class="form-control" ID="TextBox1" runat="server" placeholder="User ID" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">

                                    <div class="form-group">
                                        <asp:TextBox Class="form-control" ID="TextBox6" runat="server" placeholder="Password" ReadOnly="True" type="hidden"></asp:TextBox>
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Current Password</label>
                                    <div class="form-group">
                                        <asp:TextBox Class="form-control" ID="TextBox8" runat="server" placeholder="Password"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>New Password</label>
                                    <div class="form-group">
                                        <asp:TextBox Class="form-control" ID="TextBox9" runat="server" placeholder="Password"></asp:TextBox>
                                    </div>
                                </div>




                            </div>



                            <div class="row">
                                <div class="col-8 mx-auto">
                                    <center>
                                    </br>
                                
                        <div class="form-group">
                           <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
                        
                        </div>
                               </center>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="col-md-7">



                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                    <img width="100px" src="imgs/list.png" />
                                </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                    <h4>Your Payment</h4>
                                    <asp:Label class="badge badge-pill badge-info" ID="Label2" runat="server" 
                                        Text="Your Payment Info"></asp:Label>

                                </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <div class="row">

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:agnDBConnectionString %>" SelectCommand="SELECT * FROM [purchase] where uid = @uid">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="uid" SessionField="uid" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <div class="col-lg">
                                    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server"
                                        EnableScriptLocalization="true" EnableScriptGlobalization="true">
                                    </asp:ScriptManager>
                                    <asp:UpdatePanel ID="up1" runat="server">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="DataBinding" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <asp:GridView class="table table-striped table-bordered" EmptyDataText="No Records Found" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">

                                                <Columns>
                                                    <asp:BoundField DataField="rid" HeaderText="Reservation ID" SortExpression="rid"></asp:BoundField>
                                                    <asp:BoundField DataField="drid" HeaderText="Service ID" SortExpression="drid"></asp:BoundField>
                                                    <asp:BoundField DataField="drname" HeaderText="Service Name" SortExpression="drname"></asp:BoundField>
                                                    <asp:BoundField DataField="dpaymenttime" HeaderText="Time Paid" SortExpression="dpaymenttime" />
                                                    <asp:BoundField DataField="dprice" HeaderText="Total Paid" SortExpression="dprice" />
                                                    <asp:BoundField DataField="uname" HeaderText="Paid By" SortExpression="uname" />
                                                </Columns>
                                            </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
    </div>

</asp:Content>
