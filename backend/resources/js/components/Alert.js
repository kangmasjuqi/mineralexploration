import React, { Component } from 'react';

export default class Alert extends Component {
    constructor(props){
        super(props);
    }
    render() {
        return (
            <div>

                <div className={"alert alert-"+this.props.type +" alert-dismissible fade show"} role="alert">
                    {this.props.msg}
                </div>

            </div>
        );
    }
}
