# ResepKita — UTS Mobile Programming

ResepKita adalah aplikasi katalog resep masakan menggunakan Flutter dan Dart. Aplikasi memakai data dummy lokal dan tidak membutuhkan API atau database eksternal.

## Fitur
- Beranda dengan banner, kategori, dan resep pilihan.
- Daftar resep dan pencarian nama masakan.
- Filter kategori: Semua, Makanan Berat, Camilan, dan Minuman.
- Detail resep berisi deskripsi, waktu, bahan, dan langkah memasak.
- Navigasi antarlayar menggunakan Navigator.push dan NavigationBar.

## Halaman
1. Beranda (`HomePage`)
2. Jelajahi Resep (`RecipeListPage`)
3. Detail Resep (`RecipeDetailPage`)

## Cara menjalankan
1. Pasang Flutter SDK dan ekstensi Flutter/Dart pada VS Code.
2. Buka folder proyek ini.
3. Jalankan `flutter doctor`.
4. Jalankan `flutter pub get`.
5. Jalankan emulator Android atau pilih Chrome.
6. Jalankan `flutter run` atau `flutter run -d chrome`.

## Struktur
```text
ResepKita/
├── lib/
│   └── main.dart
├── pubspec.yaml
└── README.md
```

## Catatan
Data resep merupakan data dummy untuk keperluan pembelajaran. Ilustrasi makanan menggunakan emoji agar proyek tidak memerlukan aset gambar tambahan. Pada pengembangan berikutnya, emoji dapat diganti gambar makanan yang berizin dan data dapat dihubungkan dengan API.
