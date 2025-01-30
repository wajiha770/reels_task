import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels_task/resources/include.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().getReels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<HomeBloc, ReelModel?>(
            listener: (context, reel) {
              if (reel != null) {
                //
              }
            },
            child: BlocBuilder<HomeBloc, ReelModel?>(
              builder: (context, reel) => SingleChildScrollView(
                  child: reel == null
                      ? const LoadingWidget()
                      : ReelScreen(
                          reel: reel,
                        )),
            )));
  }
}
