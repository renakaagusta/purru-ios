//
//  Data.swift
//  purru
//
//  Created by renaka agusta on 02/11/22.
//

import Foundation
import SceneKit

var storyList = [
       StoryData(
           id: "1",
           title: "Bengkel Pandai Besi",
           description: "Suatu malam di dalam hutan terdengar suara misterius dari sebuah bengkel pandai besi. Mengapa ada bengkel pandai besi di dalam hutan? Siapakah pemilik bengkel tersebut?",
           thumbnail: "AhliBesi",
           thumbnailSize: 400,
           modalCover:"CoverModalS1",
           sceneName: "AhliBesi",
           sceneExtension: "scn",
           particleTouch: "ParticleTouch",
           particleEnding: "ParticleEndingView",
           backsound: "backsound-story1",
           backsoundExtention: "mp3",
           backsoundVolumeFactor: 0.5,
           narationVolumeFactor: 1,
           skyBox: SkyBox(px: "px", py: "py", pz: "pz", nx: "nx", ny: "ny", nz: "nz"),
           objectList: [
               ObjectScene(
                   title: "Temukan palu",
                   objectName: "palu",
                   description: "Temukan palu",
                   hint: "Temukan",
                   tag: "1PALU",
                   type: ObjectType.Task,
                   narationDuration: 110,
                   taskDuration: 20,
                   tutorialDuration: 0,
                   narationSound: "Narasi-Story1-1",
                   narationSoundExtention: "mp3",
                   soundEffect: "SFX_1PALU",
                   soundEffectExtention: "mp3",
                   instructionList: [
                       Instruction(id: "1", text: "", startedAt: 0),
                       Instruction(id: "2", text: "Pada suatu malam,", startedAt: 1.4),
                       Instruction(id: "3", text: "kamu sedang berjalan di sebuah hutan", startedAt: 4.9),
                       Instruction(id: "4", text: "Tiba” kamu mendengar sebuah dentuman, dentuman suara besi yang cukup keras.", startedAt: 9.3),
                       Instruction(id: "5", text: "Kamu berjalan lebih dalam menyusuri hutan dan menemukan sebuah bengkel pandai besi", startedAt: 20.1),
                       Instruction(id: "6", text: "Entah mengapa ada bengkel pandai besi di dalam hutan.", startedAt: 31.1),
                       Instruction(id: "7", text: "Kamu bisa mendengar suara percikan api dari perapian", startedAt: 39.5),
                       Instruction(id: "8", text: "serta dengungan yang asing dari kejauhan.", startedAt: 47.7),
                       Instruction(id: "9", text: "Bengkel ini seperti baru saja ditinggalkan saat seseorang atau sesuatu sedang bekerja", startedAt: 54.8),
                       Instruction(id: "10",text: "Mungkinkah kurcaci?", startedAt: 68.4),
                       Instruction(id: "11",text: "Karena ukuran bengkel yang tidak begitu tinggi dan tidak begitu besar", startedAt: 72),
                       Instruction(id: "12",text: "Atau peri yang tidak kasat mata?", startedAt: 81.2),
                       Instruction(id: "13",text: "Dentuman besi yang kamu dengar tadi pasti berasal dari sebuah palu yang ditinggalkan", startedAt: 86.9),
                       Instruction(id: "14",text: "Saat tengah menempa sebuah besi tua", startedAt: 94.9),
                       Instruction(id: "15",text: "Bisakah kamu menemukan palu, sumber suara dentuman yang kamu dengar itu?", startedAt: 101.8),
                   ]
               ),
               ObjectScene(
                   title: "Temukan buku",
                   objectName: "buku",
                   description: "Temukan buku",
                   hint: "Temukan",
                   tag: "2BOOK",
                   type: ObjectType.Task,
                   narationDuration: 63.2,
                   taskDuration: 20,
                   tutorialDuration: 0,
                   narationSound: "Narasi-Story1-2",
                   narationSoundExtention: "mp3",
                   soundEffect: "SFX_2BOOK",
                   soundEffectExtention: "mp3",
                   instructionList: [
                       Instruction(id: "1", text: "", startedAt: 0),
                       Instruction(id: "2", text: "Aneh sekali palu ini melayang di udara seakan-akan waktu sedang terhenti,", startedAt: 1.6),
                       Instruction(id: "3",text: "Bahkan percikan api masih terlihat beterbangan", startedAt: 14),
                       Instruction(id: "4",text: "Percikan itu diam tidak bergerak, dan masih terasa hangat ditengah dinginnya malam.", startedAt: 22.7),
                       Instruction(id: "5",text: "Tampaknya pandai besi ini juga meninggalkan sebuah buku yang terbuka di atas meja kayu disebelah perapian.", startedAt: 38.5),
                       Instruction(id: "6",text: "Buku yang terlihat sudah usang dan banyak noda abu tetapi masih digunakan", startedAt: 53.2),
                   ]
               ),
               ObjectScene(
                   title: "Temukan roda",
                   objectName: "roda",
                   description: "Temukan roda",
                   hint: "Temukan",
                   tag: "3RODA",
                   type: ObjectType.Task,
                   narationDuration: 40,
                   taskDuration: 25.5,
                   tutorialDuration: 0,
                   narationSound: "Narasi-Story1-3",
                   narationSoundExtention: "mp3",
                   soundEffect: "SFX_3RODA",
                   soundEffectExtention: "mp3",
                   instructionList: [
                       Instruction(id: "1", text: "", startedAt: 0),
                       Instruction(id: "2", text: "Rupanya Buku ini berisi sketsa kereta kuda yang sangat menawan dengan segala macam bagiannya.", startedAt: 0.5),
                       Instruction(id: "3",text: "Salah satu bagian dari kereta kuda yang tampak sudah selesai dibuat", startedAt: 16.4),
                       Instruction(id: "4",text: "Adalah roda yang terbuat dari kayu dan berlapiskan besi", startedAt: 23),
                       Instruction(id: "5",text: "Roda yang pasti dibuat dengan seksama karena kokoh dan rapi", startedAt: 32),
                   ]
               ),
               ObjectScene(
                   title: "Temukan balok besi",
                   objectName: "balok besi",
                   description: "Temukan balok besi",
                   hint: "Temukan",
                   tag: "4BESI",
                   type: ObjectType.Task,
                   narationDuration: 20,
                   taskDuration: 20,
                   tutorialDuration: 0,
                   narationSound: "Narasi-Story1-4",
                   narationSoundExtention: "mp3",
                   soundEffect: "SFX_4BALOKBESI",
                   soundEffectExtention: "mp3",
                   instructionList: [
                       Instruction(id: "1",text: "", startedAt: 0),
                       Instruction(id: "2",text: "Menurut petunjuk dari buku,", startedAt: 0.1),
                       Instruction(id: "3",text: "untuk membuat sebuah roda seperti ini akan dibutuhkan tiga buah balok besi", startedAt: 3.9),
                       Instruction(id: "4",text: "Coba temukan tiga buah balok besi", startedAt: 14)
                   ]
               ),
               ObjectScene(
                   title: "Temukan potongan kayu",
                   objectName: "potongan kayu",
                   description: "Temukan potongan kayu",
                   hint: "Temukan",
                   tag: "5KAYU",
                   type: ObjectType.Task,
                   narationDuration: 87.4,
                   taskDuration: 20,
                   tutorialDuration: 0,
                   narationSound: "Narasi-Story1-5",
                   narationSoundExtention: "mp3",
                   soundEffect: "SFX_5POTONGANKAYU",
                   soundEffectExtention: "mp3",
                   instructionList: [
                       Instruction(id: "0",text: "", startedAt: 0),
                       Instruction(id: "1",text: "Balok-balok besi ini harus dipanaskan dengan api hingga membara", startedAt: 1.6),
                       Instruction(id: "2",text: "Kemudian ditempa bentuknya agar sesuai dengan ukuran bingkai roda.", startedAt: 11.3),
                       Instruction(id: "3",text: "Kemungkinan tidak hanya besi tempa yang dikerjakan oleh pandai besi,", startedAt: 21.7),
                       Instruction(id: "4",text: "Tetapi juga perlengkapan dari kayu.", startedAt: 30.7),
                       Instruction(id: "5",text: "Betul juga,", startedAt: 36.6),
                       Instruction(id: "6",text: "Perabot kayu di bengkel ini tidak lapuk maupun rapuh walaupun pasti sudah begitu lama usianya", startedAt: 39),
                       Instruction(id: "7",text: "Sosok pandai besi pasti sudah ahli dan berpengalaman,", startedAt: 53.3),
                       Instruction(id: "8",text: "Dan kayu yang digunakan tidak mungkin kayu sembarangan.", startedAt: 62),
                       Instruction(id: "9",text: "Dia meletakkan potongan-potongan kayu pada sebuah kotak penyimpanan", startedAt: 69.6),
                       Instruction(id: "10",text: "Coba temukan kayu yang akan digunakan oleh pandai besi", startedAt: 79.6)
                   ]
               ),
               ObjectScene(
                   title: "Ending Story tutorial",
                   objectName: "",
                   description: "",
                   hint: "",
                   tag: "",
                   type: ObjectType.Ending,
                   narationDuration: 84,
                   taskDuration: 0,
                   tutorialDuration: 0,
                   narationSound: "Narasi-Story1-6",
                   narationSoundExtention: "mp3",
                   soundEffect: "",
                   soundEffectExtention: "",
                   instructionList: [
                       Instruction(id: "0",text: "", startedAt: 0),
                       Instruction(id: "1",text: "Bisa dibilang bengkel ini sangatlah rapi dan teratur.", startedAt: 1.6),
                       Instruction(id: "2",text: "Penerangan di malam hari hanya berasal dari lilin-lilin kecil yang diletakkan di lantai serta perapian hangat", startedAt: 10),
                       Instruction(id: "3",text: "Membuat suasana di sini sangat menenangkan, dengan suara-suara alam dari hutan", startedAt: 25.1),
                       Instruction(id: "4",text: "Tetapi walaupun menenangkan, suasana disini juga misterius", startedAt: 39),
                       Instruction(id: "5",text: "Karena tidak nampak sosok pemilik bengkel ini yang masih bekerja.", startedAt: 50),
                       Instruction(id: "6",text: "Sekarang segeralah beristirahat,", startedAt: 59),
                       Instruction(id: "7",text: "Karena esok hari kamu masih harus beraktivitas", startedAt: 64),
                       Instruction(id: "8",text: "Semoga kamu menikmati kunjunganmu ke bengkel pandai besi ini,", startedAt: 71),
                       Instruction(id: "9",text: "Dan malammu tenang.", startedAt: 79.7)
                   ]
               )
           ],
           //isTutorial: true,
           height: 1
       ),
       //story 2
       StoryData(
           id: "2",
           title: "Perpustakaan Penyihir",
           description: "Seorang pengelana yang menemukan sebuah ruangan kuno ajaib di sebuah kota kecil yang ia kunjungi. Siapa pemilik ruangan ini? Mengapa banyak barang-barang supranatural didalamnya?",
           thumbnail: "RuanganAjaib",
           thumbnailSize: 340,
           modalCover:"alcheworld",
           sceneName: "RuanganAjaib",
           sceneExtension: "scn",
           particleTouch: "2ParticleTouch",
           particleEnding: "2ParticleEndingView",
           backsound: "backsound-story2",
           backsoundExtention: "mp3",
           backsoundVolumeFactor: 0.3,
           narationVolumeFactor: 1,
           skyBox: SkyBox(px: "px.2", py: "py.2", pz: "pz.2", nx: "nx.2", ny: "ny.2", nz: "nz.2"),
           objectList: [
               ObjectScene(
                   title: "Temukan tanaman herbal",
                   objectName: "tanaman herbal",
                   description: "Narasi 1",
                   hint: "Temukan",
                   tag: "1TANAMAN",
                   type: ObjectType.Task,
                   narationDuration: 180,
                   taskDuration: 20,
                   tutorialDuration: 0,
                   narationSound: "Narasi-Story2-1",
                   narationSoundExtention: "mp3",
                   soundEffect: "SFX_1TANAMAN",
                   soundEffectExtention: "mp3",
                   instructionList: [
                       Instruction(id: "1", text: "",  startedAt: 0),
                       Instruction(id: "2", text: "Oh halo!",  startedAt: 1.1),
                       Instruction(id: "3",text: "Selamat datang di perpustakaan yang spesial ini", startedAt: 4.4),
                       Instruction(id: "4",text: "Masuklah! Pasti kamu lelah Setelah beraktivitas seharian", startedAt: 11.9),
                       Instruction(id: "5",text: "Aku akan bercerita tentang perpustakaan tua ini", startedAt: 22.5),
                       Instruction(id: "6",text: "Perpustakaan ini adalah peninggalan nenekku", startedAt: 34.4),
                       Instruction(id: "7",text: "dulunya, nenek saya adalah seorang penyihir", startedAt: 42.1),
                       Instruction(id: "8",text: "Seumur hidupnya dia habiskan di perpustakaan ini", startedAt: 51.2),
                       Instruction(id: "9",text: "untuk belajar meracik berbagai macam ramuan obat", startedAt: 59.9),
                       Instruction(id: "10",text: "Karena itu, dia menjadikan suasana perpustakaan ini senyaman mungkin", startedAt: 68.8),
                       Instruction(id: "11",text: "Karpet merah yang lembut bagaikan gulungan sutra", startedAt: 79.8),
                       Instruction(id: "12",text: "Dan lilin-lilin dinyalakan satu per satu", startedAt: 85.3),
                       Instruction(id: "13",text: "agar suasana disini semakin hangat dan nyaman.", startedAt: 93.8),
                       Instruction(id: "14",text: "Lihatlah sekelilingmu, dan coba rasakan lembutnya karpet ini saat kamu berjalan diatasnya,", startedAt: 104.1),
                       Instruction(id: "15",text: "Dan rasakan hangatnya lilin yang dinyalakan, semakin hangat dan semakin hangat.", startedAt: 120.3),
                       Instruction(id: "16",text: "Satu hal yang paling aku ingat dari perpustakaan ini.", startedAt: 135.8),
                       Instruction(id: "17",text: "adalah wangi istimewanya.", startedAt: 143),
                       Instruction(id: "18",text: "Rasanya seperti menghirup udara segar di taman bunga pada pagi hari", startedAt: 149.2),
                       Instruction(id: "19",text: "Mungkin, karena nenekku hanya menggunakan tanaman herbal untuk meracik ramuan obatnya.", startedAt: 160.8),
                       Instruction(id: "20",text: "Bisakah kamu menemukan asal bau wangi ini?", startedAt: 173.5)
                   ]
               ),
               ObjectScene(
                   title: "Temukan buku resep nenek",
                   objectName: "buku resep nenek",
                   description: "Narasi 2",
                   hint:  "Temukan",
                   tag: "2BUKU",
                   type: ObjectType.Task,
                   narationDuration: 97.6,
                   taskDuration: 20,
                   tutorialDuration: 0,
                   narationSound: "Narasi-Story2-2",
                   narationSoundExtention: "mp3",
                   soundEffect: "SFX_2BUKU",
                   soundEffectExtention: "mp3",
                   instructionList: [
                       Instruction(id: "1", text: "",  startedAt: 0),
                       Instruction(id: "2", text: "Ah, rupanya yang menjadikan wangi ruangan ini sangat istimewa adalah perpaduan wangi bunga aster, lavender, dan samar-samar aroma bawang putih",  startedAt: 0.2),
                       Instruction(id: "3",text: "Setiap sore, nenekku memetik tanaman-tanaman ini dan meraciknya menjadi obat herbal yang ampuh.", startedAt: 24.3),
                       Instruction(id: "4",text: "Nenekku pandai membuat ramuan obat herbal karena dia banyak membaca", startedAt: 40),
                       Instruction(id: "5",text: "Semua buku bacaan milik nenek, dirangkumnya menjadi dua buku", startedAt: 51.4),
                       Instruction(id: "6",text: "Buku resep itu sangat tebal dan sampulnya terbuat dari kulit yang terasa halus saat diraba", startedAt: 62.5),
                       Instruction(id: "7",text: "Kurasa kedua buku resep itu ditumpuk di atas meja kerja", startedAt: 79.1),
                       Instruction(id: "8",text: "Coba temukan dua buku itu", startedAt: 90.2)
                   ]
               ),
               ObjectScene(
                   title: "Temukan Papan",
                   objectName: "Papan",
                   description: "Narasi 3",
                   hint:"Temukan",
                   tag: "3PAPAN",
                   type: ObjectType.Task,
                   narationDuration: 51,
                   taskDuration: 20,
                   tutorialDuration: 0,
                   narationSound: "Narasi-Story2-3",
                   narationSoundExtention: "mp3",
                   soundEffect: "SFX_3PAPAN",
                   soundEffectExtention: "mp3",
                   instructionList: [
                       Instruction(id: "1", text: "",  startedAt: 0),
                       Instruction(id: "2", text: "Buku ini memang tebal dan terlihat kuno, tetapi saat kamu baca,",  startedAt: 0.1),
                       Instruction(id: "3",text: "kamu pasti bisa membuat ramuan obat karena isinya mudah dipahami.", startedAt: 11.4),
                       Instruction(id: "4",text: "Dulu nenekku juga sering menuliskan catatan eksperimennya,", startedAt: 23),
                       Instruction(id: "5",text: "Catatan-catatan itu dia tempel pada sebuah papan besar di ujung ruangan ini", startedAt: 31.1),
                       Instruction(id: "6",text: "Bisakah kamu temukan papan itu?", startedAt: 43.3)
                   ]
               ),
               ObjectScene(
                   title: "Temukan Kursi",
                   objectName: "Kursi",
                   description: "Narasi 4",
                   hint: "Temukan",
                   tag: "4KURSI",
                   type: ObjectType.Task,
                   narationDuration: 57.3,
                   taskDuration: 20,
                   tutorialDuration: 0,
                   narationSound: "Narasi-Story2-4",
                   narationSoundExtention: "mp3",
                   soundEffect: "SFX_4KURSI",
                   soundEffectExtention: "mp3",
                   instructionList: [
                       Instruction(id: "1", text: "",  startedAt: 0),
                       Instruction(id: "2", text: "Saat aku kecil, nenek melarangku mengotak-atik papan ini.",  startedAt: 0.6),
                       Instruction(id: "3",text: "Karena katanya, banyak catatan penting", startedAt: 8.4),
                       Instruction(id: "4",text: "Ah, Aku merindukan momen-momen bersama nenek", startedAt: 15.2),
                       Instruction(id: "5",text: "Aku senang sekali menemaninya,", startedAt: 23.5),
                       Instruction(id: "6",text: "dan aku tau nenek juga pasti senang", startedAt: 28),
                       Instruction(id: "7",text: "Sampai-sampai dia membuatkan kursi untuk kami duduk bersama", startedAt: 34.5),
                       Instruction(id: "8",text: "Karena kursi ini sudah tua, setiap kali kududuki kursi ini selalu berdecit", startedAt: 43.5)
                   ]
               ),
               ObjectScene(
                   title: "Temukan Hugo",
                   objectName: "Hugo",
                   description: "Narasi 5",
                   hint: "Temukan",
                   tag: "5HUGO",
                   type: ObjectType.Task,
                   narationDuration: 34,
                   taskDuration: 20,
                   tutorialDuration: 0,
                   narationSound: "Narasi-Story2-5",
                   narationSoundExtention: "mp3",
                   soundEffect: "SFX_5HUGO",
                   soundEffectExtention: "mp3",
                   instructionList: [
                       Instruction(id: "1", text: "",  startedAt: 0),
                       Instruction(id: "2", text: "Di perpustakaan ini, Banyak bulu burung hantu yang berceceran di mana-mana,",  startedAt: 0.3),
                       Instruction(id: "3",text: "aku belum sempat membersihkannya.", startedAt: 11.8),
                       Instruction(id: "4",text: "Oh iya, nenek memelihara seekor burung hantu,", startedAt: 16),
                       Instruction(id: "5",text: "Kami beri nama Hugo.", startedAt: 23),
                       Instruction(id: "6",text: "Bulunya putih bersih dan sangat-sangat halus", startedAt: 27.3)
                   ]
               ),
               ObjectScene(
                   title: "Temukan tiang burung",
                   objectName: "tiang burung",
                   description: "Narasi 6",
                   hint: "Temukan",
                   tag: "6TIANG",
                   type: ObjectType.Task,
                   narationDuration: 60,
                   taskDuration: 20,
                   tutorialDuration: 0,
                   narationSound: "Narasi-Story2-6",
                   narationSoundExtention: "mp3",
                   soundEffect: "SFX_6TIANG",
                   soundEffectExtention: "mp3",
                   instructionList: [
                       Instruction(id: "1", text: "",  startedAt: 0),
                       Instruction(id: "2", text: "Hugo adalah burung yang aktif dan pintar,",  startedAt: 0.4),
                       Instruction(id: "3", text: "Saat Hugo masih kecil, nenek menyelamatkannya dari pemburu",  startedAt: 7.5),
                       Instruction(id: "4",text: "Oleh karena itu dia menjadi peliharaan yang sangat setia, dia sudah seperti penjaga perpustakaan ini.", startedAt: 16.1),
                       Instruction(id: "5",text: "Hugo selalu ditempatkannya di tiang burung untuk menemani nenek bekerja,", startedAt: 32.5),
                       Instruction(id: "6",text: "walau sebenarnya dia lebih suka berkeliaran di perpustakaan ini.", startedAt: 43.9),
                       Instruction(id: "7",text: "Coba temukan tiang burung itu", startedAt: 54.1)
                   ]
               ),
               ObjectScene(
                   title: "Ending",
                   objectName: "",
                   description: "Narasi 7",
                   hint: "Hint 1",
                   tag: "",
                   type: ObjectType.Ending,
                   narationDuration: 76.4,
                   taskDuration: 20,
                   tutorialDuration: 0,
                   narationSound: "Narasi-Story2-7",
                   narationSoundExtention: "mp3",
                   soundEffect: "",
                   soundEffectExtention: "",
                   instructionList: [
                       Instruction(id: "1", text: "",  startedAt: 0),
                       Instruction(id: "2", text: "Nenek membuat sendiri tiang burung ini.",  startedAt: 0.5),
                       Instruction(id: "3",text: "Ukirannya sangat detail dan batangnya sangat kokoh.", startedAt: 5.7),
                       Instruction(id: "4",text: "Sudah hampir 10 tahun sejak nenek berhenti bekerja,", startedAt: 14.3),
                       Instruction(id: "5",text: "namun barang-barang disini masih sama, tidak ada yang berubah.", startedAt: 21.4),
                       Instruction(id: "6",text: "Kamu boleh menghabiskan lebih banyak waktu di sini melihat-lihat,", startedAt: 32.2),
                       Instruction(id: "7",text: "semoga kamu menikmati kunjunganmu ke perpustakaan ini.", startedAt: 41.2),
                       Instruction(id: "8",text: "hingga saatnya kamu tidur,", startedAt: 49.6),
                       Instruction(id: "9",text: "cobalah untuk mengenang momen-momen bersama orang yang kamu cintai.", startedAt: 53),
                       Instruction(id: "10",text: "Aku dengar, itu dapat membantu untuk bisa lebih rileks.", startedAt: 63.1),
                       Instruction(id: "11",text: "Semoga malammu tenang.", startedAt: 72.5)
                   ]
               )
           ],
           height: 1
       )
   ]

