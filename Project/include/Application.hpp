#include <iostream>
#include <gtk/gtk.h>

#ifndef APPLICATION_HPP
#define APPLICATION_HPP

namespace Application {

class Application {
public:
  Application(){}
  ~ Application(){}

  void Init(int argc, char* argv[]){
    gtk_init(&argc, &argv);
    m_GtkWidget = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(m_GtkWidget), "StarHunter");
    gtk_window_set_default_size(GTK_WINDOW(m_GtkWidget), 200, 200);
    gtk_window_set_position(GTK_WINDOW(m_GtkWidget), GTK_WIN_POS_CENTER);
    gtk_widget_show(m_GtkWidget);
    gtk_main();
  }
  void Run(){
    std::cout << "Application is running." << std::endl;
  }
  void End(){}
private:
  GtkWidget* m_GtkWidget;
};

} // namespace Application

#endif
