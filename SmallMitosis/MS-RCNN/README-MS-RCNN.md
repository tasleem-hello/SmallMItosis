### Our MS-RCNN small size mitosis detection model is based on faster-rcnn.
To install the MS-RCNN detector please consult the readme file of "online hard examples mining support for Faster R-CNN end to end on caffe".
Clone the repository “https://github.com/unsky/ohem-end2end”


###  To train a deep detector on ICPR 2012 MITOSIS dataset:
(a)	Download pre-trained ImageNet models
```Shell
./data/scripts/download_imagenet_models.sh
```

(b)	Train the model
```Shell
./experiments/scripts/ICPR12.sh 0 VGG_CNN_M_1024 ICPR2012 
```

### Test MS-RCNN on the ICPR 2012 MITOSIS dataset
(a)	A pre-trained MS-RCNN model can be downloaded using:
Shell
`$MS-RCNN/output/download_MS-RCNN_model`

(b)	Run the detector on MITOSIS 2012 test data. Output will be saved in `$ MS-RCNN/output`.
```Shell
cd $ MS-RCNN 
./experiments/scripts/ICPR12_test.sh 0 vgg16_OHEM_concat_ms_rcnn_iter_150000.caffemodel ICPR2012
```
### Evaluation 
The names of the ICPR 2012 MITOSIS test images are listed in'ICPR12-test.txt' and the mitosis ground truths are listed in ' annotations_test.txt’ 
cd $ MS-RCNN/detector_tools 

To evaluate the detection result of MS-RCNN model:
python measure_output_detections.py

### Data preparation
The ICPR 2012 dataset is relatively small, so we generated augmented versions of original training dataset by rotation and elastic deformation. The images in training datasets are rotated with preset values of 45°, 90°, 135°, 220°, and 180° values and elastic deformation  is performed using elasticity coefficient (σ) of 10 and the scaling factor (α) of 90.
