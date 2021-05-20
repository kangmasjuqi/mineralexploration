import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import '../App.css';

class Breadcrumb extends Component {

  constructor(props) {
    super(props);
    this.state = {links_data:props.links};
  }

  render() {

    const list_items = this.state.links_data.map((link, key) =>
      <span key={key}>
          <Link to={link.url}>
            {link.label}
          </Link>
      </span>
    );

    return (<p className="breadcrumb">{list_items}</p>);
  }
}

export default Breadcrumb;