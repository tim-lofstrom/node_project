import express from 'express';
const app = express();

app.get('/', (req, res) => {
    res.send("asd");
})

app.listen(3000, '127.0.0.1', function() {
    console.log("Server now listening on 3000");
});
