import React, { Component, seState, useEffect } from 'react';
import ReactDOM from 'react-dom';
import axios from 'axios';
import { Link } from "react-router-dom";
import Config from '../Config.js';
import Alert from '../Alert.js';

export default class ReadingUpdate extends Component {

    constructor(props)
    {
        super(props);

        this.updateReading = this.updateReading.bind(this);
        
        this.state={
			reading_id: 0, 
			reading_hole_id: 0, 
			reading_depth: 0, 
			reading_dip: 0, 
			reading_azimuth: 0, 
			reading_is_trustworthy: 0, 
            alert_message:''
        }
    }

    retrieveData()
    {
		var readingId = this.props.match.params.readingId
		axios.get(Config.getUrl()+"/readings/" + readingId)
        .then(response=>{
            this.setState({
				reading_id: response.data.data.id,
				reading_hole_id: response.data.data.hole_id,
				reading_depth: response.data.data.depth,
				reading_dip: response.data.data.dip,
				reading_azimuth: response.data.data.azimuth,
				reading_is_trustworthy : response.data.data.is_trustworthy,
			});
        });
    }

    componentDidMount()
    {
		this.retrieveData()
    }

    componentDidUpdate()
    {
		this.retrieveData()
    }

    updateReading(e)
    {
        e.preventDefault();
		
		var reading_id = this.state.reading_id
		var hole_id = this.state.reading_hole_id
		
        const updated_reading ={
            hole_id: hole_id,
            depth: this.state.reading_depth,
            dip: this.state.reading_dip,
            azimuth: this.state.reading_azimuth,
        }
		// console.log(updated_reading)
        axios.patch(Config.getUrl()+"/readings/"+reading_id, updated_reading)
        .then(res=>{
			console.log(res)
            this.setState({alert_message:'success'});
        }).catch(error=>{
			console.log(error)
            this.setState({alert_message:'error'});
        });
    }


    render() {
        return (
            <div>
                <hr />

				<h5>Override Reading Data</h5>

                {this.state.alert_message=="success"?<Alert type="success" msg="Data updated successfully!" />:null}
                {this.state.alert_message=="error"?<Alert type="warning" msg="Error occured" />:null}

				<form onSubmit={this.updateReading}>
				
					<div style={{width : '100px', float : 'left', marginLeft : '20px'}}>
						<label>Reading ID</label>
						<p>{this.state.reading_id}</p>
					</div>

					<div style={{width : '100px', float : 'left', marginLeft : '20px'}}>
						<label>Depth</label>
						<input className="form-control" type="text" 
							id="field_reading_depth" 
							value={this.state.reading_depth}
							onChange={(e) => 
								this.setState({ reading_depth: e.target.value })
							}/>
					</div>

					<div style={{width : '100px', float : 'left', marginLeft : '20px'}}>
						<label>Dip</label>
						<input className="form-control" type="text" 
							id="field_reading_dip" 
							value={this.state.reading_dip}
							onChange={(e) => 
								this.setState({ reading_dip: e.target.value })
							}/>
					</div>

					<div style={{width : '100px', float : 'left', marginLeft : '20px'}}>
						<label>Azimuth</label>
						<input className="form-control" type="text" 
							id="field_reading_azimuth" 
							value={this.state.reading_azimuth}
							onChange={(e) => 
								this.setState({ reading_azimuth: e.target.value })
							}/>
					</div>

					<div style={{width : '100px', float : 'left', marginLeft : '20px'}}>
						<button style={{marginTop: '30px'}} type="submit" className="btn btn-primary">Save</button>
					</div>

				</form>
            </div>
        );
    }
}
