import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:vouloir/config/app_bar.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:vouloir/config/textstyle.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  String? fieldtextstring;
  List<Message> messages = [
    Message(
      text: 'Hi',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
      isSentByMe: false,
    ),
    Message(
      text: 'Hello',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
      isSentByMe: true,
    ),
    Message(
      text: 'How are you',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 4)),
      isSentByMe: false,
    ),
    Message(
      text: 'I am Good',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 5)),
      isSentByMe: true,
    ),
    Message(
      text: 'What about you?',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 5)),
      isSentByMe: true,
    ),
  ].reversed.toList();

  final fieldText = TextEditingController();
  void clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBarwithLeading(context, "Fitted - Tech & Design"),
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/chat_bg.png',
                ),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: messages.isEmpty
                    ? Container(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Text('Tuesday 00:00 AM',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Say hi to someone",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Icon(Icons.close,
                                          color: Colors.black, size: 20)),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  'assets/say_hi_high_five.png',
                                ),
                                Image.asset(
                                  'assets/say_hi_wave.png',
                                ),
                                Image.asset(
                                  'assets/say_hi_celebration.png',
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : GroupedListView<Message, DateTime>(
                        padding: const EdgeInsets.all(8),
                        reverse: true,
                        order: GroupedListOrder.DESC,
                        useStickyGroupSeparators: true,
                        floatingHeader: true,
                        elements: messages,
                        groupBy: (message) => DateTime(
                          message.date.year,
                          message.date.month,
                          message.date.day,
                        ),
                        groupHeaderBuilder: (Message message) => SizedBox(
                          height: 40,
                          child: Center(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  DateFormat.yMMMMd().format(message.date),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ),
                        itemBuilder: (context, Message message) => Align(
                          alignment: message.isSentByMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: message.isSentByMe
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Bubble(
                                      padding: const BubbleEdges.symmetric(
                                          vertical: 12, horizontal: 12.0),
                                      elevation: 2.0,
                                      margin: const BubbleEdges.only(
                                          left: 02, top: 10.0, bottom: 10.0),
                                      nip: BubbleNip.rightBottom,
                                      nipHeight: 06.0,
                                      nipWidth: 06.0,
                                      nipRadius: 0.0,
                                      color: cardColor,
                                      child: Text(
                                        message.text,
                                        style: ralewayStyle(
                                          15,
                                          FontWeight.w500,
                                          const Color(0xff1F2933),
                                        ),
                                      ),
                                    ),

                                    // Container(
                                    //   height: 50,
                                    //   width: 50,
                                    //   decoration: BoxDecoration(
                                    //     border: Border.all(color: Colors.white),
                                    //     borderRadius: BorderRadius.circular(25),
                                    //     image: const DecorationImage(
                                    //       fit: BoxFit.cover,
                                    //       image:
                                    //           AssetImage('assets/hasnain.png'),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                )
                              : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(25),
                                        image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage('assets/hasnain.png'),
                                        ),
                                      ),
                                    ),
                                    Bubble(
                                      padding: const BubbleEdges.symmetric(
                                          vertical: 12, horizontal: 12.0),
                                      elevation: 2.0,
                                      margin: const BubbleEdges.only(
                                          left: 02, top: 10.0, bottom: 10.0),
                                      nip: BubbleNip.leftBottom,
                                      nipHeight: 06.0,
                                      nipWidth: 06.0,
                                      nipRadius: 0.0,
                                      color: secColor,
                                      child: Text(
                                        message.text,
                                        style: ralewayStyle(
                                            15, FontWeight.w500, Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      )),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.01, vertical: height * 0.01),
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      // final message = Message(
                      //     text: fieldText.text,
                      //     date: DateTime.now(),
                      //     isSentByMe: true);
                      // setState(() {
                      //   messages.add(message);
                      //   clearText();
                      // });
                    },
                    child: Container(
                        width: width * 0.05,
                        // padding: EdgeInsets.only(
                        //     left: MediaQuery.of(context).size.width * 0.03),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/chat_plus.svg',
                          fit: BoxFit.fill,
                        )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.80,
                    child: TextField(
                      controller: fieldText,
                      style: ralewayStyle(
                        15,
                        FontWeight.w800,
                        const Color(0xff1F2933),
                      ),
                      cursorColor: const Color(0xff1F2933),
                      decoration: InputDecoration(
                        // suffixIcon: const Icon(
                        //   Icons.emoji_emotions_outlined,
                        //   color: Colors.black,
                        //   size: 25,
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 0,
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusColor: cardColor,
                        fillColor: cardColor,
                        filled: true,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 14.0),
                        hintText: 'Send a message',
                        hintStyle:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff1F2933),
                                ),
                      ),
                      onSubmitted: (text) {
                        final message = Message(
                            text: text, date: DateTime.now(), isSentByMe: true);
                        setState(() {
                          messages.add(message);
                          fieldtextstring = text;
                          clearText();
                        });
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      final message = Message(
                          text: fieldText.text,
                          date: DateTime.now(),
                          isSentByMe: true);
                      setState(() {
                        messages.add(message);
                        clearText();
                      });
                    },
                    child: Container(
                        width: width * 0.05,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/chat_send.svg',
                          fit: BoxFit.fill,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  const Message(
      {required this.text, required this.date, required this.isSentByMe});
}
