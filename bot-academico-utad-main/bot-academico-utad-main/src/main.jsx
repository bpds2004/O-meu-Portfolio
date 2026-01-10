import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App.jsx';


ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

// Sinaliza que a aplicação React carregou com sucesso.
window.__app_loaded__ = true;
