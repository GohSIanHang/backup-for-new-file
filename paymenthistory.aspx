<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="paymenthistory.aspx.cs" Inherits="AGN.paymenthistory" %>

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

   <style>

    

body {
  background-color: #5f6163;
}
</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="vertical-align:middle; margin: 0 auto;">
    <div class="container" >
        <br />
        <div class="row" style="vertical-align:middle; text-align: center;">

            <div class="col-sm-12" >
                
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
                        Payment History List</h2>
                                <div class="row">
                                <div class="col">
                                    <hr><p style="font-weight: bold;">The payment history only will be counted after you upload receipt<hr />
                                  
                                </div>
                            </div>
                    </center>
                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:agnDBConnectionString %>" DeleteCommand="DELETE FROM [purchase] WHERE [rid]=@rid" SelectCommand="SELECT * FROM [purchase] where uid = @uid"><selectparameters><asp:sessionparameter name="uid" sessionfield="uid" type="String" /></selectparameters></asp:SqlDataSource>
                                <div class="col-md-12" style="vertical-align:middle; margin: 0 auto;" >
                                    <asp:GridView class="table-striped table-bordered" EmptyDataText = "No Records Found" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="rid" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting">
                                         
                                        <Columns>

                                            <asp:BoundField  DataField="rid" HeaderText="Reservation ID" SortExpression="rid">

                                                <ControlStyle Width="10%" Font-Bold="True" />
                                            </asp:BoundField>

                                            <asp:BoundField DataField="drid" HeaderText="AGN Service ID" SortExpression="drid">
                                                <ControlStyle Font-Bold="True" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="drname" HeaderText="AGN Service Name" SortExpression="drname">
                                                <FooterStyle Font-Bold="True" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="dpaymenttime" HeaderText="Time Paid" SortExpression="dpaymenttime">
                                                <ControlStyle Font-Bold="True" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="dprice" HeaderText="Total Paid (RM)" SortExpression="dprice">
                                                <ControlStyle Font-Bold="True" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="uname" HeaderText="Paid By" SortExpression="uname">
                                                <ControlStyle Font-Bold="True" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Download Receipt">

                                                <ItemTemplate>

                                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imgs/down.png"
                                                        Width="130" Height="35" CommandName="print" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="False" />

                                                </ItemTemplate>

                                            </asp:TemplateField>

                                            <asp:CommandField ButtonType="Button" CausesValidation="False" ShowDeleteButton="True">
                                            <ControlStyle BackColor="Red" Font-Bold="True" ForeColor="White" />
                                            </asp:CommandField>

                                        </Columns>
                                        <EmptyDataRowStyle Width = "450px"

   HorizontalAlign = "Center" BackColor = "#C2D69B"  />
                                    </asp:GridView>
                                </div>
                            </div>
                            <center>
                    <a href="mainpage.aspx">
                        << Back to Main Menu</a><span class="clearfix"></span>
                            <br />
                            <center>
                        </div>
                    </div>
                </div>
                    </div>
            </div>
            
        </div>
        <br /><br />
    </div>
        </div>

</asp:Content>
