import 'package:flutter/material.dart';

/// Extension on [num] to provide easy access to [SizedBox] widgets for spacing.
extension SizedBoxX on num {
  /// Returns a [SizedBox] with the same width and height as this one, but with the given [child].
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

/// Example usage: instead of writing `SizedBox(height: 10)`, you can write `10.height`.
/// This makes the code more concise and readable.

///Padding extension
///Extension on [num] to provide easy access to [EdgeInsets] for padding.
/// Example usage: instead of writing `EdgeInsets.all(10)`, you can write `10.paddingAll`.
extension PaddingX on num {
  EdgeInsets get paddingAll => EdgeInsets.all(toDouble());
  // EdgeInsets.all(10)
  //example on how to use paddingAll:
  // 10.paddingAll
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: toDouble());

  // EdgeInsets.symmetric(horizontal: 10)
  //example on how to use horizontal:
  // 10.paddingSymmetric(horizontal: 10)
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: toDouble());
  // EdgeInsets.symmetric(vertical: 10)
  //example on how to use vertical:
  // 10.paddingSymmetric(vertical: 10)
  EdgeInsets get paddingOnly => EdgeInsets.only(
    left: toDouble(),
    top: toDouble(),
    right: toDouble(),
    bottom: toDouble(),
  );

  /// EdgeInsets.onlyLeft(this)
  EdgeInsets get onlyLeft => EdgeInsets.only(left: toDouble());

  /// EdgeInsets.onlyTop(this)
  EdgeInsets get onlyTop => EdgeInsets.only(top: toDouble());

  /// EdgeInsets.onlyRight(this)
  EdgeInsets get onlyRight => EdgeInsets.only(right: toDouble());

  /// EdgeInsets.onlyBottom(this)
  EdgeInsets get onlyBottom => EdgeInsets.only(bottom: toDouble());
}
