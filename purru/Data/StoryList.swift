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
           title: "Story 1",
           description: "Description 1",
           thumbnail: "",
           sceneName: "3DAssetS1",
           sceneExtension: "scn",
           backsound: "backsound-story1",
           backsoundExtention: "mp3",
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
                   narationSound: "narasi0",
                   narationSoundExtention: "mp3",
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
                   camera: Camera(
                    worldPosition: SCNVector3(x: -20, y: 161.625, z: 300),
                    worldOrientation: SCNQuaternion(x: -0.15020624, y: -0.052591953, z: -0.008001905, w: 0.98722243)
                   ),
                   narationDuration: 32,
                   taskDuration: 24,
                   tutorialDuration: 15,
                   narationSound: "narasi1",
                   narationSoundExtention: "mp3",
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
                   camera: Camera(
                    worldPosition: SCNVector3(x: 313.56372, y: 159.99977, z: 102.63094),
                    worldOrientation: SCNQuaternion(x: -0.035320174, y: 0.58635354, z: 0.025595589, w:  0.80888)
                   ),
                   narationDuration: 40,
                   taskDuration: 30,
                   tutorialDuration: 15,
                   narationSound: "narasi2",
                   narationSoundExtention: "mp3",
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
                   camera: Camera(
                    worldPosition: SCNVector3(x:-122.73445, y: 119.99984, z:-131.6167),
                    worldOrientation: SCNQuaternion(x: 0.015983317, y: 0.92953205, z: 0.040585518, w: -0.36615202)
                   ),
                   narationDuration: 32,
                   taskDuration: 25.5,
                   tutorialDuration: 15,
                   narationSound: "narasi3",
                   narationSoundExtention: "mp3",
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
                   camera: Camera(
                    worldPosition: SCNVector3(x:7.269193, y: 49.99996, z: 149.79382),
                    worldOrientation: SCNQuaternion(x: -0.04360657, y: 0.024219517, z: 0.00105724, w: 0.9987546)
                   ),
                   narationDuration: 34,
                   taskDuration: 24,
                   tutorialDuration: 15,
                   narationSound: "narasi4",
                   narationSoundExtention: "mp3",
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
                   camera: Camera(
                    worldPosition: SCNVector3(x:-122.73445, y: 119.99984, z:-131.6167),
                    worldOrientation: SCNQuaternion(x: 0.015983317, y: 0.92953205, z: 0.040585518, w: -0.36615202)
                   ),
                   narationDuration: 40,
                   taskDuration: 0,
                   tutorialDuration: 0,
                   narationSound: "narasi5",
                   narationSoundExtention: "mp3",
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
           isTutorial: true
       ),
       StoryData(
           id: "2",
           title: "Story 2",
           description: "Description 1",
           thumbnail: "",
           sceneName: "3DAssetS1",
           sceneExtension: "scn",
           backsound: "backsound-story1",
           backsoundExtention: "mp3",
           objectList: [
               ObjectScene(
                   title: "Object 1",
                   description: "Description 1",
                   hint: "Hint 1",
                   tag: "Cube_001",
                   type: ObjectType.Task,
                   narationDuration: 15,
                   taskDuration: 30,
                   tutorialDuration: 20,
                   narationSound: "",
                   narationSoundExtention: "mp3",
                   instructionList: [
                       Instruction(id: "1", text: "Narasi 1",  startedAt: 0),
                       Instruction(id: "1",text: "Narasi 2", startedAt: 5),
                       Instruction(id: "1",text: "Narasi 3", startedAt: 10)
                   ]
               )
           ]
       )
   ]
