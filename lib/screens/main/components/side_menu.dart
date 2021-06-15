import 'package:admin/controllers/drawer_index_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../responsive.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Summary",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              context.read<DrawerIndexController>().index = 0;
              if(!Responsive.isDesktop(context)) {
                Navigator.pop(context);
              }
            },
          ),
          DrawerListTile(
            title: "Report",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              context.read<DrawerIndexController>().index = 1;
              if(!Responsive.isDesktop(context)) {
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.black,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black54),
      ),
    );
  }
}
