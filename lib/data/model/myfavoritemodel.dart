class Myfavoritemodel {
  String? favoriteId;
  String? favoriteUserid;
  String? favoriteItemid;
  String? userId;
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

  Myfavoritemodel(
      {this.favoriteId,
      this.favoriteUserid,
      this.favoriteItemid,
      this.userId,
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

  Myfavoritemodel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUserid = json['favorite_userid'];
    favoriteItemid = json['favorite_itemid'];
    userId = json['user_id'];
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
    data['favorite_id'] = this.favoriteId;
    data['favorite_userid'] = this.favoriteUserid;
    data['favorite_itemid'] = this.favoriteItemid;
    data['user_id'] = this.userId;
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
