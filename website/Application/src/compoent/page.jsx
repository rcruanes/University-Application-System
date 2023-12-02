import { useState, useEffect } from "react";
import RequestIdGenerator from "./requestId/requestID";
import "./page.css";
const Page = (props) => {
  const [input, setInput] = useState(true); // for error message if not all input are filled

  const handleSubmit = (e) => {
    e.preventDefault();
    //get data
    const inputNames = [
      "username",
      "email",
      "password",
      "gpa",
      "extracurriculars",
      "income",
      "ethnicity",
      "race",
      "age",
      "gender",
      "sex",
    ];
    const contacts = {};

    let count = 0;
    for (let i = 0; i < inputNames.length; i++) {
      const inputElement = document.getElementById(inputNames[i]);
      inputElement.value ? count++ : count;
      contacts[inputNames[i]] = inputElement.value;
    }

    //if all input are filled
    if (count == inputNames.length) {
      localStorage.setItem("contacts", JSON.stringify(contacts));
      //hidden contact tab and error message
      setInput(true);
    } else {
      //display error
      setInput(false);
    }
  };
  return (
    <div className="container">
      <div className={"contact-content"}>
        <div className="text">Info</div>
        <div className="center">
          <h1 className={input ? "alert off" : "alert"}>All fields required</h1>
        </div>
        <form onSubmit={handleSubmit} className="form">
          <div className="center">
            <div className="info-form__2col">
              <span>
                <label>
                  Username <b>*</b>
                </label>
                <input
                  type="text"
                  placeholder="Enter your Username"
                  name=""
                  id="username"
                />
              </span>
              <span>
                <label>
                  Email <b>*</b>
                </label>
                <input
                  type="text"
                  placeholder="Enter your email"
                  name=""
                  id="email"
                />
              </span>
            </div>
            <div className="info-form__2col">
              <span>
                <label>
                  Password <b>*</b>
                </label>
                <input
                  type="text"
                  placeholder="Enter password"
                  name=""
                  id="password"
                />
              </span>
              <span>
                <label>
                  GPA <b>*</b>
                </label>
                <input
                  type="text"
                  placeholder="Enter your GPA"
                  name=""
                  id="gpa"
                />
              </span>
              <div />
              <div className="info-form__1col">
                <span>
                  <label>
                    Extracurriculars <b>*</b>
                  </label>
                  <input
                    type="text"
                    placeholder="Enter your extracurriculars"
                    name=""
                    id="extracurriculars"
                  />
                </span>
              </div>
              <div className="info-form__2col">
                <span>
                  <label>
                    income <b>*</b>
                  </label>
                  <input
                    type="text"
                    placeholder="Enter your income"
                    name=""
                    id="income"
                  />
                </span>
                <span>
                  <label>
                    Ethnicity <b>*</b>
                  </label>
                  <input
                    type="text"
                    placeholder="Enter your Ethnicity"
                    name=""
                    id="ethnicity"
                  />
                </span>
                <span>
                  <label>
                    Race <b>*</b>
                  </label>
                  <input
                    type="text"
                    placeholder="Enter your race"
                    name=""
                    id="race"
                  />
                </span>
                <span>
                  <label>
                    Age <b>*</b>
                  </label>
                  <input
                    type="text"
                    placeholder="Enter your age"
                    name=""
                    id="age"
                  />
                </span>
                <span>
                  <label>
                    Gender <b>*</b>
                  </label>
                  <input
                    type="text"
                    placeholder="Enter your gender"
                    name=""
                    id="gender"
                  />
                </span>
                <span>
                  <label>
                    Sex <b>*</b>
                  </label>
                  <input
                    type="text"
                    placeholder="Enter your sex"
                    name=""
                    id="sex"
                  />
                </span>
              </div>
            </div>
            {<RequestIdGenerator />}
            <button type="submit" className="colored-button">
              Submit
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default Page;
