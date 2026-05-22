# YouTube Playlist Download Guide

This guide explains how to download any YouTube playlist as high-quality audio files using the Spotify2MP3 app.

---

## 📋 Table of Contents

1. [Overview](#overview)
2. [What You'll Need](#what-youll-need)
3. [Step-by-Step Instructions](#step-by-step-instructions)
4. [Understanding the CSV Format](#understanding-the-csv-format)
5. [Download Settings Explained](#download-settings-explained)
6. [Troubleshooting](#troubleshooting)
7. [Tips & Best Practices](#tips--best-practices)
8. [FAQ](#faq)

---

## Overview

This workflow allows you to:
- Convert any **public YouTube playlist** to downloadable audio files
- Get high-quality **M4A** (original AAC) or **MP3** (VBR0) files
- Automatically embed metadata (title, artist, album)
- Generate playlists compatible with iTunes, VLC, MediaMonkey, etc.

**The Process:**
```
YouTube Playlist URL → CSV File → Spotify2MP3 App → Downloaded Audio Files
```

---

## What You'll Need

1. **YouTube Playlist URL**
   - Any public YouTube playlist
   - Example: `https://www.youtube.com/playlist?list=PLxxxxxxxxxxxxxxxx`

2. **Spotify2MP3 App**
   - Download from [Releases](https://github.com/angall1/Spotify2MP3/releases)
   - Or run from source with `./run.sh` (macOS)

3. **Internet Connection**
   - For exporting CSV and downloading songs

---

## Step-by-Step Instructions

### Step 1: Get Your YouTube Playlist URL

1. Go to **YouTube.com** and find the playlist you want to download
2. Open the playlist
3. Copy the URL from your browser's address bar
   - Example: `https://www.youtube.com/playlist?list=PLrAXtmErZgOeiKm4sgNOknGvNjby9efdf`

**Note:** The playlist must be **public** or **unlisted** (private playlists won't work)

---

### Step 2: Convert Playlist to CSV

#### Option A: Using SanishTech Export Tool (Recommended)

1. **Open the export tool:**
   - Visit: https://sanishtech.com/tools/export-youtube-playlist-to-csv/
   - Or click the link in the Spotify2MP3 app interface

2. **Paste your playlist URL:**
   ```
   https://www.youtube.com/playlist?list=PLxxxxxxxxxxxxxxxx
   ```

3. **Click "Export to CSV"**
   - The tool will fetch all videos from the playlist
   - Processing time: ~5-10 seconds for most playlists

4. **Download the CSV file:**
   - Click the "Download CSV" button
   - Save it to your Downloads folder or desktop
   - The file will be named something like: `youtube_playlist_export.csv`

#### Option B: Using TuneMyMusic (Alternative)

1. Visit: https://tunemymusic.com/transfer
2. Select "YouTube" as source
3. Paste your playlist URL
4. Select "CSV File" as destination
5. Download the generated CSV

---

### Step 3: Launch Spotify2MP3 App

#### On macOS (from source):
```bash
cd Spotify2MP3-test
./run.sh
```

#### On Windows/macOS (prebuilt app):
- Double-click `Spotify2MP3.exe` (Windows)
- Open `Spotify2MP3.app` (macOS)

---

### Step 4: Import CSV into App

1. **In the app interface, you'll see three blue links at the top:**
   - Exportify (for Spotify)
   - TuneMyMusic (for Apple Music, YouTube Music, etc.)
   - **YouTube Playlist CSV Export** ← This is the new link!

2. **Drag & Drop Method:**
   - Drag your downloaded CSV file onto the drop zone
   - The zone will turn green when a file is loaded
   - You'll see: `CSV file: youtube_playlist_export.csv`

3. **Browse Method:**
   - Click the drop zone
   - Select your CSV file from the file browser

---

### Step 5: Choose Output Folder

1. Click **"Choose Output Folder"**
2. Select where you want the downloaded songs saved
   - Example: `~/Music/YouTube Downloads/`
3. The app will create a subfolder named after your CSV file

---

### Step 6: Configure Download Settings

#### Basic Settings (Visible by default):

**Deep Search:**
- ✅ **ON (Recommended):** Slower but more accurate matching (~20 seconds per song)
  - Searches top 3 YouTube results
  - Scores based on title, artist, duration
  - Best for music playlists

- ❌ **OFF:** Faster but less accurate (~3 seconds per song)
  - Takes first YouTube search result
  - Good for playlists where video titles exactly match song names

**Embed Thumbnails:**
- Enable to download and embed video thumbnails as cover art
- Good for music videos

#### Advanced Settings (Click "Settings" button):

**Duration Filters:**
- **Minimum:** Skip videos shorter than X seconds (default: 60s)
- **Maximum:** Skip videos longer than X seconds (default: 600s)
- Useful for filtering out intros, outros, or full concerts

**Transcode to MP3:**
- ✅ **ON:** Convert to MP3 (VBR0 highest quality)
  - ~8-12 MB per song
  - Compatible with all devices

- ❌ **OFF:** Keep as M4A (AAC format)
  - ~3-5 MB per song
  - Original YouTube audio quality (usually 128 kbps AAC)
  - Not all devices support M4A

**Generate M3U Playlist:**
- ✅ **ON:** Creates a `.m3u` playlist file
  - Import into iTunes, VLC, Winamp, etc.

**Exclude Instrumentals:**
- ✅ **ON:** Skip videos with "instrumental" in title
- Useful for music playlists

**Variants:**
- Add search terms to append (e.g., "acoustic", "live", "remix")
- Advanced users only

---

### Step 7: Start Download

1. Click **"Convert Playlist"** button
2. **Progress tracking:**
   - You'll see: `[1/42] Searching: Song Title Artist`
   - Status updates for each song
   - ETA (Estimated Time Remaining)

3. **What happens during download:**
   ```
   [1/42] Song Title - Artist Name
   🔍 Searching: Song Title Artist
   ✓ Quick match found (or)
   🔎 Deep searching...
   ⬇️  Downloading...
   ✅ Downloaded: 001 - Song Title.m4a
   ```

4. **Wait for completion:**
   - Status will show: `✅ Completed in [time]`
   - A sound notification will play

---

### Step 8: Access Your Downloaded Songs

1. Click **"Open Output Folder"** button in the app

2. **You'll find:**
   ```
   📁 youtube_playlist_export/
   ├── 001 - Song Title 1.m4a
   ├── 002 - Song Title 2.m4a
   ├── 003 - Song Title 3.m4a
   ├── ...
   ├── My Playlist.m3u           (if M3U enabled)
   ├── downloaded.txt            (download archive)
   └── youtube_playlist_export_not_found.csv  (if any failed)
   ```

3. **Files are numbered in playlist order** (001, 002, 003...)

4. **Metadata is embedded:**
   - Title, Artist, Album automatically tagged
   - Cover art (if thumbnail embedding enabled)

---

## Understanding the CSV Format

### Expected CSV Structure

The YouTube playlist CSV export tool generates files with these columns:

```csv
Title,Channel,Duration,URL
Song Name,Artist/Channel Name,3:45,https://youtube.com/watch?v=xxxxx
Another Song,Another Channel,4:20,https://youtube.com/watch?v=yyyyy
```

### How Spotify2MP3 Reads YouTube CSVs

The app is flexible and supports multiple CSV formats:

**Spotify CSV (Exportify):**
```csv
Track Name,Artist Name(s),Album Name,Duration (ms)
```

**Apple Music / YouTube Music (TuneMyMusic):**
```csv
Track name,Artist name,Album
```

**YouTube Playlist (SanishTech/Custom):**
```csv
Title,Channel,Duration,URL
```

The app will:
1. Look for `Track Name` or `Track name` or `Title` for song name
2. Look for `Artist Name(s)` or `Artist name` or `Channel` for artist
3. Look for `Album Name` or `Album` for album (defaults to playlist name if missing)
4. Parse duration from `Duration (ms)` or time format like `3:45`

---

## Download Settings Explained

### Deep Search Algorithm

When **Deep Search is ON**, the app uses a sophisticated matching system:

**Phase 1: Quick Probe**
1. Searches YouTube: `ytsearch1:Song Title Artist`
2. Validates result:
   - ✓ Title contains song name
   - ✓ Uploader/channel matches artist
   - ✓ Duration within ±10 seconds
   - ✓ Duration within your min/max range
3. If all pass → Download immediately

**Phase 2: Deep Search** (if Phase 1 fails)
1. Searches YouTube: `ytsearch3:Song Title Artist`
2. Gets top 3 results
3. Scores each result:
   - +100 points if title starts exactly with song name
   - +80 points if title contains song name
   - -1 point per second of duration difference
   - Checks keywords in correct order
4. Rejects:
   - Age-restricted videos
   - YouTube Shorts
   - Videos outside duration range
   - Videos not matching artist/channel
5. Downloads highest-scoring match

**When Deep Search is OFF:**
- Takes first search result (`ytsearch1:Song Title Artist`)
- No validation
- Much faster (3s vs 20s per song)

---

### Audio Quality Explained

**M4A Format (Default):**
- Original YouTube audio stream
- No re-encoding (preserves quality)
- AAC codec, usually 128 kbps
- Smaller file size (~3-5 MB per song)
- Supported by: iTunes, VLC, modern media players
- **Not supported by:** Some older MP3 players, car stereos

**MP3 Format (Optional):**
- Re-encoded from YouTube audio
- VBR0 (Variable Bitrate 0) = highest MP3 quality
- Larger file size (~8-12 MB per song)
- **Universal compatibility**
- Slight quality loss from re-encoding

**Recommendation:**
- Use **M4A** if your devices support it (most modern devices do)
- Use **MP3** for maximum compatibility or older devices

---

## Troubleshooting

### Problem: "No tracks to download" or Empty CSV

**Causes:**
- Playlist is private
- Invalid playlist URL
- Export tool couldn't access playlist

**Solutions:**
1. Make sure playlist is **public** or **unlisted**
2. Verify URL is correct format: `https://www.youtube.com/playlist?list=PLxxxxx`
3. Try the alternative export method (TuneMyMusic)
4. Check if playlist has any videos (not empty)

---

### Problem: Songs Not Found / Download Failures

**Causes:**
- Video titles don't match actual song names
- Videos are age-restricted
- Videos were removed/deleted
- Incorrect metadata in CSV

**Solutions:**
1. **Enable Deep Search** (slower but more accurate)
2. **Adjust duration filters** in Settings:
   - Lower `duration_min` to 30 seconds
   - Raise `duration_max` to 900 seconds
3. **Check failed songs list:**
   - Open `[playlist]_not_found.csv` in output folder
   - See which songs failed and why
4. **Manual retry:**
   - Edit video titles in CSV to match actual song names
   - Example: Change `"Song Title (Official Music Video)"` to `"Song Title"`
   - Re-import CSV and download again

---

### Problem: Wrong Songs Downloaded

**Causes:**
- Deep Search is OFF
- Video titles are misleading (e.g., covers, remixes)
- Multiple versions of same song

**Solutions:**
1. **Enable Deep Search** for better accuracy
2. **Manually review CSV** before downloading:
   - Open CSV in Excel or text editor
   - Fix video titles to match actual songs
3. **Use duration filtering:**
   - If original song is 3:30, set max to 240 seconds
   - Filters out extended/live versions

---

### Problem: Age-Restricted Videos Fail

**Cause:**
- Video requires sign-in to confirm age
- yt-dlp can't download without authentication

**Solutions:**
1. **Export cookies from browser** (advanced):
   - Install browser extension: "Get cookies.txt"
   - Export cookies from YouTube while logged in
   - Add to Settings → Cookies Path
2. **Skip age-restricted videos:**
   - They'll be listed in `*_not_found.csv`
   - Download manually or find alternate versions

---

### Problem: Download is Very Slow

**Expected speeds:**
- **Deep Search ON:** ~20-30 seconds per song
- **Deep Search OFF:** ~3-5 seconds per song

**For a 50-song playlist:**
- Deep Search: ~20-30 minutes
- Fast Search: ~3-5 minutes

**Solutions:**
1. **Disable Deep Search** if playlist titles are accurate
2. **Reduce search scope:**
   - Tighten duration filters
   - This skips validation on more videos
3. **Split large playlists:**
   - Download in batches of 20-30 songs
4. **Check internet speed:**
   - Slow connection = slower downloads

---

### Problem: Files Have No Metadata / Wrong Info

**Cause:**
- CSV has incomplete information
- Metadata embedding failed

**Solutions:**
1. **Edit CSV before importing:**
   - Add missing Artist, Album columns
   - Ensure proper formatting
2. **Re-download with corrected CSV**
3. **Manually tag files:**
   - Use MP3Tag, MusicBrainz Picard, or iTunes
   - Bulk edit metadata

---

## Tips & Best Practices

### Before Downloading

✅ **Review CSV file first:**
- Open in Excel/LibreOffice/Text Editor
- Check if video titles match actual songs
- Fix obvious errors (typos, wrong artists)

✅ **Set appropriate duration filters:**
- Music songs: 60-600 seconds (1-10 minutes)
- Podcasts: 600-7200 seconds (10-120 minutes)
- Audiobooks: Disable max or set very high

✅ **Use descriptive playlist names:**
- The CSV filename becomes the folder name
- Rename CSV before importing for better organization
- Example: `My_Workout_Mix.csv` → folder: `My_Workout_Mix`

---

### During Downloading

✅ **Don't close the app:**
- Let it run until completion
- If closed, progress is lost (will re-download)

✅ **Monitor the output:**
- Watch for failed songs
- Note any patterns (all from one channel, all short/long)

✅ **Be patient:**
- Deep Search takes time but gives better results
- 100-song playlist ≈ 40-50 minutes with Deep Search

---

### After Downloading

✅ **Check the not_found.csv file:**
- Lists all failed downloads with reasons
- Review for patterns

✅ **Verify downloads:**
- Play a few random songs to check quality
- Ensure metadata is correct

✅ **Import M3U playlist:**
- Double-click `.m3u` file
- Opens in iTunes/VLC/your default player
- Maintains playlist order

✅ **Backup your files:**
- Copy to cloud storage or external drive
- Keep original CSV for re-downloading if needed

---

## FAQ

### Can I download private YouTube playlists?

❌ **No.** The CSV export tools can only access **public** or **unlisted** playlists. You must make the playlist public before exporting.

---

### Can I download YouTube Music playlists?

⚠️ **Partially.** If the playlist is public on regular YouTube (not just YouTube Music), yes. Pure YouTube Music playlists require the paid API (not supported by free tools).

**Workaround:** Use TuneMyMusic to export YouTube Music → CSV

---

### Will this download music videos or just audio?

🎵 **Audio only.** The app uses yt-dlp to extract the **best audio stream** from videos. You get:
- M4A: Original AAC audio stream (no video)
- MP3: Re-encoded audio (no video)

---

### What if video titles don't match song names?

📝 **Edit the CSV first:**
1. Open CSV in Excel/text editor
2. Fix the "Title" column to match actual song names
3. Add proper "Artist" names if needed
4. Save and re-import

Example:
```csv
# Before:
Title,Channel,Duration
"Awesome Song!! (OFFICIAL VIDEO) 2023",SomeChannel,3:45

# After:
Title,Channel,Duration
Awesome Song,Artist Name,3:45
```

---

### Can I download entire channels?

❌ **Not recommended.** This app is designed for playlists (10-200 songs). For entire channels:
1. Create a playlist with your desired videos
2. Export that playlist to CSV
3. Use the app

**Why?** Channels can have thousands of videos. The app would take hours/days and might fail.

---

### How do I handle remixes, live versions, covers?

🎛️ **Use the Variants feature:**
1. Open Settings in app
2. Add to Variants: `["remix"]` or `["live"]` or `["acoustic"]`
3. This appends the term to search queries

Example:
- Song: "Hotel California"
- Variant: "live"
- Search: "Hotel California live"

---

### Can I resume if download is interrupted?

⚠️ **Partially.** The app uses a download archive (`downloaded.txt`). If you re-run with the same CSV and output folder:
- ✅ Already downloaded songs are **skipped**
- ✅ Failed songs are **retried**

**However:** If you close the app mid-download:
- ❌ Current song in progress is **lost**
- ✅ All previously completed songs are safe

---

### What's the difference between this and YouTube-dl directly?

**Spotify2MP3 App advantages:**
- 🖱️ **GUI interface** (vs command line)
- 📊 **CSV batch processing** (vs one-by-one)
- 🎯 **Smart search & matching** (Deep Search algorithm)
- 🏷️ **Auto metadata** (tags files automatically)
- 📈 **Progress tracking** (ETA, status updates)
- ⚙️ **Easy settings** (filters, formats, options)

**YouTube-dl/yt-dlp advantages:**
- 🚀 **Faster** for single videos
- 🔧 **More control** (advanced options)
- 🤖 **Scriptable** (automation)

---

### Can I use this for podcasts?

✅ **Yes!** Just adjust settings:
1. Increase `duration_max` to 7200 (2 hours) or higher
2. Disable Deep Search (podcast titles are usually accurate)
3. Use M4A format (smaller files)

---

### Is this legal?

⚠️ **Legal gray area.** You are downloading content from YouTube:
- ✅ **Legal for personal use** in most countries
- ❌ **Illegal for distribution/sharing** of copyrighted content
- ✅ **Legal for public domain/Creative Commons** content

**Disclaimer:** Use at your own risk. Respect copyright laws in your country.

---

### Does this work with age-restricted videos?

❌ **No** by default. Age-restricted videos require YouTube authentication.

**Advanced solution:**
1. Export cookies from your browser (while logged in to YouTube)
2. Add cookies file path in Settings
3. See [yt-dlp documentation](https://github.com/yt-dlp/yt-dlp#authentication-options) for details

---

## Example Workflows

### Workflow 1: Simple Music Playlist

**Scenario:** Download a 30-song playlist from YouTube

1. Get playlist URL: `https://youtube.com/playlist?list=PLxxxxx`
2. Export CSV: https://sanishtech.com/tools/export-youtube-playlist-to-csv/
3. Download and save: `my_music.csv`
4. Open Spotify2MP3 app
5. Drag `my_music.csv` into app
6. Choose output folder
7. **Settings:**
   - ✅ Deep Search ON
   - ✅ M4A format (default)
   - ✅ Generate M3U
8. Click "Convert Playlist"
9. Wait ~10-15 minutes
10. Open output folder → enjoy music!

---

### Workflow 2: High-Quality MP3 for iPod

**Scenario:** Download for an old iPod that only supports MP3

1. Export YouTube playlist to CSV (as above)
2. Open Spotify2MP3 app
3. Import CSV
4. **Settings:**
   - ✅ Deep Search ON
   - ✅ **Transcode to MP3**
   - ✅ Generate M3U
5. Click "Convert Playlist"
6. Copy output folder to iPod
7. Import `.m3u` file in iTunes

---

### Workflow 3: Cleaning Up Bad Data

**Scenario:** Playlist has messy video titles (e.g., "Song Title (OFFICIAL VIDEO) [HD]")

1. Export CSV
2. **Open CSV in Excel:**
   ```
   Title → Clean up:
   "Awesome Song (Official Music Video)" → "Awesome Song"
   "Cool Track [HD Audio]" → "Cool Track"
   "Best Song Ever - Official" → "Best Song Ever"
   ```
3. **Add artist names if channel ≠ artist:**
   ```csv
   Title,Channel,Artist
   Awesome Song,VEVO,Artist Name
   Cool Track,MusicChannel,Artist Name
   ```
4. Save edited CSV
5. Import to app and download

---

### Workflow 4: Large Playlist (100+ songs)

**Scenario:** Download a 200-song playlist efficiently

1. Export CSV (200 songs)
2. **Split CSV into batches:**
   - Songs 1-50: `batch1.csv`
   - Songs 51-100: `batch2.csv`
   - Songs 101-150: `batch3.csv`
   - Songs 151-200: `batch4.csv`
3. Download each batch separately
4. **Benefits:**
   - Easier to monitor progress
   - If one batch fails, others are safe
   - Can pause between batches

---

## Advanced Configuration

### Custom Search Variants

In `config.json`:
```json
{
  "variants": ["acoustic", "live", "remix"]
}
```

The app will try each variant if the default search fails:
1. "Song Title Artist"
2. "Song Title Artist acoustic"
3. "Song Title Artist live"
4. "Song Title Artist remix"

---

### Duration Filters

Useful for filtering content:

**Music only (skip intros/outros):**
```json
{
  "duration_min": 90,
  "duration_max": 600
}
```

**Podcasts/long-form:**
```json
{
  "duration_min": 600,
  "duration_max": 7200
}
```

---

### Exclude Instrumentals

If your playlist has both vocal and instrumental versions:
```json
{
  "exclude_instrumentals": true
}
```

This rejects any video with "instrumental" in the title.

---

## Summary: Complete Workflow Checklist

- [ ] 1. Find YouTube playlist URL
- [ ] 2. Export playlist to CSV (https://sanishtech.com/tools/export-youtube-playlist-to-csv/)
- [ ] 3. Download CSV file
- [ ] 4. (Optional) Edit CSV to clean up titles/artists
- [ ] 5. Launch Spotify2MP3 app
- [ ] 6. Import CSV via drag-and-drop or browse
- [ ] 7. Choose output folder
- [ ] 8. Configure settings (Deep Search, M4A/MP3, M3U)
- [ ] 9. Click "Convert Playlist"
- [ ] 10. Wait for completion
- [ ] 11. Open output folder
- [ ] 12. Check `*_not_found.csv` for failures
- [ ] 13. Import `.m3u` into music player
- [ ] 14. Enjoy your music!

---

## Need Help?

- **GitHub Issues:** [Report bugs or request features](https://github.com/angall1/Spotify2MP3/issues)
- **YouTube Export Tool:** [SanishTech Support](https://sanishtech.com/contact/)

---

**Happy downloading! 🎵**
