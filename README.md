## **Session 5 - Advanced Navigation and Route Management in Flutter**

Momease adalah aplikasi yang dirancang untuk mendukung ibu hamil dan ibu pasca melahirkan dalam perjalanan mereka, menawarkan berbagai fitur seperti navigasi yang intuitif, serta menyediakan kebutuhan-kebutuhan bayi dan ibu. Dokumen ini menjelaskan pendekatan yang digunakan untuk implementasi navigasi canggih di aplikasi ini, termasuk dokumentasi kode, tantangan yang dihadapi, serta fitur lanjutan yang diimplementasikan.

---

### **Struktur Navigasi**
Aplikasi menggunakan **Flutter Navigation** dengan pendekatan berbasis rute yang terpusat di file `app.dart`. Setiap halaman didefinisikan dalam `MaterialApp.routes`, memberikan navigasi yang mudah dan terorganisir.

#### Contoh Struktur Rute
```dart
  MaterialApp(
      title: 'momEase',
      initialRoute: '/onboardingscreen1',
      routes: {
        '/onboardingscreen1': (BuildContext context) => const OnboardingScreen(),
        '/onboardingscreen2': (BuildContext context) => const Onboarding2Screen(),
        '/onboardingscreen3': (BuildContext context) => const Onboarding3Screen(),
        '/login': (BuildContext context) => const LoginPage(),
        // '/homepage': (BuildContext context) => const HomePage(),
        '/cart': (BuildContext context) => const CartPage(),
        '/profile': (BuildContext context) => const ProfilePage(),
        // '/dynamic': (BuildContext context) => const DynamicScreens(),
        // TODO: Change to a Backdrop with a HomePage frontLayer (104)
        '/backdrop': (BuildContext context) => Backdrop(
             currentCategory: _currentCategory,
             // TODO: Pass_currentCategory for frontLayer (104)
             frontLayer: HomePage(category: _currentCategory),
             // TODO: Change backLayer field value to CategoryMenuPage (104)
             backLayer: CategoryMenuPage(
                currentCategory: _currentCategory,
                onCategoryTap: _onCategoryTap,
              ),
             frontTitle: Text('MOMEASE'),
             backTitle: Text('MENU'),
        ),
        '/details': (context) => const DetailPage(
          productName: 'Default Name',
          productDescription: 'Default Description',
          price: 0,
          imageUrl: 'assets/default.png',
        ),
      },
```

- **`initialRoute`**: Menentukan halaman awal aplikasi.
- **`onUnknownRoute`**: Mengatasi navigasi ke rute yang tidak dikenal.
- **`routes`**: Daftar semua halaman yang tersedia dalam aplikasi.

---

### **Pendekatan Implementasi**
#### 1. **Bottom Navigation Bar**
Menggunakan `BottomNavigationBar` untuk mempermudah perpindahan halaman utama seperti *Backdrop / Homepage* dan *Cart*.

**Contoh Implementasi**
```dart
BottomNavigationBar(
  onTap: (index) {
    String? routeName;
    if (index == 0) routeName = '/backdrop';
    if (index == 1) routeName = '/cart';

    if (routeName != null) {
      Navigator.pushNamed(context, routeName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Route tidak ditemukan')),
      );
    }
  },
  items: [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Personalization'),
  ],
);
```

#### 2. **Fade Transition**
Transisi halaman dengan efek *fade* untuk meningkatkan pengalaman pengguna.

**Contoh Implementasi**
```dart
  Navigator.of(context).push(
    PageRouteBuilder(
      settings: RouteSettings(name: routeName), // Tetap gunakan nama rute
      pageBuilder: (context, animation, secondaryAnimation) {
      // Ambil widget berdasarkan nama rute dari MaterialApp
      final widgetBuilder =
        context.findAncestorWidgetOfExactType<MaterialApp>()?.routes?[routeName];
        return widgetBuilder!(context);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
```

#### 3. **Error Handling**
Menangani navigasi ke rute yang tidak dikenal dengan dialog atau *SnackBar*.

---

### **Tantangan yang Dihadapi**
1. **Validasi Rute Dinamis**  
   Menyelaraskan rute antara `BottomNavigationBar` dan `MaterialApp.routes` agar tetap konsisten tanpa redundansi.

2. **Efek Transisi Halus**  
   Implementasi transisi seperti *fade* membutuhkan penyesuaian agar tidak memengaruhi struktur rute yang sudah ada.

3. **Umpan Balik Pengguna**  
   Memberikan informasi yang jelas saat terjadi kesalahan navigasi, terutama jika pengguna mencoba mengakses halaman yang tidak tersedia.

---

### **Fitur Lanjutan yang Diimplementasikan**
1. **Transisi Halaman Kustom**
   - Efek transisi seperti *fade* untuk pengalaman yang lebih mulus.
2. **Penanganan Error**
   - *Fallback* ke halaman error untuk rute yang tidak dikenal.
   - *SnackBar* atau dialog untuk memberikan umpan balik langsung kepada pengguna.
3. **Navigasi Konsisten**
   - Routing terpusat di `app.dart` untuk meminimalkan duplikasi dan meningkatkan skalabilitas.

---

### **Cara Menjalankan Aplikasi**
1. Pastikan Anda telah menginstal **Flutter SDK** dan dependensi proyek.
2. Clone repositori ini menggunakan perintah berikut:  
   ```bash
   git clone https://github.com/alicialisal/VisPro_ClassAssignment_AdvancedNavigation.git
   cd VisPro_ClassAssignment_AdvancedNavigation
   ```
3. Jalankan perintah untuk mengunduh dependensi:  
   ```bash
   flutter pub get
   ```
4. Jalankan aplikasi pada perangkat target (emulator atau perangkat fisik):  
   ```bash
   flutter run
   ```

### **Kesimpulan**
Navigasi canggih di Momease dirancang untuk:
- Memberikan pengalaman pengguna yang lancar melalui transisi halus.
- Menjaga konsistensi dengan menggunakan rute terpusat.
- Menangani error navigasi secara elegan untuk meningkatkan keandalan aplikasi.

Dengan pendekatan ini, Momease menjadi lebih mudah digunakan, bahkan untuk pengguna baru.

---
