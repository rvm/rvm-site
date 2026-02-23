---
title: "Integrating RVM with LXTerminal"
---

Integrating RVM with LXTerminal
===============================

This instruction will guide you through the steps to integrate RVM with LXTerminal, particularly focusing on LXDE, and will allow LXTerminal to automatically load RVM and the profiles. This will allow you to use RVM without explicitly loading the profile, thus avoiding the "RVM is not a function" error message.

**You will probably need to log out and back into your account for all changes to take effect.**

Integration with LXDE Menu
--------------------------
On the menu, navigate to the shortcut for LXTerminal. Right-click, and select properties. In the window that pops up, find the "Command" textbox, and change the text to **lxterminal -e "bash -il"**, by adding the text highlighted in red in the screenshot below.

![LXTerminal Screenshot 1](/images/lxdemenu.png)

Integration with the LXDE Keyboard Shortcut
-------------------------------------------
(Note that this assumes the default keybinding/shortcut Control-Alt-L. If you have remapped it you'll need to adjust these instructions accordingly)

Open ~/.config/openbox/lubuntu-rc.xml in your text editor of choice (this file handles system shortcuts/keybindings; it's worth knowing). Search for **x-terminal-emulator** - that's the command for the terminal shortcut. Replace it with **lxterminal -e "bash -il"**, the same text as above.

Adding a bash alias
-------------------
This will set it up so that launching lxterminal from the command line will also autoload the profile. Open up either ~/.bashrc, or ~/.bash_aliases, depending on which is present. Add the line **alias lxterminal="lxterminal -e \"bash -il\""** (yes, those quotation marks are correct).
