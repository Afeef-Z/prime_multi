import React from "react";
import axios from "axios";
import MultiplicationTable from "./MultiplicationTable";

const PrimeTable = () => {
    const [dimension, setDimension] = React.useState(0);
    const [primes, setPrimes] = React.useState([]);

    const fetchPrimes = async (e) => {
        e.preventDefault();
        const {data} = await axios.get(`/api/v1/prime_tables?dimension=${dimension}`)
        setPrimes(data)
    }

    return (
        <div className="container my-5">
            <form className = "mb-4 row">
                <div className = "form-group col-md-10">
                    <input id = 'dimension' type = "text" placeholder = "Enter Dimension" onChange = {(e) => setDimension(e.target.value)} className = "form-control"/>
                </div>
                <button type="submit" onClick = {fetchPrimes} className = "btn btn-primary col-md-2">Submit</button>
            </form>

            <MultiplicationTable primes = { primes } />
        </div>
    );
}

export default PrimeTable;