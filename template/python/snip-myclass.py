class {{_expr_:substitute('{{_input_:name}}', '\w\+', '\u\0', '')}}({{_expr_:substitute('{{_input_:object}}', '\w\+', '\u\0', '')}}):
    __slots__ = []

    def __init__(self{{_cursor_}}):
        pass

    def __dir__(self):
        return self.__slots__

    def __name__(self):
        repr("this name")

    def __doc__(self):
        description = """ \
                description \
                """
        repr(description)

    def __new__(cls):
        """
        explicitly static method but no need to declare
        return must be cls instance
        """
        return super.__new__(cls)

    def __repr__(self):
        pass

    def __del__(self):
        pass

    def __str__(self):
        pass

    def __format__(self, fmtargs, **kwdargs):
        return f''.format()

    def __bytes__(self):
        pass

    def __hash__(self):
        pass

    def __lt__(self):
        pass #less than

    def __le__(self):
        pass #less equal

    def __eq__(self):
        pass #equal

    def __ne__(self):
        pass #not equal

    def __gt__(self):
        pass #greater than

    def __ge__(self):
        pass #greater than

    def __getattr__(self, name):
        pass

    def __getattribute(self, name):
        pass

    def __setattr__(self, name):
        pass

    def __delattr__(self, name):
        pass
