from django.shortcuts import render
from topicapp.forms import TopicForm
from topicapp.models import TopicModel
from .forms import ThemesForm
from .models import ThemesModel
from django.shortcuts import render,redirect,get_object_or_404
from django.http import Http404


def themes_view(request,CategoryId,Topicid):
    try:
        data = TopicModel.objects.get(id=Topicid)
    except TopicModel.DoesNotExist:
        raise Http404('Категория не найдена')
    dataset = ThemesModel.objects.filter(Topic=Topicid)
    return render(request, 'listthemes.html',{'dataset': dataset, 'category':CategoryId, 'topic':Topicid})

def create_theme(request,CategoryId,Topicid):
    if request.method == 'POST':
        themesCategoryID = ThemesModel(Category=CategoryId)
        themeTopicId = ThemesModel(Topic=Topicid)
        form = ThemesForm(request.POST)

        if form.is_valid():
           # form.save(commit=False)
            themes = form.save(commit=False)
            themes.Category = CategoryId
            themes.Topic=Topicid
            themes.save()
            return redirect('/')
    else:
        form = ThemesForm()
        context = {
            'form': form, 'category':CategoryId, 'topic':Topicid
        }
        return render(request,'createtheme.html', context)

#удаление темы
def theme_delete(request, CategoryId,Topicid, id):
    try:
        data = get_object_or_404(ThemesModel, id=id)
    except Exception:
        raise Http404('Theme not find')

    if request.method == 'POST':
        data.delete()
        return redirect('/')
    else:
        return render(request, 'deletetheme.html',{ 'category':CategoryId, 'topic':Topicid})

#изменение темы
def theme_update(request,CategoryId, Topicid,id):
    try:
        old_data = get_object_or_404(ThemesModel,id=id)
    except Exception:
        raise Http404('Topic Not Found')
    if request.method == 'POST':
        form = ThemesForm(request.POST, instance=old_data)
        if form.is_valid():
            form.save()
            return redirect('/')
    else:
        form = ThemesForm(instance=old_data)
        context = {
            'form': form, 'category':CategoryId, 'topic':Topicid
        }
        return render(request,'updatetheme.html',context)
