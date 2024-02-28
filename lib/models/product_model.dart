 class ProductModel{
  final String title;
  final String image;
  final String description;
 const ProductModel({
    required this.title,
    required this.image,
    required this.description});
 }
 const List<ProductModel> specialDealList=[
   ProductModel(
       title: "Apple HeadPhone",
       image: "appleHeadPhone.png",
       description: "Apple HeadPhone Silver Dubai Version"
   ),
   ProductModel(
       title: "Men Suite",
       image: "men_suite.png",
       description: "Men suite Blue Stylish"
   ),
   ProductModel(
       title: "iPhone 12 Pro",
       image: "iPhone.png",
       description: "iPhone 12 Pro 256gb variant Mindnight Blue"
   ),
   ProductModel(
       title: "i Watch 2",
       image: "watch.png",
       description: "Apple Smart watch 2"
   ),
   ProductModel(
       title: "Wallet Men",
       image: "wallet.png",
       description: "Blue Wallet for men Genuine leather"
   )
 ];
// const List<ProductModel> popularCatlList=[
//    ProductModel(
//        title: "Men Suite",
//        image: "men_suite.png",
//        description: "Men suite Blue Stylish"
//    )
//  ];
// const List<ProductModel> trendyProlList=[
//    ProductModel(
//        title: "title",
//        image: "image",
//        description: "description"
//    )
// ];
// const List<ProductModel> onlyForYouList=[
//    ProductModel(
//        title: "title",
//        image: "image",
//        description: "description"
//    ),
//  ];

const List<ProductModel>bannerList=[
  ProductModel(
      title: "utsob_cover",
      image: "utsob_cover.png",
      description: 'description'
  ),
  ProductModel(
      title: "goru_gosto",
      image: "goru_gosto_cover.jpeg",
      description: 'description'
  ),
  ProductModel(
      title: "fridge_sale",
      image: "fridge_sale_cover.jpeg",
      description: 'description'
  ),
  ProductModel(
      title: "monday_night",
      image: "monday_night_cover.jpeg",
      description: 'description'
  ),
  ProductModel(
      title: "egg_offer",
      image: "egg_cover.jpeg",
      description: 'description'
  ),

];

