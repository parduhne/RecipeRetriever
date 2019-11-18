import React from "react";
import {
  BrowserRouter,
  Switch,
  Route,
  Link
} from "react-router-dom";
import RecipeView from './recipes_view';
import RecipePantryView from './recipes_pantry_view';

export default function App() {
    return (
      <BrowserRouter>
        <div>
          <nav>
            <ul>
              <li>
                <Link to="/">Home</Link>
              </li>
              <li>
                <Link to="/recipes">Recipes</Link>
              </li>
              <li>
                <Link to="/pantry">Pantry</Link>
              </li>
              <li>
                <Link to="/pantry-recipes">Pantry Recipes</Link>
              </li>
            </ul>
          </nav>

          {/* A <Switch> looks through its children <Route>s and
              renders the first one that matches the current URL. */}
          <Switch>
            <Route path="/recipes">
              <Recipes />
            </Route>
            <Route path="/pantry">
              <Pantry />
            </Route>
            <Route path="/pantry-recipes">
              <PantryRecipes />
            </Route>
            <Route path="/">
              <Home />
            </Route>
          </Switch>
        </div>
      </BrowserRouter>
    );
  }

  function Home() {
    return <h2>Home</h2>;
  }

  function Recipes() {
    return <RecipeView />;
  }

  function Pantry() {
    return <h2>Users</h2>;
  }
  function PantryRecipes() {
    return <RecipePantryView />;
  }
