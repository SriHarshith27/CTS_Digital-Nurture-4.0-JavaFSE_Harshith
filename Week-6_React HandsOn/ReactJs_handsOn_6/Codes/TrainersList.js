
import React from 'react';
import { Link } from 'react-router-dom'; 
import TRAINERS_DATA from './TrainersMock'; 

function TrainersList() {
  return (
    <div style={{ padding: '20px' }}>
      <h2>Our Trainers</h2>
      <ul style={{ listStyleType: 'none', padding: 0 }}>
        {TRAINERS_DATA.map(trainer => (
          <li key={trainer.TrainerId} style={{ margin: '10px 0', border: '1px solid #eee', padding: '10px', borderRadius: '5px' }}>
            <Link to={`/trainers/${trainer.TrainerId}`} style={{ textDecoration: 'none', color: '#007bff', fontWeight: 'bold' }}>
              {trainer.Name} ({trainer.Technology})
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default TrainersList;