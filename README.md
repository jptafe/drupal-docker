 ``` 
      
     |           D R U P A L 
     |
     |           D O C K E R 
     |
     |           D E P L O Y 

```

### An exploration of Drupal, Composer & Drush to deploy a managed microservice 

# OBJECTIVES 
* develop a persistent service with an epheremal microservice 
* maintain dev, staging and production with a single platform 
* automate backup by pushing configuration & content to a git repository TODO 

# TECHNOLOGY
* docker, docker-compose
* composer, drush, drupal
* linux, bash 

# FOLDER STRUCTURE
* sync - an export of the configuration 
* files - objects uploaded in the user-space

# INSTALLATION:

See Dockerfile & docker-compose
```
docker system prune // remove all persistence 
eocker-compose build
docker-compose up
```

# TODO
* develop cron event to export configurations & content
* push to a private repository
* remove passwords from implementation

# Run in Google Cloud

[![Run on Google Cloud](https://deploy.cloud.run/button.svg)](https://deploy.cloud.run)
