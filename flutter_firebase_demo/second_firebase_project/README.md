# 🎬 Film Veritabanı Uygulaması

Firebase Firestore entegrasyonu ile geliştirilmiş modern bir film yönetim uygulaması.

## 📱 Uygulama Hakkında

Bu Flutter uygulaması, Firebase Firestore kullanarak film verilerini yönetmek için geliştirilmiş modern bir CRUD (Create, Read, Update, Delete) uygulamasıdır. Kullanıcılar film ekleyebilir, görüntüleyebilir, ve silebilir.

## ✨ Özellikler

### 🎯 Ana Özellikler
- **Film Ekleme**: Yeni filmler ve rating'lerini ekleyebilme
- **Film Listeleme**: Tüm filmleri gerçek zamanlı görüntüleme
- **Film Silme**: Onay dialog'u ile güvenli silme işlemi
- **Gerçek Zamanlı Güncelleme**: StreamBuilder ile anlık veri senkronizasyonu

### 🎨 Tasarım Özellikleri
- **Modern UI/UX**: Material Design prensiplerine uygun tasarım
- **Responsive Layout**: Tüm ekran boyutlarına uyumlu
- **Card Tasarımı**: Gölgeli ve yuvarlatılmış modern kartlar
- **İkonlu Arayüz**: Görsel olarak zengin kullanıcı deneyimi
- **Tema Renkleri**: DeepPurple renk paleti
- **Animasyonlar**: Yumuşak geçişler ve feedback'ler

### 🔧 Teknik Özellikler
- **Firebase Firestore**: NoSQL bulut veritabanı
- **StreamBuilder**: Gerçek zamanlı veri akışı
- **Form Validation**: Gelişmiş form doğrulama
- **Error Handling**: Kapsamlı hata yönetimi
- **SnackBar Notifications**: Kullanıcı bildirimleri
- **Confirmation Dialogs**: Güvenli işlem onayları

## 🛠️ Kullanılan Teknolojiler

- **Flutter**: UI framework
- **Dart**: Programlama dili
- **Firebase Firestore**: Bulut veritabanı
- **Material Design**: UI tasarım sistemi

## 📦 Gerekli Paketler

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^4.0.0
  cloud_firestore: ^6.0.0
  cupertino_icons: ^1.0.8
```

## 🚀 Kurulum

1. **Projeyi klonlayın:**
   ```bash
   git clone [repository-url]
   cd second_firebase_project
   ```

2. **Bağımlılıkları yükleyin:**
   ```bash
   flutter pub get
   ```

3. **Firebase kurulumu:**
   - Firebase Console'da yeni proje oluşturun
   - Android/iOS uygulaması ekleyin
   - `google-services.json` dosyasını `android/app/` klasörüne yerleştirin
   - Firestore veritabanını etkinleştirin

4. **Uygulamayı çalıştırın:**
   ```bash
   flutter run
   ```

## 📱 Ekran Görüntüleri

### Ana Ekran Özellikleri:
- 🎬 **Film Listesi**: Gerçek zamanlı güncellenen film kartları
- ⭐ **Rating Gösterimi**: Yıldız ikonu ile görsel rating
- 🗑️ **Silme İşlemi**: Onay dialog'u ile güvenli silme
- ➕ **Film Ekleme Formu**: Modern tasarımlı form alanları

## 💾 Veritabanı Yapısı

```javascript
// Firestore Collection: movies
{
  "film_adi": {
    "name": "Film Adı",
    "rating": "8.5"
  }
}
```

## 🎯 Kullanım

1. **Film Ekleme**: Alt kısımdaki form ile film adı ve rating girin
2. **Film Görüntüleme**: Üst kısımda tüm filmler otomatik listelenir
3. **Film Silme**: Her film kartındaki çöp kutusu ikonuna tıklayıp onaylayın

## 🔄 CRUD İşlemleri

- **CREATE**: Yeni film ekleme formu
- **READ**: StreamBuilder ile gerçek zamanlı listeleme
- **UPDATE**: (Geliştirilme aşamasında)
- **DELETE**: Onay dialog'u ile silme

## 🎨 UI/UX Detayları

- **Loading State**: CircularProgressIndicator
- **Empty State**: Boş liste için özel görsel
- **Error State**: Hata durumları için kullanıcı dostu mesajlar
- **Success Feedback**: SnackBar bildirimleri
- **Confirmation**: Kritik işlemler için onay dialog'ları

## 🔧 Geliştirici Notları

Kod içerisinde öğretici amaçlı yorumlar bulunmaktadır:
- Document Snapshot kullanımı
- QuerySnapshot veri yapısı
- StreamBuilder implementasyonu
- Firestore referans yönetimi

## 📄 Lisans

Bu proje eğitim amaçlı geliştirilmiştir.

## 👨‍💻 Geliştirici

Firebase ve Flutter entegrasyonu öğrenim projesi.

---

**Not**: Bu uygulama Firebase Firestore ile gerçek zamanlı veri yönetimi öğrenmek için geliştirilmiş bir örnektir.
