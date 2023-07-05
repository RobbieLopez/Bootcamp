import { useEffect, useState } from 'react';
import './App.css';
import { Characters } from './components/Characters';
function App() {
  const [characters, setCharacters] = useState([]);
  function getCharacters(pageNumber = 1) {
    const res = fetch("https://rickandmortyapi.com/api/character/?page=1git s")
      .then(response => response.json())
      .then(({ results }) => results)
      .catch(() => []);
      return res;
  }
  async function consoleCharacters() {
    const resp = await getCharacters();
    setCharacters(resp);
  }

  //Es un hook que nos permite ejecutar cierta funcionalidad en el ciclo de vida de cierto compoenente
  useEffect(()=>{
    console.log(consoleCharacters()) 
  }, []);
  
  
  return (
    <div className="App">
      <header className="Header">
        <img className="Logo" src="/logoRM.png" alt=""/>
        <h1 className="Terms">Terms + conditions</h1>
      </header>
      <div className="Hero">
        <h1>Rick and morty</h1>
        <h1>See all the caracters and more </h1>
      </div>
      <main><h1>Characters list</h1>
      <hr />
      <div className="card-container">
        {
        (characters && characters.length > 0) && characters.map(character => (<Characters character={character} />))
        }
      </div>
      </main>
      <footer>

      </footer>
    </div>
  );
}

export default App;





