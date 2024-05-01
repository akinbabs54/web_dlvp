import React from 'react';
import { Link } from 'react-router-dom';
import './Home.css';

const Home = () => {
  return (
    <div>
      {/* Header */}
      <header className="header_box">
        <h4 className="ITS"> IT SERVICES </h4>
        <div className="upper_right_box">
          <Link to="/web_development"><h4>WEB DEVELOPMENT</h4></Link>
          <Link to="/it_security"><h4>IT SECURITY</h4></Link>
          <Link to="/it_service_management"><h4>IT SERVICE MANAGEMENT</h4></Link>
          <Link to="/contact"><h4>CONTACT</h4></Link>
        </div>
      </header>

      {/* Main Content */}
      <main>
        <div className="middle_box">
          <div className="first_middle_box"></div>
          <div className="second_middle_box">
            <h1 className="about_us">ABOUT US</h1>
            <h5 className="first_lorem">Lorem Ipsum is simply dummy text...</h5>
            <button className="second_help_me_button">HELP ME</button>
          </div>
        </div>
        <div className="project-content">
          <h1>DRIVE GROWTH AND SUCCESS WITH STRATEGIC IT SOLUTIONS</h1>
          <p>Lorem Ipsum is simply dummy text...</p>
        </div>
      </main>

      {/* Footer */}
      <footer className="copyright">
        <p>&copy; 2024 Your Company Name. All rights reserved.</p>
      </footer>
    </div>
  );
};

export default Home;


