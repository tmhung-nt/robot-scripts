import pyautogui
from pywinauto.application import Application
from pywinauto import keyboard
from pywinauto import mouse
import time

class mspaint(object):
    
    def __init__(self):
        self._result = ''
        self.window = None
    
    def start_mspaint(self):    
        app = Application().Start(cmd_line=u'"C:\\Windows\\system32\\mspaint.exe" ')
        mspaintapp = app.MSPaintApp
        mspaintapp.Wait('ready')
    
    def draw_using_mouse_drag(self):    
        pyautogui.moveTo(200, 350)
        distance = 200
        while distance > 0:
            pyautogui.dragRel(distance, 0, duration=0)   # move right
            distance -= 5
            pyautogui.dragRel(0, distance, duration=0)   # move down
            pyautogui.dragRel(-distance, 0, duration=0)  # move left
            distance -= 5
            pyautogui.dragRel(0, -distance, duration=0)  # move up
        pyautogui.hotkey('ctrl', 's')
        time.sleep(2)
    def save_the_picture(self):
        app = Application().Connect(title=u'Save As')
        window = app.Dialog
        window.Wait('ready')
        button = window[u'&Save']
        button.Click()
        time.sleep(1) 
        button = window[u'&Yes']
        button.Click()
        time.sleep(1)
        app.Kill_()


