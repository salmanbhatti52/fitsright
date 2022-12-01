import 'package:fits_right/views/common/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../utils/app_colors.dart';
import '../../common/widgets/app_menu_button.dart';
import '../../common/widgets/back_button.dart';

class ShoppignScreen extends StatefulWidget {
  const ShoppignScreen({super.key});

  @override
  State<ShoppignScreen> createState() => _ShoppignScreenState();
}

class _ShoppignScreenState extends State<ShoppignScreen>
    with SingleTickerProviderStateMixin {
  late Size size;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const AppDrawer(),
      body: SafeArea(child: _profileScreen()),
    );
  }

  Widget _profileScreen() {
    return SizedBox(
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(flex: 1, child: _titleBar()),
            Flexible(flex: 1, child: _tabs()),
            Flexible(flex: 1, child: _yourSize()),
            Expanded(flex: 9, child: _tabBarViews()),
          ],
        ),
      ),
    );
  }

  Widget _titleBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Builder(builder: (context) {
            return AppMenuButton(
              onTap: () => Scaffold.of(context).openDrawer(),
            );
          }),
        ),
        Flexible(
            flex: 3,
            child: Text(
              'Shopping',
              style: textStyle(FontWeight.w700, AppColors.commonBtnColor,
                  size.height * 0.025),
            )),
        const Flexible(
          flex: 1,
          child: AppBackBtn(icon: Icon(Icons.search)),
        ),
      ],
    );
  }

  Widget _tabs() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 11,
            child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFEDF2F4),
                ),
                child: TabBar(
                  indicator: RectangularIndicator(
                      color: AppColors.commonBtnColor,
                      bottomLeftRadius: 20,
                      bottomRightRadius: 20,
                      topRightRadius: 20,
                      topLeftRadius: 20,
                      horizontalPadding: 3,
                      verticalPadding: 3),
                  controller: _tabController,
                  tabs: [
                    Text(
                      'Brands',
                      style: textStyle(
                          FontWeight.w600, Colors.white, size.height * 0.018),
                    ),
                    Text(
                      'Favourites',
                      style: textStyle(
                          FontWeight.w600, Colors.white, size.height * 0.018),
                    ),
                  ],
                ))),
      ],
    );
  }

  Widget _yourSize() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Your Size',
            style:
                textStyle(FontWeight.w600, Colors.black, size.height * 0.017),
          ),
          Text('XL',
              style:
                  textStyle(FontWeight.w600, Colors.grey, size.height * 0.017)),
        ],
      ),
    );
  }

  Widget _tabBarViews() {
    return TabBarView(controller: _tabController, children: [
      SizedBox(
        child: GridView.builder(
          itemCount: 28,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemBuilder: (context, index) => Container(
            alignment: Alignment.center,
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: SvgPicture.asset(
              r'assets/svgs/addidaslogo.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
      Container(),
    ]);
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}
