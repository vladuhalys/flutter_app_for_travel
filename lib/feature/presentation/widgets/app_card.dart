import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_for_travel/core/theme/app_text_style/app_text_style.dart';
import 'package:flutter_app_for_travel/feature/domain/models/place_dto.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.place});

  final PlaceDto place;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(place.imageUrl,
            fit: BoxFit.cover, height: 250, width: double.infinity),
        BlurryContainer(
          blur: 5,
          width: 200,
          height: 200,
          elevation: 0,
          color: Colors.transparent,
          padding: const EdgeInsets.all(8),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${place.name}, ", style: AppTextStyle.cardTitel),
                  Text(place.locationDto.city,
                      style: AppTextStyle.cardTitel
                          .copyWith(fontWeight: FontWeight.w400))
                ],
              ),
              Row(children: [
                SvgPicture.asset(
                  'assets/icons/location_icon.svg',
                  width: 16,
                  height: 16,
                ),
                Text("${place.locationDto.city}, {place.locationDto.country}",
                    style: AppTextStyle.cardSubTitel),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
