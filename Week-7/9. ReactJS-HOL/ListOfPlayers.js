import React from 'react';

function ListOfPlayers(props) {
    const players = [
        { name: 'Jack', score: 50 },
        { name: 'Michael', score: 70 },
        { name: 'John', score: 40 },
        { name: 'Ann', score: 61 },
        { name: 'Elisabeth', score: 61 },
        { name: 'Sachin', score: 95 },
        { name: 'Dhoni', score: 100 },
        { name: 'Virat', score: 84 },
        { name: 'Jadeja', score: 64 },
        { name: 'Raina', score: 75 },
        { name: 'Rohit', score: 80 }
    ]; // Declare an array with 11 players and store details of their names and scores [cite: 23]

    // Filter players with scores below 70 using arrow functions [cite: 24]
    const playersBelow70 = players.filter(item => item.score <= 70);

    return (
        <div>
            <h1>List of Players</h1>
            <ul>
                {players.map((item, index) => ( // Use map() method of ES6 
                    <li key={index}>Mr. {item.name} <span>{item.score}</span></li>
                ))}
            </ul>

            <h1>List of Players having Scores Less than 70</h1>
            <ul>
                {playersBelow70.map((item, index) => (
                    <li key={index}>Mr. {item.name} <span>{item.score}</span></li>
                ))}
            </ul>
        </div>
    );
}

export default ListOfPlayers;