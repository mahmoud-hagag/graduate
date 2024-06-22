import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/workout_model.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({super.key, required this.workout});
  WorkoutModel workout;
  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.asset(
        'assets/vids/${widget.workout.link}.mp4',
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workout.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 600,
              width: 400,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 2.8/4,
                  child: FlickVideoPlayer(
                    flickManager: flickManager,
                  ),
                ),
              ),
            ),
            CustomButton(
                text: 'press',
                onTab: () {
                  widget.workout.completSets++;
                },
                color1: color1Button,
                color2: color1Button)
          ],
        ),
      ),
    );
  }
}
