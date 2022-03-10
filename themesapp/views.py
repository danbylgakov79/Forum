from topicapp.models import TopicModel
from .forms import ThemesForm
from .models import ThemesModel
from django.shortcuts import render,redirect,get_object_or_404
from django.http import Http404

def themes_view(request,CategoryId,TopicId):
    try:
        data = TopicModel.objects.get(id=TopicId)
    except TopicModel.DoesNotExist:
        raise Http404('Категория не найдена')
    dataset = ThemesModel.objects.filter(Topic=TopicId)
    return render(request,'listthemes.html',{'dataset': dataset, 'CategoryId': CategoryId, 'TopicId': TopicId})

def create_theme(request,CategoryId,TopicId):
    if request.method == 'POST':
        form = ThemesForm(request.POST)
        if form.is_valid():
            themes = form.save(commit=False)
            themes.Category = CategoryId
            themes.Topic = TopicId
            themes.save()
            return redirect(f'/themes/{CategoryId}/{TopicId}')
    else:
        form = ThemesForm()
        context = {
            'form': form, 'CategoryId': CategoryId, 'TopicId': TopicId
        }
        return render(request,'create.html',context)

#удаление темы
def theme_delete(request,CategoryId,TopicId,id):
    try:
        data = get_object_or_404(ThemesModel,id=id)
    except Exception:
        raise Http404('Theme not find')

    if request.method == 'POST':
        data.delete()
        return redirect(f'/themes/{CategoryId}/{TopicId}')
    else:
        return render(request,'delete.html',{ 'CategoryId': CategoryId, 'TopicId': TopicId})

#изменение темы
def theme_update(request,CategoryId,TopicId,id):
    try:
        old_data = get_object_or_404(ThemesModel,id=id)
    except Exception:
        raise Http404('Topic Not Found')
    if request.method == 'POST':
        form = ThemesForm(request.POST,instance=old_data)
        if form.is_valid():
            form.save()
            return redirect(f'/themes/{CategoryId}/{TopicId}')
    else:
        form = ThemesForm(instance=old_data)
        context = {
            'form': form, 'CategoryId': CategoryId, 'TopicId': TopicId
        }
        return render(request,'update.html',context)
