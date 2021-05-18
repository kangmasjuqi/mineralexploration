import React, { Component } from 'react';
import '../App.css';
import { Link } from 'react-router-dom';

class Breadcrumb extends Component {
  constructor(props) {
    super(props);
    this.state = {links_data:props.links};
  }

  render() {

    const listItems = this.state.links_data.map((link, key) =>
	  <span key={key}>
		  <Link to={link.url}>
			{link.label}
		  </Link>
	  </span>
    );

    return (
		<p className="breadcrumb">{listItems}</p>
    );
  }
}

export default Breadcrumb;