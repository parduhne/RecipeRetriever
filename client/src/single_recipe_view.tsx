// get_recipe_name(id){
//   fetch("http://localhost:8000/recipes?id=${id}")
//     .then(res => res.json())
//     .then(
//       (result) => {
//         return result.name
//       },
//       // Note: it's important to handle errors here
//       // instead of a catch() block so that we don't swallow
//       // exceptions from actual bugs in components.
//       (error) => {
//         //need to add something here later
//       }
//     )
// }
// get_ing_name(id){
//   fetch("http://localhost:8000/ingredients?id=${id}")
//     .then(res => res.json())
//     .then(
//       (result) => {
//         return result.name
//       },
//       // Note: it's important to handle errors here
//       // instead of a catch() block so that we don't swallow
//       // exceptions from actual bugs in components.
//       (error) => {
//         //do something
//       }
//     )
// }

// if(reciID == item.recipeid){
//   itemName = get_ing_name(item.ingredientid)
//   list.push(<li key={item.recipeid}>{item.size} oz {itemName}</li>);
// }else{
//   reciName = get_recipe_name(item.recipeid)
//   list.push(<li key={item.recipeid}><h3>{reciName}</h3></li>);
//   itemName = get_ing_name(item.ingredientid)
//   list.push(<li key={item.recipeid}>{item.size} oz {itemName}</li>);
//   reciID = item.recipeid
// }
import * as React from 'react';
// import './App.css';
// import {QuestionEntry, VoteValidation} from './QuestionEntry'

class SingleRecipeView extends React.Component <any, any> {
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
    fetch("http://localhost:8000/recipes?id=0")
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
  public recipe_call(){

  }
  createList(){
    const { error, isLoaded, items } = this.state;
    let reciID = -1;
    let list = [];
    items.forEach( (item) => {
      list.push(<li key={item.recipeid}>{item.size} oz {item.ingredientid}</li>);
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
export default SingleRecipeView;
