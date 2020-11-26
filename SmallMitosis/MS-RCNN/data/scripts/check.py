import os
from pascal_voc_io import PascalVocReader, PascalVocWriter

if '__main__' == __name__:
    base_dir = './Annotations'
    for parent, dirnames, filenames in os.walk(base_dir):
        for filename in filenames:
            fnm, fex = os.path.splitext(filename)
            if '.xml' == fex:
                reader = PascalVocReader(os.path.join(base_dir, filename))
                writer = PascalVocWriter('VOC2007', fnm, [1024, 1024, 3],
                                         localImgPath=os.path.join('JPEGImages', fnm + '.png'))
                print(reader.shapes)
                for label, pos, _, __ in reader.shapes:
                    # (xmin, ymin), (xmax, ymin), (xmax, ymax), (xmin, ymax)
                    # xmin, ymin, xmax, ymax
                    writer.addBndBox(pos[0][0], pos[0][1], pos[2][0], pos[2][1], label)
                writer.save(targetFile=os.path.join("Anno2", filename))
