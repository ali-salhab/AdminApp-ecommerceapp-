class ItemsModel {
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
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDate;
  String? favorite;
  String? priceafterdiscount;

  ItemsModel(
      {this.itemId,
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
      this.itemDiscount,
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDate,
      this.priceafterdiscount,
      this.favorite});

  ItemsModel.fromJson(Map<String, dynamic> json) {
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
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDate = json['categories_date'];
    favorite = json['favorite'];
    priceafterdiscount = json['priceafterdiscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_date'] = this.categoriesDate;
    data['favorite'] = this.favorite;
    data['priceafterdiscount'] = this.priceafterdiscount;
    return data;
  }
}
