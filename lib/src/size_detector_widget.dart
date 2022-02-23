import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

/// A small & simple widget to detect size of it's child widget.
///
/// This widget is useful when you want to know the size of a widget after it has been rendered as in
/// certain cases, the size of a widget is not known until it has been rendered.

class SizeDetectorWidget extends StatefulWidget {
  /// Accepts a [Widget], of which you have detect the size.
  final Widget child;

  /// Accepts a [ValueChanged], which will be called when the size of the child widget changes.
  final ValueChanged<Size> onSizeDetect;

  const SizeDetectorWidget({
    Key? key,
    required this.child,
    required this.onSizeDetect,
  }) : super(key: key);

  @override
  _SizeDetectorWidgetState createState() => _SizeDetectorWidgetState();
}

class _SizeDetectorWidgetState extends State<SizeDetectorWidget> {
  /// The size of the old child widget.
  Size? _oldSize;

  @override
  void initState() {
    super.initState();

    /// Call [_detectSize] to detect the size of the child widget after the child widget is build
    SchedulerBinding.instance?.addPostFrameCallback((_) => _detectSize());
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  /// Function to detect the size of the child widget and call the [ValueChanged] callback.
  void _detectSize() {
    if (!mounted) {
      return;
    }
    final size = context.size;
    if (_oldSize != size) {
      _oldSize = size;
      widget.onSizeDetect(size!);
    }
  }
}
