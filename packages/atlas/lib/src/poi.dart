import 'package:atlas/atlas.dart';
import 'package:flutter/foundation.dart';

/// The `Poi` represents the details of the valid points selected on the map.
class Poi {
  ///A unique identifier of the valid point selected.
  final String? id;

  ///The name of the valid point selected.
  final String? name;

  ///The latitude and longitude of the selected valid point.
  final LatLng latLng;

  const Poi({
    this.id,
    this.name,
    required this.latLng,
  }) : assert(latLng != null);
}
