from SeleniumLibrary import SeleniumLibrary


class ExtendedSeleniumLibrary(SeleniumLibrary):
    def title_should_start_with(self, expected):
        title = self.get_title()
        if not title.startswith(expected):
            raise AssertionError("Title '%s' did not start with '%s'" % (title, expected))
