using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using prjAutocomplete.Models;

namespace prjAutocomplete
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            NorthwindEntities db = new NorthwindEntities();
            string keyword = txtKeyword.Text;
            var custs = db.客戶.Where(m => m.地址.Contains(keyword)).ToList();
            GridView1.DataSource = custs;
            GridView1.DataBind();
        }
    }
}