<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewdrivingrange.aspx.cs" Inherits="AGN.viewdrivingrange" %>
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
        <br /><br />
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
                        Driving Range</h2>
                    </center>
                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:agnDBConnectionString %>" SelectCommand="SELECT * FROM [driving_range_tb1]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-bordered" EmptyDataText = "No Records Found" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                        <Columns>
                                        
                                        <asp:BoundField DataField="driving_range_id" HeaderText="ID" SortExpression="driving_range_id" >
                                        
                                        <FooterStyle Font-Bold="True" />
                                        
                                        </asp:BoundField>
                                        
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-7">


                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("driving_range_name") %>' Font-Bold="True" Font-Size="X-Large" ForeColor="#0033CC"></asp:Label>
                                                                </div>
                                                            </div>


                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <span style="color: green; font-weight: bold">Location : </span>
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("dlocation") %>'></asp:Label>
                                                                    &nbsp;| <span style="color: green; font-weight: bold"><span>&nbsp;</span>Tel : </span>
                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("dtel") %>'></asp:Label>
                                                                    &nbsp;| 
                                                   <span style="color: green; font-weight: bold">Email : <span>&nbsp;</span>
                                                       <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("demail") %>' ForeColor="Black"></asp:Label>
                                                   </span>
                                                                </div>
                                                            </div>


                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <span style="color: green; font-weight: bold">Status : </span>
                                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("dstatus") %>'></asp:Label>
                                                                    &nbsp;| <span style="color: green; font-weight: bold"><span>&nbsp;</span>Time : </span>
                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("dtime") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>


                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <span style="color: green; font-weight: bold">Actual Ball Stock : </span>
                                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("actual_ball_stock") %>'></asp:Label>
                                                                    &nbsp;| <span style="color: green; font-weight: bold"><span>&nbsp;</span>Current Ball Stock : </span>
                                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("current_ball_stock") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <span style="color: green; font-weight: bold">Available Range : </span>
                                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("available_bay") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <span style="color: green; font-weight: bold">Price Balls : </span>
                                                                    <span style="color: black; font-weight: bold">RM</span>
                                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Text='<%# Eval("price_ball") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>


                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <span style="color: green; font-weight: bold">All Range Bay : </span>
                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("all_range_bay") %>'></asp:Label>
                                                                    &nbsp;| <span style="color: green; font-weight: bold"><span>&nbsp;</span>Available Range Bay : </span>
                                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("available_range_bay") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="col-lg-5">
                                                            <br />
                                                            <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("range_img_link") %>' />
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
    </div>
    <br /><br /><br />

</asp:Content>
