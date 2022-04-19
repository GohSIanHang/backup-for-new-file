<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="drivingrangeupload.aspx.cs" Inherits="AGN.drivingrangeupload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
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
        h2 {
            margin-top: 65px;
        }


        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <center>
    <h2>Uplaod Your Receipt</h2>
        <lable>Please uplaod your payment receipt if you using UUM ecom payment platform to pay</lable>
    
        <div class="container" style="vertical-align:middle; margin: 0 auto;">
        <div class="row">

            <div class="col-sm-12" style="vertical-align:middle; margin: 0 auto;">
                
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
                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:agnDBConnectionString %>" SelectCommand="SELECT * FROM [customer_drivingrange_tb1] where areservation_id = @areservation_id">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="areservation_id" SessionField="areservation_id" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-bordered" EmptyDataText = "No Records Found" BorderColor="DarkGreen" BorderWidth="1px" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" >
                                        <Columns>
                                        
                                        
                                        <asp:BoundField DataField="dservice" HeaderText="service" SortExpression="dservice" />
                                            <asp:BoundField DataField="areservation_id" HeaderText="Reservation id" SortExpression="areservation_id">
                                            </asp:BoundField>
                                            <asp:BoundField DataField="dreservation_time" HeaderText="Reservation time" SortExpression="dreservation_time" />
                                            <asp:BoundField DataField="driving_range_id" HeaderText="Service id" SortExpression="driving_range_id" />
                                            <asp:BoundField DataField="dcustomer_id" HeaderText="Customer id" SortExpression="dcustomer_id" />
                                            <asp:BoundField DataField="dcustomer_name" HeaderText="Customer name" SortExpression="dcustomer_name" />
                                            <asp:BoundField DataField="total" HeaderText="Total(RM)" SortExpression="total" />
                                            <asp:BoundField DataField="dr_link" HeaderText="Your Uploaded Receipt" SortExpression="dr_link" Visible="false"/>
                                            <%--<asp:BoundField DataField="CustomerName" Visible="false" />--%>
                                            <asp:TemplateField HeaderText="Upload Receipt">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Bind("dr_link") %>'  OnClick="downloadfile" ></asp:LinkButton>
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
    </div>

        <br /><br /><br /><br />
    <asp:FileUpload ID="FileUpload2" runat="server" />
    <hr />
    <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="UploadFile" />
    <br />
    <asp:Label ID="lblMessage" ForeColor="Green" runat="server" />
        <br /><br /><br /><br />
       
                    <a href="customerdrivingrange.aspx">
                        << Back to Reservation</a><span class="clearfix"></span>
                            <br />
                            
    </center>

</asp:Content>
