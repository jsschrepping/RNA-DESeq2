QCHeatmap <- function(){
  ht <-  Heatmap(mat[,names(mat) %in% c("basic_statistics", "per_base_sequence_quality", "per_tile_sequence_quality", "per_sequence_quality_scores", "per_base_sequence_content", "per_sequence_gc_content", "per_base_n_content", "sequence_length_distribution", "sequence_duplication_levels", "overrepresented_sequences", "adapter_content")], 
                 column_title = "FastQ QC",
                 column_title_gp = gpar(fontsize = 10),
                 column_names_gp = gpar(fontsize = 8), 
                 row_names_gp = gpar(fontsize = 8),
                 show_row_names = T, 
                 row_names_side = "left",
                 col = c("#F88524","#A1CD64", "#FBE32D"), 
                 cell_fun = function(j, i, x, y, width, height, fill){
                   grid.rect(x = x, y = y, width = width, height = height, 
                             gp = gpar(col = "grey"))}, 
                 name = "QC status") + 
    
    Heatmap(mat[,"X.GC"], 
            column_title = "GC content (%)",
            show_column_names = FALSE, 
            column_title_gp = gpar(fontsize = 10),
            column_title_rot = 90,
            column_names_gp = gpar(fontsize = 8), 
            show_heatmap_legend = FALSE,
            cell_fun = function(j, i, x, y, width, height, fill){
              grid.rect(x = x, y = y, width =2, height = height, 
                        gp = gpar(col = "grey", fill = "white"))
              grid.text(sprintf("%.1f", mat[,"X.GC"][i]), x, y, 
                        gp = gpar(fontsize = 5))
            })+
    
    Heatmap(mat[,"total_deduplicated_percentage"], 
            column_title = "Percentage of reads remaining if deduplicated",
            show_column_names = FALSE, 
            column_title_gp = gpar(fontsize = 10),
            column_title_rot = 90,
            column_names_gp = gpar(fontsize = 8), 
            show_heatmap_legend = FALSE,
            cell_fun = function(j, i, x, y, width, height, fill){
              grid.rect(x = x, y = y, width =2, height = height, 
                        gp = gpar(col = "grey", fill = "white"))
              grid.text(sprintf("%.1f",
                                mat[,"total_deduplicated_percentage"][i]), x, y, 
                        gp = gpar(fontsize = 5))
            })+
    
    Heatmap(mat[,"Sequence.length"], 
            column_title = "Sequence length",
            show_column_names = FALSE, 
            column_title_gp = gpar(fontsize = 10),
            column_title_rot = 90,
            column_names_gp = gpar(fontsize = 8), 
            show_heatmap_legend = FALSE,
            cell_fun = function(j, i, x, y, width, height, fill){
              grid.rect(x = x, y = y, width =2, height = height, 
                        gp = gpar(col = "grey", fill = "white"))
              grid.text(mat[,"Sequence.length"][i], x, y, 
                        gp = gpar(fontsize = 5))
            }) + 
    
    
    Heatmap(mat[,"total_reads"],
            column_title = "total reads (x 10^6)",
            show_column_names = FALSE, 
            column_title_gp = gpar(fontsize = 10),
            column_title_rot = 90,
            show_heatmap_legend = FALSE,
            cluster_columns = F, 
            cluster_rows = F,
            row_names_side = "left", 
            show_row_names = TRUE,
            row_names_gp = gpar(fontsize = 10),
            cell_fun = function(j, i, x, y, width, height, fill){
              grid.text(sprintf("%.1f", mat[,"total_reads"][i]/10^6), 
                        x, y, 
                        gp = gpar(fontsize = 5))}) + 
    
    Heatmap(mat[,"percent_aligned"],
            column_title = "aligned reads (%)",
            show_column_names = FALSE, 
            column_title_gp = gpar(fontsize = 10),
            column_title_rot = 90,
            show_row_names = FALSE, 
            show_heatmap_legend = FALSE,
            cluster_columns = F, 
            cluster_rows = F,
            cell_fun = function(j, i, x, y, width, height, fill){
              grid.text(sprintf("%.1f", mat[,"percent_aligned"][i]), x, y, 
                        gp = gpar(fontsize = 5))}) + 
    
    
    Heatmap(mat[,"pseudoaligned_reads"],
            column_title = "aligned reads (x 10^6)",
            show_column_names = FALSE, 
            column_title_gp = gpar(fontsize = 10),
            column_title_rot = 90,
            show_row_names = FALSE, 
            show_heatmap_legend = FALSE,
            cluster_columns = F, 
            cluster_rows = F,
            cell_fun = function(j, i, x, y, width, height, fill){
              grid.text(sprintf("%.1f",
                                mat[,"pseudoaligned_reads"][i]/10^6), 
                        x, y, 
                        gp = gpar(fontsize = 5))}) + 
    
    rowAnnotation(dist2 = anno_barplot(mat$pseudoaligned_reads, bar_width = 1, gp = gpar(col = NA, fill = "#FFE200"), border = FALSE, which = "row", axis = TRUE), width = unit(1, "cm"))
  
  draw(ht)
}
