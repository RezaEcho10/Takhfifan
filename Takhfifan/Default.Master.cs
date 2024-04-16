using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Takhfifan
{
    public partial class Default : System.Web.UI.MasterPage
    {
        private takhfifanEntities te = new takhfifanEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public List<City> GetAllCity()
        {
            List<City> ct = new List<City>();

            ct = te.Cities.ToList();
            return ct;
        }

        public List<Category> GetAllCategory()
        {
            List<Category> cgy = new List<Category>();
            cgy = te.Categories.ToList();
            return cgy;
        }
    }
}