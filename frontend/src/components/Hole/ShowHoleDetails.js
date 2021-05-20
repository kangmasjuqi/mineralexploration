import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import ConfigData from "../../Config.json";

import Breadcrumb from '../Breadcrumb';
import HoleSegment from '../Hole/HoleSegment';
import ReadingTable from '../Reading/ReadingTable';
import Loading from "../Loading";

import '../../App.css';

class ShowHoleDetails extends Component {
  constructor(props) {
    super(props);
    this.state = {
      api_url: ConfigData.API_URL,
      loading: true,
      breadcrumb_links_data: [
        {'label':'Home /', 'url':'/'}, 
        {'label':'Hole /', 'url':'/hole'}, 
        {'label':'Detail', 'url':'#'}
      ],
      hole: {},
      readings: [],
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

    return (
      <div className="ShowHoleDetails">

        <Breadcrumb links={this.state.breadcrumb_links_data}/>

        <div className="container">

          <div className="row">

            <div className="col-md-12">
              <h4>View Hole's Info&nbsp;&nbsp;
                  <Link to="/hole" className="btn btn-primary float-right">
                      Show Hole List
                  </Link>
              </h4><br/>
            </div>

            <Loading loading={this.state.loading} />

          </div>

          <HoleSegment hole={this.state.hole} />

          <ReadingTable readings={this.state.readings} />

        </div>
      </div>
    );
  }
}

export default ShowHoleDetails;