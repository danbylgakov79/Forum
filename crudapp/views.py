from .models import CategoryModel
from .forms import CategoryForm
from django.shortcuts import render,redirect
from django.http import Http404

def create_view(request):

    if request.method == 'POST':
        form = CategoryForm(request.POST)

        if form.is_valid():
            form.save()

            return redirect('/')
    else:
        form = CategoryForm()
        context = {
            'form': form
        }
        return render(request,'create.html', context)

def category_view(request):
    dataset = CategoryModel.objects.all()
    return render(request, 'listview.html', {'dataset':dataset})
def category_detail_view(request,id):
    try:
        data = CategoryModel.objects.get(id=id)
    except CategoryModel.DoesNotExist:
        raise Http404('Категория не найдена')

    return render(request, 'detailview.html',{'data': data})