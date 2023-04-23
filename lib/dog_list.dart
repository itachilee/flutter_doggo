import 'package:flutter/material.dart';

import 'dog_card.dart';
import 'dog_model.dart';

class DogList extends StatelessWidget {
  final List<Dog> doggos;

  const DogList(this.doggos, {super.key});

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      // Must have an item count equal to the number of items!
      itemCount: doggos.length,
      // A callback that will return a widget.
      itemBuilder: (context, index) {
        // In our case, a DogCard for each doggo.
        return DogCard(doggos[index]);
      },
    );
  }
}
