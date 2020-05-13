+++
date = "2019-01-21T19:53:00-00:00"
draft = true
title = "Slacking Off With Slackware"
tags = ["technology","linux","distros","hardware"]
categories = ["Tech"]
banner = "img/blogposts/ibmt42.jpg"
+++

# Introduction
Choosing a distro can be a very personal endeavor.  It can be confusing for those who have not been part of the Linux, well, the Open Source world.  There are OS pundits and fanbois.  Even in the Linux world.  Yet the variety of choices and understanding why distros make those choices is part of the learning process.  At least for me and why I love Linux so much.  

What it takes to get to a usable and maintainable system is important and a personal thing.  For a long time I primarily used <a href = "https://kubuntu.org/" target="blank">Kubuntu</a>.  Now I use <a href = "https://elementary.io/" target="blank">elementary OS</a> for the most part.  They are easy to install, easy to use, pleasant on the eye.  To me.  But I still explore distros whenever I have the time.  And so I decided to get a feel for <a href = "http://www.slackware.com/" target="blank">Slackware</a>.  As an educational experience as well as a hands-on check if Slackware’s style matches my style.

In the end (spoilers!) I did get a usable and performant system.  It took a lot of DIY type activities (outlined below), and took a lot of my time and, uh, the CPU’s time.  A more direct statement is that Slackware has the feel of <a href = "https://www.archlinux.org/" target="blank">Arch</a> and <a href = "https://freebsd.org/" target="blank">FreeBSD</a>.  It is initially easier to set up then Arch; but in the end, the “build it yourself” nature takes time, patience and definitely uses my research skills.  The feel of finding information was not as “together” as Arch or FreeBSD.  The community felt friendly and mostly accepting of newbies.  I did find everything I needed to get a working system, even if some of the software is a bit dated.  

Another important thing to say right away, of the many Linux distros I’ve tried, Slackware does run well on <a href = "https://sites.google.com/riotsu.com/adventuresintech/home" target="blank">dated hardware</a>.  I tried Slackware on all 4 systems, and to various degrees, I had a usable system in each case.  One could guess that I would only use the older IBM T42 and Toshiba A105 if I was desperate.  But they worked for simple purposes.  Slackware on the Samsung RF510 “felt” as good as elementary OS on my <a href = "https://system76.com/laptops/galago" target="blank">Galago Pro (v3)</a>.  I do wish the tools I use, professionally and personally, were not mostly “compile for yourself”.  

# Installation
The <a href = "https://slackware.com/" target="blank">slackware.com</a> website is nice and simple in many ways, including the documentation.  But go to https://docs.slackware.com/ instead of the main site.  Those <a href = "https://docs.slackware.com/slackware:install" target="blank">installation instructions</a> will get you going in a much better direction.  For those too impatient to read them yourself, here is some basic commentary about my installation experience:
1. Download Slackware ISO and burn to usb drive (very typical, no surprises).  I did notice something weird, the 14.2 ISOs (for 32-Bit) had no valid partition table when I dd’ed it to a USB.  That was okay for all my systems with the exception of the Toshiba A105 (I used a CD).
2. Boot to USB drive was relatively painless besides the A105.  PAE is an issue with many older machines.  The hugesmp.s kernel is PAE enabled, and that bombed booting the T42.  The reason is that the T42 actually does support PAE; it just doesn’t advertise the feature.  This is not a Slackware thing; and just like most distros, I could add “forcepae” at the boot prompt.
3. I suggest using fdisk to set up your partitions beforehand.  Keep it simple.
4. The setup section never says you need to type “setup” at the root prompt.
5. Only two Window Manager/Desktop Environment were listed: KDE or XFCE.  Other Window Managers were installed.  Be mindful of resources.  For desktop environments, XFCE was needed for T42; KDE was fine for the Toshiba A105, but probably because it’s still KDE 4. The Dell XPS M1530 and the Samsung RF510 were fine with KDE as well.  In the end, I just used XFCE on all 4 machines.
6. They ask about making a USB system boot disk.  An uncommon thing, but good idea for recovery.  DO NOT use the installation USB; get another.
When configuring LILO, and you have an older CPU that supports, but does not advertise PAE, don’t forget to add “forcepae” (i.e. I did forget for the T42, oops!).
7. When configuring services, I’d leave them as is except if you know what you’re doing or:
    1. rc.pcmcia is for older laptops that have a PCMCIA port.  
    2. rc.cups is for other computers printing through this one.
    3. rc.inetd is for many network services, some only needed for servers.
    4. rc.samba is for connecting to Windows machines.
