# This code generates the Fusion360 ISOMetricprofile.xml values
# shown on https://everclamp.org/

from xml.etree import ElementTree as ET
import io

def scale_6h(percent, level=3):
  # initial xml data
  data = """
  <Thread>
    <Gender>internal</Gender>
    <Class>6H x 100%</Class>
    <MajorDia>6.147</MajorDia>
    <PitchDia>5.425</PitchDia>
    <MinorDia>5.035</MinorDia>
    <TapDrill>5.0</TapDrill>
  </Thread>
  """
  
  tree = ET.ElementTree(ET.fromstring(data))
  root = tree.getroot()
  
  # scaling factor
  factor = percent / 100
  
  # iterate over elements and scale numeric values
  for elem in root:
    if elem.tag in ["MajorDia", "PitchDia", "MinorDia", "TapDrill"]:
      elem.text = "%.3f" % (float(elem.text) * factor)
    elif elem.tag == "Class":
      elem.text = f"6H x {percent}%"


  ET.indent(tree, space='  ', level=level)
  out = io.StringIO()
  tree.write(out, encoding='unicode', method='xml')  # Write the tree as XML to the StringIO object
  return '  ' * level + out.getvalue()


for s in [90, 92, 94, 96, 98, 102, 104, 106, 108]:
  print(scale_6h(s))
