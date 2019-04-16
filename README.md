# XIL - XBPS Interpreter Layer
I am terrible at naming things...
DELETE ME

# About
XIL (pronounce zil, as in god*zil*la) is a simple, easy to use, add-on to the XBPS package manager.
This is NOT a package manager or a replacement to XBPS as it only handles the basic commands.
Void Linux is an awesome distro that more people should be using, but the package manager can be a little weird for people who have never used a package manager or coming from Ubuntu/Fedora/etc.
So this introduces more "sane" install commands in the same way that APT and DNF handle theirs, or "interprets/translates" what the user wants into the proper XBPS command if they haven't dealt with a package manager.
It may have more "advanced" commands added eventually, but as of today it is focused on general use cases.

# Install
Clone this repo, download the zip, or download the file. Add it to your $PATH. Make sure it has permissions to run.

# Usage
xil [OPTION] [ARGUMENTS]

# Commands
- update            -> Update Repos
- upgrade           -> Upgrade System
- listrepos         -> Lists all configured Repos
- addrepo <ARGS>    -> Adds a Repository
- search <NAME>     -> Searches for packages using a name
- install <PKG(s)>  -> Installs package(s)
- remove <PKG(s)>   -> Removes package(s)
- recursiveremove   -> Removes package(s) and it's dependencies
- autoremove        -> Removes orphaned packages
- help              -> Shows this dialog
- details           -> Shows version, contact and license info

# Dependencies
Just bash. :)

# In Progress
- Command completion
- Advanced commands

# License

Copyright (C) 2019  James Gillman [jronaldgillman@gmail.com]

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
