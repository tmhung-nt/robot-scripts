class Cheese(float):
    def __str__(self):
        return 'Muenster'
    def __repr__(self):
        return 'Stilton'

chunk = Cheese(-123.4)