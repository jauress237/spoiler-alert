import 'package:flutter/material.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/pages/detail/widgets/detail_sliver.dart';
import 'package:newtest/pages/detail/widgets/inform.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.info, {super.key});

  final Info info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: DetailSliverDelegate(
              info: info,
              expandedHeight: 360,
              roundedContainerHeight: 30,
            ),
          ),
          SliverToBoxAdapter(child: InformInfo(info)),
        ],
      ),
    );
  }
}
