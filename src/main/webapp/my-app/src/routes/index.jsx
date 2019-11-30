import React from "react";
import {
    BrowserRouter as Router,
    Switch,
    Route,
    Link
} from "react-router-dom";
import AdvertisementDetails from './advertisement-details';

export default function App() {
    return (
        <Router>
                <Switch>
                    <Route path="/advertisement-details/:id/:name" component={AdvertisementDetails} />
                </Switch>
        </Router>
    );
}
