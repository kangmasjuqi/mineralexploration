import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import axios from 'axios';
import { Link, Route, Switch } from "react-router-dom";
import Config from '../Config.js';
import Alert from '../Alert.js';
import HoleDetail from './HoleDetail';

export default class HoleIndex extends Component {

    constructor()
    {
        super();
        this.state={
            holes:[],
            alert_message:''
        }

    }

    componentDidMount()
    {
        axios.get(Config.getUrl()+"/holes")
        .then(response=>{
            this.setState({
                holes:response.data.data
            });
        });
    }

    render() {
        return (
            <div>
                {this.state.alert_message=="success"?<Alert type="success" msg="Data deleted successfully!" />:null}
                {this.state.alert_message=="error"?<Alert type="warning" msg="Error occured" />:null}

                <table className="table table-border">
                <thead>
                    <tr>
						<th scope="col">No.</th>
						<th scope="col">Lat & Long</th>
						<th scope="col">Dip</th>
						<th scope="col">Azimuth</th>
						<th scope="col">Readings</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        this.state.holes.map(hole=>{
                            return(
                                <tr key={hole.id}>
                                    <td>{hole.id}</td>
                                    <td>{hole.latitude}, {hole.longitude}</td>
                                    <td>{hole.dip}</td>
                                    <td>{hole.azimuth}</td>
                                    <td>
										<Link to={"/mineral_exploration/holes/" + hole.id}>
											Detail
										</Link>
									</td>
                                </tr>
                            );
                        })
                    }
                </tbody>
                </table>

                <Switch>
                    <Route exact path="/mineral_exploration/holes/:holeId" component={HoleDetail} />
                </Switch>
            </div>
        );
    }
}

