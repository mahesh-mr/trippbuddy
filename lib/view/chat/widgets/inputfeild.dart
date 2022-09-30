import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/personalchat_controll.dart';
import 'package:trippbuddy/controller/service/postchat_service.dart';
import 'package:trippbuddy/model/personalchat.dart';

class InputFeild extends StatelessWidget {
  const InputFeild({
    Key? key,
    required GlobalKey<FormState> fomkey,
    required TextEditingController msgcontroller,
    //  required this.personalChatController,
    required this.chatindex,
  })  : _fomkey = fomkey,
        _msgcontroller = msgcontroller,
        super(key: key);

  final GlobalKey<FormState> _fomkey;
  final TextEditingController _msgcontroller;
  // final PersonalChatController personalChatController;
  final int chatindex;

  @override
  Widget build(BuildContext context) {
    PersonalChatController personalChatController =
        Get.find<PersonalChatController>();
    return SizedBox(
      height: 50,
      child: Container(
        padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
        height: 60,
        width: double.infinity,
        color: Colors.white,
        child: Form(
          key: _fomkey,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _msgcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "minimum  1 length";
                    } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
                      return 'Please enter a valid Location';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: "Write message...",
                      hintStyle: const TextStyle(color: Colors.black54),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              FloatingActionButton(
                onPressed: () {
                  PersonalChat? prlChat =
                      personalChatController.personalchats.value[chatindex];
                  bool isValid = _fomkey.currentState!.validate();

                  if (isValid) {
                    PostChatService.postChats(
                        chatId: prlChat.chat!.id!,
                        content: _msgcontroller.text);
                  }
                  _msgcontroller.clear();
                  print(prlChat.chat!.id!);
                  print(_msgcontroller.text);
                },
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 18,
                ),
                backgroundColor: Colors.blue,
                elevation: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
