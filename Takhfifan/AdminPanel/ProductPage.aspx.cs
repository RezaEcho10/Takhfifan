using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Takhfifan.AdminPanel
{
    public partial class ProductPage : System.Web.UI.Page
    {
        public static takhfifanEntities te = new takhfifanEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                List<Category> CateList = new List<Category>();
                List<City> CityList = new List<City>();

                CateList = te.Categories.ToList();
                dropCategory.DataSource = CateList;
                dropCategory.DataBind();
                dropCategory.Items.Insert(0, " -- انتخاب کنید --");

                CityList = te.Cities.ToList();
                dropCity.DataSource = CityList;
                dropCity.DataTextField = "Title";
                dropCity.DataValueField = "ID";
                dropCity.DataBind();
                dropCity.Items.Insert(0, " -- انتخاب کنید --");
            }

            offPercent.Attributes["onblure"] = "changeToFloat(this.value)";
        }

        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            Product pro = new Product();
            pro.Title = offTitle.Text;
            pro.Price = offPrice.Text;
            pro.categoryID = int.Parse(dropCategory.SelectedValue);
            pro.cityID = int.Parse(dropCity.SelectedValue);
            
            pro.offPercent = Convert.ToDouble(offPercent.Text);
            pro.Feature = features.Text;
            pro.useCondition = condition.Text;
            pro.responseTime = resTime.Text;
            pro.serviceDate = servDay.Text;
            pro.Tell = tell.Text;
            pro.Address = address.Text;
            pro.Description = Desc.Text;
            pro.Location = location.Text;

            pro.Pic = "images/gallery/" + functions.GenerateRandomString(10) + offPic.FileName.ToString();
            pro.menuPic = "images/gallery/" + functions.GenerateRandomString(10) + offPicMenu.FileName.ToString();

            te.Products.Add(pro);
            if(te.SaveChanges() >= 0)
            {
                offPic.SaveAs(Request.PhysicalApplicationPath + pro.Pic + "images/gallery/" + functions.GenerateRandomString(10) + offPic.FileName.ToString());
                offPicMenu.SaveAs(Request.PhysicalApplicationPath + pro.Pic + "images/gallery/" + functions.GenerateRandomString(10) + offPic.FileName.ToString());

                Response.Redirect(Request.Url.AbsolutePath);

                label1.Attributes["class"] = "col-lg-12 alert alert-success";
                label1.Text = "عمل تخفیف با موفقیت ثبت شد";

            }
            else
            {
                label1.Attributes["class"] = "col-lg-12 alert alert-success";
                label1.Text = "عمل تخفیف با موفقیت ثبت شد";
            }
        }

        [WebMethod]
        public static List<Product> ProductDetails()
        {
            List<Product> AllPro = new List<Product>();
            AllPro = te.Products.ToList();
            return AllPro;
        }
    }
}