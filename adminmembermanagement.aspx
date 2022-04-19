<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminmembermanagement.aspx.cs" Inherits="AGN.adminmembermanagement" %>
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

    <div class="container-fluid">
        <br /><br />
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member Details</h4>
                                    
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/member1.png" />

                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-3">
                                        <label>User ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="ID"></asp:TextBox>

                                    <asp:LinkButton class="btn btn-success" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        </div>
                                </div>
                            </div>
                                    

                            <div class="col-md-4">
                                <label>Full Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name" ReadOnly="True" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                        </div>
                            </div>


                        <div class="col-md-5">
                                <label>Account Status</label>
                            <div class="form-group">
                               <div class="input-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Account Status" ReadOnly="True"></asp:TextBox>
                                       <asp:LinkButton class="btn btn-success" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                       <asp:LinkButton class="btn btn-warning" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                       <asp:LinkButton class="btn btn-danger" ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                               </div>
                            </div>
                         </div>
                            

                        </div>

                        <div class="row">
                                    
                            <div class="col-md-3">
                                <label>Date of Birth</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="DOB" ReadOnly="True"></asp:TextBox>
                        </div>
                            </div>

                            <div class="col-md-4">
                                <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Contact No" ReadOnly="True"></asp:TextBox>
                        </div>
                            </div>

                            <div class="col-md-5">
                                <label>Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" ReadOnly="True"></asp:TextBox>
                        </div>
                            </div>

                          

                        </div>

                        <div class="row">
                                    
                            <div class="col-md-6">
                                <label>User Type</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="User Type" ReadOnly="True"></asp:TextBox>
                        </div>
                            </div>

                            <div class="col-md-6">
                                <label>Gender</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Gender" ReadOnly="True"></asp:TextBox>
                        </div>
                            </div>

                        </div>

                        

                        <div class="row">
                            <div class="col-8 mx-auto">
                                <br>
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete User Permanently" OnClick="Button2_Click" />
                                <br>
                            </div>

                            
                        </div>     
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
                                    <h4>Member List</h4>
                                    


                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:agnDBConnectionString %>" SelectCommand="SELECT * FROM [member_tb1]"></asp:SqlDataSource>
                            <div class="col">
                                
                                <asp:GridView class="table-striped table-bordered" EmptyDataText = "No Records Found" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="user_id" HeaderText="UserID" SortExpression="user_id" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact" SortExpression="contact_no" />
                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                        <asp:BoundField DataField="user_type" HeaderText="UserType" SortExpression="user_type" />
                                        <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                                        <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                                        <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
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
