# Pixabay Gallery application

This is a simple application that uses the Pixabay API to display images in a gallery.
The user can search for images using a search term and the application will display the images in a
grid.
The user can also click on an image to view details about the image.

## To run the application

1. Clone the repository
2. Run `flutter pub get` to install the dependencies
3. Add your Pixabay API key in the `lib/src/utils/constants.dart` file or create a `.env` file
4. Run the application using `flutter run` or using your IDE
5. To login with default user, use the following credentials:
    - Username: `user1@gmail.com` (or any user`N`@gmail.com, where N is [1, 2, 3, 4, 5])
    - Password: `Test1234`

## Features

- Mock authentication & Local storage
- Image search
- Theme switching
- Detailed image view

