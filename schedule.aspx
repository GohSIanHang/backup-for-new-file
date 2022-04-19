<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="schedule.aspx.cs" Inherits="AGN.schedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br /><br />
    <center>
    <div>  
        <p style="text-align: center">  
        <b></b>  
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial Black" Font-Size="20pt"  
            ForeColor="#000814">Customer Service Schedule</asp:Label><br /></b>  
        </p>  
        <asp:Calendar ID="Calendar1" runat="server" BackColor="	#e6ffcc" BorderColor="#004d00"  
            BorderWidth="3px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="12pt"  
            ForeColor="#663399" Font-Bold="True" ShowGridLines="True" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged"  
            OnVisibleMonthChanged="Calendar1_VisibleMonthChanged">  
            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />  
            <SelectorStyle BackColor="#FFCC66" />  
            <TodayDayStyle BackColor="#351b50" ForeColor="White" />  
            <OtherMonthDayStyle ForeColor="#CC9966" />  
            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />  
            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />  
            <TitleStyle BackColor="#004d00" Font-Bold="True" Font-Size="12pt" ForeColor="#FFFFCC" />  
        </asp:Calendar>  
        <b></b>  
        <asp:Label ID="LabelAction" runat="server"></asp:Label><br />  
        <br />   <br />   


    </div>  
         <a href="adminmenu.aspx">
                        
                        << Back to Admin Menu</a><span class="clearfix"></span>
                            <br /><br /><br />
        </center>


</asp:Content>

