<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="customercancel.aspx.cs" Inherits="AGN.customercancel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(window).scroll(function () {
            sessionStorage.scrollTop = $(this).scrollTop();
        });
        $(document).ready(function () {
            if (sessionStorage.scrollTop != "undefined") {
                $(window).scrollTop(sessionStorage.scrollTop);
            }
        });

        $(function () {
            $('#<%= GridView1.ClientID %>').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                paging: true,
                scrollY: "500px",
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

    <style>
        hr {
            border: 1px solid red;
        }
    </style>
    <style>
        body {
            background-color: #5f6163;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">

            <div class="col-sm-12">
                <br />
                <br />


                <div class="row">
                    <div class="col-md-12 jobs_index_middle_panels">
                        <div class="card">
                            <div class="card-body">
                                <center>
                        <h2>
                        Your Cancelled Service</h2>
                    </center>
                                <br />
                                <div class="col-md-12">
                                    <hr>
                                    <p style="font-weight: bold;">Please Enter Your Bank Account No. : </p>
                                    <hr />
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Bank Account No"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox6" ErrorMessage="Please Enter Account No" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                    <asp:Button ID="Button2" class="btn btn-lg btn-success" runat="server" Text="Submit" OnClick="Button2_Click" />

                                </div>
                            </div>


                            <div class="row">
                                <div class="col-sm-12 col-md-12">
                                    <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                    </asp:Panel>
                                </div>
                            </div>
                            <br />

                            <div class="row">

                                <div class="col-md-12 jobs_index_middle_panels">
                                    <div class="card">

                                        <div class="card-body">
                                            <div class="col-md-12 jobs_index_middle_panels">
                                                <div class="row">
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:agnDBConnectionString %>" SelectCommand="SELECT * FROM [cancellation] where uname = @uname" DeleteCommand="DELETE FROM [cancellation] WHERE [rid]=@rid">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="uname" SessionField="uname" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <div class="col-md-12" style="vertical-align: middle; margin: 0 auto;">
                                                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" EmptyDataText="No Records Found" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="rid" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting">
                                                            <Columns>

                                                                <asp:BoundField DataField="rid" HeaderText="Reservation ID" SortExpression="rid">

                                                                    <ControlStyle Font-Bold="True" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <div class="container-fluid">

                                                                            <div class="row">
                                                                                <div class="col-lg-12">
                                                                                    <span style="color: green; font-weight: bold">AGN Service ID : </span>
                                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("drid") %>'></asp:Label>
                                                                                    &nbsp;| <span style="color: green; font-weight: bold"><span>&nbsp;</span>AGN Service Name :</span>
                                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("drname") %>'></asp:Label>
                                                                                    &nbsp;
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-lg-12">
                                                                                    <span style="color: green; font-weight: bold">Time Paid : </span>
                                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("dpaymenttime") %>'></asp:Label>
                                                                                    &nbsp;| <span style="color: green; font-weight: bold"><span>&nbsp;</span>Total Paid : RM</span>
                                                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("dprice") %>'></asp:Label>
                                                                                    &nbsp;
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-lg-12">
                                                                                    <span style="color: green; font-weight: bold">Paid By : </span>
                                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("uname") %>'></asp:Label>
                                                                                    &nbsp;| <span style="color: green; font-weight: bold"><span>&nbsp;</span>Status :</span>
                                                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("paystatus") %>'></asp:Label>
                                                                                    &nbsp;
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-lg-12">
                                                                                    <span style="color: green; font-weight: bold">Proposed Date : </span>
                                                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("pproposal_date") %>'></asp:Label>
                                                                                    &nbsp;| <span style="color: green; font-weight: bold"><span>&nbsp;</span>Proposed Time :</span>
                                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("pproposal_time") %>'></asp:Label>
                                                                                    &nbsp;
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-lg-12">
                                                                                    <span style="color: green; font-weight: bold">Refund Status : </span>
                                                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("rstatus") %>'></asp:Label>
                                                                                    &nbsp;
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>


                                                                <asp:BoundField DataField="rmessage" HeaderText="Message of Refund" SortExpression="rmessage">

                                                                    <ControlStyle Font-Bold="True" BackColor="#0099FF" />
                                                                </asp:BoundField>

                                                                <asp:TemplateField HeaderText="View Receipt">

                                                                    <ItemTemplate>

                                                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imgs/view.png"
                                                                            Width="140" Height="34" CommandName="view" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="False" />

                                                                    </ItemTemplate>

                                                                </asp:TemplateField>


                                                                <asp:TemplateField ShowHeader="False">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure?');" />
                                                                    </ItemTemplate>
                                                                    <ControlStyle BackColor="Red" Font-Bold="True" ForeColor="White" />
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
                            <center>
                    <a href="mainpage.aspx">
                        << Back to Main Menu</a><span class="clearfix"></span>
                            <br /><br />
                            <center>
                        </div>


                    </div>


                </div>
                <br />
                <br />
            </div>
        </div>
</asp:Content>
