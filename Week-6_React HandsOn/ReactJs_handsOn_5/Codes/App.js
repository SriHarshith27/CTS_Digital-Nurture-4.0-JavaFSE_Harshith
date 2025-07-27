import React from 'react';
import './App.css'; 
import CohortDetails from './CohortDetails';

function App() {
  const cohorts = [
    {
      id: 1,
      name: "INTADMF10 - .NET FSD",
      startedOn: "22-Feb-2022",
      status: "Scheduled",
      coach: "Aathma",
      trainer: "Jojo Jose"
    },
    {
      id: 2,
      name: "ADM21JF014 - Java FSD",
      startedOn: "10-Sep-2021",
      status: "Ongoing",
      coach: "Apoorv",
      trainer: "Elisa Smith"
    },
    {
      id: 3,
      name: "CDBJF21025 - Java FSD",
      startedOn: "24-Dec-2021",
      status: "Ongoing",
      coach: "Aathma",
      trainer: "John Doe"
    }
  ];

  return (
    <div className="App">
      <h1 style={{ textAlign: 'center', marginBottom: '20px' }}>Cohorts Details</h1>
      <div style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'center' }}>
        {cohorts.map(cohort => (
          <CohortDetails key={cohort.id} cohort={cohort} />
        ))}
      </div>
    </div>
  );
}

export default App;