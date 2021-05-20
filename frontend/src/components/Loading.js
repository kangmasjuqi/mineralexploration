import React from 'react';

const Loading = (props) => {

    const loading = props.loading;
    let loading_message = ''

    if(loading)
        loading_message = 
            <div className="col-md-12">
                <p className="loading-notif">Loading data, please wait..</p>
            </div>

    return loading_message
};

export default Loading;