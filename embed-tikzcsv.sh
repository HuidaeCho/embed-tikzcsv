#!/bin/sh
# Copyright (C) 2026 Huidae Cho <https://idea.isnew.info/>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

for i in $(grep -l csv fig-*.tex); do
	awk '
	/^ *%/{
		print
		next
	}
	match($0, /^(.*\{)(.*\.csv)(\}.*)$/, m){
		print m[1]
		file = m[2]
		print "% "file
		while((getline line < file) > 0)
			print line
		close(file)
		print m[3]
		next
	}
	{
		print
	}' $i > csv-$i
done
