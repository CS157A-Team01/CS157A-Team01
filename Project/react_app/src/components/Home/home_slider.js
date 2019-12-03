import React from "react";
import Slider from "react-slick";

const HomeSlider = props => {
  const slides = [
    {
      img: "/images/main.jpg",
      lineOne: "BeatMe",
      lineTwo: "Deal Tracker",
      linkTitle: "Register Now",
      linkTo: "/register_login"
    },
    {
      img: "/images/main2.jpg",
      lineOne: "BeatMe",
      lineTwo: "Deal Tracker",
      linkTitle: "Log in",
      linkTo: "/register_login"
    }
  ];

  const settings = {
    dots: false,
    infinite: true,
    speed: 500,
    slidesToShow: 1,
    slidesToScoll: 1,
    arrows: false
  };

  const generateSlides = () =>
    slides
      ? slides.map((item, i) => (
          <div key={i}>
            <div
              className="featured_image"
              style={{
                background: `url(${item.img})`,
                height: `${window.innerHeight}px`
              }}
            >
              <div className="featured_action">
                <div className="tag title">{item.lineOne}</div>
                <div className="tag low_title">{item.lineTwo}</div>
                <div></div>
              </div>
            </div>
          </div>
        ))
      : null;
  return (
    <div className="featured_container">
      <Slider {...settings}>{generateSlides()}</Slider>
    </div>
  );
};

export default HomeSlider;
