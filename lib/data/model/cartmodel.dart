class CartModel {
  String? priceofitemafterdiscount;
  String? countofitemincart;
  String? cartId;
  String? cartItemid;
  String? cartUserid;
  String? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDesc;
  String? itemDescAr;
  String? itemImage;
  String? itemCount;
  String? itemActive;
  String? itemPrice;
  String? itemDate;
  String? itemCategories;
  String? itemDiscount;
  // "countofitemincart": "2",
  //     "priceofitemafterdiscount": "2280"
  CartModel(
      {this.priceofitemafterdiscount,
      this.countofitemincart,
      this.cartId,
      this.cartItemid,
      this.cartUserid,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDesc,
      this.itemDescAr,
      this.itemImage,
      this.itemCount,
      this.itemActive,
      this.itemPrice,
      this.itemDate,
      this.itemCategories,
      this.itemDiscount});

  CartModel.fromJson(Map<String, dynamic> json) {
    priceofitemafterdiscount = json['priceofitemafterdiscount'];
    countofitemincart = json['countofitemincart'];
    cartId = json['cart_id'];
    cartItemid = json['cart_itemid'];
    cartUserid = json['cart_userid'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDesc = json['item_desc'];
    itemDescAr = json['item_desc_ar'];
    itemImage = json['item_image'];
    itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemDate = json['item_date'];
    itemCategories = json['item_categories'];
    itemDiscount = json['item_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['priceofitemafterdiscount'] = this.priceofitemafterdiscount;
    data['countofitemincart'] = this.countofitemincart;
    data['cart_id'] = this.cartId;
    data['cart_itemid'] = this.cartItemid;
    data['cart_userid'] = this.cartUserid;
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_name_ar'] = this.itemNameAr;
    data['item_desc'] = this.itemDesc;
    data['item_desc_ar'] = this.itemDescAr;
    data['item_image'] = this.itemImage;
    data['item_count'] = this.itemCount;
    data['item_active'] = this.itemActive;
    data['item_price'] = this.itemPrice;
    data['item_date'] = this.itemDate;
    data['item_categories'] = this.itemCategories;
    data['item_discount'] = this.itemDiscount;
    return data;
  }
}
