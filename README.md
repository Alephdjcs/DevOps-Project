# DevOps Challenge – Application Code

This branch contains the **source code** for the sample web application.  

## Project Structure

.
├── application
│   ├── docker-compose.yml
│   ├── Dockerfile
│   └── src
│       └── web
│           ├── css
│           │   ├── bootstrap.css
│           │   ├── flexslider.css
│           │   ├── font-awesome.min.css
│           │   ├── icofont.css
│           │   ├── jquery-ui.css
│           │   ├── jQuery.verticalCarousel.css
│           │   ├── owl.carousel.min.css
│           │   └── owl.theme.default.min.css
│           ├── fonts
│           │   ├── flexslider-icon.eot
│           │   ├── flexslider-icon.svg
│           │   ├── flexslider-icon.ttf
│           │   ├── flexslider-icon.woff
│           │   ├── FontAwesome.otf
│           │   ├── fontawesome-webfont.eot
│           │   ├── fontawesome-webfont.svg
│           │   ├── fontawesome-webfont.ttf
│           │   ├── fontawesome-webfont.woff
│           │   ├── fontawesome-webfont.woff2
│           │   ├── glyphicons-halflings-regular.eot
│           │   ├── glyphicons-halflings-regular.svg
│           │   ├── glyphicons-halflings-regular.ttf
│           │   ├── glyphicons-halflings-regular.woff
│           │   ├── glyphicons-halflings-regular.woff2
│           │   ├── icofont.eot
│           │   ├── icofont.svg
│           │   ├── icofont.ttf
│           │   └── icofont.woff
│           ├── img
│           │   ├── accordion1.jpg
│           │   ├── customar-_area_bg.jpg
│           │   ├── header-bg.jpg
│           │   ├── site-logo.png
│           │   ├── sliderr1.png
│           │   ├── vertical_text_images1.jpg
│           │   └── vertical_text_images.jpg
│           ├── index.html
│           ├── js
│           │   ├── active.js
│           │   ├── bootstrap.min.js
│           │   ├── jquery-3.1.1.min.js
│           │   ├── jquery.flexslider.js
│           │   ├── jquery-ui.js
│           │   ├── jQuery.verticalCarousel.js
│           │   └── owl.carousel.min.js
│           ├── responsive.css
│           └── style.css
└── README.md

## Quick Start (Local)

1. Clone the repository:
```bash
git clone -b main https://github.com/Alephdjcs/devops-challenge.git
cd devops-challenge/application

docker build -t myapp:latest .
docker run -p 8080:80 myapp:latest


http://localhost:8080


## Notes

This branch is intended for development and local testing only.

CI/CD pipeline, deployment instructions, and documentation are maintained in the UAT branch.

For production or staging deployments, please refer to the UAT branch.
