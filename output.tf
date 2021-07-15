output "playlists" {
  value = {
    cookout = spotify_playlist.cookout
    workout = spotify_playlist.workout
  }
}
