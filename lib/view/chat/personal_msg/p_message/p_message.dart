import 'package:flutter/material.dart';
import 'package:trippbuddy/controller/personal_msg_controller/personal_msg_controller.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class PMessages extends StatelessWidget {
  PMessages({
    Key? key,
  }) : super(key: key);

  final pmsg = PersonalMsgController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      shrinkWrap: true,
      //  physics: NeverScrollableScrollPhysics(),

      itemCount: pmsg.Pmessage.length,
      itemBuilder: (context, index) {
        final messageList = pmsg.Pmessage[index];
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: messageList.isSender
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/3.jpg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: const BoxDecoration(
                                color: gray2,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    //    topLeft: Radius.circular(20),
                                    topRight:  Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  TextLines(
                                    title: messageList.massages,
                                    color: white1,
                                    size: 16,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: TextLines(
                                          title: messageList.time,
                                          size: 12,
                                          color: white1,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      )
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: const BoxDecoration(
                                color: blue2,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  TextLines(
                                    title: messageList.massages,
                                    color: white1,
                                    size: 16,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: TextLines(
                                      title: messageList.time,
                                      size: 12,
                                      color: white1,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/3.jpg"),
                      ),
                    ],
                  )

            //        Row(

            //         mainAxisAlignment: messageList.isSender
            //             ? MainAxisAlignment.end
            //             : MainAxisAlignment.start,
            //         children: [messageList.isSender ?TextLines(title: messageList.time, size: 14,color: gray2,):
            //       const    CircleAvatar(
            //             backgroundImage: AssetImage(
            //                  "assets/2.jpg"),
            //           ),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 10),
            //           child: Container(
            // decoration: BoxDecoration(
            //                   color:messageList.isSender ? gray2:blue2,
            //                     borderRadius:messageList.isSender ?
            //                     BorderRadius.only(
            //                         bottomLeft: Radius.circular(20),
            //                         topLeft: Radius.circular(20),
            //                         topRight: Radius.circular(20),
            //                         ):

            //                      BorderRadius.only(
            //                         bottomLeft: Radius.circular(20),
            //                         bottomRight: Radius.circular(20),
            //                         topRight: Radius.circular(20),
            //                         ),
            //                         ),
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(8.0),
            //                   child: TextLines(
            //                     title: messageList.massages,color: white1,
            //                     size: 16,
            //                   ),
            //                 ),),
            //         ),
            //               messageList.isSender? CircleAvatar(
            //             backgroundImage: AssetImage(
            //                  "assets/3.jpg"),
            //           ):TextLines(title: messageList.time, size: 14, color: gray2,)
            //         ],
            //       ),
            );
      },
    );
  }
}
