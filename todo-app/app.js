const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());
app.use(express.static('public'));

let todos = [];

app.get('/todos', (req, res) => {
  res.json(todos);
});

app.post('/todos', (req, res) => {
  todos.push(req.body);
  res.status(201).send();
});

app.listen(port, () => {
  console.log(`To-do app listening at http://localhost:${port}`);
});