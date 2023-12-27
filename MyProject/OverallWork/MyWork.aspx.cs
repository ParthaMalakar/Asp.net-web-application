using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject.OverallWork
{
    public partial class MyWork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MyProject.OverallWork.Backend backendService = new MyProject.OverallWork.Backend();
            backendService.HelloWorld();
            backendService.GetDatabaseData();
            backendService.GetIndividualData();
            backendService.GetProduct();
        }
       
    }
}