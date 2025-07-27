import React from 'react';

function Post(props) {
  const { title, body } = props;
  return (
    <div style={{ border: '1px solid #ddd', padding: '10px', margin: '10px 0', borderRadius: '5px' }}>
      <h3>{title}</h3>
      <p>{body}</p>
    </div>
  );
}

export default Post;