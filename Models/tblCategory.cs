namespace Proj_day11_test.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblCategory")]
    public partial class tblCategory
    {
        [Key]
        [DisplayName("Mã danh mục")]
        public int Categoryid { get; set; }

        [DisplayName("Tên danh mục")]
        [Required(ErrorMessage ="Không được bỏ trống tên danh mục")]
        [StringLength(150)]
        public string CategoryName { get; set; }

        [StringLength(50)]
        [DisplayName("Tiêu đề")]
        public string MetaTitle { get; set; }
    }
}
