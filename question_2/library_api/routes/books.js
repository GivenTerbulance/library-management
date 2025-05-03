const express = require('express');
const router = express.Router();
const db = require('../db');

// CREATE book
router.post('/', (req, res) => {
  const { title, author, publisher, category_id, published_year } = req.body;
  const sql = `INSERT INTO Books (title, author, publisher, category_id, published_year) VALUES (?, ?, ?, ?, ?)`;
  db.query(sql, [title, author, publisher, category_id, published_year], (err) => {
    if (err) return res.status(500).send(err);
    res.send('Book added');
  });
});

// READ all books
router.get('/', (req, res) => {
  db.query('SELECT * FROM Books', (err, rows) => {
    if (err) return res.status(500).send(err);
    res.json(rows);
  });
});

// UPDATE book
router.put('/:id', (req, res) => {
  const { title, author } = req.body;
  db.query('UPDATE Books SET title = ?, author = ? WHERE book_id = ?', [title, author, req.params.id], (err) => {
    if (err) return res.status(500).send(err);
    res.send('Book updated');
  });
});

// DELETE book
router.delete('/:id', (req, res) => {
  db.query('DELETE FROM Books WHERE book_id = ?', [req.params.id], (err) => {
    if (err) return res.status(500).send(err);
    res.send('Book deleted');
  });
});

module.exports = router;
