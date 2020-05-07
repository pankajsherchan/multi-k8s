import React, { Component } from 'react';
import { BrowserRouter as Router, Link, Route } from 'react-router-dom';
import './App.css';
import Fib from './Fib';
import logo from './logo.svg';
import OtherPage from './OtherPage';

class App extends Component {
  render() {
    return (
      <Router>
        <div className='App'>
          <header className='App-header'>
            <img src={logo} className='App-logo' alt='logo' />
            <h1 className='App-title'>Fib Calculator in the Kubernetes</h1>
            <h1> Direct Master Change </h1>
            <Link to='/'>Home</Link>
            <Link to='/otherpage'>Other Page</Link>
          </header>
          <div>
            <Route exact path='/' component={Fib} />
            <Route path='/otherpage' component={OtherPage} />
          </div>
        </div>
      </Router>
    );
  }
}

export default App;
