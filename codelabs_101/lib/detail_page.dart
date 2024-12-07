import 'package:codelabs_101/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final String productName;
  final String productDescription;
  final double price;
  final String imageUrl;

  const DetailPage({
    Key? key,
    required this.productName,
    required this.productDescription,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double _currentRating = 4.5; // Default rating
  List<String> _comments = ['Great product!', 'Really useful and high quality.'];
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shop",
          style: GoogleFonts.poppins(fontSize: 20),
        ),
        backgroundColor: kShrineBlue100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Center(
              child: Image.asset(
                widget.imageUrl,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20.0),
            // Product Name
            Text(
              widget.productName,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: kShrineBlue500,
              ),
            ),
            Text(
              '\Rp. ${NumberFormat('#,##0').format(widget.price)}',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 68, 108, 192),
              ),
            ),
            const SizedBox(height: 10.0),
            // Product Description
            Text(
              widget.productDescription,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 20.0),
            // Star Rating
            Row(
              children: [
                Text(
                  'Rating:',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 10.0),
                for (int i = 1; i <= 5; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentRating = i.toDouble();
                      });
                    },
                    child: Icon(
                      Icons.star,
                      color: i <= _currentRating ? Colors.amber : Colors.grey,
                    ),
                  ),
                const SizedBox(width: 10.0),
                Text(
                  _currentRating.toStringAsFixed(1),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            // Comment Section
            Text(
              'Comments:',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: _comments.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      leading: const Icon(Icons.comment, color: Colors.grey),
                      title: Text(
                        _comments[index],
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    style: GoogleFonts.poppins(
                      fontSize: 12, // Ukuran font untuk teks yang diketik
                      color: Colors.black, // Warna teks yang diketik
                    ),
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      hintStyle: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, // Atur padding horizontal
                        vertical: 8.0, // Atur padding vertical
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    if (_commentController.text.isNotEmpty) {
                      setState(() {
                        _comments.add(_commentController.text);
                        _commentController.clear();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kShrineBlue500,
                  ),
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            // Buy Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Product ${widget.productName} added to cart!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 68, 108, 192),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 8.0,
                  ),
                ),
                child: Text(
                  'Buy Now',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
