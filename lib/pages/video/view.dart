import 'package:app/pages/video/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPage extends GetView<VideoController> {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ioooo"),
      ),
      body: Text("data"),
    );
  }
}
