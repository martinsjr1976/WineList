const express = require('express')
const router = express.Router()
const Wine = require('../models/wines')

//Getting all
router.get('/', async (req, res) => {
    try {
        const wines = await Wine.find()
        res.json(wines)
    } catch (err) {
        res.status(500).json({ message: err.message })
    }
})

//Getting One
router.get('/:id', (req, res) => {

    
})

//Creating One
router.post('/', async (req, res) => {
    const wine = new Wine({
        name: req.body.name,
        country: req.body.country,
        region: req.body.region,
        price: req.body.price,
        year: req.body.year
    })
    try {
        const newWine = await wine.save()
        res.status(201).json(newWine)
    } catch (err) {
        res.status(400).json({ message: err.message})
    }
    
})

//Delete One
router.delete('/:id', (req, res) => {

    
})

module.exports = router