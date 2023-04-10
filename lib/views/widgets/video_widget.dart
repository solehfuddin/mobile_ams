part of 'widgets.dart';

// ignore: must_be_immutable
class VideoWidget extends StatefulWidget {
  String? videoUrl = '';
  File? file;
  VideoWidget({this.videoUrl, this.file, Key? key}) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  initPlayer() async {
    //Ubah https ya
    _controller = widget.videoUrl != null
        ? VideoPlayerController.network(
            Uri.parse(widget.videoUrl!).replace(scheme: 'https').toString(),
          )
        : VideoPlayerController.file(widget.file!);

    _chewieController = ChewieController(videoPlayerController: _controller);

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return _chewieController != null
        ? Chewie(
            controller: ChewieController(
              videoPlayerController: _controller,
              autoPlay: false,
              autoInitialize: true,
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
