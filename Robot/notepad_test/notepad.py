from pywinauto.application import Application
from pywinauto import keyboard
from pywinauto import mouse
import pyautogui
import time,os

class notepad(object):
    
    def __init__(self):
        self._result = ''
        self.window = None
        
    def start_notepad(self):
        app = Application().start("Notepad.exe")
        
    def welcome_to_robot_framework(self):   
        app = Application().connect(title = u'Untitled - Notepad', class_name='Notepad')        
        app.Notepad.DrawOutline()
        app.Notepad.Edit.TypeKeys("Welcome to Robot framework. This is an example with notepad", with_spaces = True)
        
    def close_file_and_click_save(self):    
        app = Application().connect(title = u'Untitled - Notepad', class_name='Notepad')
        app.Notepad.MenuSelect("File -> Exit")
        app.Notepad.Save.Click()
        
    def input_file_name_and_save(self):    
        app = Application().connect(title = u'Untitled - Notepad', class_name='Notepad')
        window = app.Dialog
        window.Wait('ready')
        combobox = window[u'4']
        combobox.DoubleClickInput()
        combobox.TypeKeys("Example.txt")
        button = window[u'&Save']
        button.Click()
        time.sleep(1)
        button = window[u'&Yes']
        button.Click()
