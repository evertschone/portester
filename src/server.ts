import express from 'express';

const app = express();
const port = 3001; // You can set this to any desired port

app.get('/env', (req, res) => {
    res.send("ENV v1:"+JSON.stringify(process.env));
});

app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});