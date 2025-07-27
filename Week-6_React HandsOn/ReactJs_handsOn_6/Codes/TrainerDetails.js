// D:\workspaces\Cts_handson\React\TrainersApp\src\TrainerDetails.js

import React from 'react';
import { useParams } from 'react-router-dom'; // Hook to get URL parameters
import TRAINERS_DATA from './TrainersMock'; // Import mock data

function TrainerDetail() { // This component name is 'TrainerDetail' (singular)
  const { id } = useParams(); // Get the 'id' parameter from the URL
  const trainer = TRAINERS_DATA.find(t => t.TrainerId === parseInt(id)); // Find trainer by ID

  if (!trainer) {
    return <div style={{ padding: '20px', textAlign: 'center', color: 'red' }}>Trainer not found!</div>;
  }

  return (
    <div style={{ padding: '20px', maxWidth: '600px', margin: '20px auto', border: '1px solid #eee', borderRadius: '8px', boxShadow: '0 2px 5px rgba(0,0,0,0.1)' }}>
      <h2>Trainer Details: {trainer.Name}</h2>
      <p><strong>Trainer ID:</strong> {trainer.TrainerId}</p>
      <p><strong>Email:</strong> {trainer.Email}</p>
      <p><strong>Phone:</strong> {trainer.Phone}</p>
      <p><strong>Technology:</strong> {trainer.Technology}</p>
      <p><strong>Skills:</strong> {trainer.Skills.join(', ')}</p>
    </div>
  );
}

export default TrainerDetail; 