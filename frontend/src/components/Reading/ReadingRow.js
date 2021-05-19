import React from 'react';
import '../../App.css';
import { Link } from 'react-router-dom';

const ReadingRow = (props) => {
    const reading  = props.reading;
    const no  = props.no;

	let is_trustworthy = "No"
	let badge_style = "danger"
	let action_btn = <Link to={`/reading/override/${reading.id}`} className="btn btn-warning">
					  Override
				  </Link>
	if(reading.is_trustworthy === 1){
		is_trustworthy = "Yes"
		badge_style = "success"
		action_btn = ''
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
			</td>
        </tr>
    )
};

export default ReadingRow;