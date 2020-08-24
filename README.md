[Watch a demo video](https://streamable.com/552aia)

[![Watch the video](https://i.imgur.com/QWlzmBT.png)](https://streamable.com/552aia)

To run the web-app, setup postgresql locally, then do the following:

Create and setup the DB
```
psql -d sparta
psql -d sparta -f db/sparta.sql
```

Run the app
```
export DATABASE_URL='postgres://{your_postgres_user_here}:{your_postgres_password_if_you_have_one}@localhost/sparta'
rackup
```

To run heroku commands, make sure you install heroku tools

To deploy new code on heroku:
```
git push heroku master
```

To check logs on heroku:
```
heroku logs --tail
```

To run .sql file on heroku database:
```
heroku pg:psql --app sparta-gym < db/sparta.sql
```