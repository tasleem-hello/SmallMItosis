We derived A-FCN model from VGG16-net [42] by replacing the last three fully connected layers with two fully convolution layers. In designed A-FCN the pool4 and pool5 layers are omitted and a dilation convolution with dilation rate of 1, 2, and 3 is applied to all filters of Conv5_1, Conv5_2, and Conv5_3 layers respectively.

### Train
A-FCN is pre-trained on ICPR 2012 dataset.

(a) For A-FCN weights initialization, parameters of VGG16-net which is pre-trained on the PASCAL semantic segmentation dataset are loaded.

(b) We modify the other files to train it on ICPR 2012 dataset.
### Test
The A-FCN model is then applied on the ICPR 2014 and AMIDA13 MITOSIS data to produce segmentation map.

### Data preparation
We used the fully labled ICPR 2012 MITOSIS dataset to train the A-FCN model. In order to train our A-FCN model, small patches (size 521×521 pixels) are extracted from ICPR 2012 dataset. To obtain data balancing, patches with mitosis are rotated and mirrored while other patches with non-mitosis are kept intact.
