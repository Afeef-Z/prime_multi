import React from "react";

const MultiplicationTable = (props) => {
    const { primes } = props;
    const [row, setRow] = React.useState(0);
    const [col, setCol] = React.useState(0);
    const [showRows, setShowRows] = React.useState(0);
    const [showCols, setShowCols] = React.useState(0);

    React.useEffect(() => {
        const rowSize = primes.length - row
        const colSize = primes.length - col
        setShowRows(rowSize < 15 ? rowSize : 15)
        setShowCols(colSize < 15 ? colSize : 15)
    }, [primes, row, col])

    return (
        <div>
            <div className = "table-responsive">
                <table className = 'table table-stripped'>
                    <thead>
                        <tr>
                            <th></th>
                            {[...Array(showCols).keys()].map( i =>
                                <th key = {i} >{ primes[i + col] }</th>
                                )}
                        </tr>
                    </thead>
                    <tbody>
                        {[...Array(showRows).keys()].map(r =>
                            <tr key = {r}>
                                {[...Array(showCols + 1).keys()].map(c => 
                                    <td key = {c} >{ c === 0 ? primes[r + row] : primes[r + row] * primes[c + col - 1] }</td>
                                    )}
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>

            {!!primes.length && 
            <>
                <button onClick={() => setCol(col - 15)} disabled = {col < 15} className = "btn me-1">Left</button>
                <button onClick={() => setCol(col + 15)} disabled = {col + 15 >= primes.length} className = "btn me-1">Right</button>
                <button onClick={() => setRow(row - 15)} disabled = {row < 15} className = "btn me-1">Up</button>
                <button onClick={() => setRow(row + 15)} disabled = {row + 15 >= primes.length} className="btn me-1">Down</button>
            </>}
        </div>
    );
}

export default MultiplicationTable;