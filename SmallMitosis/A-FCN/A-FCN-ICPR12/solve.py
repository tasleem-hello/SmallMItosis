import caffe
import surgery, score

import numpy as np
import os
import sys

try:
    import setproctitle
    setproctitle.setproctitle(os.path.basename(os.getcwd()))
except:
    pass
weights = '../A-FCN-ICPR12/fcn32s-heavy-pascal.caffemodel'


# init
caffe.set_device(1)
caffe.set_mode_gpu()

solver = caffe.SGDSolver('solver.prototxt')
#solver.net.copy_from(weights)
solver.restore('snapshot/train_iter_220000.solverstate')
# surgeries
interp_layers = [k for k in solver.net.params.keys() if 'up' in k]
surgery.interp(solver.net, interp_layers)

# scoring
#val = np.loadtxt('../data/segvalid11.txt', dtype=str)

solver.step(180000)
#for _ in range(25):
#    solver.step(4000)
#    score.seg_tests(solver, False, val, layer='score')
