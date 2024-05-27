import 'package:flutter/material.dart';
import 'package:ontrend_task/services/resto_explore_service.dart';
import 'package:ontrend_task/utils/color_consts.dart';
import 'package:ontrend_task/view/home/common/rating_widget.dart';

class HomeRestoToExplore extends StatelessWidget {
  HomeRestoToExplore({super.key});

  final restoExploreService = RestoExploreService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: StreamBuilder(
          stream: restoExploreService.fecthRestoExplore(),
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
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final restoExplore = snapshot.data![index];
                  return Container(
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kWhiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: kBlackColor.withOpacity(0.25),
                          spreadRadius: 0.8,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height * 0.17,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: kBlackColor.withOpacity(0.1),
                                spreadRadius: 0.1,
                                blurRadius: 5,
                                offset: const Offset(0, 6),
                              ),
                            ],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(restoExplore.image),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.015),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                restoExplore.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: kBlackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              RatingWidget(
                                height: size.height * 0.029,
                                width: size.height * 0.063,
                                textAndIconSized: 14,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Pizza, Pastas, Desserts',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: kBlackColor,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                '* OMR ${restoExplore.price} for one',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: kBlackColor,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.timelapse,
                                color: kBlueColor,
                              ),
                              SizedBox(width: size.width * 0.02),
                              const Text(
                                '40-45 min',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: kBlackColor,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(width: size.width * 0.02),
                              const Text(
                                '* 6.8 KM',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: kBlackColor,
                                  fontSize: 13,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                restoExplore.place,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: kBlackColor,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(width: size.width * 0.007),
                              const Icon(
                                Icons.location_on,
                                color: kMainColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: size.height * 0.018,
                ),
                itemCount: snapshot.data!.length,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
