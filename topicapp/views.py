from django.shortcuts import render
from crudapp.forms import CategoryForm
from crudapp.models import CategoryModel
from .forms import TopicForm
from .models import TopicModel
from django.shortcuts import render,redirect,get_object_or_404
from django.http import Http404


def category_detail_view(request,Categoryid):
    try:
        data = CategoryModel.objects.get(id=Categoryid)
    except CategoryModel.DoesNotExist:
        raise Http404('Категория не найдена')
    dataset = TopicModel.objects.filter(Category=Categoryid)
    print(dataset[0])
    return render(request, 'listtopic.html',{'dataset': dataset, 'category':Categoryid})

def create_topic(request,Categoryid):
    if request.method == 'POST':
        categoryIdAdd = TopicModel(Category=Categoryid)
        form = TopicForm(request.POST,instance=categoryIdAdd)

        if form.is_valid():

            form.save()

            return redirect('/')
    else:
        form = TopicForm()
        context = {
            'form': form, 'category':Categoryid
        }
        return render(request,'createtopic.html', context)

#удаление топика
def topic_delete(request,Categoryid,id):
    try:
        data = get_object_or_404(TopicModel, id=id)
    except Exception:
        raise Http404('Topik not find')

    if request.method == 'POST':
        data.delete()
        return redirect('/')
    else:
        return render(request,'deletetopic.html',{'category':Categoryid})

#изменение топика
def topik_update(request, Categoryid,id):
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
            'form': form, 'category':Categoryid
        }
        return render(request,'updatetopic.html',context)