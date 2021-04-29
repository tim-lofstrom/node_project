import express from 'express';

const app = express();
const port = 3000;

app.use('/', express.static('client/dist/client'));

app.use('/api', (req, res) => {
    res.send("Hello!");
});

app.listen(port, () => {
    console.log("Listening on port: ", port);
});
