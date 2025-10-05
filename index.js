const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;
const FEATURE_NEW_UI = process.env.FEATURE_NEW_UI === 'true';

app.get('/', (req, res) => {
  res.send(FEATURE_NEW_UI ? 'Hello from NEW UI!' : 'Hello from OLD UI!');
});

app.get('/health', (req, res) => res.send('OK'));

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}, FEATURE_NEW_UI=${FEATURE_NEW_UI}`);
});

