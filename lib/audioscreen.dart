import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
  
class AudioPage extends StatelessWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID:
            801554257, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign:
            "26fc49db421020842661c9f510a9fdf7060d6354339dc6e4ff1264ae5fdd8fed", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: 'videi3o12',
        userName: 'vide333io12',
        callID: "ntf",

        // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()
          ..onOnlySelfInRoom = (context) => Navigator.of(context).pop());
  }
}
