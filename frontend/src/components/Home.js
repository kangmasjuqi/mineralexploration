import React, { Component } from 'react';
import '../App.css';

class Home extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  componentDidMount() {};

  render() {

    return (
      <div className="Home">
        <div className="container">
          <div className="row">
            <div className="col-md-12">
              Survey instruments are used by mineral exploration clients to measure the physical location of a drilled hole and see how close the actual end of the hole is to the planned underground target mineral body. You need to provide a way for geologists to view the following readings coming from a survey instrument::<div><br/></div><div><ul><li>A single collar position (latitude, longitude, dip, and azimuth) is the surface position and orientation of the drill hole.</li><li>A number of depth readings. Each reading has depth, dip, and azimuth providing the direction of the hole at that point.&nbsp;</li></ul></div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Home;