module AdminHelper
  COLLECTION_ACTIONS = [ 'index', 'new' ]
  MEMBER_ACTIONS     = [ 'show', 'edit', 'destroy' ]

  T = {
    'index'     => 'Listele',
    'new'       => 'Yeni',
    'create'    => 'Yeni',
    'show'      => 'Görüntüle',
    'edit'      => 'Düzenle',
    'update'    => 'Güncelle',
    'destroy'   => 'Sil',
    'buildings' => 'Eserler',
    'photos'    => 'Fotoğraflar'
  }

  def t(str)
    T[str] || str || ''
  end

  def controllers_menu(menu)
    r = []
    menu.each { |k|
      link = case k
        when controller.controller_name: link_to(t(k), { :controller => k }, { :class => 'current' })
        else                             link_to(t(k), :controller => k)
      end
      r << content_tag(:li, link)
    }
    r.join('')
  end

  def controllers_select(menu)
    r = []
    menu.each { |k|
        r << options_for_select(t(k) => k)
    }
    r.join('')
  end

  def actions_menu()
    actions = COLLECTION_ACTIONS

    if MEMBER_ACTIONS.include?(controller.action_name)
      actions += MEMBER_ACTIONS
    end

    r = []
    actions.each { |k|
      link = case k
        when 'destroy'             : link_to(t(k), { :action => k }, :confirm => 'Emin misiniz?', :method => :delete)
        when controller.action_name: link_to(t(k), { :action => k }, { :class => 'current' })
        else                         link_to(t(k), :action => k)
      end
      r << content_tag(:li, link)
    }

    r.join('')
  end

  def member_actions(object, methods)
    links = []
    controller = eval("#{object.class.to_s.pluralize}Controller.new")

    for method in methods
      if method == :destroy
        links << link_to(t(method.to_s), object, :confirm => 'Emin misiniz?', :method => :delete)
      else
        links << link_to(t(method.to_s), polymorphic_path(object, :action => method))
      end
    end
    links.join(' | ')
  end
end
