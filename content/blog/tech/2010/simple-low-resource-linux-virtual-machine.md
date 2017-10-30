+++
date = "2010-05-12T09:03:00-00:00"
draft = false
title = "Simple Low-resource Linux for a Virtual Machine"
tags = ["distros","FOSS","linux","technology"]
categories = ["Tech"]
banner = "img/yingyang.jpg"
+++
Okay, I work remotely in almost everything I do for work. I.e. I remote into the servers and workstations all day every day; very little gets done on my laptop except personal stuff. Whether it be development, database manipulation, webapp/system management, or regular'ol'tech-support. The projects are mostly for clients, so they stay on clients machines, but I do have my own servers.

Also, most clients use routers (or whatever does the DHCP) out of the box at their office. Meaning I get a lot of people using 192.168.0.# or 192.168.1.# subnets internally.

For those two reasons, I use VirtualBox alot, with each VM connecting to different networks. This means that I need light-weight OS's, as I usually have at least 2 or 3 going at any particular time. My laptop is much the mobile workstation, it can handle a few, but they really do need to be light-weight.  For this reason I still use Windows 2000 in virtual machines when I'm required to use Windows only VPN software (ick).

But I don't always have to, and prefer to have an easy to manage Linux VM. Linux is what I use for my main OS, Kubuntu to be specific. I hadn't really been using any as could never find something that made me happy. Now I admit I'm lazy (from a certain perspective) in that I don't want to have to do a lot for tasks that are "maintenance" or "setup" tasks. Those are usually hard to bill clients. So bear that in mind when I say most distros I tried in my recent attempts did not make me happy. Either they had troubles running in a VM (puppy, vector, etc.), didn't have the ease of install for VPN software or management (vector, debian, etc.) or were just too bulky (Fedora, openSUSE, Ubuntu's). And because of the way FOSS works, this may change.

But I wanted one now, and what surprised me is I just put it (Kubuntu) on a 1.6Ghz/512MB system for a friend to look at. I turned off all the fancy effects, and it ran well enough. Can't really run two major apps (say, Firefox and OpenOffice.org) at the same time; but individually, not an issue. So I figured I'd try Kubuntu in a VM, if anything, just for kicks.

It works fine! I can manage VPN's the same way as my main/host OS, have all the same browsers (including modded ones from clients, e.g. sales terminals) etc. etc. It runs with only 256MB of RAM allocated. Here is a list of System Settings I changed:

  * Style -> Workspace: Set to "Oxygen" because its a more "consistent" pattern to draw.
  * Style -> Fine Tuning -> Graphics Effects: Low display resolution and Low CPU.
  * Style -> Windows -> Fine Tuning -> Background Color: Solid Color.
  * Style -> Windows -> Fine Tuning -> Outline Active Window: off.
  * Style -> Windows -> Fine Tuning -> Active Window Glow: off.
  * Style -> Windows -> Buttons -> Show window button tooltips: off.
  * Desktop -> Desktop Effects -> Enable desktop effects: off.
  * Desktop -> Multiple Desktops: 1.
  * Disable Nepomuk or any other background file indexing.
  * Change desktop to single solid color and close all widgets.

There are other settings I changed because of personal preference; but I think these are the ones to adjust performance the most. Admittedly, Firefox is a bit slow, but Chrome works well enough. I can't really use OpenOffice.org, but I can have Kate, Konsole and Chrome all open at the same time and switch among them easily. If I up'ed the RAM to 512MB, performance is acceptable, though I wouldn't want to do everyday type work in it.

Tangentially, a friends machine is just a (single-core) 2.2Ghz with 1GB of RAM. I did the same thing and it works well. More then two "major apps" and things get a bit slow, but my friend is happy. Oh, also, I have it on our Asus netbook that we use at home. That is a dual-core Atom and works beautifully with OpenOffice.org, Firefox and even Amarok working at the same time!

Ok, enough babbling, back to work and I hope someone sees and appreciates this info....
