# Confnotes API

Description:

Confnotes will be a web application that will allow you to
watch videos and take "notes" from [Confreaks.tv](http://www.confreaks.tv) .

A User will be able to login via email/password. They will browse and add videos
to their library. When watching a video a User will have the option to take
notes. When the button is pressed the video will pause allowing the User to insert notes.
When the notes are submitted the video will continue playing.

This will be the Rails API backend for Confnotes. It will have several API end points
that will serve an Ember frontend.

Examples of some of the API endpoints:

```

/api/v1/conferences
# => returns all conferences

/api/v1/conferences/:id
# => returns one conference

/api/v1/presenters
# => returns all presenters

/api/v1/presenters/:id
# => returns one presenter

/api/v1/events/
# => returns all events

/api/v1/events/:id
# => returns one event

/api/v1/videos/
# => returns all videos

/api/v1/videos/:id
# => returns one video

/api/v1/users/:id/notes
# => returns all user's notes

/api/v1/users/:id/notes/:id
# => returns one user's notes

/api/v1/users/:id/library
# => returns one user's library

```

Note:
**This is project is currently in development.**

This project will use Confreaks.tv API `http://confreaks.tv/api/v1` to pull
video information.




