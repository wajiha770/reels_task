import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels_task/resources/include.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class ReelScreen extends StatefulWidget {
  final ReelModel reel;
  const ReelScreen({super.key, required this.reel});

  @override
  State<ReelScreen> createState() => _ReelScreenState();
}

class _ReelScreenState extends State<ReelScreen> {
  @override
  Widget build(BuildContext context) {
    final Controller scrollController = Controller()
      ..addListener((event) {
        _handleCallbackEvent(context, event);
      });

    return SizedBox(
      width: Statics.screenWidth,
      height: Statics.screenHeight,
      child: Scaffold(
        body: TikTokStyleFullPageScroller(
          contentSize: 100,
          swipePositionThreshold: 0.5,
          swipeVelocityThreshold: 2000,
          animationDuration: const Duration(milliseconds: 400),
          controller: scrollController,
          builder: (BuildContext context, int index) {
            return ReelWidget(reelModel: widget.reel);
          },
        ),
      ),
    );
  }

  void _handleCallbackEvent(BuildContext context, ScrollEvent event) {
    var pageNo = context.read<HomeBloc>().pageNumber;
    if (event.direction == ScrollDirection.FORWARD) {
      context.read<HomeBloc>().pageNumber++;
    } else if (event.direction == ScrollDirection.BACKWARDS && pageNo > 1) {
      context.read<HomeBloc>().pageNumber--;
    }
    context.read<HomeBloc>().getReels();
  }
}
