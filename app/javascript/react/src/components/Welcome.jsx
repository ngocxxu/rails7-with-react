import * as React from 'react';
import * as ReactDOM from 'react-dom';

const Welcome = () => {
  <div className='container'>
    <h1>Hello</h1>
  </div>;
};

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Welcome />, document.getElementById('welcome'));
});

export default Welcome;
