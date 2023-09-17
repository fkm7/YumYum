import 'package:delmer/res/style.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton.filledTonal(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) => const Icon(Icons.search);

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(
        'Results',
        style: AppTextStyle.titleStyle0,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        'Suggest',
        style: AppTextStyle.subTitleStyle2,
      ),
    );
  }
}