8. Reboot system & login as root.

Amazingly all my hardware was auto-detected and supported; for all my test laptops (see note below about EFI).  I’m not surprised with the oldest hardware.  These days one only has hardware issues with Linux if the hardware is really specialized or vendors that make it hard for the community.  I’m glad to see Slackware keeping up to date and automatically including the drivers I needed.  Oh, if I had NVIDIA, all bets are off!

I ran into a pleasant surprise with the Toshiba Satellite A105.  The trackpad worked no problem; it was notoriously hard to configure with Linux in the past.  A slight digression: I took a quick look at Debian and while the installation environment was weird with the trackpad, the resulting full install was fine.  

# Post-Install Stuff
After installation, some notes for those coming from other linux OSes.  Or if you just want some additional information.  

The first thing I usually do with a new system is update it.  But I choose Network Manager during install to manage my network connections; usually a GUI tool.  And what do I notice when I boot?  No Login Manager, which gets into a sorta “catch-22” situation.  I also don’t like logging into a GUI with root, which would come up if I just changed the default run-level.  So I suggest something a bit different from <a href = "https://docs.slackware.com/slackware:install" target="blank">Slack’s Docs</a>:
1. Create a regular user:
    1. /usr/sbin/adduser
    2. For groups (after initial group), use the up-arrow key to select a fair (secure for desktop purposes) selection of groups
    3. All the other prompts are pretty straightforward.
2. Login Manager at boot:
    1. nano -w /etc/inittab
    2. Change “id:3:initdefault:” to “id:4:initdefault:”
3. Choose mirror for packages:
    1. nano -w /etc/slackpkg/mirrors
    2. Uncomment the closest one or use the main mirrors site.
4. Reboot
5. Update!!! (check out the slackpkg arguments)
6. Install <a href = "https://slackbuilds.org/repository/14.2/system/sbotools/" target="blank">sbotools</a> (see below).

Side note:  The run level part (step #2) is slightly different then other distros.  Not only because I had to manually do the edit (typical of Slackware, like Arch & FreeBSD).  But also because Slackware uses runlevel 4 for the graphical user interface; unlike many other distros which use runlevel 5.   

Another difference is how sudo works; the <a href = "https://www.linuxquestions.org/questions/slackware-14/sudo-not-working-4175554330/#post5424739" target="blank">best explanation</a> involves some history as well as an approach towards security.  The biggest takeaways are:
Add appropriate user or group via “visudo” command.
Using “sudo -i” and then the command will switch to root’s environment.
Alternative to “sudo -i” is to modify the path (as per linked post).
It is up to you to decide if you want sudo to act more like other distros or not!

# Installing Apps
Here again Slackware looks more like Arch or FreeBSD again.  Slackware is all about making personal & informed choices.   And that is certainly true about the package management.  I learned about the “Slack” way of things and could write a lot.  To keep things simple here, the important thing to say is that the main repos have all the basics.  But expect a lot of compiling for anything not “built into” XFCE or KDE.

I don’t want to “harp on” this point, but it is important.  For distros like Slackware, Arch and FreeBSD, the user needs to pay attention and be able to answer questions on the installs/builds.  There are GUIs, but when this is the case, I find users are better served using a terminal.  You need to pay attention to the READMEs and messages when installing (did I say that already?).  If this is your cup of tea and/or you like that aspect you will feel right at home.  

There are two tools that I used:
1. <a href = "https://docs.slackware.com/slackware:slackpkg" target="blank">slackpkg</a> - built-in tool that covers apps in the default install/repos.
2. <a href = "https://slackbuilds.org/repository/14.2/system/sbotools/" target="blank">sbotools</a> - perl-based tool that makes <a href = "https://slackbuilds.org/" target="blank">slackbuilds.org</a> more like <a href = "https://www.freebsd.org/ports/" target="blank">ports from BSD</a>.
This is why I put the installation of sbotools as a post-install step.  It will make installing apps much easier.  I found most of the tools I wanted to use (see below) to be part of SlackBuilds.org.  That is why sbotools is very useful.  This process is very interactive and, to reiterate, one needs to pay close attention to the READMEs and messages in the terminal!  I did not for a few packages and really messed things up.  More learning process!  :-)

If you want an easier to install/setup system that is based on Slackware, try <a href = "https://www.salixos.org/" target="blank">salixos.org</a>.  I will eventually do a review of that, because I do like the “feel” of Slackware.  Salix OS seems like a good match in the same way I try to use Manjaro when I can.  Meaning the Arch/Manjaro relationship is similar to the Slackware/SalixOS relationship.

