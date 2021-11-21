terraform {
  backend "remote" {
    workspaces {
      name = "spotify-playlists"
    }
  }

  required_providers {
    spotify = {
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}
