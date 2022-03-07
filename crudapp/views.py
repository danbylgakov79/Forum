from .models import CategoryModel, TopicModel
from .forms import CategoryForm, TopicForm
from django.shortcuts import render,redirect,get_object_or_404
from django.http import Http404

#создание категории
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

#отображение категории
def category_view(request):
    dataset = CategoryModel.objects.all()
    return render(request, 'listview.html', {'dataset':dataset})

#отображение содержимого текущей категории
def category_detail_view(request,id):
    try:
        data = CategoryModel.objects.get(id=id)
    except CategoryModel.DoesNotExist:
        raise Http404('Категория не найдена')
    dataset = TopicModel.objects.filter(Category=id)
    return render(request, 'listtopic.html',{'dataset': dataset})

#изменение категории
def category_update(request,id):
    try:
        old_data = get_object_or_404(CategoryModel,id=id)
    except Exception:
        raise Http404('Category Not Found')
    if request.method == 'POST':
        form = CategoryForm(request.POST, instance=old_data)
        if form.is_valid():
            form.save()
            return redirect(f'/{id}')
    else:
        form = CategoryForm(instance=old_data)
        context = {
            'form': form
        }
        return render(request,'update.html',context)

#удаление категории
def category_delete(request, id):

    try:
        data = get_object_or_404(CategoryModel, id=id)
    except Exception:
        raise Http404('Category not find')

    if request.method == 'POST':
        data.delete()
        return redirect('/')
    else:
        return render(request,'delete.html')

#создание топика
def create_topic(request):
    if request.method == 'POST':
        form = TopicForm(request.POST)

        if form.is_valid():
            form.save()

            return redirect('/')
    else:
        form = TopicForm()
        context = {
            'form': form
        }
        return render(request,'createtopic.html', context)

#удаление топика
def topic_delete(request, id):
    try:
        data = get_object_or_404(TopicModel, id=id)
    except Exception:
        raise Http404('Topik not find')

    if request.method == 'POST':
        data.delete()
        return redirect('/')
    else:
        return render(request,'deletetopic.html')

#изменение топика
def topik_update(request, id):
    try:
        old_data = get_object_or_404(TopicModel,id=id)
    except Exception:
        raise Http404('Topic Not Found')
    if request.method == 'POST':
        form = TopicForm(request.POST, instance=old_data)
        if form.is_valid():
            form.save()
            return redirect('/')
    else:
        form = TopicForm(instance=old_data)
        context = {
            'form': form
        }
        return render(request,'updatetopic.html',context)