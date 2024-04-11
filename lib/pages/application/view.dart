import 'package:app/pages/application/controller.dart';
import 'package:app/pages/discover/view.dart';
import 'package:app/pages/tools/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({super.key});

  // 顶部导航
  AppBar _buildAppBar() {
    return AppBar(
        title: Obx(() => Text(
          controller.tabTitles[controller.state.page].tr,
        )),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          )
        ]);
  }

  Widget _buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
      children:  const <Widget>[
        DiscoverPage(),
        ToolsPage(),
      ],
    );
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
      items: controller.bottomTabs,
      currentIndex: controller.state.page,
      type: BottomNavigationBarType.fixed,
      onTap: controller.handleNavBarTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
