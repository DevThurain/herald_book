import 'package:fluent_ui/fluent_ui.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      header: Padding(
        padding: EdgeInsets.only(left: 12.0),
        child: Text(
          'Items',
          style: TextStyle(
            fontSize: 16.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
