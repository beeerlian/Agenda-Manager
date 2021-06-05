Welcome to the agenda-manager-using-flutter wiki!

# berlian_app (Agenda Manager)

A Flutter project.
Using slimy_card package (https://pub.dev/packages/slimy_card)

Had Mobile and Web look view.

Features : 
- Add new agenda
- Marking agenda as done
- Undo agenda as done marking
- Delete agenda
- Edit Agenda

Still using static data declared inside the source code, you can check it in beerlian_app/lib/model/agenda.dart
Not yet integrated with any database, all changes inside the app will be lost once the application is closed, and will be reset when the app opened again.

The agenda's date data in this ap using String datatype with dd-MM-yyyy formatting.
Cannot canceling/undo while deleting agenda.

## UI
### Mobileview


<img src = "https://github.com/beeerlian/agenda-manager-using-flutter/blob/Flutters-Repo/berlian_app/assets/Screenshot/berlian_app_ui/loginM.jpeg" height = "400"/> <img src="https://github.com/beeerlian/agenda-manager-using-flutter/blob/Flutters-Repo/berlian_app/assets/Screenshot/berlian_app_ui/mainM2.jpeg" height = "400"/> <img src="https://github.com/beeerlian/agenda-manager-using-flutter/blob/Flutters-Repo/berlian_app/assets/Screenshot/berlian_app_ui/mainM3.jpeg" height = "400"/> <img src="https://github.com/beeerlian/agenda-manager-using-flutter/blob/Flutters-Repo/berlian_app/assets/Screenshot/berlian_app_ui/addM.jpeg" height="400"/> <img src="https://github.com/beeerlian/agenda-manager-using-flutter/blob/Flutters-Repo/berlian_app/assets/Screenshot/berlian_app_ui/deletem.jpeg" height="400"/>

### Webview

<img src="https://github.com/beeerlian/agenda-manager-using-flutter/blob/Flutters-Repo/berlian_app/assets/Screenshot/berlian_app_ui/mainpage.jpeg" width="500"/> <img src="https://github.com/beeerlian/agenda-manager-using-flutter/blob/Flutters-Repo/berlian_app/assets/Screenshot/berlian_app_ui/add.jpeg" width="500"/>

<img src="https://github.com/beeerlian/agenda-manager-using-flutter/blob/Flutters-Repo/berlian_app/assets/Screenshot/berlian_app_ui/delete.jpeg" width="500"/> <img src="https://github.com/beeerlian/agenda-manager-using-flutter/blob/Flutters-Repo/berlian_app/assets/Screenshot/berlian_app_ui/mark.jpeg" width="500" /> 
<img src="https://github.com/beeerlian/agenda-manager-using-flutter/blob/Flutters-Repo/berlian_app/assets/Screenshot/berlian_app_ui/edit.jpeg" width="500"/>




