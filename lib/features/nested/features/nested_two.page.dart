import 'package:auto_route/auto_route.dart';
import 'package:eyr/app/app.widget.gr.dart';

import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:eyr/shares/widgets/header.widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NestedTwoPage extends StatelessWidget with CommonFunctionable {
  NestedTwoPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: HeaderBarWidget(title: 'Nested Two'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('Hello To Two'),
            ),
            TextButton(
              onPressed: () {
                router.popUntilRouteWithName(
                  NestedHomeRoute.name,
                  scoped: false,
                );
              },
              child: Text(
                'Go Back to',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
