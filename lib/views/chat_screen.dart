import 'package:clone_whatsapp_darkmode/models/message_models/message_helper.dart';
import 'package:clone_whatsapp_darkmode/models/message_models/message_model.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatefulWidget {
  final String image, name;
  const ChatScreen({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 18 ,
              backgroundImage: NetworkImage(widget.image),
            ),
            SizedBox(width: 5,),
          
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name),
                Text(
                  'online',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.call),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.video_call_outlined),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: MessageHelper.itemCount,
                itemBuilder: (context, index) {
                  MessageItemModel chatItem = MessageHelper.getCHatList(index);
                  return Column(
                    crossAxisAlignment:  index% 2 == 0  ?  CrossAxisAlignment.end  : CrossAxisAlignment.start,
                      children: [
                        MessageBubble(
                          index: index,
                          message: chatItem.mostRecentMessage,
                          isSeen:  false,
                          isMe: false,
                          time: chatItem.messageDate,
                          onPress: () {  },
                          listLength: MessageHelper.itemCount,
                          type: chatItem.type,
                        ),
                      ],
                    );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Icon(Icons.attach_file),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.camera_alt),
                            SizedBox(
                              width: 5,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  child: Icon(
                    Icons.mic,
                    size: 19,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({
    required this.isMe,
    required this.message,
    required this.time,
    required this.onPress,
    required this.index,
    required this.listLength,
    required this.isSeen,
    required this.type,
  });

  final bool isMe;
  final String message, type;
  final String time;
  final VoidCallback onPress;
  int index;
  int listLength;
  bool isSeen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment:
            index % 2 == 0 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2,
          ),

          if (type == "msj")
            Align(
              alignment:
                  index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
              child: InkWell(
                onTap: onPress,
                child: Material(
                  elevation: 1,
                  color: index % 2 == 0
                      ? Colors.teal
                      : Colors.black.withOpacity(0.5),
                  borderRadius: index % 2 == 0
                      ? BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(10))
                      : BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(0)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Text(
                      message,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          if (type == "image")
            Align(
              alignment:
                  index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
              child: InkWell(
                onTap: onPress,
                child: Material(
                  elevation: 1,
                  borderRadius: index % 2 == 0
                      ? BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(10))
                      : BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(0)),
                  color: index % 2 == 0
                      ? Colors.teal
                      : Colors.black.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image(
                        height: MediaQuery.of(context).size.height * .2,
                        width: MediaQuery.of(context).size.width * .5,
                        fit: BoxFit.cover,
                        image: NetworkImage(message)),
                  ),
                ),
              ),
            ),

          SizedBox(
            height: 2,
          ),
          Text(
            time.toString(),
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),

          SizedBox(
            height: 4,
          ),
          // Text(time.toString())
        ],
      ),
    );
  }
}
