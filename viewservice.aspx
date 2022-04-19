<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewservice.aspx.cs" Inherits="AGN.viewservice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $('#<%= GridView1.ClientID %>').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                paging: false,
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
                        AGN Service List</h2>
                    </center>
                                <div class="row">
                                </div>
                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:agnDBConnectionString %>" SelectCommand="SELECT * FROM [service_tb1]"></asp:SqlDataSource>
                                    <div class="col">
                                        <asp:GridView class="table table-striped table-bordered" EmptyDataText = "No Records Found" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="service_id" DataSourceID="SqlDataSource1">
                                            <Columns>

                                                <asp:BoundField DataField="service_id" HeaderText="ID" ReadOnly="True" SortExpression="service_id">

                                                    <ItemStyle Font-Bold="True" />
                                                </asp:BoundField>

                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-lg-4">


                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("service_name") %>' Font-Bold="True" Font-Size="X-Large" ForeColor="#0033CC"></asp:Label>
                                                                        </div>
                                                                    </div>


                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <span style="color: green; font-weight: bold">Coach : </span>
                                                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("coach_name") %>'></asp:Label>
                                                                            &nbsp;
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <span style="color: green; font-weight: bold">Genre :</span>
                                                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                                            &nbsp;
                                                                        </div>
                                                                    </div>


                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <span style="color: green; font-weight: bold">Tel : </span>
                                                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("tel") %>'></asp:Label>
                                                                            &nbsp;| <span style="color: green; font-weight: bold"><span>&nbsp;</span>Email : </span>
                                                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("email") %>'></asp:Label>
                                                                            &nbsp;
                                                                        </div>
                                                                    </div>


                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <span style="color: green; font-weight: bold">Location : </span>
                                                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("location") %>'></asp:Label>
                                                                            &nbsp;
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <span style="color: green; font-weight: bold">Service Status : </span>
                                                                            <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("service_status") %>'></asp:Label>
                                                                            &nbsp;| <span style="color: green; font-weight: bold"><span>&nbsp;</span>Maximum Participants :</span>
                                                                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Text='<%# Eval("maximum_participants") %>'></asp:Label>
                                                                            &nbsp;
                                                                        </div>
                                                                    </div>


                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <br />
                                                                            <span style="color: green; font-weight: bold">Service Time : </span>
                                                                            <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("service_time") %>'></asp:Label>
                                                                            &nbsp;
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-12">

                                                                            <span style="color: green; font-weight: bold">Registration Fee (RM) : </span>
                                                                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("service_price") %>'></asp:Label>
                                                                            &nbsp;
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <br />
                                                                            <br />
                                                                            <span style="color: green; font-weight: bold">Service Description : </span>
                                                                            <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("service_description") %>'></asp:Label>
                                                                            <br />
                                                                            <br />
                                                                            &nbsp;
                                                                    
                                                                        </div>
                                                                    </div>


                                                                </div>
                                                                <div class="col-lg-8">
                                                                    <br />
                                                                    <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("service_img_link") %>' />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                          <%--  <center>
                    <a href="homepage.aspx">
                        << Back to Home</a><span class="clearfix"></span>
                            <br />
                            <center>--%>
                        </div>

                    </div>
                </div>

            </div>

        </div>
        <br />
        <br />
        <br />
</asp:Content>
