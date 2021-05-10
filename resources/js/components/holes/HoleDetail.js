import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import axios from 'axios';
import { Link, Route, Switch } from "react-router-dom";
import Config from '../Config.js';
import Alert from '../Alert.js';
import ReadingUpdate from '../readings/ReadingUpdate';

export default class HoleDetail extends Component {

    constructor(props)
    {
        super(props);
        
        this.state={
            hole : { 
				latitude: '', 
				longitude: '', 
				dip: '', 
				azimuth: '', 
				readings : []
			},
			field_reading_depth:0,
			field_reading_dip:0,
			field_reading_azimuth:0,
            alert_message:''
        }
    }

    componentDidMount()
    {
		var holeId = 1 // this.props.match.params.id
		axios.get(Config.getUrl()+"/holes/" + holeId)
        .then(response=>{
            this.setState({
				hole : { 
					latitude: response.data.data.latitude,
					longitude: response.data.data.longitude,
					dip: response.data.data.dip,
					azimuth: response.data.data.azimuth,
					readings : response.data.data.readings,
				}
			});
        });
    }

    render() {
        return (
            <div>
                <hr />
                <h5>Hole Detail & Readings</h5>
                <div style={{padding : '15px'}}>
					<p>Latitude : {this.state.hole.latitude}</p>
					<p>Longitude : {this.state.hole.longitude}</p>
					<p>Dip : {this.state.hole.dip}</p>
					<p>Azimuth : {this.state.hole.azimuth}</p>
                </div>
				<div>
					<table className="table table-border">
					<thead>
						<tr>
							<th scope="col">Depth</th>
							<th scope="col">Dip</th>
							<th scope="col">Azimuth</th>
							<th scope="col">Is Trustworthy?</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
                    {
                        this.state.hole.readings.map(reading=>{
							
							var field_reading_depth = "reading_depth["+reading.id+"]"
							var field_reading_dip = "reading_dip["+reading.id+"]"
							var field_reading_azimuth = "reading_azimuth["+reading.id+"]"
							
                            return(
                                <tr key={reading.id}>
                                    <td>
										<input type="text" style={{width : '100px'}}
											name={field_reading_depth} value={reading.depth}
											onChange={(e) => 
												this.setState({ reading_depth: e.target.value })
											}
										/>
									</td>
                                    <td>
										<input type="text" style={{width : '100px'}}
											name={field_reading_dip} value={reading.dip}
											onChange={(e) => 
												this.setState({ reading_dip: e.target.value })
											}
										/>
									</td>
                                    <td>
										<input type="text" style={{width : '100px'}}
											name={field_reading_azimuth} value={reading.azimuth}
											onChange={(e) => 
												this.setState({ reading_azimuth: e.target.value })
											}
										/>
									</td>
                                    <td>
                                        {reading.is_trustworthy=1?("Yes"):("No")}
                                    </td>
                                    <td>
										<a className="btn btn-warning" href="#">Update</a>
									</td>
                                </tr>
                            );
                        })
                    }
					</tbody>
					</table>
				</div>

                <Switch>
                    <Route exact path="/mineral_exploration/readings/edit/:readingId" component={ReadingUpdate} />
                </Switch>

            </div>
        );
    }
}
