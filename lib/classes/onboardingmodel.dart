class Onboardingmodel {
  String image;
  String title;
  String description;
  Onboardingmodel(this.image, this.title, this.description);
}

List<Onboardingmodel> onboardingData = [
  Onboardingmodel(
    "images/bg1.png",
    "Discover the Latest Trends",
    "Shop the newest fashion arrivals and stay ahead with curated collections just for you",
  ),
  Onboardingmodel(
    "images/bg2.png",
    "Exclusive Deals & Discounts",
    "Unlock special offers and enjoy member-only discounts on your favorite styles",
  ),
  Onboardingmodel(
    "images/bg3.png",
    "Fast & Secure Checkout",
    "Seamless shopping with secure payment options and quick delivery to your doorstep",
  ),
];
