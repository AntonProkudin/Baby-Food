<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listing.aspx.cs" Inherits="WebMarket.Pages.Listing"
    MasterPageFile="~/Pages/Store.Master" %>
<%@ Import Namespace="System.Web.Routing" %>

<asp:Content ContentPlaceHolderID="bodyContent" runat="server">
    <div id="categories">
                <GS:CategoryLinks runat="server" />
   </div>
    <div class="slideshow-container">
      <div class="mySlides fade">
        <img src="/Images/slider3.gif" style="width:100% ; height:500px;border-radius:20px;"/>
      </div>
    
      <div class="mySlides fade">
        <img src="/Images/slider2.jpg" style="width:100% ; height:500px;border-radius:20px;"/>
      </div>
    
      <div class="mySlides fade">
       <img src="/Images/slider3.gif" style="width:100% ; height:500px;border-radius:20px;"/>
      </div>
      <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
      <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
    <br/>
    <div style="text-align:center">
      <span class="dot" onclick="currentSlide(1)"></span>
      <span class="dot" onclick="currentSlide(2)"></span>
      <span class="dot" onclick="currentSlide(3)"></span>
    </div>    
    <script src="/Scripts/slider.js"></script>
    <br/>
    <div class="selectedCategory">
        <%
            string category = (string)Page.RouteData.Values["category"]
                ?? Request.QueryString["category"];
            string path = RouteTable.Routes.GetVirtualPath(null, null,
                new RouteValueDictionary() { {"category", category}, { "page", "1" } }).VirtualPath;
            if (category != null)
                Response.Write(
                        String.Format("<a href='{0}' {1}>{2}</a>",
                            path, "1", "Ассортимент по категории: "+category));
            else
            {
                category = "Весь ассортимент:";
                Response.Write(
                    String.Format("<a href='{0}' {1}>{2}</a>",
                        path, "1", category));
            }
        %>
    </div>
    <br/>
    <asp:Repeater ItemType="WebMarket.Models.Item"
            SelectMethod="GetItems" runat="server">
            <ItemTemplate>
                <div style="display: inline-block;" class="item": >
                         <a><img src="<%# Item.ImageUrl %>"></a>
                         <h3><%# Item.Name %></h3>
                         <h5><%# Item.Description %></h5>
                             <h3 style="float:left"><%# Item.Price.ToString("c") %></h3>
                             <button  name="add" type="submit" value="<%# Item.ItemId %>"> <h4>Добавить в корзину</h4>
                            
                                 </button>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    <div class="pager">
        <%
            for (int i = 1; i <= MaxPage; i++)
            {
                 category = (string)Page.RouteData.Values["category"]
                    ?? Request.QueryString["category"];
                 path = RouteTable.Routes.GetVirtualPath(null, null,
                    new RouteValueDictionary() { {"category", category}, { "page", i } }).VirtualPath;
                Response.Write(
                    String.Format("<a href='{0}' {1}>{2}</a>",
                        path, i == CurrentPage ? "class='selected'" : "", i));
            }
        %>
    </div>
</asp:Content>