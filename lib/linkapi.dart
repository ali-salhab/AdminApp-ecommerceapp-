class Applink {
  static const String server =
      "https://alisalhab.000webhostapp.com/ecommerceapp_backend";
  static const String test = "$server/test.php";

  // -----------------------auth link------------------------//
  static const String signup = "$server/auth/signup.php";
  static const String verifycode = "$server/auth/verifycode.php";
  static const String login = "$server/auth/login.php";
  // ----------------------forget password-----------------//
  static const String forgetpassword =
      "$server/forgetpassword/forgetpassword.php";
  static const String verifycodeforget =
      "$server/forgetpassword/verifycode.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  static const String itemsapi = "$server/items/items.php";

  // ----------------------home-----------
  static const String home = "$server/home.php";

  //----------------------images----------------------
  static const String serverimage =
      "https://alisalhab.000webhostapp.com/ecommerceapp_backend";
  static const String categories = "$serverimage/upload/categories";
  static const String items = "$serverimage/upload/items";
  static const String removefavorite =
      "$serverimage/favorite/removefavorite.php";
  static const String addfavorite = "$serverimage/favorite/addfavorite.php";
  // favorite/favoriteview.php
  static const String favoriteview = "$serverimage/favorite/favoriteview.php";
  static const String removefavoriteview =
      "$serverimage/favorite/removefavoriteview.php";
  static const String addtocart = "$serverimage/cart/add.php";
  static const String removefromcart = "$serverimage/cart/remove.php";
  //
  //

  static const String itemcount = "$serverimage/cart/itemcount.php";
  static const String cartview = "$serverimage/cart/cartview.php";
  static const String search = "$serverimage/search.php";
  static const String addaddress = "$serverimage/address/add.php";
  static const String deleteaddress = "$serverimage/address/delete.php";
  static const String viewaddresses = "$serverimage/address/view.php";
  static const String checkcoupon = "$serverimage/coupon/coupon.php";
  static const String checkout = "$serverimage/order/checkout.php";
  static const String pendingorders = "$serverimage/order/pendingorders.php";
  static const String archivedorders = "$serverimage/order/archievedorder.php";
  static const String notifications = "$serverimage/notifications.php";
  static const String orderdetails = "$serverimage/order/details.php";
  static const String deleteorder = "$serverimage/order/delete.php";
  static const String offer = "$serverimage/offer/offer.php";
  static const String rateorder = "$serverimage/order/rateorder.php";
}
