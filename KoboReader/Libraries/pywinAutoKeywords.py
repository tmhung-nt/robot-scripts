from pywinauto import Application
import pyautogui
import time
from pywinauto import keyboard


class pywinAutoKeywords(object):
    """Test library for testing *Calculator* business logic.

    Interacts with the calculator directly using its ``push`` method.
    """

    def __init__(self):

        self._result = ''
        self.currentWindow= ''
        self.currentWorking = None
        self.name = ''

    def start_vwEbooks_app(self):
        app = Application().Start(cmd_line=u'"C:\\Program Files\\VW-eBook-AC\\Bookshelf.exe" ')
        cefclient = app.CEFCLIENT
        cefclient.Wait('ready')
        
        time.sleep(2)
        keyboard.SendKeys("{ENTER}")
        self.currentWindow = cefclient

    def wait_for_app_to_be_ready(self, name, app_type):
        time.sleep(3)
        name = str(name)
        try:
            if app_type == "reflow":
                app = Application().Connect(title= name, class_name='WindowsForms10.Window.8.app.0.74db74_r11_ad1')
            elif app_type == "bigImage":
                app = Application().Connect(title= name, class_name='WindowsForms10.Window.8.app.0.11c3e_r11_ad1')
        except:
            print "Wrong app_type is passed to this method! app_type = %s" % app_type
            print "Correct app_type is reflow or bigImage"
            return None

        windowsformswindowappdbrad = app[name]
        self.currentWorking = windowsformswindowappdbrad
        windowsformswindowappdbrad.Wait('ready')
        self.currentWindow = windowsformswindowappdbrad
        self.name = name

    def wait_for_app_to_be_clickable(self):
        self.currentWorking.Wait('ready')

    def get_image_location(self, image_path):
        time.sleep(2)
        image_path = str(image_path)
        img_location = pyautogui.locateOnScreen(image_path, grayscale=True)
        img_location_x, img_location_y =  pyautogui.center(img_location)
        print img_location_x, img_location_y
        return img_location_x, img_location_y
    
    def get_image_x_coordinate(self, image_path):
        image_path = str(image_path)
        return self.get_image_location(image_path)[0]
    
    def get_image_y_coordinate(self, image_path):
        image_path = str(image_path)
        return self.get_image_location(image_path)[1]
    
    def click_image(self, image_path):
        # print "image_path type = ",
        # print type(image_path)
        # print "image_path = %s" % image_path
        image_path = str(image_path)        
        
        img_location_x, img_location_y = self.get_image_location(image_path)
        pyautogui.click(img_location_x, img_location_y)
        time.sleep(3)
     
    def click_GUI_Element(self, locator):
        self.wait_for_app_to_be_clickable()
        # self.wait_for_app_to_be_ready(self.name)
        locator = str(locator)
        _currentWindow = self.currentWindow[locator]
        _currentWindow.Click()

    def click_at_cordinate(self, location_x, location_y):
        pyautogui.click(location_x, location_y)

    def move_mouse(self, location_x, location_y):
        time.sleep(1)
        pyautogui.click(location_x, location_y)  # click to put drawing program in focus
        distance = 100
        pyautogui.dragRel(-distance, 0, duration=0.5)  # move left
        pyautogui.dragRel(0, distance, duration=0.5)  # move down
        pyautogui.dragRel(distance, 0, duration=0.5)  # move right
        pyautogui.dragRel(0, -distance, duration=0.5)  # move up

    def clear_text(self):
        self.wait_for_app_to_be_clickable()
        pyautogui.keyDown('shift')
        pyautogui.press('end')
        pyautogui.keyUp('shift')
        pyautogui.press('backspace')
        
    def input_text(self, text):
        self.wait_for_app_to_be_clickable()
        self.clear_text()
        text = str(text)
        pyautogui.typewrite(text)
        
    def click_to_bookmark_text_field(self):
        self.currentWindow.Edit.Click()
        time.sleep(1)
    # def close_windows_by_keyboards(self):
    #     keyboard.SendKeys('%{F4}')
        
        
        
        