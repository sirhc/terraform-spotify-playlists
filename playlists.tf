locals {
  cookout = csvdecode(file("${path.module}/playlists/cookout.csv"))
  workout = csvdecode(file("${path.module}/playlists/workout.csv"))
}

data "spotify_search_track" "cookout" {
  for_each = { for row in local.cookout : join(",", [row.artist, row.album, row.track]) => row }

  artist = each.value.artist
  album  = each.value.album
  name   = each.value.track
}

resource "spotify_playlist" "cookout" {
  name        = "Terraform Cookout Playlist"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = [
    for k, v in data.spotify_search_track.cookout : v.tracks[0].id
  ]
}

data "spotify_search_track" "workout" {
  for_each = { for row in local.workout : join(",", [row.artist, row.album, row.track]) => row }

  artist = each.value.artist
  album  = each.value.album
  name   = each.value.track
}

resource "spotify_playlist" "workout" {
  name        = "Terraform Workout Playlist"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = [
    for k, v in data.spotify_search_track.workout : v.tracks[0].id
  ]
}
