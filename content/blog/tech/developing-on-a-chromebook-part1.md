+++
date = "2016-11-28T15:38:00-00:00"
draft = false
title = "Developing on a Chromebook (well, CloudReady), Part 1"
tags = ["technology","linux","distros","hardware","development"]
categories = ["Tech"]
banner = "img/blogposts/-development.jpg"
+++

![](../../../../../img/blogposts/chromebook.jpg)

I like the idea of Chrome Apps.  It is (was?) a great idea; write one app and it will run on Linux, Chrome OS, Mac and Windows (yeah, the order is telling).  It's a shame Google has <a href = "https://developers.chrome.com/apps/migration" target="blank">announced</a> it will stop supporting Chrome Apps on Linux, Mac and Windows.  So initially this started out as a log of my adventure of making a Chrome App on Chrome OS (well a <a href = "http://www.chromium.org/chromium-os/" target="blank">Chromium OS</a> distro called <a href = "https://www.neverware.com/" target="blank">CloudReady</a>).  But now it is just developing a Chrome App on Chrome OS.  I still want to develop one app on multiple platforms, but need a new perspective.  It'll be a Chrome App on Chrome OS and I'm not sure what (<a href = "https://github.com/electron/electron" target="blank">electron</a> or <a href = "http://nwjs.io/" target="blank">nw.js</a>) on other OS's.

So, to reach that goal, and after researching a bit, I'm going to start out with making a <a href = "https://developers.google.com/web/progressive-web-apps/" target="blank">Progressive Web App</a> on my CloudReady Chromebook.  Google has a nice <a href = "https://developers.google.com/web/fundamentals/getting-started/codelabs/your-first-pwapp/" target="blank">CodeLab</a> for making one, and it supports development on a Chromebook.  I won't belabor things by doing a step-by-step read-through of something that is already step-by-step.  Instead, what will follow in this post (and hopefully others) are highlights and other review-type thoughts.  

First things first: the development environment.  I use github.com for most stuff, so I forked the <a href = "https://github.com/googlecodelabs/your-first-pwapp" target="blank">codelab</a>.   The next part is how do I get that onto my Chromebook to edit?   Also, commits are a part of development, so then how do we push them?  I want a simple, direct way to do it (I'm thinking of low barrier of entry).  The only thing I've found that has GUI to clone repositories locally is <a href = "https://chrome.google.com/webstore/detail/chrome-dev-editor/pnoffddplpippgcfjdhbmhkofpnaalpg" target="blank">Chrome Dev Editor</a> (CDE).  It's a shame its been <a href = "https://plus.google.com/+SriramSaroop/posts/6EwgknwKpeS" target="blank">discontinued</a> and that it is hard to find in the Chrome App Web Store.  But for editing it's nice, for committing it works, and one can push commits.

There are a few "buts" though.  One important item is that there is not a way to "fast forward" a repo.  Only thing I've figured out is to delete and re-clone.

Another, perhaps more subtle, ChromeOS "but" is that CDE can clone to Google Drive.  Then Chrome Dev Editor edits those files in Google Drive.  Which sounds nice (another copy/backup). But those files are not stored offline.  One could mark them offline in the "Files" app, but in large projects that would be tedious.  An enhancement or an extension to manage offline files would be cool, but that along with forking and continuing CDE is another endeavor.

Besides those two "buts", I have started doing the codelab.  I'll keep notes are post another entry as I move through the tutorial.  The next post is <a href = "/blog/2017/09/13/developing-on-a-chromebook-part1/" target="blank">here</a>.
