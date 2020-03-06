from models.posenet import PoseNet, MapNet
from common.train import load_state_dict, step_feedfwd
from common.pose_utils import (
    optimize_poses,
    quaternion_angular_error,
    qexp,
    calc_vos_safe_fc,
    calc_vos_safe,
)
from dataset_loaders.composite import MF
import argparse
import os
import os.path as osp
import sys
import numpy as np
import matplotlib

DISPLAY = "DISPLAY" in os.environ
if not DISPLAY:
    matplotlib.use("Agg")
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import configparser
import torch.cuda
from torch.utils.data import DataLoader
from torchvision import transforms, models
import cPickle

dropout = 0.5
feature_extractor = models.resnet34(pretrained=False)
model = PoseNet(feature_extractor, droprate=dropout, pretrained=False)
weights_filename = "./weights.pth"

loc_func = lambda storage, loc: storage
checkpoint = torch.load(weights_filename, map_location=loc_func)
load_state_dict(model, checkpoint["model_state_dict"])
print "Loaded weights from {:s}".format(weights_filename)
