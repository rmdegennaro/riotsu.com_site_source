+++
date = "2017-10-14T19:18:59-04:00"
draft = false
title = "My First Use of Hugo"
tags = ["technology","development","websites"]
categories = ["Tech"]
banner = "img/blogposts/hugo-logo.jpg"
+++
I make myself laugh.  The title is so "meta".  My first use of hugo is in hugo.  :-/  I've been searching for a <a href = "https://en.wikipedia.org/wiki/Web_template_system#Static_site_generators" target="blank">static website generator</a> not a <a href = "https://en.wikipedia.org/wiki/Content_management_system" target="blank">CMS</a>.  For the uninitiated, or you don't want to read the links, a CMS creates the pages a viewer see dynamically when the page is requested (sometime cached), based on looking up data and using templates of sorts to generate pages.  A Static Site Generator uses data and templates but pages are generated once during "build time" and the same stuff is displayed until data/files are changed and another "build" happens.  

Don't forget, most of what I just is high level.  If you want to get into details of sliding pictures, menus, opening/closing content dive into how this all works.  

Anyways, I <a href = "https://www.staticgen.com" target="blank">read</a> <a href = "https://staticsitegenerators.net" target="blank">about</a> a lot of <a href = "https://wiki.python.org/moin/StaticSiteGenerator" target="blank">different</a> <a href = "https://github.com/myles/awesome-static-generators" target="blank">ones</a>.  And <a href = "https://jekyllrb.com/" target="blank">Jekyll</a> seems to be king.  

I've never been one to use the most popular and settled on <a href = "https://gohugo.io/" target="blank">Go Hugo</a>.  And for the most part, so far, so good.  I've created a site, added some themes and created this first post.  

- - -

## Why Hugo Is Cool

First things first, Hugo is really cool.  My primary goal is to use the free hosting at <a href = "https://github.com" target="blank">Github</a>.  But any Static Site Generator can do that for me.  I suppose I don't have enough experience to compare Static Site Generators.  My thoughts at this time are about why I like the idea of a Static Site Generator.  

Making entries as text files using markdown wiki syntax is easy to do and less error prone (for me) then WYSIWYG editors in CMSs.  In this same sense, I can check in the "source" of my articles, entries, posts, pages, whatever we're calling them in any <a href="https://en.wikipedia.org/wiki/Version_control" target="blank">VCS</a>.  I can use the same workflows of working from multiple computers/locations as I do with development projects.  

I can tweak and manage the site better then places like <a href = "https://blogger.com" target="blank">Blogger</a> or other "use our website builder" type sites.  And I'm not stuck to their editors.  And can move the site to any hosting company that will do HTTP hosting.

Its static, so faster and less attack surface then other CMS like <a href = "https://wordpress.org" target="blank">Wordpress</a> or <a href = "https://drupal.org" target="blank">Drupal</a>.  

There are a few extra steps to post changes.  Most CMSs you save and you're done.  I have to go through the build and upload process mentioned above.  This locks me into using a system that has Hugo installed as well as putting all my source files on that system.  Easy enough for the most part.  I do wonder about making some type of "build server" where I could: edit online, push commits, and have it build on demand, on schedule or automatically.  But then I'd need to pay for a server.  ;-)

- - -

## Little Bumps In The Road

Trying to get the new site built, I encountered a few roadblocks.  Most all easily overcome.  They are all documentation related at this point.  And I'll leave it all here in case others get into the same issues.  

First one, is a chicken and the egg sort of thing.  I make my repositories first and then add files through the workflow of making something.  <a href = "https://gohugo.io/" target="blank">Hugo</a> did not like that; it complained that the directory was not empty.  It wanted an empty directory first.  And if I followed their <a href = "https://gohugo.io/getting-started/quick-start/" target="blank">Quick Start</a> exactly I would not have had this problem.  :-(  They do the *git init* after creating the site.  Still, I wish it allowed for the steps to be reversed.  And since I had already created the repository on Github, I just did some renaming of directories and moving of files and all was good.  :-)

Next is somewhat an oddity.  The <a href = "https://gohugo.io/getting-started/quick-start/#step-3-add-a-theme" target="blank">Add a Theme</a> step from their site has the user add the theme as a submodule.  That is good practice.  But things go a bit awry in two ways.  One is the directory isn't the name of the module (a pet peeve of mine).  And, two, most of the directions for other themes don't have you do it the same way.  A minor thing, but could confuse a newbie...

One item that is somewhat frustrating is that the theme in their Quick Start required a newer version then what is in Ubuntu 16.04.  To cut out the chase, I downloaded their DEB from the <a href = "https://github.com/gohugoio/hugo/releases" target="blank">releases</a> page on Github.  Another aspect was the version in main repositories put the binary in `/bin/usr/` while the DEB is in `/bin/loca/bin/`.  That is correct as well, but can be frustrating if you don't realize it.  :-)  Overall, I do wish that developers would have releases and documentation geared towards the stable bases (i.e. & e.g. the LTS version of Ubuntu).  And that their pro/con list <a href = "https://gohugo.io/getting-started/installing/#linux" target="blank">Linux installation</a> portion could be a bit more explicit of the gotchas.  Oh, one last related tidbit, their first suggestion of the Snap version wasn't good because of issues with Snap.  Those should be rectified soon.  

- - -

## Using Themes

I expected a bunch of issues with adapting which ever theme I choose.  This is one thing that many theme developers do.  The themes look spectacular.  But they are made by developers or graphic designers and expect the same of others to modify them.  I like it when projects make things easy to understand and easy to adapt.  So making the theme less tied to, for example, business needs like Contact, Customers, Testimonials is better in my opinion.  Anyways, I rolled up my sleeves, got into the nitty gritty and tweaked the theme code a bit and its all good.  

- - -
