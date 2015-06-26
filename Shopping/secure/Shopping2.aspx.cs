using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspNetHome3.secure
{
    public partial class Shopping2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // take sessin 
            string id = Convert.ToString( Session["id"]);
            //split sessin
            string[] idler = id.Split('%');
            string idlerler = "";
            foreach (string item in idler)
            {
               idlerler += item + ",";
                   
                
            }
           // control 
            if (idlerler !=",")
            {
                
                string a = idlerler.Substring(0, idlerler.Length - 2);
                // select query
                string selectCommand = "SELECT [name] FROM [items] where id IN(" + a + ")";
                SqlDataSource1.SelectCommand = selectCommand;
            }
            // totalcost write in label
            Label1.Text = Convert.ToString(Session["totalcost"]);

            
        }

        //Checkout button
        protected void Button1_Click(object sender, EventArgs e)
        {
            string id = Convert.ToString(Session["id"]);
            string[] idler = id.Split('%');
            string quantity = Convert.ToString(Session["quantity"]);
            string[] quantities = quantity.Split('%');
            string number = Convert.ToString(Session["number"]);
            string[] numbers = number.Split('%');
            for (int i = 0; i < quantities.Length; i++)
            {
                if (numbers[i] != "")
                {
                    // numbers control 
                    if (Convert.ToInt32(quantities[i]) < Convert.ToInt32(numbers[i]))
                    {
                        // error message
                        Label2.Text = "Error checking out the items!Please try again later";


                    }
                    else
                    {

                       
                        if (quantities[i] != "")
                        {
                            int newnumber = Convert.ToInt32(quantities[i]) - Convert.ToInt32(numbers[i]);
                            string convertnewnumber = Convert.ToString(newnumber);
                           //update query
                            string updateCommand = "UPDATE [items] SET [quantity] ='" + convertnewnumber + "'" + "WHERE id='" + idler[i] + "'";
                            // double adas = Convert.ToDouble(Session["id"]);
                            SqlDataSource1.UpdateCommand = updateCommand;
                            SqlDataSource1.Update();
                        }
                    }
                }
            }
           
        }

        
    }
}