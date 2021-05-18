import React from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import './App.css';

import Home from './components/Home';
import Sidebar from './components/Sidebar';
import Footer from './components/Footer';
import ShowHoleList from './components/Hole/ShowHoleList';
import ShowHoleDetails from './components/Hole/ShowHoleDetails';

function App() {
  return (
      <div className="main container">
		  <Router>

			  <div className="row">
			    <div className="col-md-12">
				  <h2 className="display-4 text-center">Software Development Practical Test</h2>
				  <hr/>
			    </div>
			  </div>

			  <div className="row">
				<div className="col-md-3">
					<Sidebar />
				</div>
				<div className="col-md-9">
				  <Route exact path='/' component={Home} />
				  <Route exact path='/hole' component={ShowHoleList} />
				  <Route path='/hole/show-hole/:id' component={ShowHoleDetails} />
				</div>
			  </div>

			  <div className="row">
				<div className="col-md-12">
					<Footer />
				</div>
			  </div>

		  </Router>
      </div>
  );
}

export default App;
