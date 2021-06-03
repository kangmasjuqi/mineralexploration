import React from 'react';
import '../../App.css';

const HoleSegment = (props) => {

    const  hole  = props.hole;

    return(
        <div className="table-responsive">
          <table className="table table-hover table-dark">
            <tbody>
              <tr>
                <td align="right">Hole Latitude</td>
                <td>{ hole.latitude }</td>
                <td align="right">Hole Longitude</td>
                <td>{ hole.longitude }</td>
              </tr>
              <tr>
                <td align="right">Hole Dip</td>
                <td>{ hole.dip }</td>
                <td align="right">Hole Azimuth</td>
                <td>{ hole.azimuth }</td>
              </tr>
            </tbody>
          </table>
        </div>
    )
};

export default HoleSegment;