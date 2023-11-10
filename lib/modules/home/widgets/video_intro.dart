import 'package:dart_programing/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends GetView<HomeController> {
  const VideoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: controller.videoController.value.isInitialized
          ? AspectRatio(
              aspectRatio: controller.videoController.value.aspectRatio,
              child: VideoPlayer(controller.videoController),
            )
          : Container(),
    );
  }
}
