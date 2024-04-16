<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.Master" AutoEventWireup="true" CodeBehind="CityPage.aspx.cs" Inherits="Takhfifan.AdminPanel.CityPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <h1>مدیریت شهرها</h1>
                </div>
            </div>
            <div class="row">
                <div class="col col-lg-12">
                    <div class="col-lg-1 col-lg-12">
                        <asp:Label Text="text" ID="lblText" style="display: none" runat="server" />
                    </div>
                    <div class="col-lg-2">
                        <label for="btnCancel"></label>
                        <input type="button" id="btnCancel" value="انصراف" class="btn btn-warning form-control" onclick="this.form.reset(); return false;" runat="server" />
                    </div>
                    <div class="col-lg-2">
                        <label for="btnAddCity"></label>
                        <asp:Button ID="btnAddCity" Text="ثبت" CssClass="btn btn-info form-control" OnClick="AddCity" runat="server" />
                    </div>
                    <div class="col-lg-6">
                        <label for="cityTitle">نام شهر</label>
                        <asp:TextBox ID="cityTitle" runat="server" CssClass="form-control" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="لطفا فیلد را پر کنید" style="color: red" ControlToValidate="cityTitle" runat="server" ValidationGroup="validation" ></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <asp:GridView ID="GridViewCity" style="width: 50%" AutoGenerateColumns="False" DataKeyNames="ID" BackColor="Orange" runat="server" OnRowCancelingEdit="GridViewCity_Cancel" OnRowDeleting="GridViewCity_Deleted" OnRowEditing="GridViewCity_Edit" OnRowUpdating="GridViewCity_Update" OnSelectedIndexChanged="GridViewCity_SelectedIndexChanged">
                        <Columns>
                            <asp:TemplateField HeaderText="شهر">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Title") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ردیف">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text="<%# Container.DataItemIndex + 1 %>"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="عملیات" ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>

                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
