namespace Proj_day11_test.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblProduct")]
    public partial class tblProduct
    {
        [Key]
        [DisplayName("Mã sản phẩm")]
        public int Pid { get; set; }
        [DisplayName("Mã danh mục")]
        public int Categoryid { get; set; }
        [DisplayName("Tên sản phẩm")]
        [Required(ErrorMessage ="Tên sản phẩm không được để trống")]
        [StringLength(250)]
        public string ProdName { get; set; }

        [StringLength(50)]
        [DisplayName("Tiêu đề")]
        public string MetaTitle { get; set; }

        [StringLength(250)]
        [DisplayName("Mô tả")]
        [Required(ErrorMessage = "Mô tả không được để trống")]
        public string Description { get; set; }
        [DisplayName("Ảnh")]
        [Required(ErrorMessage ="Ảnh không được để trống")]
        [StringLength(550)]
        public string ImagePath { get; set; }
        [DisplayName("Giá")]
        [Required(ErrorMessage = "Giá sản phẩm không được để trống")]
        public decimal Price { get; set; }
    }
}
