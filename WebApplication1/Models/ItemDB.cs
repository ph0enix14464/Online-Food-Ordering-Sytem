using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public static class ItemDB
    {
        public static List<tblItem> GetAllRecentItem()
        {
            using (var context = new OnlineFoodDBEntities())
            {
                return context.tblItems.Where(s => s.IsAvailable == "Special").Take(8).ToList();
            }
        }
        public static List<tblItem> GetAllFoodRecentItem()
        {
            using (var context = new OnlineFoodDBEntities())
            {
                return context.tblItems.Take(8).ToList();
            }
        }
    }
}