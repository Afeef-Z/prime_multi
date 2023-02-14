import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import PrimeTable from "../components/PrimeTable";

export default (
  <Router>
    <Routes>
      <Route path="/" element={<PrimeTable />} />
    </Routes>
  </Router>
);