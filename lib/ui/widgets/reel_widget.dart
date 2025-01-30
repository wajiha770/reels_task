import 'package:flutter/material.dart';
import 'package:reels_task/resources/include.dart';
import 'package:video_player/video_player.dart';

class ReelWidget extends StatefulWidget {
  final ReelModel reelModel;
  const ReelWidget({super.key, required this.reelModel});

  @override
  State<ReelWidget> createState() => _ReelWidgetState();
}

class _ReelWidgetState extends State<ReelWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(widget.reelModel.cdnUrl!));

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(18.0),
        color: Colors.black,
        width: Statics.screenWidth,
        height: Statics.screenHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                children: <Widget>[
                  VideoPlayer(_controller),
                  _ControlsOverlay(
                    controller: _controller,
                  ),
                ],
              ),
            ),
            ReelInformation(
              reel: widget.reelModel,
            ),
          ],
        ),
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller});

  final VideoPlayerController controller;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : const ColoredBox(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: VideoProgressIndicator(controller, allowScrubbing: true)),
      ],
    );
  }
}

class ReelInformation extends StatelessWidget {
  const ReelInformation({super.key, required this.reel});
  final ReelModel reel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Wrap(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      reel.user!.profilePictureCdn ?? "",
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      reel.user!.fullname ?? "",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Text(
                  reel.description ?? reel.title ?? "",
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            reel.description ?? reel.title ?? "",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
          child: Align(
              alignment: Alignment.bottomRight,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                direction: Axis.vertical,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: reel.isFollow ?? false
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(
                            color: reel.isFollow ?? false
                                ? Colors.black
                                : Colors.white)),
                    width: 70,
                    height: 30,
                    child: Center(
                      child: Text(
                        reel.isFollow ?? false ? "Followed" : "Follow",
                        style: TextStyle(
                            color: reel.isFollow ?? false
                                ? Colors.black
                                : Colors.white),
                      ),
                    ),
                  ),
                  reel.isLiked ?? false
                      ? Image.asset(
                          "assets/liked.png",
                          width: 40,
                          height: 40,
                        )
                      : Image.asset(
                          "assets/like.png",
                          width: 40,
                          height: 40,
                          color: Colors.white,
                        ),
                  Text(
                    "${reel.totalLikes ?? 0} likes",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Image.asset(
                    "assets/comment.png",
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  ),
                  Text(
                    "${reel.totalComments ?? 0} comments",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text(
                    "${reel.totalShare ?? 0} shares",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
