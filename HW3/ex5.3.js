const express = require('express');
const app = express();
const port = 3000;

const { runQuery } = require('./database');

app.get('/fare', async (req, res) => {
    try {
        const uid = req.query.uid;
        const sql = 'SELECT sum(round(types.fare_rate / 1000 * trains.distance, -2)) AS total_fare, users.name ' +
            'FROM tickets ' +
            'INNER JOIN users ON tickets.user = users.id ' +
            'INNER JOIN trains ON tickets.train = trains.id ' +
            'INNER JOIN types ON trains.type = types.id ' +
            'WHERE users.id = ?;';
        const result = await runQuery(sql, [uid]);
        res.send(`Total fare of ${result[0].name} is ${result[0].total_fare} KRW.`);
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal server error');
        return;
    }
});

app.get('/train/status', async (req, res) => {
    try {
        const tid = req.query.tid;
        const sql = 'SELECT trains.id, count(tickets.train) AS occupied, types.max_seats AS maximum ' +
            'FROM trains ' +
            'INNER JOIN types ON trains.type = types.id ' +
            'LEFT OUTER JOIN tickets ON trains.id = tickets.train ' +
            'WHERE trains.id = ?;';
        const result = await runQuery(sql, [tid]);
        if (result[0].occupied < result[0].maximum) {
            res.send(`Train ${result[0].id} is not sold out`);
        }
        else {
            res.send(`Train ${result[0].id} is sold out`);
        }

    }
    catch (error) {
        console.error(error);
        res.status(500).send('Internal server error');
        return;
    }
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));