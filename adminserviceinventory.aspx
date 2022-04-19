<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminserviceinventory.aspx.cs" Inherits="AGN.adminserviceinventory" %>

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
                                    <h2>Service Details</h2>
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
                                <br/>
                                <label style="font-weight:bold">Please Add Service ID Based on Guideline Below: </label><br/>
                                <label>▶ BEP01 - Bridging Executive Program</label><br/>
                                <label>▶ EGC01 - Elite Golf Camp 3 to 5 days</label><br/>
                                <label>▶ EGP01 - Executive Golf Program</label><br/>
                                <label>▶ GC01 - Golf Clinic - Special Package (School Students)</label><br/>
                                <label>▶ GC02 - Golf Clinic - Special Package (UUM Students)</label><br/>
                                <label>▶ GC03 - Golf Clinic - Special Package (UUM Staffs)</label><br/>
                                <label>▶ GC04 - Golf Clinic - Corporate Package (Student Coach)</label><br/>
                                <label>▶ GC05 - Golf Clinic - Corporate Package (Professional Coach)</label><br/>
                                <label>▶ GC06 - Golf Clinic - Individual Package (Professional Coach)</label><br/>
                                <label>▶ GC07 - Golf Clinic - Individual Package (UUMNGA Student Coach)</label><br/>
                                <br/>
                            </div>
                        </div>

                        <div class="row">
                            <br/>
                            <div class="col-md-3">
                                <label>Service ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="ID"></asp:TextBox>
                                        
                                        <asp:Button class="btn btn-success" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" CausesValidation="False" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please Enter ID" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-9">
                                <label>Service Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Service Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-4">
                                <label>Coach</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server" placeholder="Coach">
                                        <asp:ListItem Text="Publisher 1" Value="Publisher 1" />
                                        <asp:ListItem Text="Publisher 2" Value="Publisher 2" />
                                    </asp:DropDownList>
                                </div>

                                <label>Location</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Location"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="Please Enter Location" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                            </div>

                            <div class="col-md-4">
                                <label>Tel</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Tel"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please Enter tel.No" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                                <label>
                                    Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Genre</label>
                                <div class="form-group">
                                    <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                                        <asp:ListItem Text="Individual" Value="Individual" />
                                        <asp:ListItem Text="Adventure" Value="Adventure" />
                                        <asp:ListItem Text="Cooperation" Value="Cooperation" />
                                        <asp:ListItem Text="Training" Value="Training" />
                                        <asp:ListItem Text="Motivation" Value="Motivation" />
                                        <asp:ListItem Text="Professional" Value="Professional" />
                                        <asp:ListItem Text="Wellness" Value="Wellness" />
                                    </asp:ListBox>
                                </div>



                            </div>



                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <label>Service Time</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Service Time" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox9" ErrorMessage="Please Enter Service Time" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Service Status</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Active" Value="Active" />
                                        <asp:ListItem Text="Inactive" Value="Inactive" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <label>Maximum Participants</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Max No" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox6" ErrorMessage="Please Enter Participants No" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            
                        </div>

                        <div class="row">

                            <div class="col-12">
                                <label>Service Description</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox10" ErrorMessage="Please Enter Description" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                        </div>

                        <div class="row">
                            <div class="col-12">
                                <label>Set Price</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="RM" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox8" ErrorMessage="Please Enter Price" ForeColor="Red"></asp:RequiredFieldValidator>
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

                            <a href="adminmenu.aspx"><< Back to Main Menu</a><br>
                
                        </div>
                    </div>

                </div>
                <br /><br />
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">


                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Service Inventory List</h4>
                                    


                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:agnDBConnectionString %>" SelectCommand="SELECT * FROM [service_tb1]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table-striped table-bordered" ID="GridView1" EmptyDataText = "No Records Found" runat="server" AutoGenerateColumns="False" DataKeyNames="service_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        
                                        <asp:BoundField DataField="service_id" HeaderText="ID" ReadOnly="True" SortExpression="service_id" >
                                        
                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-9">


                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("service_name") %>' Font-Bold="True" Font-Size="X-Large" ForeColor="#0033CC"></asp:Label>
                                                                </div>
                                                            </div>


                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <span style="color: green; font-weight: bold">Coach : </span>
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("coach_name") %>'></asp:Label>
                                                                    &nbsp;| <span style="color: green; font-weight: bold"><span>&nbsp;</span>Genre :</span>
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
                                                                    &nbsp;| 
                                                   <span style="color: green; font-weight: bold">Service Status : <span>&nbsp;</span>
                                                       <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("service_status") %>' ForeColor="Black"></asp:Label>
                                                   </span>
                                                                </div>
                                                            </div>


                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <span style="color: green; font-weight: bold">Location : </span>
                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("location") %>'></asp:Label>
                                                                    &nbsp;| <span style="color: green; font-weight: bold"><span>&nbsp;</span>Maximum Participants :</span>
                                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("maximum_participants") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <br />
                                                                    <span style="color: green; font-weight: bold">Registration Fee : RM</span>
                                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("service_price") %>'></asp:Label>
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
                                                                    <br />
                                                                    <span style="color: green; font-weight: bold">Service Description : </span>
                                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("service_description") %>'></asp:Label>
                                                                    <br />
                                                                    &nbsp;
                                                                    
                                                                </div>
                                                            </div>


                                                        </div>
                                                        <div class="col-lg-3">
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
                </div>
            </div>
        </div>
    </div>



    </label>



</asp:Content>
