part of 'widgets.dart';

// ignore: must_be_immutable
class ImageWidget extends StatefulWidget {
  String? imageUrl;
  ImageWidget({this.imageUrl, Key? key}) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget>
    with SingleTickerProviderStateMixin {
  late TransformationController _controller;
  late TapDownDetails _tapDownDetails;

  late AnimationController _animationController;
  Animation<Matrix4>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = TransformationController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    )..addListener(() {
        _controller.value = _animation!.value;
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTapDown: (details) {
        _tapDownDetails = details;
      },
      onDoubleTap: () {
        final position = _tapDownDetails.localPosition;
        const double scale = 3.0;
        final x = -position.dx * (scale - 1);
        final y = -position.dy * (scale - 1);
        final zoomed = Matrix4.identity()
          ..translate(x, y)
          ..scale(scale);
        final end =
            _controller.value.isIdentity() ? zoomed : Matrix4.identity();

        _animation = Matrix4Tween(begin: _controller.value, end: end).animate(
          CurveTween(curve: Curves.easeOut).animate(_animationController),
        );

        _animationController.forward(from: 0);
      },
      child: InteractiveViewer(
        clipBehavior: Clip.none,
        transformationController: _controller,
        panEnabled: false,
        scaleEnabled: false,
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            widget.imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
