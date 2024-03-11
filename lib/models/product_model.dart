 class ProductModel{
  final String title;
  final String image;
  final String description;
 const ProductModel({
    required this.title,
    required this.image,
    required this.description});
 }


const List<ProductModel>bannerList=[
  ProductModel(
      title: "utsob_cover",
      image: "assets/utsob_cover.png",
      description: 'description'
  ),
  ProductModel(
      title: "goru_gosto",
      image: "assets/goru_gosto_cover.jpeg",
      description: 'description'
  ),
  ProductModel(
      title: "fridge_sale",
      image: "assets/fridge_sale_cover.jpeg",
      description: 'description'
  ),
  ProductModel(
      title: "monday_night",
      image: "assets/monday_night_cover.jpeg",
      description: 'description'
  ),
  ProductModel(
      title: "egg_offer",
      image: "assets/egg_cover.jpeg",
      description: 'description'
  ),

];
//
