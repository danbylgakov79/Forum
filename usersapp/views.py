from django.shortcuts import render
from django.contrib.auth.models import User, Group
from .forms import UserRegistrationForm

def register(request):
    if request.method == 'POST':
        user_form = UserRegistrationForm(request.POST)
        if user_form.is_valid():
            # Create a new user object but avoid saving it yet
            new_user = user_form.save(commit=False)
            # Set the chosen password
            new_user.set_password(user_form.cleaned_data['password'])
            # Save the User object
            new_user.save()
            g = Group.objects.get(name="Members")
            g.user_set.add(new_user)
            return render(request, '/', {'new_user': new_user})
    else:
        user_form = UserRegistrationForm()
        return render(request, 'register.html', {'user_form': user_form})
