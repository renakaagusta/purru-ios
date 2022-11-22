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
           title: "Taman Purru",
           description: "Bernostalgia di sebuah taman yang sangat indah dengan pohon-pohon berwarna warni yang memanjankan mata. Angin sepoi-sepoi, langit yang mendung, membuat suasana menjadi sangat nyaman.",
           thumbnail: "PohonKiki",
           modalCover:"tamanpurru",
           sceneName: "3DAssetS1",
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
                   title: "Object 1",
                   objectName: "",
                   description: "Description 1",
                   hint: "",
                   tag: "Cube_001",
                   type: ObjectType.Opening,
                   narationDuration: 37,
                   taskDuration: 0,
                   tutorialDuration: 0,
                   narationSound: "Narasi-Story1-1",
                   narationSoundExtention: "mp3",
                   soundEffect: "",
                   soundEffectExtention: "",
                   instructionList: [
                        Instruction(id: "1", text: "", startedAt: 0),
                        Instruction(id: "2", text: "Halo selamat malam", startedAt: 4.6),
                        Instruction(id: "3", text: "Malam ini saya akan membawa anda ke taman terindah di Purru", startedAt: 8.6),
                        Instruction(id: "4",text: "Tarik Nafas", startedAt: 17.8),
                        Instruction(id: "5",text: "Hembuskan", startedAt: 23),
                        Instruction(id: "6",text: "Apakah kamu sudah rileks? Kita akan berkeliling di taman ini dengan santai", startedAt: 27)
                   ]
               ),
               ObjectScene(
                   title: "Cari pohon biru",
                   objectName: "",
                   description: "Cari pohon biru",
                   hint: "Cari pohon biru",
                   tag: "BLUE",
                   type: ObjectType.Task,
                  
                   narationDuration: 32,
                   taskDuration: 24,
                   tutorialDuration: 15,
                   narationSound: "Narasi-Story1-2",
                   narationSoundExtention: "mp3",
                   soundEffect: "",
                   soundEffectExtention: "",
                   instructionList: [
                       Instruction(id: "1", text: "", startedAt: 0),
                       Instruction(id: "2", text: "Taman ini adalah tempat dimana saya sering bermain di masa kecil", startedAt: 2),
                       Instruction(id: "3",text: "Saya suka bermain di taman ini karena udaranya yang sangat menyejukan", startedAt: 7.5),
                       Instruction(id: "4",text: "Saat duduk bersandar di bawah pohon sembari membaca buku", startedAt: 13.9),
                       Instruction(id: "5",text: "Pohon tersebut berwarna biru dan memiliki banyak dahan", startedAt: 20.3),
                       Instruction(id: "6",text: "Bisakah kamu menemukan pohon tersebut?", startedAt: 28),
                       Instruction(id: "7",text: "Iya pohon biru itu yang ku maksud", startedAt: 57, gestureType: GestureType.Tap),
                       Instruction(id: "8",text: "Coba tekan pohon itu", startedAt: 61.2, gestureType: GestureType.Tap),
                   ]
               ),
               ObjectScene(
                   title: "Cari pohon kuning",
                   objectName: "",
                   description: "Cari pohon kuning",
                   hint: "Cari pohon kuning",
                   tag: "YELLOW",
                   type: ObjectType.Task,
                   narationDuration: 40,
                   taskDuration: 30,
                   tutorialDuration: 15,
                   narationSound: "Narasi-Story1-3",
                   narationSoundExtention: "mp3",
                   soundEffect: "",
                   soundEffectExtention: "",
                   instructionList: [
                       Instruction(id: "1", text: "", startedAt: 0),
                       Instruction(id: "2", text: "Wah benar sekali.. Itu pohon yang saya maksud. Sangat besar dan rindang bukan?", startedAt: 0.9),
                       Instruction(id: "3",text: "Salah satu pohon di taman ini menghasilkan buah yang sangat enak", startedAt: 11.5),
                       Instruction(id: "4",text: "Buahnya sangat manis dan berair. Di musim panas terasa sangat segar dan nikmat.", startedAt: 18.2),
                       Instruction(id: "5",text: "Sepanjang ingatan saya, pohon tersebut berwarna kuning.", startedAt: 27),
                       Instruction(id: "6",text: "Tapi, apakah pohon tersebut masih ada di taman ini?", startedAt: 33.9),
                       Instruction(id: "7",text: "Kamu bisa putar taman ini, untuk menemukan pohon kuning", startedAt: 69.6, gestureType: GestureType.SwipeHorizontal)
                   ]
               ),
               ObjectScene(
                   title: "Cari kiki si burung",
                   objectName: "",
                   description: "Cari kiki si burung",
                   hint: "Cari kiki si burung",
                   tag: "BIRD",
                   type: ObjectType.Task,
                   
                   narationDuration: 32,
                   taskDuration: 25.5,
                   tutorialDuration: 15,
                   narationSound: "Narasi-Story1-4",
                   narationSoundExtention: "mp3",
                   soundEffect: "",
                   soundEffectExtention: "",
                   instructionList: [
                       Instruction(id: "1", text: "", startedAt: 0),
                       Instruction(id: "2", text: "Wah jadi nostalgia. Biasanya saya berbagi buah yang sangat nikmat ini dengan hewan peliharaan saya", startedAt: 0.9),
                       Instruction(id: "3",text: "Saya sangat menyukai hewan", startedAt: 10.5),
                       Instruction(id: "4",text: "Dulu saya memelihara burung kaka tua bernama Kiki di taman ini", startedAt: 14.1),
                       Instruction(id: "5",text: "Entah mengapa, setiap hari saya hanya menemukan kiki diatas pohon berwarna merah", startedAt: 20.9),
                       Instruction(id: "6",text: "Apakah dia masih ada disana?", startedAt: 29),
                       Instruction(id: "7",text: "Iya, kiki  memang sangat kecil", startedAt: 58.5),
                       Instruction(id: "8",text: "Coba perbesar gambar untuk melihat Kiki", startedAt: 63, gestureType: GestureType.Zoom),
                   ]
               ),
               ObjectScene(
                   title: "Cari labu putih",
                   objectName: "",
                   description: "Cari labu putih",
                   hint: "Cari labu putih",
                   tag: "PUMPKIN",
                   type: ObjectType.Task,
                
                   narationDuration: 34,
                   taskDuration: 24,
                   tutorialDuration: 15,
                   narationSound: "Narasi-Story1-5",
                   narationSoundExtention: "mp3",
                   soundEffect: "",
                   soundEffectExtention: "",
                   instructionList: [
                       Instruction(id: "1",text: "Itu dia Kiki! Ini memang pohon kesukaanya", startedAt: 0),
                       Instruction(id: "2",text: "Pohon ini tidak terlalu tinggi tapi cukup untuk saya bisa bermain dengan Kiki", startedAt: 6.5),
                       Instruction(id: "3",text: "Kami sering menghabiskan waktu bersama di taman ini", startedAt: 15.3),
                       Instruction(id: "4",text: "Saya dan Kiki, meletakkan hiasan labu berwarna putih di taman ini sebagai tanda persahabatan kami", startedAt: 19.6),
                       Instruction(id: "5",text: "Coba temukan labu putih itu", startedAt: 30.2),
                       Instruction(id: "6", text: "Waktu itu memang saya masih pendek, sehingga labu itu hanya. bisa ku taruh di tanah", startedAt: 59, gestureType: GestureType.SwipeHorizontal),
                       Instruction(id: "7",text: "Coba geser taman ini, semoga labu itu masih ada disana", startedAt: 67.1, gestureType: GestureType.SwipeHorizontal)
                   ]
               ),
               ObjectScene(
                   title: "",
                   objectName: "",
                   description: "",
                   hint: "",
                   tag: "",
                   type: ObjectType.Ending,
                  
                   narationDuration: 40,
                   taskDuration: 0,
                   tutorialDuration: 0,
                   narationSound: "Narasi-Story1-6",
                   narationSoundExtention: "mp3",
                   soundEffect: "",
                   soundEffectExtention: "",
                   instructionList: [
                       Instruction(id: "1",text: "Wah kamu menemukannya!", startedAt: 0),
                       Instruction(id: "2",text: "Karena kamu telah menemukannya, kamu juga menjadi sahabat kami", startedAt: 5),
                       Instruction(id: "3",text: "Kamu dapat berkunjung kembali ke taman ini kapan saja dan bermain bersama kami", startedAt: 12),
                       Instruction(id: "4",text: "Itu saja yang dapat kuceritakan tentang taman ini", startedAt: 19.5),
                       Instruction(id: "5",text: "Selamat tidur! Semoga malam ini kamu bisa bermimimpi indah", startedAt: 23.8),
                       Instruction(id: "6",text: "Mungkin saja, saya dan Kiki akan menghampiri mimpumu", startedAt: 31.1),
                       Instruction(id: "7",text: "Sampai jumpa", startedAt: 37),
                   ]
               )
           ],
           isTutorial: true,
           height: 10
       ),
       StoryData(
           id: "2",
           title: "Perpustakaan Penyihir",
           description: "Seorang pengelana yang menemukan sebuah ruangan kuno ajaib di sebuah kota kecil yang ia kunjungi. Siapa pemilik ruangan ini? Mengapa banyak barang-barang supranatural didalamnya?",
           thumbnail: "RuanganAjaib",
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
                       Instruction(id: "11",text: "Semoga malammu tenang.", startedAt: 62.5)
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
           title: "Taman Purru",
           description: "Bernostalgia di sebuah taman yang sangat indah dengan pohon-pohon berwarna warni yang memanjankan mata. Angin sepoi-sepoi, langit yang mendung, membuat suasana menjadi sangat nyaman.",
           thumbnail: "PohonKiki",
           modalCover: "tamanpurru",
           sceneName: "3DAssetS1",
           sceneExtension: "scn",
           backsound: "backsound-story1",
           backsoundExtention: "mp3",
           isTutorial: true
       ),
       StoryTab(
           id: "2",
           title: "Perpustakaan Penyihir",
           description: "Seorang pengelana yang menemukan sebuah ruangang kuno ajaib di sebuah kota kecil yang ia kunjungi. Siapa pemilik ruangan ini? Mengapa banyak barang-barang supranatural didalamnya?",
           thumbnail: "RuanganAjaib",
           modalCover:"alcheworld",
           sceneName: "3DAssetS1",
           sceneExtension: "scn",
           backsound: "backsound-story2",
           backsoundExtention: "mp3"
       )
   ]
