// screens/feed_screen.dart

// ignore_for_file: library_private_types_in_public_api

import 'package:chance/core/const/app_text_styles.dart';
import 'package:chance/features/feed/provider/feed_provider.dart';
import 'package:chance/features/feed/screen/feed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool isPublicFeed = true;
  void _showBottomModalSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff5DC482),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/images/feed.svg',
                  ),
                  title: Text(
                    'Topic 1',
                    style: AppTextStyles.bold700Style16,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              ListTile(
                leading: SvgPicture.asset('assets/images/feedb.svg'),
                title: Text(
                  'Topic 2',
                  style: AppTextStyles.bold700Style16,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: SvgPicture.asset('assets/images/feedb.svg'),
                title: Text(
                  'Topic 3',
                  style: AppTextStyles.bold700Style16,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: SvgPicture.asset('assets/images/feedb.svg'),
                title: Text(
                  'Topic 4',
                  style: AppTextStyles.bold700Style16,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final feedAsyncValue = ref.watch(feedProvider);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 90,
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.verified,
                  color: Color(0xff5DC482),
                  size: 24,
                ),
              ],
            ),
            // centerTitle: true,
            actions: [
              IconButton(
                icon: SvgPicture.asset('assets/images/notification.svg'),
                onPressed: () {},
              ),
            ],
            bottom: TabBar(
              indicatorColor: const Color(0xff5DC482),
              labelColor: const Color(0xff5DC482),
              unselectedLabelColor: Colors.black,
              labelStyle: AppTextStyles.bold800Style12,
              unselectedLabelStyle: AppTextStyles.bold600Style12,
              indicator: UnderlineTabIndicator(
                borderSide: const BorderSide(width: 2.0, color: Colors.green),
                insets: EdgeInsets.symmetric(
                    horizontal: -(MediaQuery.of(context).size.width / 6)),
              ),
              tabs: const [
                Tab(
                  text: 'Public Feed',
                ),
                Tab(
                  text: 'Business Feed',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              feedAsyncValue.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text('Error: $err')),
                data: (feed) {
                  return SmartRefresher(
                    controller: _refreshController,
                    onRefresh: () {
                      ref.refresh(feedProvider);
                      _refreshController.refreshCompleted();
                    },
                    child: ListView.builder(
                      itemCount: feed.length,
                      itemBuilder: (context, index) {
                        final item = feed[index];

                        return Column(
                          children: [
                            if (index == 0)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Feeds',
                                      style: AppTextStyles.bold700Style20,
                                    ),
                                    IconButton(
                                      icon: SvgPicture.asset(
                                        'assets/images/filtera.svg',
                                      ),
                                      onPressed: () {
                                        _showBottomModalSheet(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            FeedItemWidget(feedItem: item),
                          ],
                        );

                        // return Container();
                      },
                    ),
                  );
                },
              ),
              const Center(child: Text('Business Feed')),
            ],
          )),
    );
  }
}
