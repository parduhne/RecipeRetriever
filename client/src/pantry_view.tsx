import * as React from 'react';
// import './App.css';
// import {QuestionEntry, VoteValidation} from './QuestionEntry'

class PantryView extends React.Component <any, any> {
  constructor(props: any) {
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
    fetch("http://localhost:8000/pantry/0")
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
  createList(){
    const { error, isLoaded, items } = this.state;
    let ingID = -1;
    let list = [];
    items.forEach( (item) => {
      list.push(<li key={item.ingredientID}>{item.size} {item.unitname} of <b>{item.ingredientname}</b></li>);
    });
    return list;
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
          {this.createList()}
        </ul>
      );
    }
  }
}
export default PantryView;
