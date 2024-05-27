import 'package:flutter/material.dart';
import 'package:ontrend_task/services/category_service.dart';
import 'package:ontrend_task/utils/color_consts.dart';

class HomeCategoryContainer extends StatelessWidget {
  HomeCategoryContainer({super.key});

  final categoryService = CategoryService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        height: size.height * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                color: kBlackColor.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
              )
            ]),
        child: StreamBuilder(
            stream: categoryService.fecthCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No Data'),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Something Error'),
                );
              } else if (snapshot.hasData) {
                return GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                    ),
                    itemBuilder: (context, index) {
                      final category = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: size.height * 0.04,
                              backgroundImage: NetworkImage(
                                category.image,
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Text(
                              category.category,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
