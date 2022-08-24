import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tikitiki/controllers/searchcontroller.dart';
import 'package:tikitiki/models.dart';
import 'package:tikitiki/views/profileview.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);

  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemRed,
          middle: CupertinoSearchTextField(
            // decoration: const BoxDecoration(
            //   filled: false,
            //   hintText: 'Search',
            //   hintStyle: TextStyle(
            //     fontSize: 18,
            //     color: Colors.white,
            //   ),
            // ),

            onChanged: (value) => searchController.searchUser(value),
          ),
        ),
        child: searchController.searchedUsers.isEmpty
            ? const Center(
                child: Text(
                  'Search for users!',
                  style: TextStyle(
                    fontSize: 25,
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: searchController.searchedUsers.length,
                itemBuilder: (context, index) {
                  User user = searchController.searchedUsers[index];
                  return CupertinoButton(
                    onPressed: () => Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => Profile(uid: user.uid),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(42.0),
                          ),
                          child: Image.network(
                            user.profilePhoto,
                          ),
                        ),
                        Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 18,
                            color: CupertinoColors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      );
    });
  }
}
