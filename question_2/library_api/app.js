const express = require('express');
const app = express();
const port = 3000;

const studentRoutes = require('./routes/students');
const bookRoutes = require('./routes/books');
const borrowRoutes = require('./routes/borrowRecords');

app.use(express.json());
app.get('/', (req, res) => {
    res.json({
      message: 'Library API is active',
      serverTime: new Date(),
      uptime: process.uptime() + ' seconds'
    });
  });
  
app.use('/students', studentRoutes);
app.use('/books', bookRoutes);
app.use('/borrow', borrowRoutes);

app.listen(port, () => {
  console.log(`Library API running on http://localhost:${port}`);
});
