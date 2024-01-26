import 'package:flutter/material.dart';
import 'package:les_recettes_de_nathan/ui/widgets/appBar/app_bar.widget.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: MyAppBar(),
        ),
        body: Center(
            child: CircularProgressIndicator()
        )
    );
  }
}
