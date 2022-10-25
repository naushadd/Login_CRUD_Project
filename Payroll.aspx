<%@ Page Title="" Language="C#" MasterPageFile="~/one.Master" AutoEventWireup="true" CodeBehind="Payroll.aspx.cs" ClientIDMode="Static"  Inherits="LPT.Payroll"  EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <h3>PayRoll Rate Master</h3>
          <div class="alert alert-success" role="alert" id="txt_message" style="display:none;">
 
</div>
        <div class="panel panel-primary" style="margin-top:40px">
            <div class="panel-heading">Employee Details</div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <div>
                            <table id="Mytable" class="table table-bordered">
                                <tbody>
                                    <tr>
                                        <td>
                                            <label class="control-label">Staff Name<span class="required" aria-required="true"></span></label>
                                        <td class="col-md-6">
                          <asp:DropDownList ID="ddlStaff" onchange="get_data_by_user_id(this)" runat="server" CssClass="form-control input-sm req req_control">
                                    </asp:DropDownList>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div>
                            <table id="Mytable1" class="table table-bordered">
                                <tbody>
                                    <th>Salary Structure</th>
                                    <th>Monthly</th>
                                    <tr>
                                        <td>
                                            <label class="control-label">Basic Salary<span class="required" aria-required="true"></span></label>
                                        <td>
                                            <asp:TextBox ID="txt_basic" CssClass="number form-control input-sm req req_control"  runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-6">
                                            <label class="control-label">House Rent Allowances<span class="required" aria-required="true"></span></label>
                                        <td>
                                            <asp:TextBox ID="txt_house" CssClass="number form-control input-sm req req_control"  runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-6">
                                            <label class="control-label">Medical Allowances<span class="required" aria-required="true"></span></label>
                                        <td class="col-md-6">
                                            <asp:TextBox ID="txt_medical" CssClass="number form-control input-sm req req_control"  runat="server"></asp:TextBox></td>
                                    </tr>
                                     <tr>
                                        <td class="col-md-6">
                                            <label class="control-label">Special Allowances<span class="required" aria-required="true"></span></label>
                                            <td>
                                                <asp:TextBox ID="txt_special" CssClass="number form-control input-sm req req_control" runat="server"></asp:TextBox>

                                            </td>
                                         </td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-6">
                                            <label class="control-label">Total Salary<span class="required" aria-required="true"></span></label>
                                        <td>
                                            <asp:TextBox ID="txt_total"  CssClass="form-control input-sm req req_control"  runat="server"></asp:TextBox></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="form-group">
                            <div class="col-md-2 col-md-offset-5">
                             <button type="button" class="btn btn-primary" id="btn_add" onclick="AddPayroll()">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
$('.number').on('keyup', function () {
    debugger;
    var sum = 0;
    var grade = 'B';

    $('.number').each(function () {
        if ($(this).val() != "") {
            sum += parseInt($(this).val());
        }
      
    });
    $("#txt_total").val(sum);
      
});


    </script>

     <script src="payroll_master.js"></script>
</asp:Content>
