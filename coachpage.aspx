<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="coachpage.aspx.cs" Inherits="AGN.coachpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script>
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
body {
  background-color: #5f6163;
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <br /><br />
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Coach Management</h4>
                                    


                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/coach.png" />   
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Coach ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="No." OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please Enter ID" ForeColor="Red"></asp:RequiredFieldValidator>

                                        
                                        <asp:Button Class="btn btn-success" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" CausesValidation="False" />
                                         </div>
                                  
                                     <br /><br />
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>Coach Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Name" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                            </div>

                            <div class="col-4">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button4_Click" />
                            </div>
                            
                        </div>
                        <br /><br />
                            <a href="adminmenu.aspx"><< Back to Main Menu</a><br>
                    </div>

                </div>
                
                
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">


                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Coach List</h4>
                                    


                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:agnDBConnectionString %>" SelectCommand="SELECT * FROM [coach_tb1]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table-striped table-bordered" EmptyDataText = "No Records Found" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="coach_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="coach_id" HeaderText="coach_id" ReadOnly="True" SortExpression="coach_id" />
                                        <asp:BoundField DataField="coach_name" HeaderText="coach_name" SortExpression="coach_name" />
 
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br /><br />
    </div>

</asp:Content>