Now onto the apps...

# Browsing
For browsers, I usually test Firefox and Google Chrome; unless otherwise instructed by the distro.  For 32-Bit there is no more Google Chrome.  So if it’s easy to install Chromium, I’ll do it.  It’s not for Slackware, and I decided that other apps were more important to invest time in setting up the system.

That means just Firefox for the T42 and A105.  The Thinkpad T42 performed well considering its a single core CPU with 2GB of RAM.  All the major websites I went to worked; just tolerably though.  Things started to get annoying, but not unusable, once I opened more than 3 or 4 tabs.  

Starting to stream continued in that vein; YouTube and some other platforms worked for a few minutes, but then videos started pausing while stuff cached.  I could drop down video quality to get things working a bit better though.  But that assumed I was not doing much else.  The lag in the user interface switching tabs or apps was bothersome.  This was also true of audio.  Though if I used just YouTube Music, Google Drive and opened one Google Doc, and didn’t move around a lot, the T42 was just shy of annoying to use.  

I could never really use the T42 for work for this reason.  The A105 was a little better, but not by much.  

It is hard to tell what causes this performance issue.  Playing videos in local media players worked well (see below).  But the browser did not perform well on wireless or wired connections on the T42 and A105.  Though the wireless is G for both, both also have 1Gb ethernet adapters.  And yes, I turned off wireless when using wired connections.

On the 64-Bit machines, the Dell XPS 1530 and Samsung RF510, I used Google Chrome.  I followed these instructions with this direct download link.  Performance was as expected.  Many Chromebooks work well on dual-core 64-Bit processors with 4GB of RAM.  And those are exactly the specs for the XPS 1530.  So needless to say the XPS1530 and the i5/8GB in the RF510 really rocked Google Chrome.  

Oh, I almost forgot.  If you need flash (I can’t believe it’s still in use), install freshplayerplugin and pepperflash-plugin.  This will probably be only for Firefox.

# Documents, Spreadsheets, Etc.
Of course there are choices here, and of course I chose LibreOffice.  SlackBulds.org offers to compile from source or to install binaries based on RPMs.  I did the compile; and man did it take forever on the Thinkpad T42 and Toshiba A105.  It did not take as long on the Dell XPS 1530 nor Samsung RF510.  But they still took a long time.

LibreOffice performed very well on all 4 systems.  I did not create or edit large documents; at most a dozen pages or so.  By themselves, Write and Calc let me do all the usual tasks I do.  Having Firefox playing only YouTube Music playing in the background did not seem to affect LibreOffice apps; I only seemed to get to the streaming jitter when YouTube Music played ads.

So, can I work and listen when it is 100% local?  How interesting that this is a segue to the next section...

# Media Consumption
I have a huge set of CDs that I usually play through Google Play Music.  Streaming from Google Play is reviewed above.  Can those MP3s be played well from local apps?  Can I work while I listen?  

Well…  First, we need to be able to play them!   I like Clementine these days for local playback, but got tired of long installs from SlackBuilds.org.  I used to be a big fan of Amarok, and it was installed along with KDE, so I started with Amarok (yes in XFCE).  It worked!  Even when I had LibreOffice open.  The one caveat is swapping apps was not as smooth as I’d want.  Still, I was surprised.  

Another choice, since Slackware comes with XFCE, was the Parole media player.  Parole is very stripped down, so I’m not surprised that the lag in moving around went away.  Parole though is not something to manage large collections.  One relies on adding files manually or using M3U files.

Gee, segues are easy right now.  Parole is also a video player.  I also installed the ever reliable VLC.  Both played long videos admirably.  So I’m taking it as the streaming being problematic.  Though as another test, and if I had time, I would try installing KODI and playing videos from another computer.  But then again, maybe KODI is as heavy and application as browsers are becoming.

# Media Creation
I don’t do a lot of media creation.  But I do use GIMP and Inkscape quite a bit for blogging and documentation.  This worked well on all 4 machines.  Along with playing local music in the background.  It did take quite a while to start Parole up after working in GIMP and Inkscape for a while.  

For Blender, I can’t say I use it enough to accurately describe how well it worked.  I tried to work with the demo projects from Blender’s website relevant to the version Slackware installed.  The T42 could never get either to start rendering; nothing happened after selecting the menu item and eventually the whole system would freeze. Loading on the A105 was okay, if long, but Blender would just crash after a minute or two into trying to render.  Neither usable.  

