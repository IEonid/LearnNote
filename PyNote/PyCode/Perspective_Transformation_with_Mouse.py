#!/usr/bin/python
# coding=utf-8
import cv2 as cv
import numpy as np


def on_mouse_event(event, x, y, flag, param):
    global points_num
    if event == 4 and points_num < 4:
        print (x, y, points_num)
        # 已选择的点加 1
        points_num = points_num + 1
        # 将选择好的点添加到相应的数组当中
        point = (x, y)
        cv.circle(image, point, 2, (255, 0, 0), 2)
        # 修改最后一个参数
        pts.append([x, y])
        # 划线
        if len(points) >= 1:
            # 取出最后一个点
            lastpoint = points[len(points)-1]
            # 划线
            cv.line(image, point, lastpoint, (255, 0, 0), 1)
        points.append(point)
        if len(points) == 4:
            # 取出开始的一个点
            last_point = points[0]
            # 划线
            height, width, channels = image.shape
            cv.line(image, (x, y), last_point, (255, 0, 0), 1)
            pts1 = np.float32(pts)
            pts2 = np.float32([[0, 0], [width, 0], [width, height], [0, height]])
            pted = cv.getPerspectiveTransform(pts1, pts2)
            dst = cv.warpPerspective(image, pted, (width, height))
            cv.imshow('warpPerspective', dst)
            cv.imwrite("result.jpg", dst)
            # 保存图片路径


if __name__ == '__main__':
    image = cv.imread("1531293455.jpg")
    img = image.copy()
    points_num = 0
    points = []
    pts = []
    cv.namedWindow('source image', 0)
    cv.setMouseCallback('source image', on_mouse_event)

    while True:
        cv.imshow('source image', image)
        if cv.waitKey(10) & 0xFF == ord('q'):
            # 按q键退出
            break
    cv.destroyAllWindows()
