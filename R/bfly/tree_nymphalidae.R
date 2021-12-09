tree <- apee:: read.nexus("Supplementary Tree 1.nex")
tree <- ape:: read.nexus("Supplementary Tree 2.nex")

tips <- tree$tip.label

sep.names <- strsplit(tips, split = "_")

df.tips <- matrix(NA, ncol = 2, nrow = length(tips))

for(i in 1:length(tips)) {
  df.tips[i,1] <- sep.names[[i]][length(sep.names[[i]])-1]
  df.tips[i,2] <- sep.names[[i]][length(sep.names[[i]])]
}
df.tips
df.tips[which(df.tips[,1] == "Pseudoscada"),]

new.tips <- cbind(Species = paste(df.tips[,1], df.tips[,2], sep = "_"))

tree$tip.label <- new.tips
tree

length(new.tips)
length(unique(new.tips))

tree$tip.label[which(tree$tip.label == new.tips[which(duplicated(new.tips) == TRUE),][1])] <- c("Pseudoscada_timna", "Pseudoscada_timna1", "Pseudoscada_timna2")
tree$tip.label[which(tree$tip.label == new.tips[which(duplicated(new.tips) == TRUE),][3])] <- c("Pteronymia_alissa", "Pteronymia_alissa1")
tree$tip.label[which(tree$tip.label == new.tips[which(duplicated(new.tips) == TRUE),][4])] <- c("Pteronymia_veia", "Pteronymia_veia1")
tree$tip.label[which(tree$tip.label == new.tips[which(duplicated(new.tips) == TRUE),][5])] <- c("Pteronymia_teresita", "Pteronymia_teresita1")
tree$tip.label[which(tree$tip.label == new.tips[which(duplicated(new.tips) == TRUE),][6])] <- c("Nymphalis_vaualbum", "Nymphalis_vaualbum1")
tree$tip.label[which(tree$tip.label == new.tips[which(duplicated(new.tips) == TRUE),][7])] <- c("Morpho_sulkowskyi", "Morpho_sulkowskyi1")
tree$tip.label[which(tree$tip.label == new.tips[which(duplicated(new.tips) == TRUE),][8])] <- c("Morpho_epistrophus", "Morpho_epistrophus1")
tree$tip.label[which(tree$tip.label == new.tips[which(duplicated(new.tips) == TRUE),][9])] <- c("Lohora_sp", "Lohora_sp1")

ape::write.tree(tree, here::here("Nymphalidae_tree.new"))
