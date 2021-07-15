# Terraform Spotify Playlists

This is based on the [Create a Spotify Playlist with Terraform](https://learn.hashicorp.com/tutorials/terraform/spotify-playlist)
from HashiCorp Learn.

## Approach

I chose to use CSV files to populate Spotify playlists. For each row of the
given CSV file, the first search result is added to the playlist. This is
probably non-deterministic, so at some point I may add an optional field to
specify the Spotify id of the track.

## Usage

As noted in the referenced tutorial, the [Spotify Terraform provider](https://registry.terraform.io/providers/conradludgate/spotify/latest) requires a local
server. The included Docker Compose configuration will start this server.

First, populate the `.env` file with the values as instructed in the tutorial.

```bash
SPOTIFY_CLIENT_ID=<client-id>
SPOTIFY_CLIENT_SECRET=<client-secret>
```

Launch the server:

```
> docker-compose up -d
```

The API key needed for the provider is printed by the container:

```
> docker logs <container-name> | grep '^APIKey:'
```

Put this in `terraform.tfvars`:

```hcl
spotify_api_key = "<api-key>"
```

Now, everything should work.

```
> terraform apply
```
