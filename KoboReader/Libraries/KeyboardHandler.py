from pywinauto import Application
import pyautogui
import time
from pywinauto import keyboard


class KeyboardHandler(object):
    """

    """

    def __init__(self):
        pass

    def close_windows_by_keyboards(self):
        keyboard.SendKeys('%{F4}')

    def press_keyboard(self, key):
        # key = str(key)
        pyautogui.press(key)
        
        
        
        