from robot.api import logger


class CollectionsHandler(object):
    def is_list_descreased(self, list):
        '''
        Check whether input list is sorted, return True if yes and vice versa
        :param list:
        :return:
        '''
        list = [int(x.encode('utf-8')) for x in list]

        logger.info("input list is: %r" % list)
        logger.info("Check whether input list is sorted or not")

        if list == sorted(list, reverse=True):
            logger.info("Input list is sorted")
            return True
        else:
            logger.info("Input list is not sorted")
            return False
