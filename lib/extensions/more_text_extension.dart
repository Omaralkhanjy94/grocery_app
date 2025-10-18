import '../core/packages_manager/ui_imports.dart'
    show
        Widget,
        TextStyle,
        StatefulWidget,
        State,
        BuildContext,
        RichText,
        TextSpan,
        Colors,
        FontWeight;
import 'package:flutter/gestures.dart';

extension MoreTextExtension on String {
  /// Returns a [RichText] widget showing a shortened version of the string
  /// with a 'more' link to expand and show the full text.
  Widget more({
    required int trimLength,
    TextStyle? textStyle,
    TextStyle? linkStyle,
  }) {
    return _MoreTextWidget(
      text: this,
      trimLength: trimLength,
      textStyle: textStyle,
      linkStyle: linkStyle,
    );
  }
}

class _MoreTextWidget extends StatefulWidget {
  final String text;
  final int trimLength;
  final TextStyle? textStyle;
  final TextStyle? linkStyle;

  const _MoreTextWidget({
    required this.text,
    required this.trimLength,
    this.textStyle,
    this.linkStyle,
  });

  @override
  State<_MoreTextWidget> createState() => _MoreTextWidgetState();
}

class _MoreTextWidgetState extends State<_MoreTextWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final displayText = _isExpanded || widget.text.length <= widget.trimLength
        ? widget.text
        : widget.text.substring(0, widget.trimLength) + '...';

    return RichText(
      text: TextSpan(
        style: widget.textStyle ?? const TextStyle(color: Colors.black),
        children: [
          TextSpan(text: displayText),
          if (widget.text.length > widget.trimLength)
            TextSpan(
              text: _isExpanded ? ' less' : ' more',
              style:
                  widget.linkStyle ??
                  const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
            ),
        ],
      ),
    );
  }
}
