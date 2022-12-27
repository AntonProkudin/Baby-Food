using System.Collections.Generic;
using System.Linq;

namespace WebMarket.Models
{
    public class Cart
    {
        private List<CartLine> lineCollection = new List<CartLine>();

        public void AddItem(Item item, int quantity)
        {
            CartLine line = lineCollection
                .Where(p => p.Item.ItemId == item.ItemId)
                .FirstOrDefault();

            if (line == null)
            {
                lineCollection.Add(new CartLine
                {
                    Item = item,
                    Quantity = quantity
                });
            }
            else
            {
                line.Quantity += quantity;
            }
        }

        public void RemoveLine(Item item)
        {
            lineCollection.RemoveAll(l => l.Item.ItemId == item.ItemId);
        }

        public decimal ComputeTotalValue()
        {
            return lineCollection.Sum(e => e.Item.Price * e.Quantity);

        }
        public void Clear()
        {
            lineCollection.Clear();
        }

        public IEnumerable<CartLine> Lines
        {
            get { return lineCollection; }
        }
    }

    public class CartLine
    {
        public Item Item { get; set; }
        public int Quantity { get; set; }
    }
}