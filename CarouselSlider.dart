  Widget createCarouselSlider() {
    List<Color> indicatorColors = [
      Colors.red,
      Colors.blue,
      Colors.yellow,
    ];
    var currentIndex = 0.obs;
    var buttonCarouselController = CarouselController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          items: [
            Container(
              margin: EdgeInsets.only(bottom: 8),
              color: Colors.red,
              child: Center(child: Text('Slide 1')),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              color: Colors.blue,
              child: Center(child: Text('Slide 2')),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              color: Colors.yellow,
              child: Center(child: Text('Slide 3')),
            ),
          ],
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            enableInfiniteScroll: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              currentIndex.value = index;
            },
          ),
          carouselController: buttonCarouselController,
        ),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicatorColors.map((color) {
                int index = indicatorColors.indexOf(color);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        index == currentIndex.value ? Colors.blue : Colors.grey,
                  ),
                );
              }).toList(),
            )),
      ],
    );
  }
}
