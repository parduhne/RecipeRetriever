import * as React from 'react';
// import './App.css';
// import {QuestionEntry, VoteValidation} from './QuestionEntry'

class RecipeView extends React.Component <any, any> {
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
  createList(){
    const { error, isLoaded, items } = this.state;
    let reciID = -1;
    let list = [];
    items.forEach( (item) => {
      if(reciID == item.recipeid){
        list.push(<li key={item.recipeid}>{item.size}oz {item.ingname}</li>);
      }else{
        list.push(<li key={item.recipeid}><h3>{item.recipename}</h3></li>);
        list.push(<li key={item.recipeid}>{item.size} oz {item.ingname}</li>);
        reciID = item.recipeid
      }
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
export default RecipeView;
