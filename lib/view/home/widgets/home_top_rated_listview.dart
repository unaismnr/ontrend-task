import 'package:flutter/material.dart';
import 'package:ontrend_task/services/top_resto_service.dart';
import 'package:ontrend_task/utils/color_consts.dart';
import 'package:ontrend_task/view/home/common/rating_widget.dart';

class HomeTopRatedListView extends StatelessWidget {
  HomeTopRatedListView({super.key});

  final topRestoService = TopRestoService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: size.height * 0.25,
        child: StreamBuilder(
            stream: topRestoService.fecthTopResto(),
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
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final topRestos = snapshot.data![index];
                    return Stack(
                      children: [
                        Container(
                          width: size.width * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(topRestos.image),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: size.width * 0.35,
                            height: size.height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  kBlackColor.withOpacity(0.7),
                                  kBlackColor.withOpacity(0.6),
                                  kBlackColor.withOpacity(0.0),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    topRestos.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        '45m to 50m',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: kWhiteColor,
                                          fontSize: 9,
                                        ),
                                      ),
                                      RatingWidget(
                                        height: size.height * 0.019,
                                        width: size.height * 0.043,
                                        textAndIconSized: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: size.width * 0.03,
                  ),
                  itemCount: snapshot.data!.length,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
