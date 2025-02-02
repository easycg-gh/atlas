import 'package:flutter/foundation.dart';
import 'package:atlas/atlas.dart';

/// Marks a geographical location on the map.
class Marker {
  /// Uniquely identifies a `Marker`.
  final String id;

  /// The location where the `Marker` is drawn is represented as `LatLng`.
  final LatLng position;

  /// Optional MarkerIcon used to replace default icon
  final MarkerIcon? icon;

  /// A `void Function` which is called whenever a `Marker` is tapped.
  final void Function()? onTap;

  final Annotation? annotation;

  /// The z-index of the marker, used to determine relative drawing order of
  /// map overlays.
  ///
  /// Lower values means drawn earlier, and thus appearing to be closer to the surface of the Earth.
  final double zIndex;

  final Anchor? anchor;

  // Optional heading used to rotate the marker in degrees (eg. 0 to 360)
  final int? heading;

  const Marker({
    required this.id,
    required this.position,
    this.onTap,
    this.annotation = const Annotation(),
    this.icon,
    this.zIndex = 0.0,
    this.anchor,
    this.heading,
  })  : assert(id != null),
        assert(position != null);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Marker typedOther = other as Marker;
    return id == typedOther.id &&
        position == typedOther.position &&
        icon == typedOther.icon &&
        zIndex == typedOther.zIndex &&
        heading == typedOther.heading;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      position.hashCode ^
      icon.hashCode ^
      zIndex.hashCode ^
      anchor.hashCode ^
      heading.hashCode;
}

/// {@template anchor}
/// Specifies the anchor to be at a particular point in the marker image.
///
/// The anchor specifies the point in the icon image that is anchored
/// to the marker's position on the Earth's surface.
///
/// The anchor point is specified in the continuous space [0.0, 1.0] x [0.0, 1.0],
/// where (0, 0) is the top-left corner of the image, and (1, 1) is the bottom-right corner.
/// The anchoring point in a W x H image is the nearest discrete grid point in a
/// (W + 1) x (H + 1) grid, obtained by scaling the then rounding.
/// For example, in a 4 x 2 image, the anchor point (0.7, 0.6) resolves
/// to the grid point at (3, 1).
/// {@endtemplate}
class Anchor {
  /// u-coordinate of the anchor, as a ratio of the image width (in the range [0, 1])
  final double x;

  /// v-coordinate of the anchor, as a ratio of the image height (in the range [0, 1])
  final double y;

  /// {@macro anchor}
  const Anchor({this.x = 0.5, this.y = 0.5});
}

/// Text labels for a [Marker] info window.
class Annotation {
  final String? title;

  final String? subTitle;

  final MarkerIcon? icon;

  /// A `void Function` which is called whenever a `Marker info` is tapped.
  final VoidCallback? onTap;

  final AnnotationType annotationType;

  const Annotation({
    this.title,
    this.subTitle,
    this.icon,
    this.onTap,
    this.annotationType = AnnotationType.destination,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Annotation typedOther = other as Annotation;
    return title == typedOther.title &&
        subTitle == typedOther.subTitle &&
        icon == typedOther.icon &&
        annotationType == typedOther.annotationType;
  }

  int get hashCode =>
      title.hashCode ^
      subTitle.hashCode ^
      icon.hashCode ^
      annotationType.hashCode;
}
