import React, { Component } from 'react';
import '../App.css';
import { Link } from 'react-router-dom';

class Sidebar extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  componentDidMount() {};

  render() {

    return (
      <div className="Sidebar">
		<ul className="Sidebar-menu">
			<li>
			  <Link to="/hole" style={{display: "block"}}>
				Hole
			  </Link>
			</li>
		</ul>
      </div>
    );
  }
}

export default Sidebar;