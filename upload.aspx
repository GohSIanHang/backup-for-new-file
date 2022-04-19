<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="AGN.upload" %>

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
                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:agnDBConnectionString %>" SelectCommand="SELECT * FROM [customer_service_tb1] where reservation_id = @reservation_id">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="reservation_id" SessionField="reservation_id" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-bordered" BorderColor="DarkGreen" BorderWidth="1px" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" >
                                        <Columns>
                                        
                                        
                                        <asp:BoundField DataField="service" HeaderText="service" SortExpression="service" />
                                            <asp:BoundField DataField="reservation_id" HeaderText="reservation_id" SortExpression="reservation_id">
                                            </asp:BoundField>
                                            <asp:BoundField DataField="reservation_time" HeaderText="Reservation time" SortExpression="reservation_time" />
                                            <asp:BoundField DataField="service_id" HeaderText="Service id" SortExpression="service_id" />
                                            <asp:BoundField DataField="customer_id" HeaderText="Customer id" SortExpression="customer_id" />
                                            <asp:BoundField DataField="customer_name" HeaderText="Customer name" SortExpression="customer_name" />
                                            <asp:BoundField DataField="stotal" HeaderText="Total(RM)" SortExpression="stotal" />
                                            <asp:BoundField DataField="doc_link" HeaderText="Your Uploaded Receipt" SortExpression="doc_link" Visible="false"/>
                                            <%--<asp:BoundField DataField="CustomerName" Visible="false" />--%>
                                            <asp:TemplateField HeaderText="Upload Receipt">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Bind("doc_link") %>'  OnClick="downloadfile" ></asp:LinkButton>
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
       
                    <a href="adminservice.aspx">
                        << Back to Reservation</a><span class="clearfix"></span>
                            <br />
                            
    </center> 
</asp:Content>
