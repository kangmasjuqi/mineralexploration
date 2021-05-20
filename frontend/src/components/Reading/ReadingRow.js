import React from 'react';
import '../../App.css';
import { Link } from 'react-router-dom';

const ReadingRow = (props) => {

    const reading  = props.reading;
    const no  = props.no;

	let is_trustworthy = "No"
	let is_trustworthy_rule_check = ""
	let badge_style = "danger"
	let action_btn = ""
	
	if(reading.is_trustworthy === 1){
		is_trustworthy = "Yes"
		badge_style = "success"
	}else {
		action_btn = <Link to={`/reading/override/${reading.id}`} className="btn btn-warning">Override</Link>
		is_trustworthy_rule_check = <p className="trustworthy_rule_check">Previous Azimuth : {reading.is_trustworthy_rule_check.previous_azimuth}<br/>Avg. Dip Of Prev. 5 Data : {reading.is_trustworthy_rule_check.average_dip_of_previous_5_depth_readings}<br/></p>
	}

    return(
        <tr>
			<td>{no}.</td>
			<td>{reading.depth}</td>
			<td>{reading.dip}</td>
			<td>{reading.azimuth}</td>
			<td>
				<span className={`badge badge-${badge_style}`}>{is_trustworthy}</span>
			</td>
			<td>
				{action_btn}
				{is_trustworthy_rule_check}
			</td>
        </tr>
    )
};

export default ReadingRow;