As for the M1530 and the RF510?  Well oddly loading the sample project for the 2.77 version of Blender kept freezing the whole computer.  Even though the version of Blender Slackware included was 2.77.  An earlier sample project would load, and when I tried to render it, it churned away for a long time.  I left it overnight and it eventually finished.  Afterwards, each action in Blender took a long time to happen.  So while it works, I’m not sure that it is “usable”.  

# Blogging
Well, the two main aspects of blogging, for me, are Google Docs and Hugo.  A small part is when I (might) make graphics, and even more rarely music or video (none on the site now!).

So, I talked about Google Docs above.  I would imagine that web-based blogging platforms are the same.  It could also vary quite a bit depending on the “heaviness” of the blogging platforms web tools.  A recap is: fine on the Samsung RF510 and the Dell XPS 1530, usable on the Toshiba A105, slightly tolerable for quick edits on the Lenovo T42.  

So that leaves editing files for Hugo and using Hugo’s command line tools to do the final rendering of articles for uploading.  

Editing is just in a text editor and git commands.  That was extremely easy and smooth; though I wish the Atom SlackBuild worked.  Leafpad is their default text editor and capable.   Kate is included as it “comes with” KDE and I like it better then Leafpad.  

As for getting Hugo going.  Well, I got tired of installing via source.  Both dart and hugo are available.  I can’t imagine that if I went through the build process that using it would be problematic.  If I was going to make Slackware a oft-used distro, I might try.  Nearing the end of this review makes me wish I would keep Slackware around, but compiling and sometimes putting patches that aren’t in the SlackBuilds or sbotools get tiring.  

# File Management And External Media
What can I say, this is just XFCE’s tools.  Thunar works well and uses a typical model/layout.   
It allows for mounting and ejecting removable media.  One can easily copy or move files between locations; regardless of being on removable media or not.  

# System Maintenance
Often my goal is often to make scripts similar to the ones I use for other linux distros. With Slackware, there are too many manual steps though.  Updates are easy for slackpkg packages.  It is the compiled packages that make it a pain.  I could probably do something with prepping downloads, unpacking, as well as listing what to do.  Others might enjoy this, and I might if I wasn’t strapped for time in my life.  But I’ve done this stuff with Gentoo, and I don’t think the amount of learning & fun vs. the time I’d invest would pay off, for me.  

# Other Oddities
The first oddity I found was related to XFCE’s panels.  When I first started up XFCE, I was asked if I wanted to use the default panels.  I said yes.  After I logged out and back in for the sudoers I did not get any panels at all.  After a reboot I got the “question” of no panels running and asking if I should execute or cancel.  The answer is “execute” of course, but I get a warning that “Modifying the panel is not allowed”.  The panels showed up and what is weird is that I can change them and the changes “stick” after a reboot.

Another oddity that I found is also in XFCE.  I don’t use it much, so this might just be Slackware’s version.  At least I doubt that XFCE does not update its menus after installing a new app.  I logged out and back in and my new apps were in the menus.  Maybe newer versions of XFCE show apps immediately after installation.

# Conclusions
I really enjoyed messing around with Slackware.  My focus, career-wise and personal-wise, is not so much on the inner workings of systems.  And Slackware wants you to focus on that aspect.  I do like it for learning and practice, but not as a day-to-day type thing.  I want to get systems up and running quickly; and I want updates to happen quickly.  

Though once I got used to it, Slackware did have a good feel to the system.  It was certainly “snappy” for tools appropriate to the hardware.  I did enjoy “getting my hands dirty”; if that is your goal, dive right into Slackware.  The community seems great in sharing information and answering questions.  That is never 100%, but ignore the haters and most Slackeware users do a good job of “leaving the ego at the door”.  Just check that the packages you need are available and your own research first.

For the “light weight” part, most of my activities on old hardware was usable. Well, except for browsing to modern websites; especially more then one at a time. Local media consumption on a single core should be reading or listening or watching.  Having a dual-core 32 bit machine definitely helps.  Basically, if I was just writing and listening, it’d be great.  

Both 64 Bit systems are about 10 years old.  So they might be considered old hardware.  Microsoft and Apple would at least consider the specs old.  But my experience was good on both devices.  I’d even say great on the RF510 (Intel i5-M460 2.53 GHz with 8 GB RAM).  

In the end, go for Slackware if you want to invest some time and want to learn.  Honestly, when I want that level of customization, I do like Manjaro better for getting up and running quickly as well as ease of maintaining the system.  I’m still tempted to keep a Slackware machine around; I will have to check out Salix OS at some point.  
