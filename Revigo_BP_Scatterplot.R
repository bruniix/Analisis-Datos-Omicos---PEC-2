# A plotting R script produced by the Revigo server at http://revigo.irb.hr/
# If you found Revigo useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# --------------------------------------------------------------------------
# If you don't have the ggplot2 package installed, uncomment the following line:
# install.packages( "ggplot2" );
library( ggplot2 );

# --------------------------------------------------------------------------
# If you don't have the scales package installed, uncomment the following line:
# install.packages( "scales" );
library( scales );

# --------------------------------------------------------------------------
# Here is your data from Revigo. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency","plot_X","plot_Y","log_size","value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0000280","nuclear division",0.556356852863531,-6.003612095371455,1.4672292527837494,5.292187376490468,-6.022276394711152,0.6698204172293701,-0),
c("GO:0002250","adaptive immune response",0.19727774428366388,2.7946040945124353,-5.0637267856531185,4.841916061893772,-12.214670164989233,0.7917842053795265,0),
c("GO:0002376","immune system process",1.3594301248748135,5.57975334610204,0.6011509248042274,5.68018951515756,-5.823908740944319,1,-0),
c("GO:0007051","spindle organization",0.3170758241756994,-5.285068340375258,-0.6606563097667217,5.047998737092271,-5.958607314841775,0.5045401099151067,0.46512395),
c("GO:0010965","regulation of mitotic sister chromatid separation",0.1020882800871556,1.2955327364068205,6.174638133070342,4.555819683061191,-6.107905397309519,0.6701199122770854,-0),
c("GO:0016064","immunoglobulin mediated immune response",0.040995432699978504,2.2779683184608834,-5.576511984995644,4.159597267987408,-6.236572006437063,0.7729869365081555,0.65671866),
c("GO:0048285","organelle fission",0.6531191335223514,-5.669784732018095,2.307086354524999,5.361826013237364,-5.619788758288394,0.7347639855635119,0.49800252),
c("GO:0051306","mitotic sister chromatid separation",0.005956261620814051,-5.887541302153743,-0.8882512554800315,3.3220124385824006,-6.00436480540245,0.5173382040526758,0.67001435),
c("GO:0098813","nuclear chromosome segregation",0.42748242959602234,-5.138230726121058,-3.968806585214932,5.1777528718426185,-5.886056647693163,0.533695344895747,0.68350166),
c("GO:1901992","positive regulation of mitotic cell cycle phase transition",0.06646711013655796,1.8793930466201871,5.762582541779988,4.36945706512637,-5.309803919971486,0.703801136510333,0.67699341));

one.data <- data.frame(revigo.data);
names(one.data) <- revigo.names;
one.data <- one.data [(one.data$plot_X != "null" & one.data$plot_Y != "null"), ];
one.data$plot_X <- as.numeric( as.character(one.data$plot_X) );
one.data$plot_Y <- as.numeric( as.character(one.data$plot_Y) );
one.data$log_size <- as.numeric( as.character(one.data$log_size) );
one.data$value <- as.numeric( as.character(one.data$value) );
one.data$frequency <- as.numeric( as.character(one.data$frequency) );
one.data$uniqueness <- as.numeric( as.character(one.data$uniqueness) );
one.data$dispensability <- as.numeric( as.character(one.data$dispensability) );
#head(one.data);


# --------------------------------------------------------------------------
# Names of the axes, sizes of the numbers and letters, names of the columns,
# etc. can be changed below

p1 <- ggplot( data = one.data );
p1 <- p1 + geom_point( aes( plot_X, plot_Y, colour = value, size = log_size), alpha = I(0.6) );
p1 <- p1 + scale_colour_gradientn( colours = c("blue", "green", "yellow", "red"), limits = c( min(one.data$value), 0) );
p1 <- p1 + geom_point( aes(plot_X, plot_Y, size = log_size), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) ));
p1 <- p1 + scale_size( range=c(5, 30)) + theme_bw(); # + scale_fill_gradientn(colours = heat_hcl(7), limits = c(-300, 0) );
ex <- one.data [ one.data$dispensability < 0.15, ];
p1 <- p1 + geom_text( data = ex, aes(plot_X, plot_Y, label = description), colour = I(alpha("black", 0.85)), size = 3 );
p1 <- p1 + labs (y = "semantic space x", x = "semantic space y");
p1 <- p1 + theme(legend.key = element_blank()) ;
one.x_range = max(one.data$plot_X) - min(one.data$plot_X);
one.y_range = max(one.data$plot_Y) - min(one.data$plot_Y);
p1 <- p1 + xlim(min(one.data$plot_X)-one.x_range/10,max(one.data$plot_X)+one.x_range/10);
p1 <- p1 + ylim(min(one.data$plot_Y)-one.y_range/10,max(one.data$plot_Y)+one.y_range/10);


# --------------------------------------------------------------------------
# Output the plot to screen

p1;

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

# ggsave("/path_to_your_file/revigo-plot.pdf");

