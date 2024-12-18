class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;
  final int reviewCount;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
  });
}

// Mock data
final List<Product> mockProducts = [
  Product(
    id: '1',
    name: 'Wireless Headphones',
    description: 'High-quality wireless headphones with noise cancellation',
    price: 3999800, // ~200$
    imageUrl: 'https://media.wired.com/photos/66abec9ccb172c2e5de763bf/master/w_960,c_limit/Edifier-Stax-Spirit-S5-Headphones-Offwhite-Background-SOURCE-Amazon.jpg',
    rating: 4.5,
    reviewCount: 128,
  ),
  Product(
    id: '2',
    name: 'Smartphone',
    description: 'Latest model with advanced camera system',
    price: 17999800, // ~900$
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6WYqVzlFEDA0wMu_kTIKQ92LD4uwRqBwT8w&s',
    rating: 4.8,
    reviewCount: 256,
  ),
  Product(
    id: '3',
    name: 'Laptop',
    description: 'Powerful laptop for work and gaming',
    price: 25999800, // ~1300$
    imageUrl: 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-mba13-m3-spacegray-202405?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1715624974748',
    rating: 4.7,
    reviewCount: 184,
  ),
  Product(
    id: '4',
    name: 'Smartwatch',
    description: 'Stylish smartwatch with fitness tracking and notifications',
    price: 4999800, // ~250$
    imageUrl: 'https://cdn.mos.cms.futurecdn.net/FkGweMeB7hdPgaSFQdgsfj-1200-80.jpg',
    rating: 4.2,
    reviewCount: 98,
  ),
  Product(
    id: '5',
    name: 'Wireless Speaker',
    description: 'Portable wireless speaker with high-quality sound',
    price: 1599800, // ~80$
    imageUrl: 'https://m.media-amazon.com/images/I/718yxonHN8L.jpg',
    rating: 4.3,
    reviewCount: 154,
  ),
  Product(
    id: '6',
    name: 'Smart TV',
    description: 'Large-screen smart TV with streaming capabilities',
    price: 11999800, // ~600$
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDarj-2djkEz1w0wKtFUFBkTrOUpBRlyYF3A&s',
    rating: 4.6,
    reviewCount: 321,
  ),
  Product(
    id: '7',
    name: 'Fitness Tracker',
    description: 'Water-resistant fitness tracker with heart rate monitoring',
    price: 999800, // ~50$
    imageUrl: 'https://duet-cdn.vox-cdn.com/thumbor/0x0:2040x1360/2400x2400/filters:focal(1020x680:1021x681):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/23336503/acastro_220321_5092_0001.jpg',
    rating: 4.1,
    reviewCount: 72,
  ),
  Product(
    id: '8',
    name: 'Action Camera',
    description: 'Durable action camera for capturing adventures',
    price: 3999800, // ~200$
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0Y4PTYeW3DrUrqYiKu4l5fp2bUomE_qbFhw&s',
    rating: 4.4,
    reviewCount: 113,
  ),
  Product(
    id: '9',
    name: 'Coffee Maker',
    description: 'Programmable coffee maker for brewing perfect coffee',
    price: 1999800, // ~100$
    imageUrl: 'https://www.foodandwine.com/thmb/6HX5OWhB965Zb-yXVyoxptXnEFg=/fit-in/1500x1000/filters:no_upscale():max_bytes(150000):strip_icc()/FAW-Cuisinart_ConicalBurr_DGB2_4-0902-Russell-Kilgore.jpg-d12678773f4c426592fcf6aff01653b8.jpg',
    rating: 4.7,
    reviewCount: 201,
  ),
  Product(
    id: '10',
    name: 'Air Purifier',
    description: 'Improves air quality and removes allergens',
    price: 2999800, // ~150$
    imageUrl: 'https://eoleaf.com/cdn/shop/files/AEROPRO40-ENV4.jpg?v=1703077777&width=533',
    rating: 4.0,
    reviewCount: 87,
  ),
];