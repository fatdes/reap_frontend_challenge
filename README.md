# Simple app

## Setup

- flutter 2.0+
- jave (if you want to generate api models)

```bash
# generate api models
flutter pub run build_runner build --delete-conflicting-outputs 

# cleanup the cache and generate_api folder otherwise it won't generate by default
flutter pub run build_runner clean
rm -rf ./generated_api
```

## Documentation

1. Test
```bash
flutter test
```

2. Production

Setup and deploy

```bash
# setup heruko app in dashboard then add remote
heroku git:remote -a fatdes-reap-frontend-challenge

# deploy to heroku 
git push heroku main
```

- config VAR
  - FLUTTER_BUILD=flutter build web --release --quiet --no-sound-null-safety --dart-define=API_BASE=https://desmond-reap-backend-challenge.herokuapp.com/v1
- follow guideline in https://elements.heroku.com/buildpacks/ee/heroku-buildpack-flutter-light

Access at https://fatdes-reap-frontend-challenge.herokuapp.com

3. Known issue

- refresh (F5) browser will lead to fail on missing token
  - token is not persisted properly 
- new created post image is not displayed correctly in the beginning.. click it will refresh to correct one

4. Sample video

[sample video here](sample.mov)