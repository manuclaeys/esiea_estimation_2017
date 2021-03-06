#########Test param�triques, ANOVA, et comparaison de popultation


        
Data <- read.csv("C:/Users/claey/Documents/Cours/cour ESIEA/4a/vgsales.csv", sep=',')
df <- as.data.frame(Data)
 

#Cherchez et citez � quoi correspond un objet de type "dataframe" sous R.
help("data.frame")
#The function data.frame() creates data frames, tightly coupled collections of 
#variables which share many of the properties of matrices and of lists, used as the fundamental 
#data structure by most of R's modeling software.
 

summary(df)
mean(Data$JP_Sales)

#moyenne de la colonne JP_Sales est de 0.07778, 
#cette valeur est identique � la moyenne donn�e par la fonction
#summary().

#Genre     
#Action      :3316  
#Sports      :2346  
#Misc        :1739  
#Role-Playing:1488  
#Shooter     :1310  
#Adventure   :1286  
#(Other)     :5113  

#A priori, le genre: "Action" a �t� le plus vendu (3316 jeux) en observant la fonction summary().

#Si on souhaite v�rifier 
box1 <- boxplot( Global_Sales ~ Genre, col='yellow', 
         pch=23, 
         xlab = "Genre", ylab = "Global_Sales",
         main='ann�es',
         data=df)

#Pas tr�s lisible...

mytable <- box1$stats
colnames(mytable)<-box1$names
rownames(mytable)<-c('min','lower quartile','median','upper quartile','max')
mytable 

#Il faut se m�fier des Apriori ! Il y a beaucoup de jeu d'action mais les jeux d'action n'ont pas fait les meillieurs ventes!
#le genre Platform � une valeur m�diane pour GlobalSales de 0.28 versus 0.19 pour le genre Action

#A priori, le continent enregistrant le plus de ventes est celui de l'am�rique du Nord. 
#m�diane � 0.0800 




hist(df$Global_Sales)
plot(density(df$Global_Sales))
plot(df$Year,df$Global_Sales)

#Gaussienne


#Sur quelle p�riode les jeux ont eu des ventes les plus forte
#Citez une variable incoh�rente 
#Un jeux semble avoir exploser les ventes, lequel? Pourquoi selon vous?. 

boxplot(df$Global_Sales)


boxplot( EU_Sales ~ Genre, col='yellow', 
         pch=23, 
         xlab = "Genre", ylab = "EU_Sales",
         main='ann�es',
         data=df)

#D�finir ce que produit la fonction boxplot.
#Pourquoi peut elle �tre utile
#Observer pour les vente globales
#Commentez par rapport � Global_Vente

boxplot( Global_Sales ~ Genre, col='yellow', 
         pch=23, 
         xlab = "Genre", ylab = "Global_Sales",
         main='COL vs RTWL',
         data=df)



#Il est possible de savoir si un genre de jeux se vent aussi bien qu'un autre
#Il est �galement possible de savoir si les ventes de l'EU suivent sont similaire 
#aux ventes g�n�rale.
#Nous allons extraire les vente globale des action jeux "action" et "sport"
COL0 = df$Global_Sales[df$Genre == 'Action']
COL1 = df$Global_Sales[df$Genre == 'Sports']

var(COL0)
var(COL1) 

#D�finir la variance


#####ANOVA

#L'analyse de la variance permet d'�tudier le comportement d'une variable 
#qualitative � expliquer en fonction d'une ou de plusieurs variables nominales 
#cat�gorielles. Lorsque l'on souhaite �tudier le comportement de plusieurs 
#variables � expliquer en m�me temps, on utilisera une analyse de la variance 
#multiple (MANOVA). Si un mod�le contient des variables explicatives 
#cat�gorielles et continues et que l'on souhaite �tudier les lois liant les 
#variables explicatives continues avec la variable � expliquer en fonction de 
#chaque modalit� des variables cat�gorielles, on utilisera alors une analyse de 
#la covariance (ANCOVA).
#http://www.statmethods.net/stats/anova.html

#Pourquoi doit on v�rifier si les donn�es suivent une lois normal avant de faire l'anova
#Cherchez deux tests permettant de v�rifier la normalit� 

###Test de la normalit�

##Le test de shapiro

shapiro.test(df$Global_Sales[df$Genre == 'Adventure'])
shapiro.test(df$Global_Sales[df$Genre == 'Strategy'])
shapiro.test(df$Global_Sales)
#Error in shapiro.test(Data$Global_Sales) : 
#la taille de l'�chantillon doit �tre comprise entre 3 et 5000

#expliquer la d�finition de la pvalue
#Interpr�ter la p value du test de shapiro sur les jeux d'avanture
#Interpr�ter la  p value du test de shapiro sur les jeux d'strat�gie
#aventure et strat�gie suivent la lois normal?
#V�rifier pour action est sport