//
//  Data.swift
//  purru
//
//  Created by renaka agusta on 02/11/22.
//

import Foundation
import SceneKit

var storyListTab = [
       StoryTab(
           id: "1",
           title: "Bengkel Pandai Besi",
           description: "Suatu malam di dalam hutan terdengar suara misterius dari sebuah bengkel pandai besi. Mengapa ada bengkel pandai besi di dalam hutan? Siapakah pemilik bengkel tersebut?",
           thumbnail: "AhliBesi",
           thumbnailSize: 425,
           modalCover: "CoverModalS1",
           sceneName: "",
           sceneExtension: "",
           backsound: "backsound-story1",
           backsoundExtention: "mp3",
           isTutorial: true
       ),
       StoryTab(
           id: "2",
           title: "Perpustakaan Penyihir",
           description: "Seorang pengelana yang menemukan sebuah ruangang kuno ajaib di sebuah kota kecil yang ia kunjungi. Siapa pemilik ruangan ini? Mengapa banyak barang-barang supranatural didalamnya?",
           thumbnail: "RuanganAjaib",
           thumbnailSize: 360,
           modalCover:"alcheworld",
           sceneName: "3DAssetS1",
           sceneExtension: "scn",
           backsound: "backsound-story2",
           backsoundExtention: "mp3"
       )
   ]
