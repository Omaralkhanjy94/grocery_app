import 'package:flutter/material.dart';

/// Extension on [num] to provide easy access to [SizedBox] widgets for spacing.
extension SizedBoxX on num {
  /// Returns a [SizedBox] with the same width and height as this one, but with the given [child].
  /// Example usage: instead of writing `SizedBox(height: 10)`, you can write `10.height`.
  /// This makes the code more concise and readable.
  SizedBox get height => SizedBox(height: toDouble());

  /// Returns a [SizedBox] with the same width and height as this one, but with the given [child].
  /// Example usage: instead of writing `SizedBox(width: 10)`, you can write `10.width`.
  /// This makes the code more concise and readable.
  SizedBox get width => SizedBox(width: toDouble());
}

///Padding extension
///Extension on [num] to provide easy access to [EdgeInsets] for padding.
extension PaddingX on num {
  /// Example usage: instead of writing `EdgeInsets.all(10)`, you can write `10.paddingAll`.
  /// EdgeInsets.all(10)
  ///example on how to use paddingAll:
  /// 10.paddingAll
  EdgeInsets get paddingAll => EdgeInsets.all(toDouble());

  /// EdgeInsets.symmetric(horizontal: this)
  /// Example usage: instead of writing `EdgeInsets.symmetric(horizontal: 10)`, you can write `10.paddingSymmetric(horizontal: 10)`
  /// EdgeInsets.symmetric(horizontal: 10)
  ///example on how to use horizontal:
  /// 10.paddingSymmetric(horizontal: 10)
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: toDouble());

  /// EdgeInsets.symmetric(vertical: this)
  /// Example usage: instead of writing `EdgeInsets.symmetric(vertical: 10)`, you can write `10.paddingSymmetric(vertical: 10)`
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: toDouble());

  /// EdgeInsets.only(this)
  /// Example usage: instead of writing `EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10)`, you can write `10.paddingOnly`
  /// 10.paddingOnly
  EdgeInsets get paddingOnly => EdgeInsets.only(
    left: toDouble(),
    top: toDouble(),
    right: toDouble(),
    bottom: toDouble(),
  );

  /// EdgeInsets.onlyLeft(this)
  /// Example usage: instead of writing `EdgeInsets.only(left: 10)`, you can write `10.paddingOnlyLeft`
  EdgeInsets get onlyLeft => EdgeInsets.only(left: toDouble());

  /// EdgeInsets.onlyTop(this)
  /// Example usage: instead of writing `EdgeInsets.only(top: 10)`, you can write `10.paddingOnlyTop`
  EdgeInsets get onlyTop => EdgeInsets.only(top: toDouble());

  /// EdgeInsets.onlyRight(this)
  /// Example usage: instead of writing `EdgeInsets.only(right: 10)`, you can write `10.paddingOnlyRight`
  EdgeInsets get onlyRight => EdgeInsets.only(right: toDouble());

  /// EdgeInsets.onlyBottom(this)
  /// Example usage: instead of writing `EdgeInsets.only(bottom: 10)`, you can write `10.paddingOnlyBottom`
  EdgeInsets get onlyBottom => EdgeInsets.only(bottom: toDouble());
}
