class OrderDetailsModel {
  String? addressId;
  String? addressUserid;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;
  String? addressName;
  String? orderId;
  String? orderUserid;
  String? orderAddress;
  String? orderType;
  String? orderShippingprice;
  String? orderPrice;
  String? orderCoupon;
  String? orderDatetime;
  String? orderPaymentmethod;
  String? orderTotalprice;
  String? orderStatus;
  String? cartId;
  String? cartItemid;
  String? cartUserid;
  String? cartOrder;
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
  String? orderitemcount;
  String? itemprices;

  OrderDetailsModel(
      {this.addressId,
      this.addressUserid,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong,
      this.addressName,
      this.orderId,
      this.orderUserid,
      this.orderAddress,
      this.orderType,
      this.orderShippingprice,
      this.orderPrice,
      this.orderCoupon,
      this.orderDatetime,
      this.orderPaymentmethod,
      this.orderTotalprice,
      this.orderStatus,
      this.cartId,
      this.cartItemid,
      this.cartUserid,
      this.cartOrder,
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
      this.itemDiscount,
      this.orderitemcount,
      this.itemprices});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressName = json['address_name'];
    orderId = json['order_id'];
    orderUserid = json['order_userid'];
    orderAddress = json['order_address'];
    orderType = json['order_type'];
    orderShippingprice = json['order_shippingprice'];
    orderPrice = json['order_price'];
    orderCoupon = json['order_coupon'];
    orderDatetime = json['order_datetime'];
    orderPaymentmethod = json['order_paymentmethod'];
    orderTotalprice = json['order_totalprice'];
    orderStatus = json['order_status'];
    cartId = json['cart_id'];
    cartItemid = json['cart_itemid'];
    cartUserid = json['cart_userid'];
    cartOrder = json['cart_order'];
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
    orderitemcount = json['orderitemcount'];
    itemprices = json['itemprices'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_userid'] = this.addressUserid;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    data['address_name'] = this.addressName;
    data['order_id'] = this.orderId;
    data['order_userid'] = this.orderUserid;
    data['order_address'] = this.orderAddress;
    data['order_type'] = this.orderType;
    data['order_shippingprice'] = this.orderShippingprice;
    data['order_price'] = this.orderPrice;
    data['order_coupon'] = this.orderCoupon;
    data['order_datetime'] = this.orderDatetime;
    data['order_paymentmethod'] = this.orderPaymentmethod;
    data['order_totalprice'] = this.orderTotalprice;
    data['order_status'] = this.orderStatus;
    data['cart_id'] = this.cartId;
    data['cart_itemid'] = this.cartItemid;
    data['cart_userid'] = this.cartUserid;
    data['cart_order'] = this.cartOrder;
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
    data['orderitemcount'] = this.orderitemcount;
    data['itemprices'] = this.itemprices;
    return data;
  }
}
