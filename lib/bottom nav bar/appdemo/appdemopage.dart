// ignore_for_file: prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, avoid_print
import 'package:eventneedz/common/appbar/appbarpage.dart';
import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AppDemoPage extends StatefulWidget {
  AppDemoPage({Key? key, this.url}) : super(key: key);
  final url;
  @override
  _AppDemoPageState createState() => _AppDemoPageState();
}

class _AppDemoPageState extends State<AppDemoPage> {
  bool play = false;
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    print('video url ${widget.url}');
    _controller = VideoPlayerController.network(
        'https://dl04.ybm.pw/?file=eyJpdiI6IjRMRVA3bFhILzNCUy9nK0ZrVDdaY2c9PSIsInZhbHVlIjoiTGVEdURqNHoraDBlaGZZQlNicVMwM1hmMFc1UG1CK0FyeHBjUUNZdGV2OE42WG4zR3ZmMVdhem84VE01N2xlekd1aU9aYkRFb1Y2alZOOEtmaEJORUR0bmtGRmV6VkNNemlUUzkyZmxBUlVBdG1QM0JkK2lSU1cyKzJjbzdDcXo3Wjh4bHdRRnVOa0YrMmVVQ3hTM3hwSzhLc05yQ3pMancvZU54OW9sN2FWZVF0UVUzVWdWTlJzd2g0OEdJcWJrUjg2eWZBdXlsL05GSDR0WWpPNHVpRVk4S1NibDR6ald3Z0RCOURhajN0d2RGbURQZzk1OEt1a0RBcXBjcU5TdS8yYitvS3JHVVJtT212My9pdzFzU3AyRjRIQk1MYWIzeEJ0NXQzS21GN0pJL2dIdDZuU2hOMEhibnRkUHJyL0xNa3pNRW5hNTBlY08xQ0lOZXY4K0FSMjdKejBUZDFhdi9hcEd1QnNIKzNmSTRiakdLV1hzWXZmR1lmNWNSNUI0cDVwRWVXcWVXbWVIR1RXKzlJT00xNnRhd0hKVHNLMGE2Vkd6Yjh4bW9YR1I2dVBUcUorVmhKSHBIQUs3NnV6VitXYThGOHQweWdncVFoWC9oMWxNTFdUS1NObDAycDM3RG5yVllacCt2eEJ6VHo3MDV2M0YrM0FOVFhJdkcwbzEvN1R2MXFPWlFrekxRNVpjQ1ZLZUV2c2hmMVUwN0h6UkNMRC95TFhEUUsweGpRRHRTcTJ5K1ZSNGRNQWtMc2E4OC9uYUJ1WDc1RmZPSFhvc3UwVml0akJKSmNYSzdKR08wZzU4NjBKZUJPbEFoQzNEL3FrU0F1NTdzQmN5dlVGSVJMRzc0UUhQbVlmR3huckp6d1FtRFI0RVBXYnpuZ1laYjNCOS9STTNNaUtyL2oxWTRzL1BkOUxqTDlRSUcyS25qa0NNYUYzb01KMWFwcHpvcDJZVzgxRTFEajVHUGNUR3grS213ZTlBMWdJTkdSb2loeHB6dm1WYjZScmdjUFF5UlZweDkzU1Vld2VXcUEyYmNkdE1Dakgxdk1BMTZ4R29KdXJ0SjVkbFlLMHBNeXdMemZSUkxjNjFBNHhvanJQRjYwazhncW44SlF1YUgyV3pSQlcxMVlWNHVlb0xUYmxQaGdDYmk5UThQcjRPSHR5NmJXUkJRNFE2MXdjcm9QalNMTkxxQjAxcVlGSlJCbzYvUytQT09oTDYwMHJYUDhzM0wwNUlxdlhxQWRQemwrdUFPek5sbkxlMlBRdXhPWDJ0RXl5b2Jra1dZUm9uWkwyYzV5aEk4Mm1QMFZzRzA0cFh2bTlmV0RpQWUwMm9kZUZuZUFDdEUwL1gwZEZPb3lEblFXL1F6ZWZKWHpYVGFDYmpNMTVhaUl6Tmp2UUlRdis1cGptSU1JaStCK3RHcFpnU1pjTVlXNFFnUVF6R0NZTy9RMXlFc2EwT1ZaZE4wcjhzckFMVTdtSW16RWFtZ2FPU1U0S3VoMXdvZjdrYTBJWHhLdHNiMkdSbElTQjhLNldFbG03dnUya2M4eDQ0c0ROdUkvb1poZGRNaVRUZzhMcTJ2Y3RhTnRPQUJHV09Qa1FXMmJScGJuaUtEK3ZtdXYwRkJMTld5Z3AyZlFIZmFMd0FVVW1vczRMVmMxalQ1NHk1dXNvdFpBemRlWUU9IiwibWFjIjoiZThmNjA5OTg0ZWQwYmIzZTUwZTRlZWYzNDMyOGVlNTMzZTQ2NTFjNDI1ODUzYzE5YWQ1ZTQ3YjExMDk5ZDU0YiIsInRhZyI6IiJ9')

      // _controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      // _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apponlytitle(context, 'Video'),
      backgroundColor: colorgreylight,
      body: Center(
          child: _controller!.value.isInitialized
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  width: deviceWidth(context, 1.0),
                  height: 250,
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                      _controller!.value.isPlaying
                          ? Container()
                          : Container(
                              width: deviceWidth(context, 1.0),
                              height: 230,
                              color: Colors.black26,
                            ),
                      Positioned(
                        top: 90,
                        left: deviceWidth(context, 0.4),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _controller!.value.isPlaying
                                  ? _controller!.pause()
                                  : _controller!.play();
                            });
                          },
                          icon: Icon(
                            _controller!.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: colorWhite,
                            size: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
          // : const Center(child: CircularProgressIndicator()),
          ),
    );
  }
}
