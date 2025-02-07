class BaseModel:
    def to_dict(self)-> dict:
        return self.__dict__