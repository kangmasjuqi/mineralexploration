import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import ConfigData from "../../Config.json";

import Breadcrumb from '../Breadcrumb';
import Loading from "../Loading";

import '../../App.css';

class ReadingUpdate extends Component {
  constructor(props) {
    super(props);
    this.state = {
      api_url: ConfigData.API_URL, 
      loading: true,
      redirect_delay_after_updating: 2000,
      update_reading_button_label: "Update Reading",
      breadcrumb_links_data: [
        {'label':'Home /', 'url':'/'}, 
        {'label':'Hole /', 'url':'/hole'}, 
        {'label':'Reading Override', 'url':'#'}
      ],
      id: '',
      hole_id: '',
      depth: '',
      dip: '',
      azimuth: '',
      is_trustworthy: '',
    };
  }

  componentDidMount() {
    axios
      .get(this.state.api_url+'/readings/'+this.props.match.params.id)
      .then(res => {
        this.setState({
          id: res.data.data.id,
          hole_id: res.data.data.hole_id,
          depth: res.data.data.depth,
          dip: res.data.data.dip,
          azimuth: res.data.data.azimuth,
          is_trustworthy: res.data.data.is_trustworthy,
          loading: false
        })
      })
      .catch(err => {
        console.log("Error from ReadingUpdate");
      })
  };
  
  // regex /[^0-9.]/g used to allow numeric or DOT char only
  onChange = e => {
    this.setState(
        { 
            [e.target.name]: e.target.value.replace(/[^0-9.]/g, '') 
        }
    );
  };

  onSubmit = e => {
    e.preventDefault();

    this.setState({
      update_reading_button_label: "Updating...please wait.."
    })

    const data = {
      hole_id: this.state.hole_id,
      depth: this.state.depth,
      dip: this.state.dip,
      azimuth: this.state.azimuth,
    };

    axios
      .patch(this.state.api_url+'/readings/'+this.props.match.params.id, data)
      .then(res => {
        this.setState({update_reading_button_label: "Successfully updated!"})
        setTimeout(() => this.props.history.push('/hole/show-hole/'+this.state.hole_id)
        , this.state.redirect_delay_after_updating);
      })
      .catch(err => {
        console.log("Error in ReadingUpdate!");
      })
  };

  render() {

    return (
      <div className="ReadingUpdate">
      
        <Breadcrumb links={this.state.breadcrumb_links_data}/>
      
        <div className="container">
          <div className="row">
            <div className="col-md-12">
              <h4>Reading Override Form&nbsp;&nbsp;
                  <Link to={`/hole/show-hole/${this.state.hole_id}`} className="btn btn-primary float-right">
                      Back to Hole Detail
                  </Link>
              </h4>
            </div>
          </div>

          <div className="row">

            <Loading loading={this.state.loading} />

            <div className="col-md-12">

              <form noValidate onSubmit={this.onSubmit}>

                <div className="row">

                    <div className="col-md-3 col-sm-6 col-xs-12">
                        <div className='form-group'>
                          <label htmlFor="depth">Depth</label>
                          <input type='text' className='form-control' onChange={this.onChange}
                            placeholder='Depth' name='depth' value={this.state.depth} 
                          />
                        </div>
                    </div>

                    <div className="col-md-3 col-sm-6 col-xs-12">
                        <div className='form-group'>
                          <label htmlFor="dip">Dip</label>
                          <input type='text' className='form-control' onChange={this.onChange}
                            placeholder='Dip' name='dip' value={this.state.dip} 
                          />
                        </div>
                    </div>

                    <div className="col-md-3 col-sm-6 col-xs-12">
                        <div className='form-group'>
                          <label htmlFor="azimuth">Azimuth</label>
                          <input type='text' className='form-control' onChange={this.onChange}
                            placeholder='Azimuth' name='azimuth' value={this.state.azimuth} 
                          />
                        </div>
                    </div>

                    <div className="col-md-3 col-sm-6 col-xs-12">
                        <label htmlFor="">&nbsp;</label>
                        <button type="submit" className="btn btn-outline-info btn-md btn-block">
                            {this.state.update_reading_button_label}
                        </button>
                    </div>

                </div>

                </form>

            </div>
          </div>

          <div className="row">
            <div className="col-md-12">
                &nbsp;
            </div>
          </div>

        </div>
      </div>
    );
  }
}

export default ReadingUpdate;