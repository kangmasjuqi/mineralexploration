import React from 'react';

import ReadingRow from '../Reading/ReadingRow';

import '../../App.css';

const ReadingTable = (props) => {

    const readings = props.readings;
    let reading_list_data;
    let no =1;

    reading_list_data = readings.map((reading, k) =>
        <ReadingRow reading={reading} key={k} no={no++}/>
    );

    return (
          <div className="ReadingListContainer">
            <h4>
                Reading List | <span className="badge badge-info">{readings.length}</span>
            </h4>
            <table className="table table-hover table-striped">
              <thead className="thead-dark">
                  <tr>
                    <td>No.</td>
                    <td>Depth</td>
                    <td>Dip</td>
                    <td>Azimuth</td>
                    <td>Trustworthy</td>
                    <td>Action</td>
                  </tr>
              </thead>
              <tbody>
                { reading_list_data }
              </tbody>
            </table>
          </div>
    );
}

export default ReadingTable;