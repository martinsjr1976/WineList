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
router.get('/:id', getWine, (req, res) => {
    res.json(res.wine)

    
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
router.delete('/:id', getWine, async (req, res) => {
    try {
        await res.wine.remove()
        res.json({ message: 'Deleted Subscriber' })
    } catch (err) {
        res.status(500).json({ message: err.message })
    }
    
})

async function getWine (req, res, next) {
    let wine
    try {
        wine = await Wine.findById(req.params.id)
        if (wine == null) {
            return res.status(404).json({ message: 'Cannot find wine' })
        }
    } catch (err) {
        return res.status(500).json({ message: err.message })
}

res.wine = wine
next()
}

module.exports = router