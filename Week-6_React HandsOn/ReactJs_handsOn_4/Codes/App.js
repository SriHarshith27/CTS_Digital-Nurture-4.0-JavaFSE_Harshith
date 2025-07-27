import './App.css';
// Change this line:
import Posts from './Posts'; // Posts.js is now directly in the 'src' folder

function App() {
  return (
    <div className="App">
      <h1>My Blog Application</h1>
      <Posts />
    </div>
  );
}

export default App;