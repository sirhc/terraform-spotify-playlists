terraform {
  backend "remote" {
    workspaces {
      name = "spotify-playlists"
    }
  }

  required_providers {
    spotify = {
      source  = "conradludgate/spotify"
      version = "~> 0.2"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}
