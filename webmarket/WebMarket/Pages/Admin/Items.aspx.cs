using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMarket.Models;
using WebMarket.Models.Repository;
using System.Web.ModelBinding;

namespace WebMarket.Pages.Admin
{
    public partial class Items : System.Web.UI.Page
    {
        private readonly Repository repository = new Repository();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<Item> GetItems()
        {
            return repository.Items;
        }

        public void UpdateItem(int ItemID)
        {
            Item myItem = repository.Items
                .Where(p => p.ItemId == ItemID).FirstOrDefault();
            if (myItem != null && TryUpdateModel(myItem,
                new FormValueProvider(ModelBindingExecutionContext)))
            {
                repository.SaveItem(myItem);
            }
        }

        public void DeleteItem(int ItemID)
        {
            Item myItem = repository.Items
                .Where(p => p.ItemId == ItemID).FirstOrDefault();
            if (myItem != null)
            {
                repository.DeleteItem(myItem);
            }
        }

        public void InsertItem()
        {
            Item myItem = new Item();
            if (TryUpdateModel(myItem,
                new FormValueProvider(ModelBindingExecutionContext)))
            {
                repository.SaveItem(myItem);
            }
        }
    }
}