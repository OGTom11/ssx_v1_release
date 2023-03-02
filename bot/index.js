const { GatewayIntentBits } = require("discord.js")
const discord = require("discord.js")
const express = require("express")
const bootData = {};

const noblox = require("noblox")
const timestamp = require('time-stamp');

// firebase
const { initializeApp } = require("firebase/app")
const { doc, collection, addDoc, getFirestore } = require("firebase/firestore")

const client = new discord.Client({
    intents: [8]
});


client.on("ready", () => {
    console.log(`${client.user.tag} is now online.`)
    client.user.setPresence({ activities: [{ name: "with SSX_V1" }], status: 'idle' });
    const data = {
        name: "booted successfully",
        time: timestamp()
     };
    addDoc(dbRef, data)
})

const firebaseConfig = {
    apiKey: "AIzaSyD7eAOz9oGu1IHYIa9dUz86H58SX_Hs5ao",
    authDomain: "ssx-backend.firebaseapp.com",
    projectId: "ssx-backend",
    storageBucket: "ssx-backend.appspot.com",
    messagingSenderId: "1022880953809",
    appId: "1:1022880953809:web:90e87f6d504b935ea9dcf0",
}


const app = initializeApp(firebaseConfig);

const db = getFirestore(app);
const dbRef = collection(db, "booters");


client.login("MTA4MDU4MjQ1MjI5ODM5NTczOA.GsRk01.TGBMGDqGNUd4gN3dFRjoEPrVoD7uqnSZ07juo0")