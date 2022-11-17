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
           ], isTutorial: true, height: 10
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
                description: "Narasi 1",
                hint: "Temukan tanaman herbal",
                tag: "1TANAMAN",
                type: ObjectType.Task,
                narationDuration: 124,
                taskDuration: 20,
                tutorialDuration: 0,
                narationSound: "Narasi-Story2-1",
                narationSoundExtention: "mp3",
                soundEffect: "SFX_1TANAMAN",
                soundEffectExtention: "mp3",
                instructionList: [
                    Instruction(id: "1", text: "",  startedAt: 0),
                    Instruction(id: "2", text: "Oh halo!",  startedAt: 1.3),
                    Instruction(id: "3",text: "Beruntung sekali kamu dapat menemukan perpustakaan yang spesial ini", startedAt: 4),
                    Instruction(id: "4",text: "Masuklah! Pasti kamu lelah Setelah beraktivitas seharian", startedAt: 12.4),
                    Instruction(id: "5",text: "Saya akan bercerita tentang perpustakaan tua ini", startedAt: 21.2),
                    Instruction(id: "6",text: "Perpustakaan ini adalah peninggalan nenek saya", startedAt: 29),
                    Instruction(id: "7",text: "dulunya, nenek saya adalah seorang penyihir", startedAt: 36),
                    Instruction(id: "8",text: "Sebagian besar waktunya dihabiskan di perpustakaan ini", startedAt: 42.6),
                    Instruction(id: "9",text: "untuk belajar membuat berbagai macam ramuan obat", startedAt: 49.8),
                    Instruction(id: "10",text: "Karena itu, beliau membuat suasana perpustakaan ini senyaman mungkin", startedAt: 57),
                    Instruction(id: "11",text: "Karpet merah yang lembut, dan lilin-lilin dinyalakan, agar suasana disini semakin hangat dan nyaman.", startedAt: 67),
                    Instruction(id: "12",text: "Satu hal yang paling saya ingat dari perpustakaan ini", startedAt: 81.5),
                    Instruction(id: "13",text: "adalah wanginya yang sangat istimewa", startedAt: 86.4),
                    Instruction(id: "14",text: "Saat masuk entah kenapa bau perpustakaan ini sangat mencolok", startedAt: 92.2),
                    Instruction(id: "15",text: "aku tidak tahu apa baunya tapi baunya sangat enak", startedAt: 100.3),
                    Instruction(id: "16",text: "Mungkin, karena nenekku hanya menggunakan tanaman herbal untuk membuat ramuan obat.", startedAt: 108.5),
                    Instruction(id: "17",text: "Bisakah kamu menemukan asal bau wangi ini?", startedAt: 118.5)
                ]
            ),
            ObjectScene(
                title: "Temukan buku resep nenek",
                description: "Narasi 2",
                hint:  "Temukan buku resep nenek",
                tag: "2BUKU",
                type: ObjectType.Task,
                narationDuration: 73,
                taskDuration: 20,
                tutorialDuration: 0,
                narationSound: "Narasi-Story2-2",
                narationSoundExtention: "mp3",
                soundEffect: "SFX_2BUKU",
                soundEffectExtention: "mp3",
                instructionList: [
                    Instruction(id: "1", text: "",  startedAt: 0),
                    Instruction(id: "2", text: "Ah, ternyata perpaduan wangi bunga aster, lavender, dan bawang putih",  startedAt: 0.5),
                    Instruction(id: "3",text: "yang menjadikan wangi perpustakaan ini sangat mencolok", startedAt: 10.7),
                    Instruction(id: "4",text: "Tanaman yang kukira tidak berguna ini ternyata bisa jadi obat herbal yang manjur di tangan nenek", startedAt: 17.7),
                    Instruction(id: "5",text: "Perpustakaan ini menyimpan semua koleksi buku milik nenek", startedAt: 29.8),
                    Instruction(id: "6",text: "Nenek sangat pandai membuat ramuan obat herbal karena beliau banyak membaca", startedAt: 38.1),
                    Instruction(id: "7",text: "Dari semua buku bacaan milik nenek,", startedAt: 48.5),
                    Instruction(id: "8",text: "Ia rangkum menjadi dua buku yang menjadi buku resepnya", startedAt: 52.4),
                    Instruction(id: "9",text: "Kurasa kedua buku resep tersebut ditumpuk di atas meja kerja", startedAt: 61.2),
                    Instruction(id: "10",text: "Coba temukan buku resepnya itu", startedAt: 69.4),
                ]
            ),
            ObjectScene(
                title: "Temukan Papan",
                description: "Narasi 3",
                hint:"Temukan Papan",
                tag: "3PAPAN",
                type: ObjectType.Task,
                narationDuration: 23,
                taskDuration: 20,
                tutorialDuration: 0,
                narationSound: "Narasi-Story2-3",
                narationSoundExtention: "mp3",
                soundEffect: "SFX_3PAPAN",
                soundEffectExtention: "mp3",
                instructionList: [
                    Instruction(id: "1", text: "",  startedAt: 0),
                    Instruction(id: "2", text: "Kamu juga pasti bisa membuat ramuan obat jika membaca buku resep milik nenek ini",  startedAt: 0.7),
                    Instruction(id: "3",text: "Dulu nenekku juga menggunakan papan besar untuk menempelkan catatan eksperimen untuk resep obat pribadinya", startedAt: 10.8),
                    Instruction(id: "4",text: "Bisakah kamu temukan papan itu?", startedAt: 22.8)
                ]
            ),
            ObjectScene(
                title: "Temukan Kursi",
                description: "Narasi 4",
                hint: "Temukan Kursi",
                tag: "4KURSI",
                type: ObjectType.Task,
                narationDuration: 38,
                taskDuration: 20,
                tutorialDuration: 0,
                narationSound: "Narasi-Story2-4",
                narationSoundExtention: "mp3",
                soundEffect: "SFX_4KURSI",
                soundEffectExtention: "mp3",
                instructionList: [
                    Instruction(id: "1", text: "",  startedAt: 0),
                    Instruction(id: "2", text: "Saat aku Kecil,",  startedAt: 0.6),
                    Instruction(id: "3",text: "nenek melarangku mengotak-atiknya karena katanya banyak catatan penting", startedAt: 2.8),
                    Instruction(id: "4",text: "Ah, Aku sungguh merindukan momen-momen bersamanya", startedAt: 11.8),
                    Instruction(id: "5",text: "Aku senang sekali menemani nenek,", startedAt: 19.7),
                    Instruction(id: "6",text: "dan aku tau beliau juga pasti senang saat aku menemaninya", startedAt: 23.3),
                    Instruction(id: "7",text: "Sampai-sampai dia membuatkan kursi untuk kami duduk bersama", startedAt: 30.8)
                ]
            ),
            ObjectScene(
                title: "Temukan Hugo",
                description: "Narasi 5",
                hint: "Temukan Hugo",
                tag: "5HUGO",
                type: ObjectType.Task,
                narationDuration: 26,
                taskDuration: 20,
                tutorialDuration: 0,
                narationSound: "Narasi-Story2-5",
                narationSoundExtention: "mp3",
                soundEffect: "SFX_5HUGO",
                soundEffectExtention: "mp3",
                instructionList: [
                    Instruction(id: "1", text: "",  startedAt: 0),
                    Instruction(id: "2", text: "Di perpustakaan ini, banyak bulu burung hantu yang berceceran di mana-mana,",  startedAt: 0.9),
                    Instruction(id: "3",text: "aku belum sempat membersihkannya.", startedAt: 9.9),
                    Instruction(id: "4",text: "Nenek memelihara seekor burung hantu,", startedAt: 14.4),
                    Instruction(id: "5",text: "namanya Hugo.", startedAt: 18),
                    Instruction(id: "6",text: "Bulunya putih bersih dan sangat-sangat halus", startedAt: 20.8)
                ]
            ),
            ObjectScene(
                title: "Temukan tiang burung",
                description: "Narasi 6",
                hint: "Temukan tiang burung",
                tag: "6TIANG",
                type: ObjectType.Task,
                narationDuration: 38,
                taskDuration: 20,
                tutorialDuration: 0,
                narationSound: "Narasi-Story2-6",
                narationSoundExtention: "mp3",
                soundEffect: "SFX_6TIANG",
                soundEffectExtention: "mp3",
                instructionList: [
                    Instruction(id: "1", text: "",  startedAt: 0),
                    Instruction(id: "2", text: "Hugo sangat setia, dia sudah seperti penjaga perpustakaan ini",  startedAt: 0.6),
                    Instruction(id: "3",text: "Saat Hugo masih kecil, nenek menyelamatkannya dari pemburu", startedAt: 9.2),
                    Instruction(id: "4",text: "Hugo juga sangat aktif dan pintar,", startedAt: 16.9),
                    Instruction(id: "5",text: "saat nenek bekerja, Hugo selalu ditempatkannya di tiang burung,", startedAt: 21.4),
                    Instruction(id: "6",text: "tapi dia lebih suka berkeliaran di perpustakaan ini", startedAt: 28.6),
                    Instruction(id: "7",text: "Coba temukan tiang burung itu", startedAt: 35.1)
                ]
            ),
            ObjectScene(
                title: "Ending",
                description: "Narasi 7",
                hint: "Hint 1",
                tag: "",
                type: ObjectType.Ending,
                narationDuration: 64,
                taskDuration: 20,
                tutorialDuration: 0,
                narationSound: "Narasi-Story2-7",
                narationSoundExtention: "mp3",
                soundEffect: "",
                soundEffectExtention: "",
                instructionList: [
                    Instruction(id: "1", text: "",  startedAt: 0),
                    Instruction(id: "2", text: "Nenek membuat sendiri tiang burung ini",  startedAt: 1.1),
                    Instruction(id: "3",text: "Sangat detail dan kokoh", startedAt: 5.6),
                    Instruction(id: "4",text: "Sudah hampir 10 tahun sejak nenek berhenti bekerja", startedAt: 10.1),
                    Instruction(id: "5",text: "namun barang-barang disini masih sama seperti 10 tahun lalu", startedAt: 15.5),
                    Instruction(id: "6",text: "tidak ada yang berubah", startedAt: 22.9),
                    Instruction(id: "7",text: "Kamu boleh menghabiskan lebih banyak waktu di sini melihat-lihat,", startedAt: 26.6),
                    Instruction(id: "8",text: "semoga kamu menikmati kunjunganmu ke perpustakaan ini", startedAt: 33.8),
                    Instruction(id: "9",text: "hingga saatnya kamu tidur,", startedAt: 41.1),
                    Instruction(id: "10",text: "cobalah untuk mengenang momen-momen bersama orang yang kamu cintai", startedAt: 44.1),
                    Instruction(id: "11",text: "Aku dengar, itu dapat membantu untuk bisa lebih rileks", startedAt: 52.4),
                    Instruction(id: "12",text: "Semoga malammu tenang", startedAt: 60.5)
                ]
            )
           ], height: 1
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
           description: "Menemukan burung yang berukuran sangat kecil seperti burung miliknya Dips",
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
