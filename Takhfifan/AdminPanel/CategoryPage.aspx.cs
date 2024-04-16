using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Takhfifan.AdminPanel
{
    public partial class CategoryPage : System.Web.UI.Page
    {
        public static takhfifanEntities te = new takhfifanEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [WebMethod]
        public static void addCategories(Category cat)
        {
            Category cgy = new Category();
            cgy.Title = cat.Title;
            te.Categories.Add(cgy);
            te.SaveChanges();
        }

        [WebMethod]
        public static List<Category> ShowCategories()
        {
            List<Category> AllCategory = new List<Category>();
            AllCategory = te.Categories.ToList();
            return AllCategory;
        }

        [WebMethod]
        public static void DeleteCategory(int catID)
        {
            var CatDelete = new Category();
            CatDelete = te.Categories.Where(c => c.ID == catID).FirstOrDefault<Category>();

            te.Entry(CatDelete).State = System.Data.Entity.EntityState.Deleted;
            te.SaveChanges();
        }

        [WebMethod]
        public static void EditCategory(int catID, string catTitle)
        {
            var CatEdit = new Category();
            CatEdit = te.Categories.Where(c => c.ID == catID).FirstOrDefault<Category>();

            CatEdit.Title = catTitle;
            te.Entry(CatEdit).State = System.Data.Entity.EntityState.Modified;
            te.SaveChanges();
        }
    }
}