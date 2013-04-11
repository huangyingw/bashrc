#!/usr/bin/env python
import xml.etree.cElementTree as ET
tree = ET.ElementTree(file='hadoop.xml')
print tree .find('name').text
