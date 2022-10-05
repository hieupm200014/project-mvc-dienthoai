using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Proj_day11_test.Models
{
    public partial class ECartDB : DbContext
    {
        public ECartDB()
            : base("name=ECartDB")
        {
        }

        public virtual DbSet<tblCategory> tblCategories { get; set; }
        public virtual DbSet<tblProduct> tblProducts { get; set; }
        public virtual DbSet<tblUser> tblUsers { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<tblCategory>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<tblProduct>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<tblUser>()
                .Property(e => e.Username)
                .IsUnicode(false);

            modelBuilder.Entity<tblUser>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<tblUser>()
                .Property(e => e.Phone)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<tblUser>()
                .Property(e => e.Email)
                .IsUnicode(false);
        }
    }
}
