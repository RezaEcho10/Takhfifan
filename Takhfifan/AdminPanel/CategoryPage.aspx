<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.Master" AutoEventWireup="true" CodeBehind="CategoryPage.aspx.cs" Inherits="Takhfifan.AdminPanel.CategoryPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <h1>مدیریت گروه ها</h1>
                </div>
            </div>
            <input type="hidden" id="EditTitle" value="" />
            <div class="row">
                <div class="alert-success" id="success" style="display: none; padding: 1%">
                    <span>با موفقیت انجام شد</span>
                </div>
                <div class="alert-danger" id="err" style="display: none; padding: 1%">
                    <span>خطا در عملیات</span>
                </div>
                <div class="col col-lg-12">
                    <div class="col-lg-1 col-lg-12">
                        <asp:Label Text="text" ID="lblText" style="display: none" runat="server" />
                    </div>
                    <div class="col-lg-2">
                        <label for="btnCancel"></label>
                        <input type="button" id="btnCancel" value="انصراف" class="btn btn-warning form-control" onclick="this.form.reset(); return false;" runat="server" />
                    </div>
                    <div class="col-lg-2">
                        <label for="btnAddCategory"></label>
                        <input type="button" id="btnAddCategory" value="ثبت گروه جدید" class="btn btn-info form-control" onclick="AddCategory();" runat="server" />
                    </div>
                    <div class="col-lg-2" style="display: none">
                        <label for="btnEditCategory"></label>
                        <input type="button" id="btnEditCategory" value="ویرایش گروه " class="btn btn-info form-control" onclick="btnEditCategory();" runat="server" />
                    </div>
                    <div class="col-lg-6" id="ScopeTitle">
                        <label for="CategoryTitle">عنوان گروه</label>
                        <input type="text" id="CategoryTitle" runat="server" placeholder="عنوان گروه" onkeypress="InsertChar();" class="form-control" />
                        <span class="help-block" id="validateText" style="display: none">لطفا عنوان گروه را وارد کنید</span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col col-lg-12" id="ScopeCatData" style="margin-top: 3%">
                   
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            fetchData();
        });
        const { error } = require("jquery");

        function AddCategory() {
            var txtTitle = $("#CategoryTitle").val();
            if (txtTitle == "") {
                $("#ScopeTitle").attr("class", "col-lg-6 has-error");
                $("#validateText").css({ "display": "block" });
                return false;
            } else {
                var CatArray = [];
                CatArray.Title = $("#CategoryTitle").val();
                $.ajax({
                    url: 'CategoryPage.aspx/addCategories',
                    contentType: 'application/json; charset=utf-8',
                    method: 'post',
                    data: '{cat: ' + JSON.stringify(CatArray) + '}',
                    success: function () {
                        $("#success").show();
                        $("#CategoryTitle").val("");
                    },
                    error: function (er) {
                        $("#err").show();
                    }
                });
            }
        }
        function InsertChar() {
            $("#ScopeTitle").attr("class", "col-lg-6");
            $("#validateText").css({"display": "none"})
        }
        function fetchData() {
            $.ajax({
                url: 'CategoryPage.aspx/ShowCategories',
                contentType: 'application/json; charset=utf-8',
                method: 'get',
                data: '{}',
                success: function (data) {
                    $("#ScopeCatData").html("");
                    var tableContent = '';
                    tableContent += '<table class="table table-bordered table-hover" style="text-align: center; direction: rtl">';
                    tableContent += '<tr style="font-weight: bold; background: #00ffff"> <td>ردیف</td><td>عنوان گروه</td ><td>عملیات</td></tr >';
                    for (var i = 0; i < data.d.length; i++) {
                        var j = i + 1;
                        tableContent += '<tr><td>' + j + '</td><td>' + data.d[i].Title + '</td><td><span onclick="removeCategory(' + data.d[i].ID + ')">حذف</span></td><td><span>ویرایش</span></td></tr>';
                    }
                    tableContent += '</table>';
                    $("#ScopeCatData").html(tableContent);
                },
                error: function (er) {
                    $("#err").show();
                }
            });
        }
        function RemoveCategory(int id) {
            if (confirm('آیا از حذف کردن این رکورد مطمئن هستید؟')) {
                $.ajax({
                    url: 'CategoryPage.aspx/DeleteCategory',
                    contentType: 'application/json; charset=utf-8',
                    method: 'post',
                    data: '{catID: ' + id + '}',
                    success: function (data) {
                        fetchData();
                    },
                    error: function (er) {
                        $("#err").show();
                    }
                });
            }
        }
        /*function EditCategories(id, title) {
            $("#CategoryTitle").val(title);
            $("#btnAddCategory").hide();
            $('#btnEditCategory').show();
            $("#EditTitle").val(id);
        }*/
        function EditCategory() {
            var title = $("#CategoryTitle").val();
            var id = $("#EditTitle").val();
                $.ajax({
                    url: 'CategoryPage.aspx/EditCategory',
                    contentType: 'application/json; charset=utf-8',
                    method: 'post',
                    data: JSON.stringify({ catID: id, catTitle: title }),
                    success: function (data) {
                        fetchData();
                        $("#CategoryTitle").val("");
                        $("#btnAddCategory").show();
                        $('#btnEditCategory').hide();
                        $("#EditTitle").val("");
                    },
                    error: function (er) {
                        $("#err").show();
                    }
                });
        }
    </script>
</asp:Content>
