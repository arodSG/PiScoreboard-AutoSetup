from data.status import Status
from rgbmatrix import graphics
from utils import get_font, center_text_position
from renderers.teams import TeamsRenderer
from renderers.scrollingtext import ScrollingText
from renderers.network import NetworkErrorRenderer
import data.layout

class Pregame:
    def __init__(self, canvas, game, scoreboard, data, probable_starter_pos):
        self.canvas = canvas
        self.game = game
        self.scoreboard = scoreboard
        self.data = data
        self.layout = data.config.layout
        self.colors = data.config.scoreboard_colors
        self.bgcolor = self.colors.graphics_color("default.background")
        self.probable_starter_pos = probable_starter_pos

    def render(self):
        text_len = self.__render_probable_starters()
        TeamsRenderer(self.canvas, self.scoreboard.home_team, self.scoreboard.away_team, self.data).render()
        if self.layout.state == data.layout.LAYOUT_STATE_WARMUP:
            self.__render_warmup()
        else:
            self.__render_start_time()
            self.__render_home_team_record()
            self.__render_away_team_record()
        NetworkErrorRenderer(self.canvas, self.data).render()
        return text_len
    
    def __render_home_team_record(self):
        home_team_record_text = self.game.home_team_record
        coords = self.layout.coords("pregame.home_team_record")
        font = self.layout.font("pregame.home_team_record")
        color = self.colors.graphics_color("pregame.home_team_record")
        home_team_record_x = center_text_position(home_team_record_text, coords["x"], font["size"]["width"])
        graphics.DrawText(self.canvas, font["font"], home_team_record_x, coords["y"], color, home_team_record_text)

    def __render_away_team_record(self):
        away_team_record_text = self.game.away_team_record
        coords = self.layout.coords("pregame.away_team_record")
        font = self.layout.font("pregame.away_team_record")
        color = self.colors.graphics_color("pregame.away_team_record")
        away_team_record_x = center_text_position(away_team_record_text, coords["x"], font["size"]["width"])
        graphics.DrawText(self.canvas, font["font"], away_team_record_x, coords["y"], color, away_team_record_text)

    def __render_start_time(self):
        time_text = self.game.start_time
        coords = self.layout.coords("pregame.start_time")
        font = self.layout.font("pregame.start_time")
        color = self.colors.graphics_color("pregame.start_time")
        time_x = center_text_position(time_text, coords["x"], font["size"]["width"])
        graphics.DrawText(self.canvas, font["font"], time_x, coords["y"], color, time_text)

    def __render_warmup(self):
        warmup_text = self.game.status
        coords = self.layout.coords("pregame.warmup_text")
        font = self.layout.font("pregame.warmup_text")
        color = self.colors.graphics_color("pregame.warmup_text")
        warmup_x = center_text_position(warmup_text, coords["x"], font["size"]["width"])
        graphics.DrawText(self.canvas, font["font"], warmup_x, coords["y"], color, warmup_text)

    def __render_probable_starters(self):
        coords = self.layout.coords("pregame.scrolling_text")
        font = self.layout.font("pregame.scrolling_text")
        color = self.colors.graphics_color("pregame.scrolling_text")
        pitchers_text = self.game.away_starter + ' vs ' + self.game.home_starter
        return ScrollingText(self.canvas, coords["x"], coords["y"], coords["width"], font, color, self.bgcolor, pitchers_text).render(self.probable_starter_pos)
