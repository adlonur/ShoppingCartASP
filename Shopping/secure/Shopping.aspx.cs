using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspNetHome3.secure
{
    public partial class Shopping : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }


        protected void Button1_Click(object sender, EventArgs e)
        {

            //Redirect other page 
            Response.Redirect("Shopping2.aspx");
        }
     
        protected void ListView_OnItemCommand(object sender, ListViewCommandEventArgs e)
        {
            
           // Button name control 
            if (String.Equals(e.CommandName, "AddButton"))
            {
               
                // take button argument and split 
                string toplam = (string) e.CommandArgument;
                string[] top = toplam.Split('/');

                double price = Convert.ToDouble(top[0]);
                string id = top[1];
                // take textbox text
                TextBox t = ((TextBox)e.Item.FindControl("TextBox1"));
                string number = t.Text;

                string quantity = top[2];
                // calculate total cost
                double totalcost = price * Convert.ToDouble(number);

                
                Label name = ((Label)e.Item.FindControl("nameLabel"));
                Session["name"] = name.Text;
               // all arguments send with session
                Session["number"] += number + "%";
                Session["totalcost"] = Convert.ToDouble(Session["totalcost"]) + totalcost;
                Session["id"] += id + "%" ;
                Session["quantity"] += quantity + "%";
            }
        }
        protected static string BuildItemImageUrl(string id)
        {
            // images id control
            if (id.StartsWith("111"))
            {
                return "~/images/laptop.jpg";
            }
            if (id.StartsWith("222"))
            {
                return "~/images/flash.jpg";
            }
            if (id.StartsWith("333"))
            {
                return "~/images/keyboard.jpg";
            }

            return "~/images/unknown.jpg";
        }
        
        
        }
    
    }
