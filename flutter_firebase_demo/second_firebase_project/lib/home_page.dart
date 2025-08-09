import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _firestore=FirebaseFirestore.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController ratingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    CollectionReference movieRaf=_firestore.collection('movies');
    var fatherRef = _firestore.collection('movies').doc('GodFather');



    return Scaffold(
      
      backgroundColor: Colors.grey[50],
      
      appBar: AppBar(
        
        title: const Text(
          'Firestore CRUD İşlemleri',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Text('${fatherRef.parent}',
            // style: TextStyle(fontSize: 24),),
            // ElevatedButton(onPressed: ()async{
            //   var response= await fatherRef.get();
            //   ///Document Snapshot nedir? 
            //   ///Document Snapshot içinden veriyi çıkarmamız lazım
            //   var map=response.data();
            //   print(map?['name']);
            // var response = await movieRaf.get();
            // var list= response.docs;
            //   print(list[0].data());
            // ///QuarySnapshot ????
            // ///List içinde neler var?
            
            // }, 
            // // child: Text('Get Data'))
            // child: Text('GET QUARY'),),
            
            // Film Listesi Container
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Header
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.movie,
                            color: Colors.deepPurple.shade600,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Film Listesi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // StreamBuilder
                    Expanded(
                      child: StreamBuilder/*<DocumentSnapshot>*/<QuerySnapshot>(
                        //Neyi Dinlediğimizin bilgisi
                        stream: /*fatherRef*/movieRaf.snapshots(), 
                        //Streamden heryeni veri aktardığında, aşağıdaki methodu çalıştır.
                        builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                          
                          if(asyncSnapshot.hasError){
                           return Center(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Icon(
                                   Icons.error,
                                   size: 48,
                                   color: Colors.red.shade400,
                                 ),
                                 const SizedBox(height: 16),
                                 Text(
                                   'Bir hata oluştu tekrar dene',
                                   style: TextStyle(
                                     fontSize: 16,
                                     color: Colors.red.shade600,
                                   ),
                                 ),
                               ],
                             ),
                           );
                          
                          }else{
                            if(asyncSnapshot.hasData){
                              List<DocumentSnapshot> listOfDocumentSnap =asyncSnapshot.data.docs;
                              
                              if (listOfDocumentSnap.isEmpty) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.movie_outlined,
                                        size: 48,
                                        color: Colors.grey.shade400,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        'Henüz film eklenmemiş',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              
                              return /*Text('${asyncSnapshot.data.data()}'*/ ListView.builder(
                                padding: const EdgeInsets.all(8),
                                itemCount: listOfDocumentSnap.length,
                                itemBuilder: (context,index){
                                  var movieData = listOfDocumentSnap[index].data() as Map<String, dynamic>;
                                  return Card(
                                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                      leading: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.deepPurple.shade100,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Icon(
                                          Icons.local_movies,
                                          color: Colors.deepPurple.shade600,
                                        ),
                                      ),
                                      title: Text(
                                        '${movieData['name']}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 16,
                                            color: Colors.amber.shade600,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${movieData['rating']}',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: IconButton(
                                        onPressed: ()async{
                                          //doküman referansına ulaş ve delete
                                          bool? confirm = await showDialog<bool>(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: const Text('Filmi Sil'),
                                              content: Text('${movieData['name']} filmini silmek istediğinizden emin misiniz?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () => Navigator.of(context).pop(false),
                                                  child: const Text('İptal'),
                                                ),
                                                TextButton(
                                                  onPressed: () => Navigator.of(context).pop(true),
                                                  child: const Text('Sil'),
                                                ),
                                              ],
                                            ),
                                          );
                                          
                                          if (confirm == true) {
                                            await listOfDocumentSnap[index].reference.delete();
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text('Film başarıyla silindi'),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                          }
                                        }, 
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red.shade400,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );

                            }else{
                              return const Center(child: CircularProgressIndicator());

                            }
                          }   
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Form Container
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: Colors.deepPurple.shade600,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Yeni Film Ekle',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple.shade800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Film Adı',
                        hintText: 'Film adını giriniz',
                        prefixIcon: const Icon(Icons.movie),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.deepPurple.shade400),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: ratingController,
                      decoration: InputDecoration(
                        labelText: 'Rating',
                        hintText: 'Rating giriniz',
                        prefixIcon: const Icon(Icons.star),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.deepPurple.shade400),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: ()async {
                          print(nameController.text);
                          print(ratingController.text);

                          //Text Alanlarındaki veriden bir map oluşturalım
                          Map<String, dynamic> movieData={
                            'name':nameController.text,
                            'rating':ratingController.text
                          };

                          //VEriyi yazmak istediğimiz referansa ulaşıcaz

                          await movieRaf.doc(nameController.text).set(movieData);
                          
                          nameController.clear();
                          ratingController.clear();
                          
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Film başarıyla eklendi'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add),
                            SizedBox(width: 8),
                            Text(
                              'Film Ekle',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}