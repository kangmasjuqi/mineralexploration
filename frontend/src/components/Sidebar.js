import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import '../App.css';

class Sidebar extends Component {

  render() {

    return (
      <div className="sidebar">
        <ul className="sidebar-menu">
            <li>
              <Link to="/hole">
                <i className="fa fa-tags"></i> Hole
              </Link>
            </li>
        </ul>
      </div>
    );
  }
}

export default Sidebar;