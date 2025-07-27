import '../Stylesheets/mystyle.css'; 

const percentToDecimal = (decimal) => {

  return (decimal * 100).toFixed(2) + '%';
};

// Helper function to calculate score
const calcScore = (total, goal) => {
  // Ensure inputs are numbers to avoid NaN
  const numericTotal = Number(total);
  const numericGoal = Number(goal);

  if (numericGoal === 0) {
    return "N/A"; // Avoid division by zero
  }
  return percentToDecimal(numericTotal / numericGoal);
};

function CalculateScore(props) {
  const { Name, School, total, goal } = props; // Destructure props

  // Calculate the score using the helper function
  const score = calcScore(total, goal);

  return (
    <div className="formatstyle">
      <h2 className="Name">Student Name: {Name}</h2>
      <h3 className="School">School: {School}</h3>
      <p className="Total">Total Marks: {total}</p>
      <p className="Total">Goal Marks: {goal}</p>
      <h4 className="Score">Overall Score: {score}</h4>
    </div>
  );
}

// Using a named export as per App.js image import
export { CalculateScore };