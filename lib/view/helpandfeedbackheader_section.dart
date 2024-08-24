import 'package:flutter/material.dart';

class HelpandfeedbackheaderSection extends StatelessWidget
    implements PreferredSizeWidget {
  final bool ispop;
  HelpandfeedbackheaderSection(this.ispop);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
          ispop
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close))
              : SizedBox()
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight); // Required for PreferredSizeWidget
}
