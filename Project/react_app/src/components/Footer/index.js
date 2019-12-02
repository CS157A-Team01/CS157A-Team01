import React from "react";
import FontAwesomeIcon from "@fortawesome/react-fontawesome";
import faCompass from "@fortawesome/fontawesome-free-solid/faCompass";
import faPhone from "@fortawesome/fontawesome-free-solid/faPhone";
import faClock from "@fortawesome/fontawesome-free-solid/faClock";
import faEnvelope from "@fortawesome/fontawesome-free-solid/faEnvelope";

const Footer = () => {
  return (
    <footer className="bck_b_dark">
      <div className="container"></div>
      <div className="wrapper">
        <div className="left">
          <h2>Contact information</h2>
          <div className="business_nfo">
            <div className="tag">
              <FontAwesomeIcon icon={faCompass} className="icon" />
              <div className="nfo">
                <div>Address</div>
                <div>1 Washington ave San Jose</div>
              </div>
            </div>
            <div className="tag">
              <FontAwesomeIcon icon={faPhone} className="icon" />
              <div className="nfo">
                <div>Phone</div>
                <div>408-123-1234</div>
              </div>
            </div>
            <div className="tag">
              <FontAwesomeIcon icon={faClock} className="icon" />
              <div className="nfo">
                <div>Working hours</div>
                <div>Mon-Fri/ 9am - 6pm</div>
              </div>
            </div>
            <div className="tag">
              <FontAwesomeIcon icon={faEnvelope} className="icon" />
              <div className="nfo">
                <div>Email</div>
                <div>info@gmail.com</div>
              </div>
            </div>
          </div>
        </div>
        <div className="left">
          <h2>Be the first Customer </h2>
          <div>
            <div>Hello New Customer</div>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
