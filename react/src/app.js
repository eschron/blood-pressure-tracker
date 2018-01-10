import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';

const App = props => {
  return(
    <Router history={browserHistory}>
      <Route path='/'>
      </Route>
    </Router>
  )
}

export default App;
