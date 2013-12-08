require "easy_dialog/version"
require "curses"

module EasyDialog
  class Choises
    def initialize question, choises
      raise unless question.class == String
      raise unless choises.class == Array
      @question = question
      @choises = choises
    end
    def ask
      width =  @choises.max_by {|s| s.length}.length + 1
      num = 80 / width
      highlight = 0
      Curses.noecho
      Curses.init_screen
      Curses.start_color
      Curses.stdscr.keypad(true)
      Curses.init_pair 1, Curses::COLOR_BLACK, Curses::COLOR_RED
      loop do
        Curses.setpos 0, 0
        Curses.attroff(Curses::A_COLOR)
        Curses.addstr(@question)
        @choises.each_with_index do |c,i|
          Curses.setpos i/num + 1, i%num*width
          if i == highlight
            Curses.attrset(Curses.color_pair(1))
          else
            Curses.attroff(Curses::A_COLOR)
          end
          Curses.addstr(c)
        end
        Curses.refresh
        case hoge = Curses.getch
        when Curses::Key::RIGHT
          highlight = highlight + 1
        when Curses::Key::LEFT
          highlight = highlight - 1
        when Curses::Key::UP
          highlight = highlight - num
        when Curses::Key::DOWN
          highlight = highlight + num
        when 27
          exit 1
        when 10
          Curses.close_screen
          return @choises[highlight]
        end
        if highlight >= @choises.length
          highlight = @choises.length - 1
        end
        highlight = 0 if highlight < 0
      end
    end
  end

  class Checkbox < Choises
    def ask
      @result = Array.new
      width =  @choises.max_by {|s| s.length}.length + 1
      num = 80 / width
      highlight = 0
      Curses.noecho
      Curses.init_screen
      Curses.start_color
      Curses.stdscr.keypad(true)
      Curses.init_pair 1, Curses::COLOR_BLACK, Curses::COLOR_RED
      Curses.init_pair 2, Curses::COLOR_BLACK, Curses::COLOR_YELLOW
      loop do
        Curses.setpos 0, 0
        Curses.attroff(Curses::A_COLOR)
        Curses.addstr(@question)
        @choises.each_with_index do |c,i|
          Curses.setpos i/num + 1, i%num*width
          if i == highlight
            Curses.attrset(Curses.color_pair(1))
          elsif @result.any? {|r| r.equal? c}
            Curses.attrset(Curses.color_pair(2))
          else
            Curses.attroff(Curses::A_COLOR)
          end
          Curses.addstr(c)
        end
        Curses.refresh
        case hoge = Curses.getch
        when Curses::Key::RIGHT
          highlight = highlight + 1
        when Curses::Key::LEFT
          highlight = highlight - 1
        when Curses::Key::UP
          highlight = highlight - num
        when Curses::Key::DOWN
          highlight = highlight + num
        when 27
          Curses.close_screen
          return @result
        when 10
          if @result.any? {|r| r.equal? @choises[highlight]}
            @result.delete_if {|r| r.equal? @choises[highlight]}
          else
            @result<<@choises[highlight]
          end
        end
        if highlight >= @choises.length
          highlight = @choises.length - 1
        end
        highlight = 0 if highlight < 0
      end
    end
  end
end
