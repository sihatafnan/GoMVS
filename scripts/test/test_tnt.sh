#!/usr/bin/env bash
TESTPATH="/content/drive/MyDrive/MVS/tankandtemples/advanced" 
TESTLIST="/content/GoMVS/lists/tnt/adv.txt"
NORMAL_PATH="highresTNT/" 												
CKPT_FILE="/content/drive/MyDrive/MVS/GoMVS/GoMVS_tnt_adv.ckpt"
OUTDIR="/content/drive/MyDrive/MVS/GoMVS/output"
if [ ! -d $OUTDIR ]; then
	mkdir -p $OUTDIR
fi

CUDA_VISIBLE_DEVICES=0 python /content/GoMVS/test.py \
--dataset=tnt_eval \
--num_view=8 \
--batch_size=1 \
--normalpath=$NORMAL_PATH \
--interval_scale=1.0 \
--numdepth=192 \
--ndepths="48,32,8"  \
--depth_inter_r="4,1,0.25" \
--testpath=$TESTPATH  \
--testlist=$TESTLIST \
--outdir=$OUTDIR  \
--filter_method="dynamic" \
--loadckpt $CKPT_FILE ${@:2}

#Using this script to generate depth maps and then run the dynamic_fusion.sh to generate the final point cloud.

