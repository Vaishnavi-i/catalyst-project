const express = require('express');
const app= express();
const port =8080;

app.get('/', (req, res) => {
    
    res.send('Welcome to VCatalyst FY24');
    
})

app.listen(port ,() => {
    console.log(`Server is running on port 8080.`);
})