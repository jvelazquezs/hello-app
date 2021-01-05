from django.http import HttpResponse


def index(request):
    return HttpResponse("Hello, world \(@_@)/. You're at the polls index\n")
