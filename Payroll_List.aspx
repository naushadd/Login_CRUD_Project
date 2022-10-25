<%@ Page Title="" Language="C#" MasterPageFile="~/one.Master" AutoEventWireup="true" CodeBehind="Payroll_List.aspx.cs" Inherits="LPT.Payroll_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <!---Payroll LIst Display--->

    <div class="container">
        <h3>PayRoll List</h3>
        <div class="row">
            <div class="panel panel-primary" style="margin-top: 35px">
                <div class="panel-heading">
                    Payroll List
                </div>

                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-12">

                            <div class="row">
                                <div class="col-md-12">

                                    <asp:ListView ID="txt_LV" runat="server">

                                        <LayoutTemplate>

                                            <table class="table table-bordered" id="my_Table">
                                                <thead>
                                                    <tr class="table bg-blue" style="">
                                                        <th>Staff Id</th>
                                                        <th>Staff Name</th>
                                                        <th>Phone No</th>
                                                        <th>Basic Salary</th>
                                                        <th>House Rent</th>
                                                        <th>Medical Allowances</th>
                                                        <th>Special Allowances</th>
                                                        <th>Total Salary</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tr id="ItemPlaceholder" runat="server"></tr>
                                            </table>
                                            <asp:HiddenField ID="hidId" Value="0" runat="server" />

                                        </LayoutTemplate>

                                        <ItemTemplate>

                                            <body>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                                    </td>

                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("staffname") %>'></asp:Label>
                                                    </td>

                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("phone") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Basicsalary") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Houserent") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Medicalallowances") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("Specialallowances") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("Totalsalary") %>'></asp:Label>
                                                    </td>

                                                    <td>
                                                        <a href="/Payroll.aspx?id=<%#Eval("id")%>" type="button" class="btn btn-primary btn-xm">Define PayRoll</a>

                                                    </td>

                                                </tr>

                                            </body>

                                        </ItemTemplate>

                                    </asp:ListView>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script>
        $(document).ready(function () {
            $('#my_Table').DataTable();
            //"pageLength": 50
            //$('#my_Table').dataTable({
            //    "lengthMenu": [[2, 4, 8, -1], [2, 4, 8, "All"]],
            //    "pageLength": 3
            //});

        });

    </script>    

    <script src="payroll_master.js"></script>

</asp:Content>
