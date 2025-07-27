import { CalculateScore } from './Components/CalculateScore'; // Adjust path if needed

function App() {
  return (
    <div className="App"> 
      <CalculateScore Name={"Steeve"} School={"DNV Public School"} total={284} goal={300} />

    </div>
  );
}

export default App;