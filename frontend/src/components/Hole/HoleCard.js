import React from 'react';
import { Link } from 'react-router-dom';
import '../../App.css';

const HoleCard = (props) => {
    const  hole  = props.hole;
    return(
        <div className="card-container">
            <div className="desc">
                <h2>
                    <Link to={`/hole/show-hole/${hole.id}`}>
                        Hole #{hole.id}
                    </Link>
                </h2>
                <p>Latitude : {hole.latitude}</p>
                <p>Longitude : {hole.longitude}</p>
                <p>Dip : {hole.dip}</p>
                <p>Azimuth : {hole.azimuth}</p>
                <div>
                    <Link to={`/hole/show-hole/${hole.id}`} className="btn btn-outline btn-primary">
                        Show Detail
                    </Link>
                </div>
            </div>
        </div>
    )
};

export default HoleCard;