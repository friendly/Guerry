

# https://stackoverflow.com/questions/6578355/plotting-pca-biplot-with-ggplot2
library(ggplot2)

PCbiplot <- function(PC, 
                     x="PC1", y="PC2", 
                     scale=.7,
                     var.text.size = 5,
                     var.color = "red",
                     var.lwd = 1.25,
                     var.alpha = 0.8
                     ) {
    # PC being a prcomp object
    data <- data.frame(obsnames=row.names(PC$x), PC$x)
    plot <- ggplot(data, aes(.data[[x]], .data[[y]])) + 
        geom_text(alpha=.4, size=3, aes(label=obsnames))
    plot <- plot + 
        geom_hline(aes(yintercept=0), linewidth=.2) + 
        geom_vline(aes(xintercept=0), linewidth=.2)

    datapc <- data.frame(varnames=rownames(PC$rotation), PC$rotation)
    mult <- min(
        (max(data[,y]) - min(data[,y])/(max(datapc[,y])-min(datapc[,y]))),
        (max(data[,x]) - min(data[,x])/(max(datapc[,x])-min(datapc[,x])))
        )
    datapc <- transform(datapc,
            v1 = scale * mult * (get(x)),
            v2 = scale * mult * (get(y))
            )

    plot <- plot + coord_equal() + 
        geom_text(data=datapc, aes(x=v1, y=v2, label=varnames), 
                  size = var.text.size, 
                  vjust=1, color=var.color)
    plot <- plot + 
        geom_segment(data=datapc, aes(x=0, y=0, xend=v1, yend=v2), 
                     arrow = arrow(length=unit(0.2,"cm")), 
                     alpha = var.alpha, 
                     color=var.color,
                     linewidth = var.lwd)
    plot <- plot + theme_bw()
    plot
}

fit <- prcomp(USArrests, scale=TRUE)
PCbiplot(fit)
