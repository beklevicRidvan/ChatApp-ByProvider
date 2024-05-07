# Sohbet Uygulaması

Bu Flutter uygulaması, kullanıcılara gerçek zamanlı sohbet etme olanağı sağlar. Firebase Authentication kullanılarak kullanıcı kayıt ve giriş işlemleri yönetilir, Firebase Firestore ile gerçek zamanlı sohbet sağlanır.

## Özellikler

- Kullanıcı Kayıt ve Giriş: Firebase Authentication kullanılarak kullanıcılar uygulamaya kaydolabilir ve giriş yapabilir.
- Gerçek Zamanlı Sohbet: Firebase Firestore kullanılarak kullanıcılar arasında gerçek zamanlı sohbet sağlanır.
- Mesaj Gönderme ve Alımı: Kullanıcılar, diğer kullanıcılara mesaj gönderebilir ve alabilir.
- Oturum Yönetimi: Kullanıcılar oturumu kapatabilir ve tekrar giriş yapabilir.

## Kullanılan Paketler

Bu uygulama geliştirilirken aşağıdaki paketler kullanılmıştır:

- `intl`: Uluslararası tarih/saat biçimlendirme için kullanılmıştır.
- `provider`: MVVM (Model-View-ViewModel) mimarisi için state yönetimi sağlar.
- `get_it`: Servislerin bağımlılıklarını yönetmek için kullanılmıştır.
- `firebase_core`: Firebase projesi yapılandırması için gereklidir.
- `firebase_auth`: Firebase Authentication işlemleri için kullanılmıştır.
- `cloud_firestore`: Firebase Firestore veritabanı işlemleri için kullanılmıştır.

## Kurulum

1. Proje dosyalarını bilgisayarınıza klonlayın veya indirin.
2. Firebase Console'da yeni bir proje oluşturun.
3. Oluşturduğunuz projeye Android ve iOS platformları için Firebase ekleme işlemlerini tamamlayın.
4. `google-services.json` ve `GoogleService-Info.plist` dosyalarını projenize ekleyin.
5. `pubspec.yaml` dosyasında belirtilen paketleri yükleyin: `intl`, `provider`, `get_it`, `firebase_core`, `firebase_auth`, `cloud_firestore`.
6. Firebase Authentication ve Firestore'u etkinleştirin.
7. Firebase projesi ile bağlantı kurmak için gerekli adımları takip edin.

## Kullanım

Uygulamayı başlatmak için bir Android veya iOS cihaz üzerinde çalıştırın. Kayıt olun veya giriş yapın, ardından sohbet etmeye başlayın.

## Ekran Görüntüleri

