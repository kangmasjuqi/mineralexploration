import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import axios from 'axios';
import { Link, Route, Switch, useParams } from "react-router-dom";
import Config from '../Config.js';
import Alert from '../Alert.js';
import ReadingUpdate from '../readings/ReadingUpdate';

export default class HoleDetail extends Component {

    constructor(props)
    {
        super(props);
        
        this.state={
            hole : { 
				id: 0, 
				latitude: '', 
				longitude: '', 
				dip: '', 
				azimuth: '', 
				readings : []
			}
        }
    }

	retrieveData()
	{
		var holeId = this.props.match.params.holeId
		axios.get(Config.getUrl()+"/holes/" + holeId)
        .then(response=>{
            this.setState({
				hole : { 
					id: response.data.data.id,
					latitude: response.data.data.latitude,
					longitude: response.data.data.longitude,
					dip: response.data.data.dip,
					azimuth: response.data.data.azimuth,
					readings : response.data.data.readings,
				}
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

    render() {
        return (
            <div>
                <hr />
                <h5>Hole Detail & Readings</h5>
                <div style={{padding : '15px'}}>
					<table className="table table-border">
						<tbody>
							<tr>
								<td>ID : {this.state.hole.id}</td>
								<td>Lat & Long : {this.state.hole.latitude}, {this.state.hole.longitude}</td>
							</tr>
							<tr>
								<td>Dip : {this.state.hole.dip}</td>
								<td>Azimuth : {this.state.hole.azimuth}</td>
							</tr>
						</tbody>
					</table>
                </div>
				<div>
				<table className="table table-border">
				<thead>
					<tr>
						<th scope="col">Hole ID</th>
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
						
						let link = <Link to={"/mineral_exploration/readings/update/" + reading.id}>
										<button type="submit" className="btn btn-warning">Override</button>
									</Link>
						
						return(
							<tr key={reading.id}>
								<td>{this.state.hole.id}</td>
								<td>{reading.depth}</td>
								<td>{reading.dip}</td>
								<td>{reading.azimuth}</td>
								<td>
									{reading.is_trustworthy==1?("Yes"):("No")}
								</td>
								<td>
									{reading.is_trustworthy==0?link:''}
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
