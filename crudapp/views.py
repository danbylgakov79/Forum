from django.contrib.auth.decorators import login_required
from django.contrib.auth.decorators import permission_required
from .models import CategoryModel
from .forms import CategoryForm
from django.shortcuts import render,redirect,get_object_or_404
from django.http import Http404

@permission_required('crudapp.can_add_category')
def category_create(request):
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
        return render(request, 'create.html', context)

def category_view(request):
    dataset = CategoryModel.objects.all()
    return render(request, 'listcategories.html', {'dataset': dataset})

@permission_required('crudapp.can_update_category')
def category_update(request,id):
    try:
        old_data = get_object_or_404(CategoryModel,id=id)
    except Exception:
        raise Http404('Category Not Found')
    if request.method == 'POST':
        form = CategoryForm(request.POST, instance=old_data)
        if form.is_valid():
            form.save()
            return redirect('/')
    else:
        form = CategoryForm(instance=old_data)
        context = {
            'form': form
        }
        return render(request, 'update.html', context)

#удаление категории
@login_required
@permission_required('crudapp.can_delete_category')
def category_delete(request, id):
    try:
        data = get_object_or_404(CategoryModel,id=id)
    except Exception:
        raise Http404('Category not find')
    if request.method == 'POST':
        data.delete()
        return redirect('/')
    else:
        return render(request, 'delete.html')
