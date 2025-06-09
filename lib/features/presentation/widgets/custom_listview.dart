import 'package:flutter/cupertino.dart';

class CustomListView extends StatelessWidget {
  final Widget ?Function(BuildContext,int)itemBuilder;
  final int itemCount;
  const CustomListView({super.key, required this.itemBuilder, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: true,
      itemCount: itemCount,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: itemBuilder,
    );
  }
}
