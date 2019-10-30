import * as React from 'react';
import {Ingredients} from './server/ingredients.js'


type InputBarProps = {onNameChange:(value:string)=>void, onDescChange:(value:string)=>void, onIngSubmitChange:()=>void, NameText:string DescText:string} //just added to create props for input bar

export class Ingredients extends React.Component{
	constructor(props:InputBarProps){
	    super(props);
	    this.handleNameTextChange = this.handleNameTextChange.bind(this)
	    this.handleDescTextChange = this.handleDescTextChange.bind(this)
	    this.handleIndgSubmitChange = this.handleIngSubmitChange.bind(this)
	    this.handleKeyPress = this.handleKeyPress.bind(this)

	}

	handleNameTextChange(e:any){
	    this.props.onNameChange(e.target.value);
	}

	handleDescTextChange(e:any){
	    this.props.onDescChange(e.target.value);
	}

	handleIndgSubmitChange(e:any){ // button action
	    this.props.onIngSubmitChange();
	}
	handleKeyPress(e:any){
	    if (e.key === 'Enter'){
	        e.preventDefault()
	        this.props.onIngSubmitChange();
	    }
	}
  render() {
    return (
      <div class ="Ingredients">
			<form action=" ">
   	   			<div class ="name">
					<p>Ingredient:<p><br/>
  	  				<input type="text" name="ingredient_name" placeholder="Ingredient" value={this.props.NameText} onChange={this.handleNameTextChange}
        			onKeyPress={this.handleKeyPress} >
				</div>
 	   			<br>
   	   			<div class ="desc">
  	  				<p>Description: <p><br/>
					<input type="text" name="ingredient_Description" placeholder="Description" value={this.props.DescText} onChange={this.handleDescTextChange}
        			onKeyPress={this.handleKeyPress} >
   	   			</div>
				<br/> <br/>
   	   			<div class ="submit">
  	  				<button id ="enterButton" type="button" onClick={this.handleIndgSubmitChange}>ADD</button>
				</div>
			</form>
      </div>
    );
  }
}

export default Ingredients
