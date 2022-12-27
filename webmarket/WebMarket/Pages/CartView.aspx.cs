using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMarket.Models;
using WebMarket.Models.Repository;
using WebMarket.Pages.Helpers;

namespace WebMarket.Pages
{
    public partial class CartView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Repository repository = new Repository();
                int itemId;
                if (int.TryParse(Request.Form["remove"], out itemId))
                {
                    Item itemToRemove = repository.Items
                        .Where(g => g.ItemId == itemId).FirstOrDefault();
                    if (itemToRemove != null)
                    {
                        SessionHelper.GetCart(Session).RemoveLine(itemToRemove);
                    }
                }
            }
        }

            public IEnumerable<CartLine> GetCartLines()
            {
                 return SessionHelper.GetCart(Session).Lines;
            }

        public decimal CartTotal
        {
            get
            {
                return SessionHelper.GetCart(Session).ComputeTotalValue();
            }
        }

        public string ReturnUrl
        {
            get
            {
                return SessionHelper.Get<string>(Session, SessionKey.RETURN_URL);
            }
        }
        public string CheckoutUrl
        {
            get
            {
                return RouteTable.Routes.GetVirtualPath(null, "checkout",
                    null).VirtualPath;
            }
        }
    }
}