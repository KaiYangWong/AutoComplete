<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="prjAutocomplete.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>

        $(document).ready(function () {
            $("#txtKeyword").on("keyup", fnKeyPress);
            function fnKeyPress() {
                var apiurl = "http://localhost:50938/api/SearchAddress";
                var keyword = $("#txtKeyword").val();

                $.ajax({
                    url: apiurl + "?keyword=" + encodeURI(keyword),
                    type: 'GET',
                    success: function (data) {
                        var availableTags = new Array(data.length);
                        for (var i = 0; i < data.length; i++) {
                            availableTags[i] = data[i];
                        }

                        $("#txtKeyword").autocomplete({
                            source: availableTags
                        });
                    }
                });

            }
        });
    </script>


</head>
<body>
    <form id="form1" runat="server">
        <div class="container" style="margin-top: 30px;">
            <h2>客戶查詢</h2>
            <div class="form-group">
                <label for="txtKeyword">關鍵字</label>
                <asp:TextBox ID="txtKeyword" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="Button1" runat="server" Text="查詢" CssClass="btn btn-success" OnClick="Button1_Click" />
            <hr />
            <p>
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover">
                    <HeaderStyle CssClass="table-info" />
                </asp:GridView>
            </p>
        </div>
    </form>
</body>
</html>
