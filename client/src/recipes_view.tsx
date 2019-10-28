import * as React from 'react';
// import './App.css';
// import {QuestionEntry, VoteValidation} from './QuestionEntry'

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      error: null,
      isLoaded: false,
      items: []
    };
    this.api_call();
    this.render();
  }
  public api_call(){
    // calls api
    // Map json to typescript
    // return mapped object
    fetch("http://localhost:8000/all-recipes")
      .then(res => res.json())
      .then(
        (result) => {
          this.setState({
            isLoaded: true,
            items: result
          });
        },
        // Note: it's important to handle errors here
        // instead of a catch() block so that we don't swallow
        // exceptions from actual bugs in components.
        (error) => {
          this.setState({
            isLoaded: true,
            error
          });
        }
      )
  }
  render() {
    // Generate and insert HTML
    // this will call api_call()
    const { error, isLoaded, items } = this.state;
    if (error) {
      return <div>Error: {error.message}</div>;
    } else if (!isLoaded) {
      return <div>Loading...</div>;
    } else {
      return (
        <ul>
          {items.map((item, index) => (
            <li key={item.recipeid}>
              {item.recipename} {item.ingname} {item.size}
            </li>
          ))}
        </ul>
      );
    }
  }
}
export default App;
