import 'package:app/molecules/gate_managment/visitor_list_tile_shimmer.dart';
import 'package:flutter/material.dart';

class VisitorShimmerList extends StatelessWidget {
  const VisitorShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const VisitorListTileShimmer(),
    );
  }
}
