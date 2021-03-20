import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String imagesrc;
  final String title;
  final Function press;
  const CategoryCard({
    Key key,
    this.imagesrc,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),

      child: Container(
        // padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),

          boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 17,
              spreadRadius: -23,
              color: Colors.white,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  //SvgPicture.asset(svgSrc),
                  Image.asset(imagesrc),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}