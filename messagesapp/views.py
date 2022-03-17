from django.contrib.auth.decorators import login_required
from django.shortcuts import render

from themesapp.models import ThemesModel
from django.contrib.auth.decorators import permission_required
from .forms import MessagesForm
from .models import MessagesModel
from django.shortcuts import render,redirect,get_object_or_404
from django.http import Http404

def messages_view(request,CategoryId,TopicId,ThemesId):
    try:
        data = ThemesModel.objects.get(id=ThemesId)
    except ThemesModel.DoesNotExist:
        raise Http404('Тема не найдена')
    dataset = MessagesModel.objects.filter(Category=CategoryId,Topic=TopicId,Themes=ThemesId)
    print(dataset)
    return render(request, 'listmessages.html', {'dataset': dataset, 'CategoryId': CategoryId, 'TopicId': TopicId, 'ThemesId': ThemesId})
@login_required
@permission_required('messagesapp.can_add_message')
def create_message(request,CategoryId,TopicId,ThemesId):
    if request.method == 'POST':
        form = MessagesForm(request.POST)
        if form.is_valid():
            message = form.save(commit=False)
            message.Category = CategoryId
            message.Topic = TopicId
            message.Themes = ThemesId
            message.save()
            return redirect(f'/messages/{CategoryId}/{TopicId}/{ThemesId}')
    else:
        form = MessagesForm()
        context = {
            'form': form, 'CategoryId': CategoryId, 'TopicId': TopicId, 'ThemesId':ThemesId
        }
        return render(request,'create.html',context)

#удаление темы
@login_required
@permission_required('messagesapp.can_delete_message')
def message_delete(request,CategoryId,TopicId,ThemesId,id):
    try:
        data = get_object_or_404(MessagesModel,id=id)
    except Exception:
        raise Http404('Theme not find')

    if request.method == 'POST':
        data.delete()
        return redirect(f'/messages/{CategoryId}/{TopicId}/{ThemesId}')
    else:
        return render(request,'delete.html',{ 'CategoryId': CategoryId, 'TopicId': TopicId,'ThemesId':ThemesId})

#изменение темы
@login_required
@permission_required('messagesapp.can_update_message')
def theme_update(request,CategoryId,TopicId,ThemesId,id):
    try:
        old_data = get_object_or_404(MessagesModel,id=id)
    except Exception:
        raise Http404('Topic Not Found')
    if request.method == 'POST':
        form = MessagesForm(request.POST,instance=old_data)
        if form.is_valid():
            form.save()
            return redirect(f'/messages/{CategoryId}/{TopicId}/{ThemesId}')
    else:
        form = MessagesForm(instance=old_data)
        context = {
            'form': form, 'CategoryId': CategoryId, 'TopicId': TopicId,'ThemesId':ThemesId
        }
        return render(request,'update.html',context)
