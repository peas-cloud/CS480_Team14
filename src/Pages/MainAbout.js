import React from "react";

export default function MainAbout() {
  const tableStyle = {
    borderCollapse: "collapse",
    width: "50%",
    margin: "auto",
    border: "2px solid #ddd", // Thicker border for the entire table
  };

  const cellStyle = {
    border: "2px solid #ddd", // Thicker border for cells
    padding: "8px",
    textAlign: "left",
  };

  const headerCellStyle = {
    ...cellStyle,
    backgroundColor: "#f2f2f2",
  };

  return (
    <div className="content">
      <h1>About Us </h1>
      <br></br><br></br>
      <h2>University Of Illinois Chicago </h2>
      <br></br>
      <h2><storng>Computer Science</storng></h2>
      <br></br><br></br><br></br>
      <h2>[CS480] - Database Management Systems</h2>
      <br></br>
      <h2>Instructor: Sidharth Kumar</h2>
      <br></br><br></br><br></br>
      <h2> Crime Data Analysis for Safer Communities</h2>
      <br></br><br></br><br></br>
      <h3>Project Group : 14</h3>
      <br></br><br></br>
      

      <h3>Group Members</h3><br></br>
      <table style={tableStyle}>
        <thead>
          <tr>
            <th style={headerCellStyle}>Name</th>
            <th style={headerCellStyle}>UIN</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td style={cellStyle}>Sai Teja Aggunna</td>
            <td style={cellStyle}>659408926</td>
          </tr>
          <tr>
            <td style={cellStyle}>Sai Rohit Mahadas</td>
            <td style={cellStyle}>661721354</td>
          </tr>
          <tr>
            <td style={cellStyle}>Vaishnavi Pathipatti</td>
            <td style={cellStyle}>672584335</td>
          </tr>
          <tr>
            <td style={cellStyle}>Tejaswi Velaga</td>
            <td style={cellStyle}>663404952</td>
          </tr>
        </tbody>
      </table>
    </div>
  );
}
