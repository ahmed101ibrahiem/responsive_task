import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_task/core/utils/media_quary.dart';

import '../../model/data_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/custom_section_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final List<String> urlList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMpynemC40o6QCp27GrUeRfG_6OTXLyFLztA&usqp=CAU',
    'https://www.audi.com/content/dam/ci/Guides/Communication_Media/Advertisements/02_Andwendungsbeispiele/audi-ci-communication-media-advertisements-example1.png?imwidth=2400',
    'https://media-assets-02.thedrum.com/cache/images/thedrum-prod/s3-news-tmp-90538-opening_graphic--default--1280.jpg',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/burger-poster-design-template-471879a9187123f71eefd3c08edd0000_screen.jpg?ts=1646031026',
    'https://www.retail4growth.com/public/uploads/editor/2019-12-13/1576210700.jpg'
  ];
  final List<DataModel> allServices = [
    DataModel(title: 'ولي الأمر', icon: (FontAwesomeIcons.userTie)),
    DataModel(title: 'طلب توظيف', icon: (FontAwesomeIcons.penToSquare)),
    DataModel(title: 'روابط عامة', icon: (FontAwesomeIcons.internetExplorer)),
    DataModel(title: 'طلب مقابلة', icon: (FontAwesomeIcons.addressCard)),
    DataModel(title: 'نمازج', icon: (Icons.featured_play_list_outlined)),
    DataModel(title: 'رزنامة العام', icon: (FontAwesomeIcons.calendarDays)),
    DataModel(title: 'تواصل معنا', icon: (FontAwesomeIcons.headset)),
  ];

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    bool isportrait = (orientation==Orientation.portrait);
    return Scaffold(
      appBar: AppBar(
        title: const Text('الرئيسية'),
        leading: IconButton(
          icon: const Icon(Icons.translate),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.shareFromSquare),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(

      //  shrinkWrap: true,
          children: [
        SizedBox(
          height: isportrait?context.height * 0.01:context.height * 0.03,
        ),
        CarouselSlider(
            items: urlList
                .map((item) => ClipRRect(
              borderRadius: BorderRadius.circular(18.sp),
                  child: CachedNetworkImage(
                        imageUrl: item,
                    height:  isportrait?context.height*0.18: context.height*0.47,
                    width:isportrait?context.weight*0.8: context.weight*0.7,
                    fit: BoxFit.cover,
                      ),
                ))
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              height: isportrait?context.height*0.18: context.height*0.47,
              initialPage: 1,
              reverse: true,
              viewportFraction:isportrait?0.8: 0.7,
              autoPlayAnimationDuration: const Duration(milliseconds: 100),
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {},
            )),
        SizedBox(height:isportrait? context.height * 0.02:context.height * 0.04),
        Align(
          alignment: Alignment.center,
          child: GridView.builder(

            shrinkWrap: true,
            padding:isportrait? EdgeInsets.all(16.h):EdgeInsets.all(2.w),
            itemCount: allServices.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: isportrait?28.sp:0,
                    crossAxisCount: orientation == Orientation.portrait?2:4,



                ),
            itemBuilder: (context, index) =>
                customService(allServices :allServices,index: index, orientation: orientation),
          ),
        ),
      ]),
    );
  }



}
