# Funding Compaigns Backend

## Project Setup
- install packages via npm
- Load db dump
- npm start for runing server at port 5000

### `npm install`
installs all relevant packages required.

### `mysql -u root -p < TestTask.sql`
Loads DB dump and all relevant procedures

## `npm start`
Runs server at port 5000

## Procedures

### For Marking compaign as fraud
Use POST http://localhost:5000/compaigns/:id/fraud API endpoint to mark a compaign as fraud and all it's donations as invalid.
