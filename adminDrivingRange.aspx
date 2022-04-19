<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminDrivingRange.aspx.cs" Inherits="AGN.adminDrivingRange" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript">
        $(function () {
            $('#<%= GridView1.ClientID %>').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                paging: true,
                scrollY: "1000px",
                searching: true,
                info: true,
                order: [],
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

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

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
                                    <h3>Driving Range Component</h3>
                                    


                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" width="450" src="serviceinventory/preview.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:FileUpload onChange="readURL(this);" Class="form-control" ID="FileUpload1" runat="server" />
                                <br><br>
                                <label style="font-weight:bold">Please Add Driving Range ID Based on Guideline Below: </label><br/>
                                <label>▶ DR01 - Driving Range</label><br/>
                                <br><br>
                            </div>
                        </div>

                 

                        <div class="row">
                            <br/>
                            <div class="col-md-3">
                                <label>Driving Range ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="ID"></asp:TextBox>
                                        
                                        <asp:Button class="btn btn-success" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" CausesValidation="False" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please Enter ID" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-9">
                                <label>Driving Range Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Driving Range Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-4">
                                <label>Location</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Location"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox10" ErrorMessage="Please Enter Location" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                                <label>
                                    Price for 100 Ball Per Bucket (RM)</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="RM" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="Please Enter Balls Amount" ForeColor="Red"></asp:RequiredFieldValidator>
                                        
                                </div>

                            </div>

                            <div class="col-md-4">
                                <label>Tel</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Tel"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please Enter Tel.No" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                                <label>
                                    Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Available Bay ("Hold Shift To Select") </label>
                                <div class="form-group">
                                    <asp:ListBox CssClass="form-control" ID="ListBox2" runat="server" SelectionMode="Multiple" Rows="5">

                                        <asp:ListItem Text="Bay1" Value="Bay1" />
                                        <asp:ListItem Text="Bay2" Value="Bay2" />
                                        <asp:ListItem Text="Bay3" Value="Bay3" />
                                        <asp:ListItem Text="Bay4" Value="Bay4" />
                                        <asp:ListItem Text="Bay5" Value="Bay5" />
                                        <asp:ListItem Text="Bay6" Value="Bay6" />
                                        <asp:ListItem Text="Bay7" Value="Bay7" />
                                        <asp:ListItem Text="Bay8" Value="Bay8" />
                                        <asp:ListItem Text="Bay9" Value="Bay9" />
                                        <asp:ListItem Text="Bay10" Value="Bay10" />
                                        <asp:ListItem Text="Bay11" Value="Bay11" />
                                        <asp:ListItem Text="Bay12" Value="Bay12" />
                                    </asp:ListBox>
                                </div>



                            </div>



                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <label>Driving Range Time</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Service Time" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox9" ErrorMessage="Please Enter Service Time" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Driving Range Status</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Active" Value="Active" />
                                        <asp:ListItem Text="Inactive" Value="Inactive" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-4">
                                <label>Actual Ball Stock</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Ball No" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox6" ErrorMessage="Please Enter Ball Stock" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Current Ball Stock</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Ball No" ReadOnly="True" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Ball Being Rented</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Ball No" ReadOnly="True" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                        <div class="row">

                            <div class="col-md-4">
                                <label>All Range Bay</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Range No" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox11" ErrorMessage="Please Enter All Range Bay" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Available Range Bay</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Range No" ReadOnly="True" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Range Bay Being Rented</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" placeholder="Range No" ReadOnly="True" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                        <div class="row">
                            <div class="col-4">
                                <br>
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button3_Click" />
                                <br>
                            </div>

                            <div class="col-4">
                                <br>
                                <asp:Button ID="Button1" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button1_Click" />
                                <br>
                            </div>

                            <div class="col-4">
                                <br>
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button2_Click" />
                                <br>
                            </div>
                            <br />
                             <a href="adminmenu.aspx">--<<-- Back to Main Menu</a><br>
               
                

                        </div>
                    </div>

                </div>
               
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">


                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Driving Range</h4>
                                    


                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:agnDBConnectionString %>" SelectCommand="SELECT * FROM [driving_range_tb1]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table-striped table-bordered" EmptyDataText = "No Records Found" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        
                                        <asp:BoundField DataField="driving_range_id" HeaderText="ID" SortExpression="driving_range_id" >
                                        
                                        <FooterStyle Font-Bold="True" />
                                        
                                        </asp:BoundField>
                                        
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-9">


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
                                                        <div class="col-lg-3">
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
                </div>
            </div>
        </div>
        <br /><br />
    </div>





</asp:Content>
