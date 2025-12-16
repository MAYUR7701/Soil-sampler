# Soil Sampler

## Frontend

Navigate to the `frontend` directory and run the following command to start the development server:

```bash
cd frontend
npm install
npm run dev
```
## Backend

Navigate to the backend directory and create a .env file with the following content:

```
cd backend
pip install -r requirements.txt
```

```
DB_NAME=YOUR_DB_NAME
DB_USER=YOUR_DB_USER
DB_PASSWORD=YOUR_DB_PASSWORD
DB_HOST=localhost
DB_PORT=3306
```

Then run the following commands to apply migrations and start the server:

```
python manage.py makemigrations
python manage.py makemigrations soil_sampler
python manage.py migrate 
```

## For creating a superuser in the database 

```
python manage.py createsuperuser 
```

## Start the server

```
python manage.py runserver
```
