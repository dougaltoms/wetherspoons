from colour import Color
from matplotlib.colors import LinearSegmentedColormap
import matplotlib.pyplot as plt
import seaborn

WetherspoonsPalettes = {
    "BlueLagoon" :["#164d83","#2a81ca","#3ca2e1","#55cce3","#80bcae","#f2e554"],
    "SexOnTheBeach" : ["#721613","#e33530","#fc6a03","#f1803a","#f5a941","#fbd85e"],
    "PurpleRain" : ["#2a0925","#412a52","#727aa0","#b9c8d4","#cacaca","#a3b535"],
    "PornstarMartini" : ["#face60","#f2903d","#d46b31","#ece2d9","#d0c65c","#995176"],
    "TuttiFrutti" : ["#1f4c1d","#479624","#7cc033","#9ed23b","#d7f578","#fefaa9"],
    "BubbleGin" : ["#b02f24","#984c50","#c2868f","#ccaead","#d5d0d4","#f5eaf3"]
}

def pitcher_of(palette, direction=(1,-1), type=("continuous", "discrete")):

    import matplotlib as plt
    
    # Get palette from from palette list

    try:
        palette_name = palette
        palette = WetherspoonsPalettes[palette]
        
    except:
        return print(f"We're not currently serving the '{palette_name}' cocktail.")

    # Set direction

    try:
        if direction not in {1,-1}:
            direction = 1

        if type not in {"continuous","discrete"}:
            type = "continuous"

    except Exception as e:
        return print("You've had one too many silly goose: ",e)


    try:
        if direction==-1:
            palette.reverse()
    except Exception as e:
        return print('Sorry for the error, pub closed: ',e)
    

    # Continuous cmaps

    try:
        if type == "continuous" and direction ==1:
            cmap = plt.colors.LinearSegmentedColormap.from_list(palette_name, palette)

        if type == "continuous" and direction ==-1:
            #palette.reverse()
            cmap = plt.colors.LinearSegmentedColormap.from_list(palette_name, palette)

    except Exception as e:
        return print('Sorry for the error, pub closed: ',e)

    # Discrete cmaps

    try:
        if type == "discrete" and direction ==1:
            cmap = plt.colors.ListedColormap(palette)

        if type == "discrete" and direction ==-1:
            #palette.reverse()
            cmap = plt.colors.ListedColormap(palette)
    except Exception as e:
        return print("Sorry for the error, pub closed: ",e)

    return cmap


if __name__ == "__main__":
    pitcher_of()