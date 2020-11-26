# SmallMitosis
Codes for our paper "SmallMitosis: Small Size Mitotic Cells Detection in Breast Histopathology Imagess". 
## Workflow Diagram
![](https://github.com/tasleem-hello/SmallMitosis/blob/main/SmallMitosis/MS-RCNN/workflow.jpg)
### Contents
1. Results
2. Hardware Requirements
3. Software Requirements
4. Data Preparation

### Results

| Method  | Dataset | Fscore |
| ------------- | ------------- | -------------|
|MS-RCNN  | ICPR 2012 test  | 0.902|
| MS-RCNN (fixed)  | ICPR 214 val  |0.316|
|SmallMitosis (Unsupervised)|ICPR 214 val|0.442 |
| SmallMitosis (Semisupervised) |ICPR 214 val|0.612| 
| SmallMitosis (Semisupervised)  |ICPR 214 test|0.495 |
|MS-RCNN (fixed)  | AMIDA13 val |0.333| 
| SmallMitosis (Unsupervised)  |AMIDA13 val | 0.400|
| SmallMitosis (Semisupervised)  |AMIDA13 val|0.587| 
| SmallMitosis (Semisupervised)  |AMIDA13 test|0.644| 

### Hardware Requirements
The experiments are performed on 2.4 GHz Intel(R) Xeon(R) E5-2630 CPU with one NVIDIA Tesla M40 GPU of 12GB memory.

### Software Requirements
The pre-processing techniques (i.e. Haar wavelet decomposition, color augmentation, and stain normalization) are implemented in the MATLAB R2018a program.
The complete SmallMitosis detection framework is implemented in Python , C++ (using the Caffe framework with CuDNN) and other common pakeges.

### Data Preparation 
The ICPR 2012 dataset is relatively small, so we generated augmented versions of original training dataset by rotation and elastic deformation. The images in training datasets are rotated with preset values of 45°, 90°, 135°, 220°, and 180° values and elastic deformation  is performed using elasticity coefficient (σ) of 10 and the scaling factor (α) of 90.
