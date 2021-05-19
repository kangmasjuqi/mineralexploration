import React, { Component } from 'react';
import '../../App.css';
import Breadcrumb from '../Breadcrumb';

class ReadingUpdate extends Component {
  constructor(props) {
    super(props);
    this.state = {
    };
  }

  componentDidMount() {
  };

  render() {

	let breadcrumb_links_data = [
		{'label':'Home /', 'url':'/'}, 
		{'label':'Hole /', 'url':'/holes'}, 
		{'label':'Reading Override', 'url':'#'}
	]

    return (
      <div className="ReadingUpdate">
	  
		<Breadcrumb links={breadcrumb_links_data}/>
	  
        <div className="container">
          <div className="row">
            <div className="col-md-12">
              <h4>Reading Override Form</h4><br />
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