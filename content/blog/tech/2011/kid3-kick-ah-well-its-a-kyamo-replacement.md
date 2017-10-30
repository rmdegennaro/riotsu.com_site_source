+++
date = "2011-07-26T01:15:47-00:00"
draft = false
title = "Kid3 Kicks, ah, Well It's A Kyamo Replacement"
tags = ["FOSS","linux","music","technology"]
categories = ["Tech"]
banner = "img/blogposts/kid3-audio-tag-editor-logo.png"
+++



So for ages I've used Kyamo to edit MP3 tags.  It had been great because it edited multiple tag versions and it also not only viewed embedded album art, but allowed you to edit it.  Sadly Kyamo is no longer supported in K/Ubuntu.  Well, as with most FOSS, you can always grab the source and compile it yourself.

I had wished I had time to do just that, and maybe update/maintain it. But instead I found a great new app called <a href = "https://kid3.sourceforge.io/" target="blank">Kid3</a>.  It seems to be a simple project at SourceForge.  On their website there is this quote on what they want to accomplish:  "If you want to easily tag multiple MP3, Ogg/Vorbis, FLAC, MPC, MP4/AAC, MP2, Speex, TrueAudio, WavPack, WMA, WAV and AIFF files (e.g. full albums) without typing the same information again and again and have control over both ID3v1 and ID3v2 tags, then Kid3 is the program you are looking for."

It does exactly what I want. Here is a (<a href = "../../../../../img/blogposts/kid3-screencapture-full.png" target="blank">full sized</a>) screen capture:

![](../../../../../img/blogposts/kid3-screencapture-500.png)

A pretty simple but highly useful UI.

Only two things that I've discovered that are weird.  First is that you can't select a directory, only a file.  Interestingly enough, selecting one file selects all files in that directory.  It'd be nice to select a higher level directory and have it scan all sub-directories.

Also, for cover art, you can only drag an appropriate file to the location in the UI.  Well, not "only", you can also use the "Browse" feature which essentially does web searches for you to drag yourself.  But I have a lot of cover art already on the computer.  It'd be nice to 1) have a browse for the file system, and/or 2) a way to automatically pick up files in the directory (so it can add it "inside" the MP3 so the cover art shows up on my phone :-).

If I had a bit more time I'd see what happens if one file is at the top directory or maybe submit a patch for either.  Even without those two features, a great little app.
