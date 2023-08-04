class NotificationModel {
  String? notificationId;
  String? notificationUserid;
  String? notificationTitle;
  String? notificationBody;
  String? notificationDatetime;

  NotificationModel(
      {this.notificationId,
      this.notificationUserid,
      this.notificationTitle,
      this.notificationBody,
      this.notificationDatetime});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationUserid = json['notification_userid'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationDatetime = json['notification_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['notification_userid'] = this.notificationUserid;
    data['notification_title'] = this.notificationTitle;
    data['notification_body'] = this.notificationBody;
    data['notification_datetime'] = this.notificationDatetime;
    return data;
  }
}
