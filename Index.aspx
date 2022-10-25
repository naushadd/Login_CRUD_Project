<%@ Page Title="" Language="C#" MasterPageFile="~/one.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="LPT.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<!---Staff details-->

    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <h2>Manage Staff</h2>
                <div class="alert alert-success" role="alert" id="message" style="display: none;">
                </div>
                <div class="panel panel-primary" style="margin-top: 40px;">
                    <div class="panel-heading">
                        Staff Details
                    </div>

                    <div class="panel-body display">
                        <div class="row">
                            <div class="form-group ">
                                <div class="col-sm-3">
                                    <label for="inputEmail3" class="control-label" value="">Staff Id</label>
                                </div>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" disabled id="staffid" style="margin: 5px" placeholder="Enter Id">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group ">
                                <div class="col-sm-3">
                                    <label for="inputEmail3" class="control-label ">Staff Name</label>
                                </div>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control req_control " id="staffname" style="margin: 5px" placeholder="Enter Name">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group ">
                                <div class="col-sm-3">
                                    <label for="inputEmail3" class="control-label">Phone No</label>
                                </div>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control req_control" id="phone" style="margin: 5px" placeholder="Enter Phone ">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group ">
                                <div class="col-sm-3">
                                    <label for="inputEmail3" class="control-label">Email</label>
                                </div>
                                <div class="col-sm-9">
                                    <input type="email" class="form-control req_control" onchange="email_validation(this)" id="email" style="margin: 5px" placeholder="Enter Email">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group ">
                                <div class="col-sm-3">
                                    <label for="inputEmail3" class="control-label">Status </label>
                                </div>
                                <div class="col-sm-9">
                                    <select name="status" id="status" class="form-control req_control">
                                        <option value="">Please Select</option>
                                        <option value="1">Active</option>
                                        <option value="0">Inactive</option>
                                    </select>
                                    <%-- <input type="text" class="form-control" id="status" style="margin: 5px" placeholder="Active(1)/Inactive(0)">--%>
                                </div>
                            </div>
                        </div>


                        <div class="box-footer pull-right">
                            <button type="button" class="btn btn-primary" id="btn_save" onclick="savedata()">Save</button>
                            <button type="button" onclick="reset()" class="btn btn-danger">Reset</button>
                            <br />

                        </div>
                    </div>
                    <%--</div>--%>
                </div>
            </div>


            <!---Stafff LIst Display--->
            <div class="col-md-7">
                <div class="panel panel-primary" style="margin-top: 94px">
                    <div class="panel-heading">
                        Staff List
                    </div>

                    <div class="panel-body">

                        <%-- <asp:Button ID="btnsearch" Text="Search" OnClick="ABC_Click" runat="server" />--%>
                        <div class="row">
                            <div class="col-sm-12">

                                <div class="row">
                                    <div class="col-md-12">

                                        <asp:ListView ID="LV" runat="server">

                                            <LayoutTemplate>

                                                <table class="table table-bordered" id="myTable">
                                                    <thead>
                                                        <tr class="table bg-blue" style="">
                                                            <th>Staff Id</th>
                                                            <th>Staff Name</th>
                                                            <th>Staff Email</th>
                                                            <th>Phone No</th>
                                                            <th>Action</th>
                                                            <%--<th>Status</th>--%>
                                                        </tr>
                                                    </thead>
                                                    <tr id="ItemPlaceholder" runat="server"></tr>
                                                </table>
                                                <asp:HiddenField ID="hidId" Value="0" runat="server" />

                                            </LayoutTemplate>

                                            <ItemTemplate>

                                                <body>

                                                    <tr>

                                                        <%--                                                           <td>
                                                            <asp:HiddenField id="hidId" Value="0" runat="server" />
                                                        </td>--%>

                                                        <td>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                                        </td>

                                                        <td>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("staffname") %>'></asp:Label>
                                                        </td>

                                                        <td>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                                        </td>

                                                        <td>
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("phone") %>'></asp:Label>
                                                        </td>

                                                        <td>
                                                            <button type="button" class="btn btn-primary btn-xs" staff_id='<%# Eval("id") %>' onclick="editdata(this)">Edit</button>

                                                            <button type="button" class="btn btn-danger btn-xs" staff_id='<%# Eval("id") %>' onclick="deletedata(this)">Delete</button>

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
    </div>

   <%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>--%>
    <script src="staff_master.js"></script>

</asp:Content>



 
