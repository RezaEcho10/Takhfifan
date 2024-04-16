<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="Takhfifan.AdminPanel.ProductPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <h1>مدیریت تخفیف ها</h1>
                </div>
            </div>
            <asp:Label Text="" ID="label1" runat="server" />
            <div class="row" style="direction: rtl; text-align: right">
                <div class="col col-lg-12">
                    <div class="col-lg-4" style="padding: 1%">
                        <label for="dropCity">مربوط به شهر</label>
                        <asp:DropDownList runat="server" ID="dropCity" DataTextField="Title" DataValueField="ID" class="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-lg-4">
                        <label for="dropCategory">مربوط به گروه</label>
                        <asp:DropDownList runat="server" ID="dropCategory" class="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-lg-4">
                        <label for="dropCity">عنوان تخفیف</label>
                        <asp:TextBox runat="server" ID="offTitle" class="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <label for="endDate">تاریخ پایان</label>
                        <asp:TextBox runat="server" ClientIDMode="Static" ID="endDate" class="form-control" data-enabletimepicker="true" data-englishnumber="true" data-mddatetimepicker="true" data-targetselector="#endDate" data-todate="true" ></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <label for="startDate">تاریخ شروع</label>
                        <asp:TextBox runat="server" ClientIDMode="Static" ID="startDate" class="form-control" data-enabletimepicker="true" data-englishnumber="true" data-mddatetimepicker="true" data-targetselector="#startDate" data-todate="true" ></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <label for="offPrice">قیمت</label>
                        <asp:TextBox runat="server" ID="offPrice" class="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <label for="tell">تلفن</label>
                        <asp:TextBox runat="server" ID="tell" class="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <label for="location">موقعیت مکانی</label>
                        <asp:TextBox runat="server" ID="location" class="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <label for="offPercent">تخفیف</label>
                        <asp:TextBox runat="server" ClientIDMode="Static" ID="offPercent" class="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <label for="address">آدرس</label>
                        <asp:TextBox runat="server" ID="address" class="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <label for="resTime">زمان پاسخگویی</label>
                        <asp:TextBox runat="server" ID="resTime" class="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <label for="servDay">روزهای سرویس دهی</label>
                        <asp:TextBox runat="server" ID="servDay" class="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <label for="Desc">توضیحات</label>
                        <asp:TextBox runat="server" ID="Desc" class="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <label for="features">ویژگی ها</label>
                        <asp:TextBox runat="server" ID="features" class="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <label for="condition">شرایط استفاده</label>
                        <asp:TextBox runat="server" ID="condition" class="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <label for="offPicMenu">تصویر منو</label>
                        <asp:FileUpload runat="server" ID="offPicMenu" class="form-control"></asp:FileUpload>
                    </div>
                    <div class="col-lg-4">
                        <label for="offPic">تصویر تخفیف</label>
                        <asp:FileUpload runat="server" ID="offPic" class="form-control"></asp:FileUpload>
                    </div>
                    <div class="col-lg-2">
                        <label for="btnCancel"></label>
                        <input type="button" id="btnCancel" value="انصراف" class="btn btn-warning form-control" onclick="this.form.reset(); return false;" runat="server" />
                    </div>
                    <div class="col-lg-2">
                        <label for="btnSaveProduct"></label>
                        <asp:Button ID="btnSaveProduct" Text="ثبت تخفیف جدید" CssClass="btn btn-info form-control" runat="server" OnClick="btnSaveProduct_Click" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12" id="ScopeProData">
                    <div></div>
                </div>
            </div>
            </div>
         </div>
    <script type="text/javascript">
        $(document).ready(function () {
            fetchData();
        });
        function changeToFloat(percent) {
            var offPercent = percent / 100;
            $("#offPercent").val(offPercent);
        }
        function fetchData() {
            $.ajax({
                url: 'ProductPage.aspx/ProductDetails',
                contentType: 'application/json; charset=utf-8',
                method: 'get',
                data: '{}',
                success: function (data) {
                    $("#ScopeProData").html("");
                    var tableContent = '';
                    tableContent += '<table class="table table-bordered table-hover" style="text-align: center; direction: rtl">';
                    tableContent += '<tr style="font-weight: bold; background: #00ffff"> <td>ردیف</td><td>تصویر</td ><td>عنوان تخفیف</td><td>قیمت</td><td>درصد تخفیف</td><td>اطلاعات تخفیف</td><td>عملیات</td></tr >';
                    for (var i = 0; i < data.d.length; i++) {
                        var j = i + 1;
                        tableContent += '<tr><td>' + j + '</td><td><img src="../' + data.d[i].Pic + '" /></td<td>' + data.d[i].Title + '</td><td>' + data.d[i].Price + '</td><td>' + data.d[i].offPercent + '</td><td><span onclick="showFullInfo(' + data.d[i].ID + ')">نمایش</span></td><td><span>ویرایش</span></td></tr>';
                    }
                    tableContent += '</table>';
                    $("#ScopeProData").html(tableContent);
                },
                error: function (er) {
                    $("#err").show();
                }
            });
        }
        function showFullInfo(id) {
            window.open("../ProductDetail.aspx?pid=" + id, "_blank");
        }
    </script>
</asp:Content>
