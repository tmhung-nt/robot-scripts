import time
from AppiumLibrary import AppiumLibrary


class ExtendedAppiumLibrary(AppiumLibrary):
    def __init__(self):
        self._driver = self._cache
        self._current_window = None
        self._available_windows = None

    def switch_window(self):
        """In case application opens a new window, use this to switch to that one.
        Please use only when your applicaiton has just two windows
        """
        current = self._driver.current_window_handle
        self._available_windows = self._driver.window_handles
        for window in self._available_windows:
            if window != current:
                self._driver.switch_to.window(window)
                self._current_window = window


    def switch_window_after_closing_a_child_window(self):
        """After closing a child window,
        please use this keyword to switch back to main window
        """

        for window in self._available_windows:
            if window != self._current_window:
                self._driver.switch_to.window(window)

        time.sleep(1)


    def close_all_applications(self):
        """Closes all open applications.

        This keyword is meant to be used in test or suite teardown to
        make sure all the applications are closed before the test execution
        finishes.

        After this keyword, the application indices returned by `Open Application`
        are reset and start from `1`.
        """

        self._debug('Closing all applications')
        self._cache.close_all()