import 'package:clone_whatsapp_darkmode/models/status_models/status_item_model.dart';

class StatusHelper {
  static var statusList = [
    StatusItemModel("John Snow", "Yesterday, 21:22 PM",
        "https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_960_720.jpg"),
    StatusItemModel("GOT", "Yesterday, 09:09 PM",
        "https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490_960_720.jpg")
  ];

  static StatusItemModel getStatusItem(int position) {
    return statusList[position];
  }

  static var itemCount = statusList.length;
}
