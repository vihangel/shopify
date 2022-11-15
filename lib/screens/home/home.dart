import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopify/screens/home/screens/home_screen.dart';
import 'package:shopify/shared/utils/colors.dart';
import 'package:shopify/shared/widgets/base_state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

PageController pageController = PageController(initialPage: 0);

class _HomeState extends BaseState<Home> {
  int bottomBarIndex = 0;

  final baseTranslate = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: pageController,
        children: const [
          HomeScreen(),
          Center(
            child: Text("Em construção"),
          ),
          Center(
            child: Text("Em construção"),
          ),
          Center(
            child: Text("Em construção"),
          ),
        ],
        onPageChanged: (value) => setState(() {
          bottomBarIndex = value;
        }),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _bottomIconBar({
    required String icon,
    required String title,
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    isSelected ? null : icon = "${icon}_outline";
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? ShopfyColors.dark : Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
                child: SvgPicture.asset(
                  'assets/img/$icon.svg',
                  color: isSelected ? ShopfyColors.dark : ShopfyColors.gray,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  title,
                  style: TextStyles.small,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _bottomNavigationBar() {
    return BottomAppBar(
      child: SizedBox(
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          direction: Axis.horizontal,
          children: [
            _bottomIconBar(
              icon: "home",
              title: translate('$baseTranslate.home'),
              isSelected: bottomBarIndex == 0 ? true : false,
              onTap: controllIndex(0),
            ),
            _bottomIconBar(
              icon: "favorite",
              title: translate('$baseTranslate.favorites'),
              isSelected: bottomBarIndex == 1 ? true : false,
              onTap: controllIndex(1),
            ),
            _bottomIconBar(
              icon: "notification",
              title: translate('$baseTranslate.notification'),
              isSelected: bottomBarIndex == 2 ? true : false,
              onTap: controllIndex(2),
            ),
            _bottomIconBar(
              icon: "perfil",
              title: translate('$baseTranslate.profile'),
              isSelected: bottomBarIndex == 3 ? true : false,
              onTap: controllIndex(3),
            ),
          ],
        ),
      ),
    );
  }

  VoidCallback controllIndex(int page) {
    return () => setState(() {
          bottomBarIndex = page;
          pageController.animateToPage(
            bottomBarIndex,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        });
  }
}
