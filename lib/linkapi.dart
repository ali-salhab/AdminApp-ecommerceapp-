class Applink {
  static const String server =
      "https://alisalhab.000webhostapp.com/ecommerceapp_backend";

  // ----------------------home-----------
  static const String adminserver = "$server/admin";

  //----------------------images----------------------
  static const String serverimage =
      "https://alisalhab.000webhostapp.com/ecommerceapp_backend";

  static const String categories = "$serverimage/upload/categories";
  static const String items = "$serverimage/upload/items";

// categories

  static const String categoriesview = "$adminserver/categories/view.php";
  static const String categoriesedit = "$adminserver/categories/edit.php";
  static const String categoriesdelete = "$adminserver/categories/delete.php";
  static const String categoriesadd = "$adminserver/categories/add.php";

  static const String itemssview = "$adminserver/items/view.php";
  static const String itemsedit = "$adminserver/items/edit.php";
  static const String itemsdelete = "$adminserver/items/delete.php";
  static const String itemsadd = "$adminserver/items/add.php";
  static const String approveorder = "$adminserver/order/approve.php";
  static const String prepareorder = "$adminserver/order/prepare.php";

  static const String viewarchive = "$adminserver/order/viewarchive.php";
  static const String viewaccepted = "$adminserver/order/viewaccepted.php";
  static const String viewpending = "$adminserver/order/viewpending.php";
}
