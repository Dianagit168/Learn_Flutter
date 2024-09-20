import 'package:flutter/material.dart';
import 'package:flutter_learning/config/app_icon.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: MyUserAppbar(
              offset: scrollController.hasClients ? scrollController.offset : 0,
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                        padding: const EdgeInsets.all(16),
                        child: const Text("This is test post"),
                      ),
                  childCount: 100))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MyUserAppbar extends StatelessWidget {
  final double offset;
  var expanded = true;
  MyUserAppbar({super.key, required this.offset});

  @override
  Widget build(BuildContext context) {
    int? postId = ModalRoute.of(context)!.settings.arguments as int?;
    final width = MediaQuery.of(context).size.width;
    final progress = offset / width;
    expanded = progress < 0.04;
    print(expanded);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: double.infinity,
      height: width - (expanded ? 0 : width - 260),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: 0,
            left: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.only(
                  top: expanded
                      ? 0
                      : MediaQuery.of(context).viewPadding.top + 24),
              alignment: expanded ? null : Alignment.center,
              width: expanded ? width : 180,
              height: expanded ? width : 180,
              child: Image.asset(
                AppIcons.imLongHair,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 24,
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              alignment: expanded ? Alignment.centerLeft : Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.amber,
                    ),
                  ),
                  const Text(
                    'User name',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                    ),
                  ),
                  Text('Canada And PostId $postId'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
