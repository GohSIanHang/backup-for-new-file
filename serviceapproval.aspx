<%@ Page Title="" Language="C#" EnableViewState="false" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="serviceapproval.aspx.cs" Inherits="AGN.serviceapproval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script src="~/Scripts/jquery-3.5.1.min.js"></script>
    <%--   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>--%>


    <style>
        #load {
            top: 0; 
            left: 0; 
            min-width: 100%;
            min-height: 100%;
            position:fixed;
            z-index:9999;
            background:url("imgs/1.gif") no-repeat center center rgba(255,255,255,255)
           
        }

        body {
            background-color: #5f6163;
        }
    </style>


    <script>
        $(window).scroll(function () {
            sessionStorage.scrollTop = $(this).scrollTop();
        });
        $(document).ready(function () {
            if (sessionStorage.scrollTop != "undefined") {
                $(window).scrollTop(sessionStorage.scrollTop);
            }
        });

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

        $(function () {
            $('#<%= GridView1.ClientID %>').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                paging: false,
                //scrollY: "500px",
                searching: true,
                info: true,
                //order: [],
                columnDefs: [{ orderable: false, targets: [0, 1] }],
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

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="load"></div>
    <div class="container-fluid">
        <br />
        <br />
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Service Reservation Details</h4>
                                    
                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/reservation3.png" />

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
                                <label>Reservation ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="ID"></asp:TextBox>

                                        <asp:LinkButton class="btn btn-dark" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"><i class="fas fa-arrow-right"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-7">
                                <label>Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Status" ReadOnly="True"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-success" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger" ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>


                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <label>Customer ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Customer Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Customer ID" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <label>Service Chosen</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Service" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Participants No</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Participants No" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                        <div class="row">


                            <div class="col-md-6">
                                <label>Contact No</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Contact No" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email Address" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>



                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <label>Proposed Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Date" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Proposed Time</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Time" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>



                        <div class="row">
                            <div class="col-6 mx-auto">
                                <br>
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete Reservation" OnClick="Button2_Click" />
                                <br>
                            </div>



                        </div>
                        <br />
                        <a href="adminmenu.aspx">--<<-- Back to Main Menu</a><br>
                    </div>

                </div>
                <br />
                <br />
            </div>

            <div class="col-md-8">

                <div class="card">
                    <div class="card-body">


                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Service Reservation List</h4>
                                    


                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:agnDBConnectionString %>" SelectCommand="SELECT * FROM [customer_service_tb1]" UpdateCommand="Update customer_service_tb1 SET message=@message WHERE reservation_id=@reservation_id" DeleteCommand="DELETE FROM [customer_service_tb1] WHERE [reservation_id]=@reservation_id"></asp:SqlDataSource>
                            <div class="col">
                                <asp:ScriptManager runat="server"></asp:ScriptManager>

                                <%--  <asp:UpdatePanel ID="UpdtPnlForGrdVw" runat="server" UpdateMode="Conditional" EnableEventValidation="False" ChildrenAsTriggers="true">
                                    <ContentTemplate>--%>
                                <asp:GridView class="table-striped table-bordered" EmptyDataText = "No Records Found" EnableViewState="false" CurrentSortField="proposed_date" CurrentSortDirection="ASC" ID="GridView1" runat="server" nableViewState="false" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="reservation_id" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand">
                                    <Columns>

                                        <asp:TemplateField ItemStyle-Width="35%">
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-12">


                                                            <div class="row">
                                                                <div class="col-lg-12">

                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("service ") %>' Font-Bold="True" Font-Size="Large" ForeColor="#0033CC"></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <span style="color: green; font-weight: bold">Reservation ID : </span>
                                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("reservation_id") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <span style="color: green; font-weight: bold">Time Submitted : </span>
                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("reservation_time") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <span style="color: green; font-weight: bold">Customer ID : </span>
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("customer_id") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <span style="color: green; font-weight: bold">Customer Name : </span>
                                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("customer_name") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <span style="color: green; font-weight: bold">Participant No : </span>
                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("participant_no") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>


                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <span style="color: green; font-weight: bold">Contact No : </span>
                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("tel") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <span style="color: green; font-weight: bold">Email :</span>
                                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Text='<%# Eval("email") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">

                                                                    <span style="color: green; font-weight: bold">Proposed Date: </span>
                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("proposed_date", "{0:d}") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">

                                                                    <span style="color: green; font-weight: bold">Proposed Time : </span>
                                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("proposed_time") %>'></asp:Label>
                                                                    &nbsp;
                                                                    <br />
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <span style="color: green; font-weight: bold">Status : </span>
                                                                    <%--<asp:Label class="badge bg-dark" ID="Label5" runat="server"
                                                                            Text='<%# Eval("status") %>'></asp:Label>--%>
                                                                    <span style="color: <%# (Eval("status").ToString() == "Accepted") ? "green" : (Eval("status").ToString() == "pending") ? "#FF4500" : "red;" %>; font-weight: bold"><%# Eval("status") %>
                                                                        <br />
                                                                </div>
                                                            </div>

                                                        </div>

                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                            <ItemStyle Width="35%" />
                                        </asp:TemplateField>
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="2%" DataField="proposed_date" HeaderText="Proposed Date" ReadOnly="True" SortExpression="proposed_date">

                                            <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>

                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%" DataField="message" HeaderText="Message to user" SortExpression="message">
                                            <ControlStyle Width="140" Height="30"></ControlStyle>

                                            <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>

                                        <asp:TemplateField HeaderText="Status" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                                            <EditItemTemplate>

                                                <asp:DropDownList ID="DropDownList1" AutoPostBack="false" runat="server">
                                                </asp:DropDownList>

                                            </EditItemTemplate>

                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                            <ItemStyle Font-Bold="True" />
                                            <ItemTemplate>

                                                <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("status") %>' />

                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-Width="10%" HeaderText="Download Bill" ItemStyle-HorizontalAlign="Center">

                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/imgs/down.png"
                                                    Width="140" Height="34" CommandName="print" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="False" />
                                                <br />
                                                <br />
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imgs/view.png"
                                                    Width="140" Height="34" CommandName="view" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="False" />

                                            </ItemTemplate>

                                            <ItemStyle HorizontalAlign="Center" Width="5%" />

                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-Width="7%" InsertVisible="False" ShowHeader="False" HeaderText="Action" ItemStyle-HorizontalAlign="Center">

                                            <EditItemTemplate>
                                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClientClick="return confirm('Successfully Updated!');" />
                                                &nbsp;
                                                        <br />
                                                <br />
                                                <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" OnClientClick="return confirm('Are you sure?');" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:button id="Button3" runat="server" causesvalidation="False" commandname="Edit" text="Editing" autopostback="false" xmlns:asp="#unknown" />
                                            </ItemTemplate>
                                            <ControlStyle BackColor="#006600" BorderStyle="Solid" ForeColor="White" Font-Bold="True" />
                                            <ItemStyle Font-Bold="True" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:Button ID="Button4" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure?');" />
                                            </ItemTemplate>
                                            <ControlStyle BackColor="Red" BorderStyle="Solid" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>


                                    </Columns>
                                </asp:GridView>
                                <%--   
                                    </ContentTemplate>
                                </asp:UpdatePanel>--%>
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
