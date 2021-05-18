import React, { Component } from 'react';
import '../../App.css';
import axios from 'axios';
import HoleCard from './HoleCard';
import Breadcrumb from '../Breadcrumb';

class ShowHoleList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      holes: [],
      loading: true,
    };
  }

  componentDidMount() {
    axios
      .get('http://192.168.69.6:8000/api/holes')
      .then(res => {
        this.setState({
          holes: res.data.data,
          loading: false
        })
      })
      .catch(err =>{
        console.log('Error from ShowHoleList');
      })
  };


  render() {

    const holes = this.state.holes;
    let holeList;

    if (this.state.loading) {
      holeList = <div><b>Loading...</b></div>;
    } else if(!holes) {
      holeList = "there is no hole record!";
    } else {
      holeList = holes.map((hole, k) =>
        <HoleCard hole={hole} key={k} />
      );
    }

	let breadcrumb_links_data = [
		{'label':'Home /', 'url':'/'}, 
		{'label':'Hole /', 'url':'/hole'}, 
		{'label':'List', 'url':'#'}
	]

    return (
      <div className="ShowHoleList">

		<Breadcrumb links={breadcrumb_links_data}/>

        <div className="container">
          <div className="row">
            <div className="col-md-12">
              <h4>Holes List</h4>
            </div>
          </div>

          <div className="list">
                {holeList}
          </div>

        </div>

      </div>
    );
  }
}

export default ShowHoleList;