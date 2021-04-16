const mongoose = require('mongoose')

const wineSchema = new mongoose.Schema({
name: {
    type: String,
    required: true
},
country: {
    type: String,
    required: true
},
region: {
    type: String,
    required: true
},
reserve: {
    type: Boolean,
    required: false
},
price: {
    type: Number,
    required: true
},
year: {
    type: Number,
    required: true
},
type: {
    type: String,
    required: false
}

})

module.exports = mongoose.model('wine', wineSchema)