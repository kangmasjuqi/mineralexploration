import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import '../../App.css';
import axios from 'axios';
import Breadcrumb from '../Breadcrumb';

class showHoleDetails extends Component {
  constructor(props) {
    super(props);
    this.state = {
      hole: {},
      readings: [],
      loading: true
    };
  }

  componentDidMount() {
    // console.log("Print id: " + this.props.match.params.id);
    axios
      .get('http://192.168.69.6:8000/api/holes/'+this.props.match.params.id)
      .then(res => {
        // console.log("Print-showHoleDetails-API-response: " + res.data);
        this.setState({
          hole: res.data.data,
          readings: res.data.data.readings,
          loading: false
        })
      })
      .catch(err => {
        console.log("Error from ShowHoleDetails");
      })
  };


  render() {

	let LoadingMsg='';
    if (this.state.loading){
      LoadingMsg = <div><b>Loading...</b></div>;
	}

    const hole = this.state.hole;
    let HoleItemDetail = <div>
      <table className="table table-hover table-dark">
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>Latitude</td>
            <td>{ hole.latitude }</td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>Longitude</td>
            <td>{ hole.longitude }</td>
          </tr>
          <tr>
            <th scope="row">3</th>
            <td>Dip</td>
            <td>{ hole.dip }</td>
          </tr>
          <tr>
            <th scope="row">4</th>
            <td>Azimuth</td>
            <td>{ hole.azimuth }</td>
          </tr>
        </tbody>
      </table>
    </div>

	let ReadingList = <div>
		Reading List : {this.state.readings.length}
	  </div>

	let breadcrumb_links_data = [
		{'label':'Home /', 'url':'/'}, 
		{'label':'Hole /', 'url':'/hole'}, 
		{'label':'Detail', 'url':'#'}
	]

    return (
      <div className="ShowHoleDetails">

	  <Breadcrumb links={breadcrumb_links_data}/>

        <div className="container">
          <div className="row">
            <div className="col-md-12">
              <h4>View Hole's Info&nbsp;&nbsp;
				  <Link to="/hole" className="btn btn-primary float-right">
					  Show List
				  </Link>
			  </h4><br/>
            </div>
          </div>
		  
		  { LoadingMsg }
		  
          <div>
            { HoleItemDetail }
          </div>
          <div>
            { ReadingList }
          </div>

        </div>
      </div>
    );
  }
}

export default showHoleDetails;