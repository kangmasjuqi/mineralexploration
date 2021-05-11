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
			}
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
						return(
							<tr key={reading.id}>
								<td>{reading.depth}</td>
								<td>{reading.dip}</td>
								<td>{reading.azimuth}</td>
								<td>
									{reading.is_trustworthy=1?("Yes"):("No")}
								</td>
								<td>
									<Link to={"/mineral_exploration/readings/update/" + reading.id}>
											<button type="submit" className="btn btn-warning">Override</button>
										</Link>
								</td>
							</tr>
						);
					})
				}
				</tbody>
				</table>
				</div>

                <Switch>
                    <Route exact path="/mineral_exploration/readings/update/:readingId" component={ReadingUpdate} />
                </Switch>

            </div>
        );
    }
}
