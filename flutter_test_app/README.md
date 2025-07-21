📱 TestApp – Temel Flutter UI Yapı Taşlarıyla Tanışın
Bu proje, Flutter kullanarak temel UI bileşenlerinin nasıl yapılandırılacağını gösteren örnek bir uygulamadır. StatelessWidget, Container, Row, Column, Expanded, Flexible, FloatingActionButton gibi Flutter’ın kritik widget'larının pratik kullanımı anlatılmaktadır. Özellikle UI yerleşimi, hizalama, renk yönetimi ve etkileşimli butonların işleyişi gibi konulara odaklanılmıştır.

🚀 Amaç ve Kullanım Senaryosu
Bu demo; Flutter öğrenmeye yeni başlayanların, UI bileşenlerini görsel ve kod düzeyinde anlaması için tasarlanmıştır. Mobil arayüz tasarımının temel yapı taşlarını tanımak ve MaterialApp iskeleti içerisinde nasıl bir yapı kurulacağını gözlemlemek isteyenler için idealdir.

🔧 Kapsanan Konular ve Öğrenilenler:

Konu	: Açıklama
StatelessWidget kullanımı: 	Basit bir uygulama mantığıyla widget ağacını tanımlama
Container ile UI elemanları:	Renk, boyut, margin ve padding gibi stil özelliklerinin nasıl tanımlandığı
Row ve Column yapıları:	Yatay ve dikey yerleşimlerin nasıl kontrol edildiği
Flexible & Expanded farkı	: Alan yönetimi ve ekran taşmalarının optimize edilmesi
FloatingActionButton etkileşimi:	Basit bir butonun nasıl işlevsel hale getirileceği
AppBar ve Scaffold yapısı:	Sayfa iskeletinin kurulumu ve üst başlık barının tanımlanması
Debug mesajları (debugPrint):	Buton etkileşiminde geri bildirim mekanizmaları

🧱 Widget Hiyerarşisi Örneği
Uygulama aşağıdaki temel bileşenleri içerir:

MaterialApp

  Scaffold

   AppBar

   Body: Row -> Flexible Containers

   FloatingActionButton

📷 Ekran Özelliği
Butona tıklanınca konsola "Buton tıklandı" mesajı yazdırılır. Icon olarak Icons.add_a_photo_outlined kullanılmıştır.

🧑‍💻 Geliştirici Notu
Kodun okunabilirliğini artırmak için:

Tüm container yapıları margin ve padding ile tasarlanmıştır.

UI yerleşimi, esnek alanlarla (Flexible, Expanded) yönetilmiştir.

myContainer, myMainColumn gibi yapılandırılmış yardımcı metodlarla kod parçalara ayrılmıştır.
