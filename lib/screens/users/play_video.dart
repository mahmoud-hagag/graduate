import 'package:dio/dio.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/constants/variables.dart';
import 'package:graduate/models/workout_model.dart';
import 'package:graduate/services/cache_helper.dart';
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
  int completeSets = 0;
  updateWorkout() async {
    try {
      uId = CacheHelper.getData(key: 'uId');
      var response = await Dio().post(
        'http://10.0.2.2:8000/api/workout/update',
        data: {
          'name': widget.workout.name,
          'id': widget.workout.id,
          'description': 'description',
          'goal': widget.workout.goal,
          'reps': widget.workout.reps,
          'sets': widget.workout.sets,
          'weight': widget.workout.weight,
          'rest': widget.workout.rests,
          'link': widget.workout.link,
          'completed_sets': completeSets,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $uId'},
        ),
      );
      if (response.data["status"]) {
      } else if (!response.data["status"]) {}
    } catch (_) {}
  }

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
        title: Text(
          widget.workout.name,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 28,
          ),
        ),
        leading: const Text(''),
        leadingWidth: 0,
        actions: [
          IconButton(
            onPressed: () async {
              updateWorkout();
              Navigator.of(context).pop();
            },
            icon: const Icon(
              size: 35,
              Icons.arrow_forward_ios_outlined,
              color: baseColor,
            ),
          ),
        ],
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
                  aspectRatio: 2.8 / 4,
                  child: FlickVideoPlayer(
                    flickManager: flickManager,
                  ),
                ),
              ),
            ),
            CustomButton(
                text: 'press',
                onTab: () {
                  completeSets++;
                },
                color1: color1Button,
                color2: color1Button)
          ],
        ),
      ),
    );
  }
}
