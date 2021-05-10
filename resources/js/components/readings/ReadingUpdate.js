import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import axios from 'axios';
import { Link } from "react-router-dom";
import Config from '../Config.js';
import Alert from '../Alert.js';

export default class ReadingUpdate extends Component {

    constructor(props)
    {
        super(props);
        this.onChangeCategoryName = this.onChangeCategoryName.bind(this);
        this.onSubmit = this.onSubmit.bind(this);
        
        this.state={
            category_name:'',
            alert_message:''
        }
    }

    componentDidMount()
    {
        axios.get(Config.getUrl()+"/category/edit/"+this.props.match.params.id)
        .then(response=>{
            this.setState({category_name:response.data.name});
        });
    }

    onChangeCategoryName(e)
    {
        this.setState({category_name:e.target.value});
    }
    onSubmit(e)
    {
        e.preventDefault();
        const category ={
            category_name: this.state.category_name
        }
        axios.put(Config.getUrl()+"/category/update/"+this.props.match.params.id, category)
        .then(res=>{
            this.setState({alert_message:'success'});
        }).catch(error=>{
            this.setState({alert_message:'error'});
        });
    }


    render() {
        return (
            <div>
                <hr />
                {this.state.alert_message=="success"?<SuccessAlert type="success" msg="Data updated successfully!" />:null}
                {this.state.alert_message=="error"?<SuccessAlert type="warning" msg="Error occured" />:null}

                <form onSubmit={this.onSubmit}>
                    <div className="mb-3">
                        <label htmlFor="category_name" className="form-label">Category Name</label>
                        <input type="text" 
                        className="form-control" 
                        id="category_name" 
                        value={this.state.category_name}
                        onChange={this.onChangeCategoryName}
                        placeholder="Enter category" />
                    </div>

                    <button type="submit" className="btn btn-primary">Submit</button>
                </form>
            </div>
        );
    }
}
