const express = require('express');
const router = express.Router();
const db = require('../db');

// CREATE borrow record
router.post('/', (req, res) => {
  const { student_id, copy_id, borrow_date, due_date } = req.body;
  const sql = `INSERT INTO BorrowRecords (student_id, copy_id, borrow_date, due_date) VALUES (?, ?, ?, ?)`;
  db.query(sql, [student_id, copy_id, borrow_date, due_date], (err) => {
    if (err) return res.status(500).send(err);
    res.send('Borrow record added');
  });
});

// READ all borrow records
router.get('/', (req, res) => {
  db.query('SELECT * FROM BorrowRecords', (err, rows) => {
    if (err) return res.status(500).send(err);
    res.json(rows);
  });
});

// UPDATE return date
router.put('/:id', (req, res) => {
  const { return_date } = req.body;
  db.query('UPDATE BorrowRecords SET return_date = ? WHERE record_id = ?', [return_date, req.params.id], (err) => {
    if (err) return res.status(500).send(err);
    res.send('Return date updated');
  });
});

// DELETE record
router.delete('/:id', (req, res) => {
  db.query('DELETE FROM BorrowRecords WHERE record_id = ?', [req.params.id], (err) => {
    if (err) return res.status(500).send(err);
    res.send('Borrow record deleted');
  });
});

module.exports = router;
