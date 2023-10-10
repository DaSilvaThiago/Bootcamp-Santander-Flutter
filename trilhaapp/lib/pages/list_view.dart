import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text("user 2"),
          leading: Image.asset(AppImages.user_002),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Hello are you good?"), Text("08:59")],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (value) {
              debugPrint(value);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(value: "option1", child: Text("option1")),
                const PopupMenuItem<String>(value: "option2", child: Text("option2")),
                const PopupMenuItem<String>(value: "option3", child: Text("option3")),
              ];
            },
          ),
          isThreeLine: true,
        ),
        Image.asset(AppImages.user_001),
        Image.asset(AppImages.user_002),
        Image.asset(AppImages.landScape_001),
        Image.asset(AppImages.landscape_002)
      ],
    );
  }
}
