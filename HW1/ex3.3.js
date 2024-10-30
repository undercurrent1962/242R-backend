const express = require('express');
const app = express();
const port = 3000;

app.get('/factorial', (req, res) => {
    res.redirect(`/factorial/${req.query.number}`);
});

app.get('/factorial/:number', (req, res) => {
    const number = parseInt(req.params.number);
    let factorial = 1;
    for (let i = 1; i <= number; i++) {
        factorial *= i;
    }
    res.send(factorial.toString());
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));