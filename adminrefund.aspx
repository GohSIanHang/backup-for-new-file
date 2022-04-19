<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminrefund.aspx.cs" Inherits="AGN.adminrefund" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="~/Scripts/jquery-3.5.1.min.js"></script>
    <script>
        $(window).scroll(function () {
            sessionStorage.scrollTop = $(this).scrollTop();
        });
        $(document).ready(function () {
            if (sessionStorage.scrollTop != "undefined") {
                $(window).scrollTop(sessionStorage.scrollTop);
            }
        });
    </script>

    <script>
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

    <style>
        body {
            background-color: #5f6163;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <br />
        <div class="row">
            <div class="col-sm-12">
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
                            <center>
                        <h2>
                        Customer Cancelled Service</h2>
                    </center>
                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:agnDBConnectionString %>" SelectCommand="SELECT * FROM [cancellation]" DeleteCommand="DELETE FROM [cancellation] WHERE [rid]=@rid"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                                    <%--                                <asp:UpdatePanel ID="UpdtPnlForGrdVw" runat="server" UpdateMode="Conditional" EnableEventValidation="False" ChildrenAsTriggers="true">
                                    <ContentTemplate>--%>
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" EmptyDataText = "No Records Found" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="rid" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting">
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
                                                                <span style="color: green; font-weight: bold">Customer ID : </span>
                                                                <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("uid") %>'></asp:Label>
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

                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <span style="color: green; font-weight: bold">Bank Account No. : </span>
                                                                <asp:Label ID="Label12" runat="server" Font-Bold="True" Text='<%# Eval("accNo") %>'></asp:Label>
                                                                &nbsp;
                                                            </div>
                                                        </div>


                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Upload Receipt" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="center">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/imgs/upload.png"
                                                        Width="50" Height="50" CommandName="receipt" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="False" />
                                                </ItemTemplate>

                                                <ItemStyle HorizontalAlign="Center" Width="80px"></ItemStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Refund" ItemStyle-Width="200px" ItemStyle-HorizontalAlign="center">

                                                <ItemTemplate>
                                                    <%--<label>Refund by Paypal :</label>
                                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/imgs/refund.png"
                                                        Width="140" Height="35" CommandName="refund" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="False" />--%>
                                                    <label>Refund by UUM ecom :</label>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imgs/refund2.png"
                                                        Width="140" Height="35" CommandName="uum" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="False" />


                                                </ItemTemplate>

                                                <ItemStyle HorizontalAlign="Center" Width="200px"></ItemStyle>

                                            </asp:TemplateField>

                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure?');" />
                                                </ItemTemplate>
                                                <ControlStyle BackColor="Red" Font-Bold="True" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                    <%--    </ContentTemplate>
                                </asp:UpdatePanel>--%>
                                </div>
                            </div>
                        </div>
                        <center>
                    <a href="adminmenu.aspx">
                        << Back to Main Menu</a><span class="clearfix"></span>
                            <br />
                            <center>
                    </div>
                        </div>
                </div>
            </div>
        </div>
        <br />
        <br />
    </div>
</asp:Content>
