<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Password_Update.aspx.cs" Inherits="LPT.Password_Update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container" style="width: 45rem">
            <div class="panel panel-primary" style="margin-top: 12rem">
                <div class="panel-heading">Reset Password</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">

                            <div>
                                <asp:Label runat="server">New Password</asp:Label><br />
                                <br />
                                <asp:TextBox ID="txtPassword" CssClass="number form-control" runat="server"></asp:TextBox><br />
                            </div>

                            <div>
                                <asp:Label runat="server">Confirm Password</asp:Label><br />
                                <br />
                                <asp:TextBox ID="txtConfPassword" CssClass="number form-control" runat="server"></asp:TextBox><br />
                            </div>

                            <div class="form-group">
                                <div class="col-md-12 col-md-offset-4">
                                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnsubmit_Click"  /><br />
                                    <br />
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <style>
            body {
                background-color: lightgray;
            }
        </style>


    </form>
</body>
</html>
