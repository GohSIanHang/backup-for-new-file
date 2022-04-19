<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="totalsales.aspx.cs" Inherits="AGN.totalsales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">
        <div class="row">

            <div class="col-sm-12">
                <center>
                        <h3>
                            <br />
                        Daily Sales Report</h3>
                    </center>
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </asp:Panel>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:agnDBConnectionString %>" SelectCommand="SELECT * FROM [allreservation] WHERE status = 'Accepted'"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="approve_time" HeaderText="Year" SortExpression="Date" DataFormatString="{0:yyyy}" ApplyFormatInEditMode="true"/>
                                            <asp:BoundField DataField="approve_time" HeaderText="Month" SortExpression="Date" DataFormatString="{0:MMMM}" ApplyFormatInEditMode="true"/>
                                            <asp:BoundField DataField="approve_time" HeaderText="Date" SortExpression="Date" DataFormatString="{0:d/M/yyyy}" ApplyFormatInEditMode="true"/>
                                            <asp:BoundField DataField="service_id" HeaderText="Service ID" SortExpression="service_id" />
                                            <asp:BoundField ItemStyle-Width="100%" ItemStyle-Wrap="false" DataField="service_name" HeaderText="Service" SortExpression="service_name" />
                                            <asp:BoundField DataField="reservation_id" HeaderText="Reservation ID" SortExpression="reservation_id" />

                                            <asp:BoundField ItemStyle-Width="100%" ItemStyle-Wrap="false" DataField="total_paid" HeaderText="Total (RM)" SortExpression="total_paid" />
                                            
                                            

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
             <br /><br /><br />
        
         <label>Daily Sales Report</label>
             <div class="mx-auto">
         <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/imgs/report.png"
                                                        Width="150" Height="40"  CausesValidation="False" OnClick="ImageButton4_Click"/>
            </div>
             <br /><br />
         <label>Monthly Sales Report</label>
             <div class="mx-auto">
         <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/imgs/report.png"
                                                        Width="150" Height="40"  CausesValidation="False" OnClick="ImageButton5_Click"/>
            </div>
                    <a href="adminmenu.aspx">
                        <br /><br/ ><br /><br/ >
                        << Back to Admin Menu</a><span class="clearfix"></span>
                            <br /><br /><br />
         </center>
    </div>

</asp:Content>
