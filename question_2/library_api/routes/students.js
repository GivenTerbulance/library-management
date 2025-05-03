const express = require('express');
const router = express.Router();
const db = require('../db');

// CREATE student
router.post('/', (req, res) => {
  const { student_id, student_name, email, department, enrollment_year, course_id } = req.body;
  const sql = `INSERT INTO Student VALUES (?, ?, ?, ?, ?, ?)`;
  db.query(sql, [student_id, student_name, email, department, enrollment_year, course_id], (err, result) => {
    if (err) return res.status(500).send(err);
    res.send('Student added');
  });
});

// READ all students
router.get('/', (req, res) => {
  db.query('SELECT * FROM Student', (err, rows) => {
    if (err) return res.status(500).send(err);
    res.json(rows);
  });
});

// UPDATE student
router.put('/:id', (req, res) => {
  const { student_name, email } = req.body;
  db.query('UPDATE Student SET student_name = ?, email = ? WHERE student_id = ?', [student_name, email, req.params.id], (err) => {
    if (err) return res.status(500).send(err);
    res.send('Student updated');
  });
});

// DELETE student
router.delete('/:id', (req, res) => {
  db.query('DELETE FROM Student WHERE student_id = ?', [req.params.id], (err) => {
    if (err) return res.status(500).send(err);
    res.send('Student deleted');
  });
});

module.exports = router;
