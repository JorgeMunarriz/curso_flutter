import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/theme/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: video.likes,
          iconData: Icons.favorite,
          iconColor: Colors.red,
        ),
        const SizedBox(
          height: 20,
        ),
        _CustomIconButton(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(
          height: 20,
        ),
        SpinPerfect(
          infinite: false,
          duration: const Duration(seconds: 5),
          child: _CustomIconButton(
            value: 0,
            iconData: Icons.play_circle_outlined,
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class _CustomIconButton extends StatefulWidget {
  int value;
  final IconData iconData;
  final Color? color;

  _CustomIconButton({
    required this.value,
    required this.iconData,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  State<_CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<_CustomIconButton> {
  void _incrementCounter() {
    setState(() {
      widget.value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            _incrementCounter();
          },
          icon: Icon(
            widget.iconData,
            color: widget.color,
            size: 30,
          ),
        ),
        if (widget.value > 0)
          Text(HumanFormats.humanReadableNumber(widget.value.toDouble())),
      ],
    );
  }
}
