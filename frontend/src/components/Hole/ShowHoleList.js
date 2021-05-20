import React, { Component } from 'react';
import axios from 'axios';
import ConfigData from "../../Config.json";

import HoleCard from './HoleCard';
import Breadcrumb from '../Breadcrumb';
import Loading from "../Loading";
import NotFound from "../NotFound";

import '../../App.css';

class ShowHoleList extends Component {

  constructor(props) {
    super(props);
    this.state = {
      api_url: ConfigData.API_URL,
      loading: true,
      breadcrumb_links_data: [
        {'label':'Home /', 'url':'/'}, 
        {'label':'Hole /', 'url':'/hole'}, 
        {'label':'List', 'url':'#'}
      ],
      holes: [],
    };
  }

  componentDidMount() {
    axios
      .get(this.state.api_url+'/holes')
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
    let hole_list;

    if(!holes) {
      hole_list = <NotFound />
    } else {
      hole_list = holes.map((hole, k) =>
        <HoleCard hole={hole} key={k} />
      );
    }

    return (
      <div className="ShowHoleList">

        <Breadcrumb links={this.state.breadcrumb_links_data}/>

        <div className="container">

          <div className="row">

            <Loading loading={this.state.loading} />

            {hole_list}

          </div>

        </div>

      </div>
    );
  }
}

export default ShowHoleList;