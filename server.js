require('dotenv').config()

const express = require('express')
const app = express()
const mongoose = require('mongoose')
const ejs = require('ejs')

app.set('view engine', 'ejs')

mongoose.connect(process.env.DATABASE_URL, { useNewUrlParser: true, useUnifiedTopology: true } )
const db = mongoose.connection
db.on('error', (error) => console.error(error))
db.once('open', () => console.log('Connected to Database'))

const winesSchema = {
    name: String,
    country: String,
    region: String,
    price: Number,
    year: Number
}

const Wine = mongoose.model('Wine', winesSchema)

app.get('/', (req, res) => {
    Wine.find({}, function(err, wines) {
        res.render('index', {
            winesList: wines
        })
    })
})

app.use(express.json())

const winesRouter = require('./routes/wines')
app.use('/wines', winesRouter)


app.listen(3000, () => console.log('Server Started'))
