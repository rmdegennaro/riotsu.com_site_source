+++
date = "2017-10-14T19:18:59-04:00"
draft = false
title = "My First Use of Hugo"
tags = ["technology","development","websites"]
categories = ["Tech"]
banner = "img/banners/banner-5.jpg"
+++
I make myself laugh.  The title is so "meta".  My first use of hugo is in hugo.  :-/  

Anyways, for the most part, so far, so good for the most past.  I've created a site, added some themes and created this first post.  There are some hiccups along the way though.  They are all documentation related at this point.

## Little Bumps In The Road

First one, is a chicken and the egg sort of thing.  I make my repositories first and then add files through the workflow of making something.  [Hugo](https://gohugo.io/) did not like that; it complained that the directory was not empty.  It wanted an empty directory first.  And if I followed their [Quick Start](https://gohugo.io/getting-started/quick-start/) exactly I would not have had this problem.  :-(  They do the *git init* after creating the site.  Still, I wish it allowed for the steps to be reversed.  And since I had already created the repository on Github, I just did some renaming of directories and moving of files and all was good.  :-)

Next is somewhat an oddity.  The [Add a Theme](https://gohugo.io/getting-started/quick-start/#step-3-add-a-theme) step from their site has the user add the theme as a submodule.  That is good practice.  But things go a bit awry in two ways.  One is the directory isn't the name of the module (a pet peeve of mine).  And, two, most of the directions for other themes don't have you do it the same way.  A minor thing, but could confuse a newbie...

One item that is somewhat frustrating is that the theme in their Quick Start required a newer version then what is in Ubuntu 16.04.  To cut out the chase, I downloaded their DEB from the [releases](https://github.com/gohugoio/hugo/releases) page on Github.  Another aspect was the version in main repositories put the binary in `/bin/usr/` while the DEB is in `/bin/loca/bin/`.  That is correct as well, but can be frustrating if you don't realize it.  :-)  Overall, I do wish that developers would have releases and documentation geared towards the stable bases (i.e. & e.g. the LTS version of Ubuntu).  And that their pro/con list [Linux installation](https://gohugo.io/getting-started/installing/#linux) portion could be a bit more explicit of the gotchas.  Oh, one last related tidbit, their first suggestion of the Snap version wasn't good because of issues with Snap.  Those should be rectified soon.  

## Using Themes

This has also been going well.  Some weird things from a user perspective, but probably make sense from development view.  It's all been the usual copy existing examples.  One thing, at least with the few themes I've tried, is that most themes are more tightly tied to why they were developed.  As example business themes are are not always happy if you don't have Contact, Customers, etc.  But you have to get in and tweak the theme code a bit and its all good.  

---

I'm adding more as I go...
