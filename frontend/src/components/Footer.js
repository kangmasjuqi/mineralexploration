import React, { Component } from 'react';
import '../App.css';

class Footer extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  componentDidMount() {};

  render() {

    return (
      <div className="Footer">
		  <p className="text-center">
			&copy; Marjuqi, 2021
		  </p>
      </div>
    );
  }
}

export default Footer;