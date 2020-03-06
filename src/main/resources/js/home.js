$('.carousel').slick({
    slidesPerRow: 3,
    rows: 3,
    Arrow :true,
    loop:true,
    arrows: true,
    cssEase: "ease",
    nextArrow:"<i class='fas fa-chevron-right arrow-right'></i>",
    prevArrow:"<i class='fas fa-chevron-left arrow-left'></i>",
    responsive: [
    {
      breakpoint: 478,
      settings: {
        slidesPerRow: 1,
        rows: 1,
      }
    }
  ]
});

