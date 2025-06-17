import { createRoot } from 'react-dom/client';
import HomePage from './pages/HomePage.tsx';
import './bootstrap';

function App() {
    return (
        <div className="app">
            <HomePage />
        </div>
    );
}

// Montar la aplicación React
const container = document.getElementById('app');
if (container) {
    const root = createRoot(container);
    root.render(<App />);
}