shapiro.test(df$Global_Sales[df$Genre == 'Action'])
shapiro.test(df$Global_Sales[df$Genre == 'Sports'])


#Le test ks

mean(Data$Global_Sales)
x <- rnorm(nrow(Data),mean = mean(Data$Global_Sales))
ks.test(Data$Global_Sales,x)

#Expliquez les lignes ci dessous
#Concluez sur la normalit� des Global_Sales
#In ks.test(Data$Global_Sales, x) :
#les valeurs p seront approxim�es en pr�sence d'ex-aequos



res1 = wilcox.test(COL0, COL1,  var.equal = TRUE)
#equality rejected <0.005

#res1 = t.test(COL0, COL1, var.equal = TRUE)
res1 

#Interpr�ter le r�sultat de Two Sample t-test
#Les jeux d'actions se vendent-ils comme les jeux de sport
#Observer Avanture et strat�gie (attention il faut v�rifier la normalit� )


res1 = t.test(COL0, COL1, var.equal = TRUE)
res1 
#chercher test fonctionnelle (pvalue)

shapiro.test(df$Global_Sales[df$Genre == 'Adventure'])
shapiro.test(df$Global_Sales[df$Genre == 'Strategy'])

#http://mehdikhaneboubi.free.fr/stat/co/var_ec_r.html
COL0 = Data$Global_Sales[Data$Genre == 'Adventure']
COL1 = Data$Global_Sales[Data$Genre == 'Strategy']






var(COL0)
var(COL1)

res1 = t.test(COL0, COL1)
res1 






###################################

#5958 => 2020


 
 
plot(density(df$Global_Sales))
plot(df$Year,df$Global_Sales)



 
 boxplot(df$Global_Sales)
 
 boxplot( EU_Sales ~ Genre, col='yellow', 
          pch=23, 
          xlab = "RTWL", ylab = "COL",
          main='COL vs RTWL',
          data=df.new)
 
 
 
 plot(density(df$Global_Sales))
 plot(df.new$Year,df.new$Global_Sales)
 

 
 COL0 = df$Global_Sales[df$Genre == 'Action']
 COL1 = df$Global_Sales[df$Genre == 'Sports']
 
 var(COL0)
 var(COL1) 
 
# Samples t-test (student) => v�rifier normalit�
 #Now that we have our data in the correct format, we can run a t-test 
 #testing the H0 that mean(COL0) = mean(COL1). Right now, we'll just assume 
 #that the two variances are equal.
 
 res1 = t.test(COL0, COL1, var.equal = TRUE)
 res1 
 #chercher test fonctionnelle (pvalue)
 
 #http://mehdikhaneboubi.free.fr/stat/co/var_ec_r.html
 COL0 = df$Global_Sales[df$Genre == 'Adventure']
 COL1 = df$Global_Sales[df$Genre == 'Strategy']
 
 var(COL0)
 var(COL1)
 
 res1 = t.test(COL0, COL1)
 res1 
 
 
 
 shapiro.test(df$Global_Sales[Data$Genre == 'Adventure'])
 shapiro.test(df$Global_Sales[Data$Genre == 'Strategy'])
 shapiro.test(df$Global_Sales)
#Error in shapiro.test(Data$Global_Sales) : 
#la taille de l'�chantillon doit �tre comprise entre 3 et 5000
 
 mean(df$Global_Sales)
 x <- rnorm(nrow(df),mean = mean(df$Global_Sales))
 ks.test(df$Global_Sales,x)
 
 #In ks.test(Data$Global_Sales, x) :
#les valeurs p seront approxim�es en pr�sence d'ex-aequos
 
 
 # Plot Means with Error Bars
 library(gplots)
 
 plotmeans(df$Global_Sales ~ df$Genre,xlab="Genre",
           ylab="Global sales", main="Mean Plot\nwith 95% CI") 
 
 ##2012
 df$Year <- as.character(df$Year)
 df$Year <- as.integer( df$Year)
 df.new <- subset.data.frame(df,df$Year > 2012)
 #myData = myData[myData$A > 4,]
 df.new = df.new[df.new$Year < 2017,]

 plot(density(df.new$Global_Sales))
 plot(df.new$Year,df.new$Global_Sales)
 
 plotmeans(df.new$Global_Sales ~ df.new$Genre,xlab="Number of Cylinders",
           ylab="Global sales", main="Mean Plot\nwith 95% CI") 
 
 boxplot(df.new$Global_Sales)
 
 boxplot( EU_Sales ~ Genre, col='yellow', 
          pch=23, 
          xlab = "Genre", ylab = "EU_Sales",
          main='COL vs RTWL',
          data=df.new)
 
 shapiro.test(df.new$Global_Sales[df.new$Genre == 'Adventure'])
 shapiro.test(df.new$Global_Sales[df.new$Genre == 'Strategy'])
 shapiro.test(df.new$Global_Sales)
 

 