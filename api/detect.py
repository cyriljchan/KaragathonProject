import cv2

def detection():
    cascade = cv2.CascadeClassifier('cascade.xml')
    test = cv2.imread('test.jpg')
    recolor = cv2.cvtColor(test, cv2.COLOR_BGR2GRAY)
    detect = cascade.detectMultiScale(recolor, 1.1, 4)
    for (x, y, w, h) in detect:
        cv2.rectangle(test, (x, y), (x+w, y+h), (255, 0, 0), 2)
        if x and y and w and h in detect:
           result =  "Illegal"
        return result 

def image():
    cascade = cv2.CascadeClassifier('cascade.xml')
    test = cv2.imread('test.jpg')
    recolor = cv2.cvtColor(test, cv2.COLOR_BGR2GRAY)
    detect = cascade.detectMultiScale(recolor, 1.1, 4)
    for (x, y, w, h) in detect:
        cv2.rectangle(test, (x, y), (x+w, y+h), (255, 0, 0), 2)
        break

    cv2.imwrite('D:/Hackathon/KaragathonProject/api/static/detect_result.jpg', test)


def check():
    if detection() == None:
        return "Legal"
    else:
        return "Illegal"
