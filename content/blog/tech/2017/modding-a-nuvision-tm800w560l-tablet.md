+++
date = "2017-09-24T21:21:00-00:00"
draft = false
title = "Modding a NuVision TM800W560L Tablet"
tags = ["technology","modding","distros","hardware"]
categories = ["Tech"]
banner = "img/blogposts/NuVision-TM800W560L-2-PPImage.jpg"
+++
So a friend gave me a <a href="http://www.nuvision.com/nuvision-tm800w560l-tablet-1/" target="blank">NuVision tm800w560l tablet</a> running Windows 10.  Honestly I tried to use it, but it was a joke.  From the start with it not connecting to WiFi because Windows 10 wanted uppercase alpha characters even though every other Linux, Android, Mac OS X or iOS device works with lower case.  To the fact that the on screen keyboard would hide where I was typing.  To the periodic hick-ups.  To the incredibly poor battery life. To the, to the, to the….

Enough said, Windows had to come off. And sadly, (spoilers) you don’t always get what you want. Anyways, here are my adventures…

# Secure Boot / Recovery / BIOS / UEFI

Knowing the little I do about OSs and stuff, I first wanted to see the state of “Secure Boot”. Secure Boot, what an amazingly stupid idea. It sounds good, but is it? In these type of choices, it’s most often a matter of what is important to you. So make informed

decisions when you can. And remember Microsoft takes every opportunity to take away your choices and force you to use and do things you might not otherwise want. The same can be said of other companies, but think about to what extent.

Okay, okay, rant-mode off… How do I check? Well, to summarize, its a pain. Microsoft has pushed a poor-excuse of a tablet OS on vendors who really don’t think too far in advance of working on the tablet. At least with ease and for people who aren’t just consumption payment machines. Sorry, ranting again….

This is probably the case for anyone who uses a x86 (non-arm) based tablet. You will most likely need a keyboard. Check the steps below, but for this NuVision tablet, I needed a USB OTG adapter, and (powered) USB hub and then the keyboard / mouse. BTW, in case you’re a newbie, bluetooth doesn’t work in the BIOS.

First, get into <s>the sad excuse of</s> what Microsoft provides for recovery for a tablet.  It’s deeply buried; I had to go to Settings -> Updates & Security -> Recovery -> Advanced Setup -> Restart Now.  

Now of course the initial screens work with touch.  I’m not “Troubleshooting”, but that is where I had to go.  So it’s Troubleshooting -> Advanced Options -> UEFI Firmware Settings, which is another restart.  And this finally puts you into the BIOS.  Here is where you need the keyboard, because unlike Android, no nice volume keys and power for navigation.  And no BIOS screen that expects touch.  :-/

Once in the BIOS, goto Security -> Secure Boot menu -> Secure Boot -> make sure it’s set to [Disabled].  Mine actually was already.  While you’re at it, might as well turn off quick boot to give you F2/ESC at the boot screen.  So its easy to get back into the BIOS.  Also enable boot from USB if not already set.  

BTW, none of this is really touching UEFI.  Just saying...

# Now, About Android?

Now there are three versions of Android that are made for x86 (32-bit) or x86_64 processors.  Well, maybe more, but three that I’ve found.  The Intel Atom processor in the TM800W560L tablet is such a processor (64-Bit).  The Android distros are:

 * <a href="http://www.phoenixos.com/" target="blank">PhoenixOS</a> (I did this before Jide said they were no longer working in the consumer market)
 * <a href="http://www.jide.com/remixos-for-pc" target="blank">Remix OS for PC</a>
 * <a href="http://www.android-x86.org/" target="blank">Android-X86</a>

I tried PhoenixOS first; and I did that simply because I’ve not seen it and it had a nice Windows Installer.  Their screen shots also showed a bit of change in the UI (user interface) depending on the form factor.  Since they mention a “OS Switch” feature to move between PhoenixOS UI and more traditional Android UI, I figured it was a good thing to check out.  

What did I find out….?  First thing after rebooting (they say reboot & choose PhoenixOS) was that it went straight to Windows 10.  So back into the BIOS to change the boot order and put Phoenix OS first.  No good; Windows Boot Manager was put first “auto magically”.  Try and disable all but Phoenix OS?  Same thing.  Go to “Boot Override” and choose Phoenix OS?  Well that started, but did it ever fully load?  After detecting and finding it, I got just a blank screen for 15 minutes.  So I went to play ultimate for a few hours, came back and found the same thing.  

My next effort was to make a bootable USB.  Not good for the long run as I want a full tablet, no keyboard/mouse.  But just to see Phoenix OS.  When I’ve tested Android-X86, I’ve “burned” the ISO on linux.  That did not work here, but I can’t tell if it’s NuVision or PhoenixOS.  I also used their tool to make a “U-disk” and I could manually do the boot override to start the process.  But again, nothing after a few hours.

On to Remix OS I guess.  So I removed PhoenixOS and downloaded Remix OS’s installer.  It ran without issue, and asked me to reboot.  This time I got a prompt for what OS to run; and it’s a good thing I had a keyboard because that was the only way I could select Remix OS.  At first I got some errors (and should have jotted them down).  I continued anyway, got another error and then the Android-x86 logo (the two groups partner now), an EFI error, then some firmware errors and finally formatting the data partition.  

This took a while, let’s say ~10 minutes.  Then some text scrolled by, but I couldn’t get it all down.  And finally a blank screen for quite a while; it was more than 20 minutes, but I can’t say how long.  I went to read off a real Android tablet and then go to bed.  

