from crudapp.models import CategoryModel
from .forms import TopicForm
from .models import TopicModel
from django.shortcuts import render,redirect,get_object_or_404
from django.http import Http404

def category_detail_view(request,CategoryId):
    try:
        data = CategoryModel.objects.get(id=CategoryId)
    except CategoryModel.DoesNotExist:
        raise Http404('Категория не найдена')
    dataset = TopicModel.objects.filter(Category=CategoryId)
    return render(request,'listtopic.html',{'dataset': dataset, 'CategoryId': CategoryId})

def create_topic(request,CategoryId):
    if request.method == 'POST':
        categoryIdAdd = TopicModel(Category=CategoryId)
        form = TopicForm(request.POST,instance=categoryIdAdd)
        if form.is_valid():
            form.save()
            return redirect(f'/topic/{CategoryId}')
    else:
        form = TopicForm()
        context = {
            'form': form, 'CategoryId': CategoryId
        }
        return render(request,'createtopic.html',context)

#удаление топика
def topic_delete(request,CategoryId,id):
    try:
        data = get_object_or_404(TopicModel, id=id)
    except Exception:
        raise Http404('Topik not find')
    if request.method == 'POST':
        data.delete()
        return redirect(f'/topic/{CategoryId}')
    else:
        return render(request,'deletetopic.html',{'CategoryId': CategoryId})

#изменение топика
def topik_update(request,CategoryId,id):
    try:
        old_data = get_object_or_404(TopicModel,id=id)
    except Exception:
        raise Http404('Topic Not Found')
    if request.method == 'POST':
        form = TopicForm(request.POST,instance=old_data)
        if form.is_valid():
            form.save()
            return redirect(f'/topic/{CategoryId}')
    else:
        form = TopicForm(instance=old_data)
        context = {
            'form': form, 'CategoryId': CategoryId
        }
        return render(request,'updatetopic.html',context)