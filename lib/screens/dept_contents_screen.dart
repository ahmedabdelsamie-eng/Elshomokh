import 'package:flutter/material.dart';
import 'package:forrira/models/item.dart';
import 'package:forrira/providers/items.dart';
import 'package:forrira/widgets/dept_content_grid.dart';
import 'package:provider/provider.dart';

class DeptContentsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _DeptContentsScreenState createState() => _DeptContentsScreenState();
}

class _DeptContentsScreenState extends State<DeptContentsScreen> {
  // var productsDAta;
  var _init = true;
  var isloading = false;
  String deptTitle;
  String deptId;
  var routesArgs;
  List<Item> fromCLass;
  List<Item> toShow;
  @override
  void didChangeDependencies() {
    if (_init) {
      routesArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      deptTitle = routesArgs['title'];
      deptId = routesArgs['id'];
      setState(() {
        isloading = true;
      });

      Provider.of<Data>(context, listen: false).fetchProducts().then((_) {
        setState(() {
          isloading = false;
        });
      });
    }

    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(deptTitle),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(
                        DeptContentsScreen.routeName,
                        arguments: {'id': 'fruit', 'title': 'Fruit'});
                  },
                  child: Card(
                    color: deptId == 'fruit' ? Colors.teal : Colors.white,
                    elevation: 20,
                    shadowColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      // color: Colors.teal,
                      padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      child: Text(
                        'Fruits',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(
                        DeptContentsScreen.routeName,
                        arguments: {'id': 'vega', 'title': 'Vegetables'});
                  },
                  child: Card(
                    color: deptId == 'vega' ? Colors.teal : Colors.white,
                    elevation: 20,
                    shadowColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      // color: Colors.teal,
                      padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      child: FittedBox(
                        child: Text(
                          'Vegetables',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(
                        DeptContentsScreen.routeName,
                        arguments: {'id': 'leav', 'title': 'Leaves'});
                  },
                  child: Card(
                    color: deptId == 'leav' ? Colors.teal : Colors.white,
                    elevation: 20,
                    shadowColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      // color: Colors.teal,
                      padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      child: FittedBox(
                        child: Text(
                          'Leaves',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child:
                // Scrollbar(
                // isAlwaysShown: true,
                // thickness: 7,
                // child:
                Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: double.infinity,
              child: isloading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : DeptContentGrid(deptId),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
