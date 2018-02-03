class log_handler(object):
    def extract_fields(self, text):
        return text[1:-1].split('" "')

    def print_extract_fields(self, text):
        lists = text[1:-1].split('" "')

        print "len: %d" % len(lists)
        print "lists= %r" % lists

        for i in range(len(lists)):
            print "%d. %s" % (i, lists[i])