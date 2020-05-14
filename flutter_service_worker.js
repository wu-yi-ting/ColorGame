'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "03d0e33555b125fabbeaa4ba894ed99a",
"main.dart.js": "6555510e583625155ace4925d14665c4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "4bc0dc76220544d183c7a971ed4fa044",
"assets/LICENSE": "e7839d8e6b526b7b482c8ef8a6387649",
"assets/images/game.jpg": "08d4670dad1beeef1447e381df8967f5",
"assets/images/bg1.jpg": "94b720f79b62bc8209d214500afa99ed",
"assets/images/bg.jpg": "30f7a25876085e4b7b9114292f3c743d",
"assets/AssetManifest.json": "5deb7ae7a9bf8f805ab352094fd5c88d",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