I did unplug the hub and plug the tablet into a power adapter.  So the screen was glowing (I assume for a good portion of the night).  When I woke up ....  it was still glowing.  And after 8 hours, I don’t think it was worth waiting longer.  

That means attempting to <a href = "http://support.jide.com/hc/en-us/articles/216394327-How-to-install-Remix-OS-for-PC-" target="blank">boot off of USB</a>.  And if that works, <a href = "http://support.jide.com/hc/en-us/articles/222974048-How-to-install-Remix-OS-for-PC-single-boot-on-hard-disk-" target="blank">install directly and get rid of Windows 10</a>.  I actually don’t own a USB 3.0 flash drive.  But I do own a nifty USB 3.0 to SATA cable and a powered USB hub.  Sadly, the same thing.  Wait forever and then nothing.

My last ditch effort for Android is Android-x86.  I rebooted the tablet, selected the freshly made USB with Android-x86 as the boot override and into the install program without a glitch.  I formatted the local “drive”; which came up as an sd-card (mmcblk0).  Then did the install and rebooted without the USB mess hooked up.  I got the boot screen, and even the message about the drive being okay.  So I left it on the glowing blank screen for a while, and nothing.  :-(

On the off chance it was a 32-bit vs. 64-bit thing I tried the 32-bit version of Android-x86.  Again booting the USB and the installation process seemed to go off without a hitch.  But the reboot left a blank screen for far too long.

The next thing to try was some <a href = "http://www.android-x86.org/documents/how-to-boot-the-android-x86-live-cd-when-you-have-problems-with-your-graphiccard" target="blank">boot options</a>.  I changed the boot parameters for the kernel to remove “quiet” and add “nomodeset”.  That got me to the screen with big “android” logo that changes the shading.  Time to let that run for while… overnight… and…  Never gets past the logo screen.  :-(  I also tried the “xforcevesa”, but same deal.  

# Regular Ol’ Linux

I’m not usually one to give up easy; as you may have noticed.  So now it’s trying to find the right Linux distro to use on a tablet.  Normally I would Google around and search for things.  But I remembered that <a href = "https://puri.sm/" target="blank">Purism</a> has been working on a <a href = "https://puri.sm/shop/librem-11/" target="blank">2-in-1 tablet</a>.  They use <a href = "https://pureos.net/" target="blank">PureOS</a> on their devices, but I am pretty sure they don't support UEFI.  I’ve read a few posts making me think they don’t.

A sorta linux is ChromeOS.  I know it’s more of a laptop/desktop OS, but it does support touch, and I really love <a href = "https://www.neverware.com/" target="blank">CloudReady</a> on my Lenovo T410.  Another download, burn and …. well the install never started up.  Same blank glowing screen...

I’ve been loving <a href = "http://manjaro.org" target="blank">Manjaro</a>, so I tried the i3 install media; both the 32-bit and 64-bit media.  I could see them in the BIOS, but selecting them in the boot override menu just flashed the screen and back to BIOS.  

Another thought was back to 32-Bit vs. 64-Bit.  The only place I’ve seen mention of 32-Bit EFI and 64-Bit processor is on Matt Gadient’s website.  But I figured why not, if it works…  I downloaded Debian, Ubuntu, Fedora, Elementary OS and Linux Mint.  None seemed to boot.  

Googling around a bit, there was the suggestion to use the ISO I wanted, but to use <a href = "https://rufus.akeo.ie/" target="blank">rufus</a> in Windows.  So, I’m sorta glad I swapped out the hard drive on that Lenovo T410 before installing CloudReady.  And I’m sorta glad I did the free upgrade to Windows 10 before it went away (and came back and went away and, well, whatever).  But alas, still just the flash of the BIOS screen when doing the boot override.  

# Perhaps More Research

At this point any normal person might have given up.  I never liked being normal.  :-)  Time to look through the BIOS and learn some more information.  Meaning, if I see something I don’t know what it is and how it works, then time to look it up.  My first stop, purely on “instinct” was the “OS/BOM Configuration” options.  At the top of configurable options was “ISP PCI Device Selection”, and choices were Disabled, ISP PCI Devce as B0D2F0 or ISP Devce as B0D3F0.  The description said choose B0D3F0 for linux, but the D0D2F0 was selected?  Was this my problem all along!?!?!?!?  

Nope.  I admit I may not be normal, but I’m going to try everything again.  So I tried Android X86, regular i3 Manjaro, Kubuntu and Matt Gadient’s debian ISO.  None of them worked with any of the three settings.  

I also don’t usually like to change multiple things, but there was also <a href = "https://01.org/intel%C2%AE-dynamic-platform-and-thermal-framework-dptf-chromium-os" target="blank">DPTF</a>, <a href = "https://www.usenix.org/system/files/conference/usenixsecurity16/sec16_paper_raj.pdf" target="blank">fTPM</a> and <a href = "https://en.wikipedia.org/wiki/Protected_Media_Path" target="blank">PAVC</a> in the same place.  Those are enabled, disabled and disabled.  These did not help.  

So more BIOS settings:
 * RPMB Provision = Disabled
 * Various graphics settings in North Bridge = I set these so graphics was at its max.  I figured this might help with Android X86, but did not help any of the issues.
 * Security -> Secure Boot Mode = Standard; I know I’m stretching, especially since “Secure Boot” = “Disabled”.  Still no help.

# The End

I’m surprised you made it this far.  Did you actually like reading this?  Well, I do know when to call it quites.  I’m not such a low-level geek type to really get into kernel debugging, finding firmware blobs, etc. etc.  So alas I’ve given up.  Now the tough decision to throw the tablet away, put it in a drawer or try to put Windows back on it….?
