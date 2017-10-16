+++
date = "2017-10-14T19:18:59-04:00"
draft = false
title = "My First Use of Hugo"
tags = ["technology","development","websites"]
categories = ["Tech"]
banner = "img/blogposts/hugo-logo.jpg"
+++
I make myself laugh.  The title is so "meta".  My first use of hugo is in hugo.  :-/  

Anyways, for the most part, so far, so good.  I've created a site, added some themes and created this first post.  There are some hiccups along the way though.  They are all documentation related at this point.

## Little Bumps In The Road

First one, is a chicken and the egg sort of thing.  I make my repositories first and then add files through the workflow of making something.  <a href = "https://gohugo.io/" target="blank">Hugo</a> did not like that; it complained that the directory was not empty.  It wanted an empty directory first.  And if I followed their <a href = "https://gohugo.io/getting-started/quick-start/" target="blank">Quick Start</a> exactly I would not have had this problem.  :-(  They do the *git init* after creating the site.  Still, I wish it allowed for the steps to be reversed.  And since I had already created the repository on Github, I just did some renaming of directories and moving of files and all was good.  :-)

Next is somewhat an oddity.  The <a href = "https://gohugo.io/getting-started/quick-start/#step-3-add-a-theme" target="blank">Add a Theme</a> step from their site has the user add the theme as a submodule.  That is good practice.  But things go a bit awry in two ways.  One is the directory isn't the name of the module (a pet peeve of mine).  And, two, most of the directions for other themes don't have you do it the same way.  A minor thing, but could confuse a newbie...

One item that is somewhat frustrating is that the theme in their Quick Start required a newer version then what is in Ubuntu 16.04.  To cut out the chase, I downloaded their DEB from the <a href = "https://github.com/gohugoio/hugo/releases" target="blank">releases</a> page on Github.  Another aspect was the version in main repositories put the binary in `/bin/usr/` while the DEB is in `/bin/loca/bin/`.  That is correct as well, but can be frustrating if you don't realize it.  :-)  Overall, I do wish that developers would have releases and documentation geared towards the stable bases (i.e. & e.g. the LTS version of Ubuntu).  And that their pro/con list <a href = "https://gohugo.io/getting-started/installing/#linux" target="blank">Linux installation</a> portion could be a bit more explicit of the gotchas.  Oh, one last related tidbit, their first suggestion of the Snap version wasn't good because of issues with Snap.  Those should be rectified soon.  

- - -

## Using Themes

This has also been going well for the most part as well.  I expected a bunch of issues with adapting the theme I choose.  This is one thing that many theme developers do.  The themes look spectacular.  But they are made by developers or graphic designers and expect the same of others to modify them.  I like it when projects make things easy to understand and easy to adapt.  So making the theme less tied to, for example, business needs like Contact, Customers, Testimonials is better in my opinion.  Anyways, I rolled up my sleeves, got into the nitty gritty and tweaked the theme code a bit and its all good.  

- - -

## Why Hugo Is Cool

All that said, Hugo is really cool.  I can use the same workflows of working from multiple computers/locations as I do with development projects.  I can tweak and manage the site better then places like <a href = "https://blogger.com" target="blank">Blogger</a> or other "use our website builder" type sites.  Its static, so faster and less attack surface then other CMS like <a href = "https://wordpress.org" target="blank">Wordpress</a> or <a href = "https://drupal.org" target="blank">Drupal</a>.  I do kinda worry about updates requiring a system that does the "build" process and push.  If I weren't using the free hosting at <a href = "https://github.com" target="blank">Github</a>, I'd look into making some type of "build server" I could: edit online, push commits, and have it build on demand, on schedule or automatically.  

- - -
