from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
def token(rollno,seconds):
    s=Serializer('norfregorthedon1',seconds)
    return s.dumps({'user':rollno}).decode('utf-8')

