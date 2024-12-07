// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:codelabs_101/model/products.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.babyEssentials,
        id: 0,
        isFeatured: true,
        name: 'Baby Bibs',
        price: 75000,
        description: 'Soft and comfortable baby bibs designed to keep your little one clean during mealtime. Made from absorbent fabric, they are gentle on your baby\'s skin and come in a variety of fun colors and patterns.',
      ),
      Product(
        category: Category.babyEssentials,
        id: 1,
        isFeatured: true,
        name: 'Baby Bottles',
        price: 80000,
        description: 'Our baby bottles are perfect for feeding your baby with ease. Featuring anti-colic technology to reduce gas and discomfort, these bottles come in various sizes and are made of BPA-free materials for your baby\'s safety.',
      ),
      Product(
        category: Category.babyEssentials,
        id: 2,
        isFeatured: false,
        name: 'Diaper Bag',
        price: 350000,
        description: 'A spacious and practical diaper bag designed to carry all your baby essentials. With multiple compartments and a comfortable design, it allows easy access to diapers, wipes, bottles, and more while you\'re on the go.',
      ),
      Product(
        category: Category.babyEssentials,
        id: 3,
        isFeatured: true,
        name: 'Infant Car Seat',
        price: 1200000,
        description: 'This infant car seat offers safety and comfort for your baby during car rides. Equipped with a secure harness system, side impact protection, and easy installation, it ensures your baby\'s safety on the road.',
      ),
      Product(
        category: Category.babyEssentials,
        id: 4,
        isFeatured: false,
        name: 'Baby Blankets',
        price: 65000,
        description: 'Soft and cozy baby blankets made from premium materials to keep your baby warm and comfortable. Ideal for swaddling, napping, or as a stroller cover, these blankets are gentle on your baby\'s sensitive skin.',
      ),
      Product(
        category: Category.maternityWear,
        id: 5,
        isFeatured: true,
        name: 'Maternity Dress',
        price: 150000,
        description: 'A stylish maternity dress designed for comfort and elegance. Featuring soft, stretchy fabric, this dress adapts to your growing bump while providing a flattering silhouette. Perfect for both casual and formal occasions.',
      ),
      Product(
        category: Category.maternityWear,
        id: 6,
        isFeatured: true,
        name: 'Yoga Pants',
        price: 200000,
        description: 'These maternity yoga pants are made with a comfortable, stretchy fabric that moves with your body. Designed to support your growing belly, they provide maximum comfort for all your activities, from yoga to daily wear.',
      ),
      Product(
        category: Category.babyAccessories,
        id: 7,
        isFeatured: true,
        name: 'Baby Shoes',
        price: 350000,
        description: 'Cute and durable baby shoes designed to keep your baby\'s feet comfortable and stylish. Featuring soft soles and adjustable straps, these shoes are perfect for your little one as they start to take their first steps.',
      ),
      Product(
        category: Category.babyAccessories,
        id: 8,
        isFeatured: false,
        name: 'Swaddle Suit',
        price: 150000,
        description: 'This soft and cozy swaddle suit wraps your baby in warmth and security. Ideal for newborns, it helps to recreate the feeling of the womb, making your baby feel safe and comfortable while they sleep.',
      ),
      Product(
        category: Category.babyAccessories,
        id: 9,
        isFeatured: false,
        name: 'Pacifiers',
        price: 100000,
        description: 'Designed to soothe and comfort your baby, these pacifiers are made from soft, BPA-free silicone. Available in a variety of shapes and colors, they are perfect for helping your baby self-soothe during naptime or bedtime.',
      ),

    ];
    
    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}
