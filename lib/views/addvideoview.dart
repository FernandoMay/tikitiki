import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tikitiki/constants.dart';
import 'package:tikitiki/controllers/videocontroller.dart';
import 'package:video_player/video_player.dart';

class NewVideo extends StatelessWidget {
  const NewVideo({Key? key}) : super(key: key);

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => ConfirmView(
            videoFile: File(video.path),
            videoPath: video.path,
          ),
        ),
      );
    }
  }

  showOptionsDialog(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        actions: [
          CupertinoDialogAction(
            onPressed: () => pickVideo(ImageSource.gallery, context),
            child: Row(
              children: const [
                Icon(CupertinoIcons.list_bullet_indent),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Gallery',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          CupertinoDialogAction(
            onPressed: () => pickVideo(ImageSource.camera, context),
            child: Row(
              children: const [
                Icon(CupertinoIcons.camera),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Camera',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: Row(
              children: const [
                Icon(CupertinoIcons.escape),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton.filled(
          onPressed: () => showOptionsDialog(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: const BoxDecoration(color: pinkColor),
            child: const Center(
              child: Text(
                'Add Video',
                style: TextStyle(
                  fontSize: 20,
                  color: CupertinoColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ConfirmView extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmView({
    Key? key,
    required this.videoFile,
    required this.videoPath,
  }) : super(key: key);

  @override
  State<ConfirmView> createState() => _ConfirmViewState();
}

class _ConfirmViewState extends State<ConfirmView> {
  late VideoPlayerController controller;
  final TextEditingController _songController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();

  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              child: VideoPlayer(controller),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: CupertinoTextField(
                      controller: _songController,
                      placeholder: 'Song Name',
                      suffix: const Icon(CupertinoIcons.music_note),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: CupertinoTextField(
                      controller: _captionController,
                      placeholder: 'Caption',
                      suffix: const Icon(CupertinoIcons.captions_bubble),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CupertinoButton(
                      onPressed: () => uploadVideoController.uploadVideo(
                          _songController.text,
                          _captionController.text,
                          widget.videoPath),
                      child: const Text(
                        'Share!',
                        style: TextStyle(
                          fontSize: 20,
                          color: CupertinoColors.white,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
