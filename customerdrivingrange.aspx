<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="customerdrivingrange.aspx.cs" Inherits="AGN.customerdrivingrange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #load {
             top: 0; 
  left: 0; 
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
    <style>
body {
  background-color: #5f6163;
}
</style>

    <script type="text/javascript">
        jQuery(function ($) {
            $("#datepicker").datepicker({
                showOtherMonths: true,
                selectOtherMonths: false,
            });
        });
    </script>

    <script type="text/javascript">
        $(function () {
            $('#<%= GridView1.ClientID %>').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                paging: true,
                //scrollY: "500px",
                searching: true,
                info: true,
                order: [],
                columnDefs: [{ orderable: false, targets: [0, 1] }],
                order: [[0, "asc"]],
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="load"></div>

    <div id="contents">
        <br />
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                    <h4>Driving Range Reservation</h4>
                                    
                                </center>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col">
                                    <center>
                                    <img width="100px" src="imgs/reservation4.png" />
                                </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>

                            <div class="row">


                                <div class="col-md-5">
                                    <label>Reservation ID (Auto-Generated)</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Reservation ID" ReadOnly="True"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <label>Driving Range ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="DR ID" ReadOnly="True"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Find Reservation ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Find ID"></asp:TextBox>

                                            <asp:Button class="btn btn-success" ID="Button5" runat="server" Text="Go" OnClick="Button5_Click" CausesValidation="False" />
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="row">


                                <div class="col-md-5">
                                    <label>Your ID</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Your ID" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-7">
                                    <label>Your Name</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Username" ReadOnly="True"></asp:TextBox>


                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="row">


                                <div class="col-md-5">
                                    <label>100 Ball Per Bucket</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" min="1" placeholder="No" TextMode="Number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox10" ErrorMessage="Please Enter Ball Amount" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-7">
                                    <label>Available Range</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="No" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>User Type</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="No" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>

                            </div>

                            <div class="row">


                                <div class="col-md-6">
                                    <label>Phone No</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="tel"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please Enter Phone No" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Email address</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox7" ErrorMessage="Please Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>



                            </div>

                            <div class="row">

                                <div class="col-md-6">
                                    <label>Proposed Date</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="Please Enter Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Proposed Time</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Time" TextMode="Time"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox6" ErrorMessage="Please Enter Time" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-4">
                                    <asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" runat="server" Text="Submit" OnClick="Button2_Click" />
                                </div>

                                <div class="col-4">
                                    <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                                </div>

                                <div class="col-4">
                                    <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Cancel" OnClick="Button4_Click" />
                                </div>
                            </div>
                        </div>


                        <table border="0" cellpadding="10" cellspacing="0" align="center">
                            <tr>
                                <td align="center"></td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <a style="cursor: pointer;" title="Paypal payment gateway center" onclick="javascript:window.open('https://www.paypal.com/cgi-bin/webscr?cmd=xpt/Marketing/popup/OLCWhatIsPayPal-outside','olcwhatispaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=400, height=350');">
                                        <img src="https://www.paypal.com/en_US/i/bnr/horizontal_solution_PPeCheck.gif" border="0"
                                            alt="Solution Graphics"></a>
                                </td>
                            </tr>
                        </table>
                        <br />
                         <a href="mainpage.aspx">--<<-- Back to Main Menu</a><br>
                    </div>
                   <br /><br />
                    
                </div>

                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body">


                            <div class="row">
                                <div class="col">
                                    <center>
                                    <h4>Your Driving Range Reservation</h4>
                                </center>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col">
                                    <hr>
                                        <p>To cancel reservation, please fill in the targeted reservation id in textbox, click "GO" and click "Cancel" to cancel.</p>
                                        <p>Please capture or download your receipt and upload as proof</p>
                                    </hr>
                                </div>
                            </div>

                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:agnDBConnectionString %>" SelectCommand="SELECT * FROM [customer_drivingrange_tb1] where dcustomer_id = @dcustomer_id"><selectparameters><asp:sessionparameter name="dcustomer_id" sessionfield="dcustomer_id" type="String" /></selectparameters></asp:SqlDataSource>
                                <div class="col-lg">

                                    <asp:GridView class="table table-striped table-bordered" EmptyDataText = "No Reservations Found" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" DataKeyNames="areservation_id">
                                        <Columns>
                                           

                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="col-lg-12">


                                                                <div class="row">
                                                                    <div class="col-lg-12">

                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("dservice ") %>' Font-Bold="True" Font-Size="X-Large" ForeColor="#0033CC"></asp:Label>
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <span style="color: green; font-weight: bold">Reservation ID : </span>
                                                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("areservation_id") %>'></asp:Label>
                                                                        &nbsp;
                                                                    </div>
                                                                </div>


                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <span style="color: green; font-weight: bold">Time Reserved : </span>
                                                                        <asp:Label ID="Label12" runat="server" Font-Bold="True" Text='<%# Eval("dreservation_time") %>'></asp:Label>
                                                                        &nbsp;
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <span style="color: green; font-weight: bold">Customer ID : </span>
                                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("dcustomer_id") %>'></asp:Label>
                                                                        &nbsp;| <span style="color: green; font-weight: bold"><span>&nbsp;</span>Customer Name :</span>
                                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("dcustomer_name") %>'></asp:Label>
                                                                        &nbsp;
                                                                    </div>
                                                                </div>



                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <span style="color: green; font-weight: bold">100 Balls Per Bucket : </span>
                                                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("noofball") %>'></asp:Label>
                                                                        &nbsp;
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <span style="color: green; font-weight: bold">Tel : </span>
                                                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("dtel") %>'></asp:Label>
                                                                        &nbsp;| <span style="color: green; font-weight: bold"><span>&nbsp;</span>Email :</span>
                                                                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("demail") %>'></asp:Label>
                                                                        &nbsp;
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <span style="color: green; font-weight: bold">User type : </span>
                                                                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("usertype") %>'></asp:Label>
                                                                        &nbsp;
                                                                    </div>
                                                                </div>


                                                                <div class="row">
                                                                    <div class="col-lg-12">

                                                                        <span style="color: green; font-weight: bold">Proposed Date: </span>
                                                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("dproposed_date") %>'></asp:Label>
                                                                        &nbsp;
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-lg-12">

                                                                        <span style="color: green; font-weight: bold">Proposed Time : </span>
                                                                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("dproposed_time") %>'></asp:Label>
                                                                        &nbsp;
                                                                    <br />
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <span style="color: green; font-weight: bold">Process Status : </span>
                                                                        <%--<asp:Label class="badge bg-dark" ID="Label5" runat="server"
                                                                            Text='<%# Eval("status") %>'></asp:Label>--%>
                                                                        <span style="color: <%# (Eval("dstatus").ToString() == "Accepted") ? "green" : (Eval("dstatus").ToString() == "pending") ? "#FF4500" : "red;" %>; font-weight: bold"><%# Eval("dstatus") %>
                                                                            <br />
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <span style="color: green; font-weight: bold">Payment Status : </span>
                                                                        <%--<asp:Label class="badge bg-dark" ID="Label5" runat="server"
                                                                            Text='<%# Eval("status") %>'></asp:Label>--%>
                                                                        <span style="color: <%# (Eval("dpayment").ToString() == "Paid") ? "green" : "red;" %>; font-weight: bold"><%# Eval("dpayment") %>
                                                                            <br />
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-lg-12">

                                                                        <span style="color: green; font-weight: bold">Messages From Admin : </span>
                                                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("dmessage") %>'></asp:Label>
                                                                        &nbsp;
                                                                    <br />
                                                                    </div>
                                                                </div>


                                                            </div>

                                                        </div>
                                                    </div>
                                                </ItemTemplate>

                                            </asp:TemplateField>

                                            <asp:BoundField DataField="dproposed_date" HeaderText="Proposed Date" ReadOnly="True" SortExpression="dproposed_date">

                                                <ItemStyle Font-Bold="True" />
                                            </asp:BoundField>

                                            <asp:BoundField DataField="total" HeaderText="Total(RM)" ReadOnly="True" SortExpression="total">
                                                <ItemStyle Font-Bold="True" />
                                            </asp:BoundField>
                                            
                                            <asp:TemplateField ItemStyle-HorizontalAlign="center" HeaderText="Upload Receipt">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/imgs/upload.png"
                                                        Width="50" Height="50" CommandName="receipt" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="False"/>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Download Bill">

                                                <ItemTemplate>

                                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/imgs/down.png"
                                                        Width="120" Height="34"  CommandName="print" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="False" />

                                                </ItemTemplate>

                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Payment Option" ItemStyle-HorizontalAlign="center" ItemStyle-Width="150px">

                                                <ItemTemplate>

                                                   <label style="font-weight: bold;">UUM e-com :</label>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imgs/button3.png"
                                                        Width="140" Height="34" CommandName="uum" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="False" />
                                                    <label style="font-weight: bold;">Pay on Paypal :</label>
                                                    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/imgs/button2.png"
                                                        Width="140" Height="34" CommandName="buy" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="False" />
                                                    <label style="font-weight: bold;">Pay on Cash :</label>
                                                    <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/imgs/button1.png"
                                                        Width="140" Height="34" CommandName="cash" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="False" />

                                                </ItemTemplate>

                                            </asp:TemplateField>


                                        </Columns>

                                    </asp:GridView>


                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
