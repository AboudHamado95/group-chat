import 'package:chat_group/config/routes/app_routes.dart';
import 'package:chat_group/core/cache/cache_helper.dart';
import 'package:chat_group/core/utils/constants.dart';
import 'package:chat_group/features/chat/presentation/cubit/auth/auth_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:chat_group/core/utils/app_colors.dart';
import 'package:chat_group/core/utils/app_strings.dart';
import 'package:chat_group/core/utils/dimensions.dart';
import 'package:chat_group/features/chat/presentation/screens/group_screen.dart';
import 'package:chat_group/features/chat/presentation/screens/profile_screen.dart';
import 'package:chat_group/features/chat/presentation/screens/users_screen.dart';
import 'package:chat_group/features/chat/presentation/widgets/custom_tool_bar_widget.dart';
import 'package:chat_group/features/chat/presentation/widgets/text_field_container_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.uId}) : super(key: key);
  final String? uId;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final PageController _pageController = PageController();
  bool _isSearch = false;
  int _toolBarPageIndex = 0;

  final List<String> _popupMenuList = ['Setting', 'Logout'];

  List<Widget> get pages =>
      [const GroupScreen(), const UsersScreen(), const ProfileScreen()];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: _isSearch == true
              ? _emptyContainer()
              : const Text(AppStrings.appName),
          backgroundColor:
              _isSearch == true ? Colors.white : AppColors.primaryColor,
          flexibleSpace: _isSearch == true
              ? _buildSearchWidget(context)
              : _emptyContainer(),
          actions: _isSearch == true
              ? []
              : [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isSearch = !_isSearch;
                      });
                    },
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: context.width10),
                        child: const Icon(Icons.search)),
                  ),
                  PopupMenuButton(
                    onSelected: (value) {
                      if (value == 'Logout') {
                        BlocProvider.of<AuthCubit>(context)
                            .loggedOut()
                            .then((value) {
                          CacheHelper.signOut(context);
                          Constants.navigateAndFinish(
                              context, Routes.loginScreen);
                        });
                      }
                    },
                    itemBuilder: (_) => _popupMenuList.map(
                      (menuItem) {
                        return PopupMenuItem(
                          value: menuItem,
                          child: Text(menuItem),
                        );
                      },
                    ).toList(),
                  ),
                ],
        ),
        body: Column(
          children: [
            _isSearch == true
                ? _emptyContainer()
                : CustomToolBarWidget(
                    pageIndex: _toolBarPageIndex,
                    toolbarIndexController: (int index) {
                      if (kDebugMode) {
                        print('current page index $index');
                      }
                      setState(() {
                        _toolBarPageIndex = index;
                      });
                      _pageController.jumpToPage(index);
                    },
                  ),
            Expanded(
              child: PageView.builder(
                itemCount: pages.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _toolBarPageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return pages[index];
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearchWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.height10 * 2.5),
      height: context.height20 * 2,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 0,
            spreadRadius: 0,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: TextFieldContainerWidget(
        textEditingController: _searchController,
        keyboardType: TextInputType.text,
        prefixIcon: Icons.arrow_back,
        hintText: 'Search...',
        color: Colors.white,
        iconClickEvent: () {
          setState(() {
            _isSearch = !_isSearch;
          });
        },
        borderRadius: 0.0,
      ),
    );
  }

  Widget _emptyContainer() {
    return const SizedBox(height: 0, width: 0);
  }
}
