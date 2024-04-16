using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace Takhfifan.AdminPanel
{
    public partial class CityPage : System.Web.UI.Page
    {
        takhfifanEntities te = new takhfifanEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        protected void AddCity(object sender, EventArgs e)
        {
            City tc = new City();
            tc.Title = cityTitle.Text;
            te.Cities.Add(tc);
            if(te.SaveChanges() >= 0)
            {
                lblText.Text = "با موفقیت ثبت شد";
                lblText.Attributes["style"] = "display: block";
                lblText.Attributes["class"] = "alert alert-success";
            }
            else
            {
                lblText.Text = "خطا در عمل ثبت";
                lblText.Attributes["class"] = "alert alert-danger";
            }
        }
        private void BindData()
        {
            GridViewCity.DataSource = te.Cities.ToList();
            GridViewCity.DataBind();
        }


        protected void GridViewCity_Edit(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridViewCity.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void GridViewCity_Cancel(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            GridViewCity.EditIndex = -1;
            BindData();
        }

        protected void GridViewCity_Deleted(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = int.Parse(GridViewCity.DataKeys[e.RowIndex].Value.ToString());
            CityDelete(id);
            BindData();
        }

        protected void GridViewCity_Update(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int id = int.Parse(GridViewCity.DataKeys[e.RowIndex].Value.ToString());
            TextBox txtCity = (TextBox)GridViewCity.Rows[e.RowIndex].FindControl("TextBox1");
            CityUpdateing(id, txtCity.Text);
            GridViewCity.EditIndex = 1;
            BindData();
        }

        private void CityUpdateing(int id, string Citytxt)
        {
            City ct = new City();
            ct = te.Cities.Where(a => a.ID == id).FirstOrDefault<City>();
            ct.Title = Citytxt;

            te.Entry(ct).State = System.Data.Entity.EntityState.Modified;
            te.SaveChanges();
        }
        private void CityDelete(int id)
        {
            City ct = new City();
            ct = te.Cities.Where(a => a.ID == id).FirstOrDefault<City>();
            te.Entry(ct).State = System.Data.Entity.EntityState.Deleted;
            te.SaveChanges();
        }

        protected void GridViewCity_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}