from imutils.perspective import four_point_transform
from imutils import contours
import numpy as np
import argparse
import imutils
import cv2


img = cv2.imread("1531403857.jpg")
img = cv2.GaussianBlur(img, (3, 3), 0)
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
edges = cv2.Canny(gray, 50, 250, apertureSize=3)
cv2.imwrite("canny.jpg", edges)
lines = cv2.HoughLinesP(edges, 1, np.pi/180, 50, minLineLength=90, maxLineGap=10)
result1 = gray
for line in lines:
    for x1, y1, x2, y2 in line:
        cv2.line(result1, (x1, y1), (x2, y2), (0, 0, 255), 1)
cv2.imwrite("canny.jpg", result1)

cv2.circle(result1,(207,151),2,(0,255,0),2)
cv2.circle(result1,(517,285),2,(0,255,0),2)
cv2.circle(result1,(17,601),2,(0,255,0),2)
cv2.circle(result1,(343,731),2,(0,255,0),2)
cv2.imwrite("canny.jpg", result1)

src = np.float32([[207, 151], [517, 285], [17, 601], [343, 731]])
dst = np.float32([[0, 0], [337, 0], [0, 488], [337, 488]])
m = cv2.getPerspectiveTransform(src, dst)
result = cv2.warpPerspective(result1, m, (337, 488))
cv2.imwrite("canny.jpg", result)



gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
blurred = cv2.GaussianBlur(gray, (5,5), 0)
edged = cv2.Canny(blurred, 75, 200)
#find contours in edge map ,then initialize the contour corresponds to the document
cnts = cv2.findContours(edged.copy(), cv2.RETR_EXTERNAL,cv2.CHAIN_APPROX_SIMPLE)
cnts = cnts[0] if imutils.is_cv2() else cnts[1]
docCnt = None
# ensure that at least one contour was found
if len(cnts) > 0:
# sort the contours according to their size in
# descending order
    cnts = sorted(cnts, key=cv2.contourArea, reverse=True)
    # loop over the sorted contours
    for c in cnts:
        # approximate the contour
        peri = cv2.arcLength(c, True)
        approx = cv2.approxPolyDP(c, 0.02 * peri, True)
        # if our approximated contour has four points,
        # then we can assume we have found the paper
        if len(approx) == 4:
            docCnt = approx
            break
# apply a four point perspective transform to both the
# original image and grayscale image to obtain a top-down
# birds eye view of the paper
paper = four_point_transform(image, docCnt.reshape(4,2))
warped = four_point_transform(gray, docCnt.reshape(4,2))
cv2.imshow("original", image)
cv2.waitKey(0)
cv2.imshow("Exam", paper)
cv2.waitKey(0)
