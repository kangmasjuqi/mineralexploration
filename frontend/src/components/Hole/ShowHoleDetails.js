import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import '../../App.css';
import axios from 'axios';
import Breadcrumb from '../Breadcrumb';
import ReadingRow from '../Reading/ReadingRow';
import configData from "../../Config.json";

class showHoleDetails extends Component {
  constructor(props) {
    super(props);
    this.state = {
      api_url: configData.API_URL,
      hole: {},
      readings: [],
      loading: true
    };
  }

  componentDidMount() {
    axios
      .get(this.state.api_url+'/holes/'+this.props.match.params.id)
      .then(res => {
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
    let HoleItemDetail = <div className="table-responsive">
      <table className="table table-hover table-dark">
        <tbody>
          <tr>
            <td align="right">Hole Latitude</td>
            <td>{ hole.latitude }</td>
            <td align="right">Hole Longitude</td>
            <td>{ hole.longitude }</td>
          </tr>
          <tr>
            <td align="right">Hole Dip</td>
            <td>{ hole.dip }</td>
            <td align="right">Hole Azimuth</td>
            <td>{ hole.azimuth }</td>
          </tr>
        </tbody>
      </table>
    </div>


	const readings = this.state.readings;
	let readingList;
	let no =1;

	readingList = readings.map((reading, k) =>
		<ReadingRow reading={reading} key={k} no={no++}/>
	);

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
					  Show Hole List
				  </Link>
			  </h4><br/>
            </div>
          </div>
		  
		  { LoadingMsg }
		  
          <div>
            { HoleItemDetail }
          </div>

          <div className="ReadingListContainer">
			<h4>
				Reading List | <span className="badge badge-info">{readings.length}</span>
			</h4>
		    <table className="table table-hover table-striped">
			  <thead className="thead-dark">
				  <tr>
					<td>No.</td>
					<td>Depth</td>
					<td>Dip</td>
					<td>Azimuth</td>
					<td>Trustworthy</td>
					<td>Action</td>
				  </tr>
			  </thead>
			  <tbody>
				{ readingList }
			  </tbody>
		    </table>
          </div>

        </div>
      </div>
    );
  }
}

export default showHoleDetails;