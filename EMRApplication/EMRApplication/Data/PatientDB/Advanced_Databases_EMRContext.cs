using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace EMRApplication.Data.PatientDB
{
    public partial class Advanced_Databases_EMRContext : DbContext
    {
        public virtual DbSet<ConsentLookup> ConsentLookup { get; set; }
        public virtual DbSet<Events> Events { get; set; }
        public virtual DbSet<InvestigationDetails> InvestigationDetails { get; set; }
        public virtual DbSet<Investigations> Investigations { get; set; }
        public virtual DbSet<Medications> Medications { get; set; }
        public virtual DbSet<Patient> Patient { get; set; }
        public virtual DbSet<Problems> Problems { get; set; }
        public virtual DbSet<Reactions> Reactions { get; set; }
        public virtual DbSet<RecordAccess> RecordAccess { get; set; }
        public virtual DbSet<Referrals> Referrals { get; set; }

        public Advanced_Databases_EMRContext(DbContextOptions<Advanced_Databases_EMRContext> options) : base(options)
        { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ConsentLookup>(entity =>
            {
                entity.HasKey(e => e.Name);

                entity.ToTable("consent_lookup");

                entity.HasIndex(e => e.Name)
                    .HasName("IX_consent_lookup")
                    .IsUnique();

                entity.Property(e => e.Name)
                    .HasColumnName("name")
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .ValueGeneratedNever();
            });

            modelBuilder.Entity<Events>(entity =>
            {
                entity.ToTable("events");

                entity.HasIndex(e => e.InvestigationsId)
                    .HasName("UniqueExceptNullsForinvestigationsId")
                    .IsUnique()
                    .HasFilter("([investigationsId] IS NOT NULL)");

                entity.HasIndex(e => e.MedicationsId)
                    .HasName("UniqueExceptNullsFormedicationsId")
                    .IsUnique()
                    .HasFilter("([medicationsId] IS NOT NULL)");

                entity.HasIndex(e => e.ProblemsId)
                    .HasName("UniqueExceptNullsForproblemsId")
                    .IsUnique()
                    .HasFilter("([problemsId] IS NOT NULL)");

                entity.HasIndex(e => e.ReactionsId)
                    .HasName("UniqueExceptNullsForreactionsId")
                    .IsUnique()
                    .HasFilter("([reactionsId] IS NOT NULL)");

                entity.HasIndex(e => e.ReferralsId)
                    .HasName("UniqueExceptNullsForreferralsId")
                    .IsUnique()
                    .HasFilter("([referralsId] IS NOT NULL)");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Approved).HasColumnName("approved");

                entity.Property(e => e.InvestigationsId).HasColumnName("investigationsId");

                entity.Property(e => e.MedicationsId).HasColumnName("medicationsId");

                entity.Property(e => e.ProblemsId).HasColumnName("problemsId");

                entity.Property(e => e.ReactionsId).HasColumnName("reactionsId");

                entity.Property(e => e.ReferralsId).HasColumnName("referralsId");

                entity.Property(e => e.EventType).HasColumnName("eventType");

                entity.HasOne(d => d.Investigations)
                    .WithOne(p => p.Events)
                    .HasForeignKey<Events>(d => d.InvestigationsId)
                    .HasConstraintName("FK__events__investig__6166761E");

                entity.HasOne(d => d.Medications)
                    .WithOne(p => p.Events)
                    .HasForeignKey<Events>(d => d.MedicationsId)
                    .HasConstraintName("FK__events__medicati__662B2B3B");

                entity.HasOne(d => d.Problems)
                    .WithOne(p => p.Events)
                    .HasForeignKey<Events>(d => d.ProblemsId)
                    .HasConstraintName("FK__events__problems__6442E2C9");

                entity.HasOne(d => d.Reactions)
                    .WithOne(p => p.Events)
                    .HasForeignKey<Events>(d => d.ReactionsId)
                    .HasConstraintName("FK__events__reaction__681373AD");

                entity.HasOne(d => d.Referrals)
                    .WithOne(p => p.Events)
                    .HasForeignKey<Events>(d => d.ReferralsId)
                    .HasConstraintName("FK__events__referral__69FBBC1F");
            });

            modelBuilder.Entity<InvestigationDetails>(entity =>
            {
                entity.ToTable("investigation_details");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.ExtractIdentifier)
                    .IsRequired()
                    .HasColumnName("extractIdentifier")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ExtractTime)
                    .HasColumnName("extractTime")
                    .HasColumnType("datetime");

                entity.Property(e => e.InvestigationId).HasColumnName("investigationId");

                entity.Property(e => e.RecordElementIdentifier)
                    .IsRequired()
                    .HasColumnName("recordElementIdentifier")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.RecordedBy)
                    .IsRequired()
                    .HasColumnName("recordedBy")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.RecordedByOrganisationId)
                    .IsRequired()
                    .HasColumnName("recordedByOrganisationId")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.RecordedByOrganisationName)
                    .IsRequired()
                    .HasColumnName("recordedByOrganisationName")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.RecordedByRole)
                    .IsRequired()
                    .HasColumnName("recordedByRole")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.SnomedCode)
                    .IsRequired()
                    .HasColumnName("snomedCode")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.SourceSystemId)
                    .IsRequired()
                    .HasColumnName("sourceSystemId")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.SourceSystemType)
                    .IsRequired()
                    .HasColumnName("sourceSystemType")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.Investigation)
                    .WithMany(p => p.InvestigationDetails)
                    .HasForeignKey(d => d.InvestigationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_investigation_details_investigations");
            });

            modelBuilder.Entity<Investigations>(entity =>
            {
                entity.ToTable("investigations");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Active).HasColumnName("active");

                entity.Property(e => e.Approved).HasColumnName("approved");

                entity.Property(e => e.DateTime)
                    .HasColumnName("dateTime")
                    .HasColumnType("datetime");

                entity.Property(e => e.Flagged).HasColumnName("flagged");

                entity.Property(e => e.IsBiochemistry).HasColumnName("isBiochemistry");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasColumnName("name")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PatientId).HasColumnName("patientId");

                entity.Property(e => e.RangeMax)
                    .HasColumnName("rangeMax")
                    .HasColumnType("decimal(18, 3)");

                entity.Property(e => e.RangeMin)
                    .HasColumnName("rangeMin")
                    .HasColumnType("decimal(18, 3)");

                entity.Property(e => e.Result)
                    .HasColumnName("result")
                    .HasColumnType("decimal(18, 3)");

                entity.Property(e => e.Unit)
                    .IsRequired()
                    .HasColumnName("unit")
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.Investigations)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_investigations_patient");
            });

            modelBuilder.Entity<Medications>(entity =>
            {
                entity.ToTable("medications");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Active).HasColumnName("active");

                entity.Property(e => e.Approved).HasColumnName("approved");

                entity.Property(e => e.DateTime)
                    .HasColumnName("dateTime")
                    .HasColumnType("datetime");

                entity.Property(e => e.IsRepeat).HasColumnName("isRepeat");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasColumnName("name")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PatientId).HasColumnName("patientId");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.Medication)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_medications_patient");
            });

            modelBuilder.Entity<Patient>(entity =>
            {
                entity.ToTable("patient");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Consent)
                    .IsRequired()
                    .HasColumnName("consent")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Dob)
                    .HasColumnName("dob")
                    .HasColumnType("date");

                entity.Property(e => e.Email)
                    .HasColumnName("email")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasColumnName("firstName")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasColumnName("lastName")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneNumber)
                    .HasColumnName("phoneNumber")
                    .HasMaxLength(11)
                    .IsUnicode(false);

                entity.HasOne(d => d.ConsentNavigation)
                    .WithMany(p => p.Patient)
                    .HasForeignKey(d => d.Consent)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_patient_consent_lookup");
            });

            modelBuilder.Entity<Problems>(entity =>
            {
                entity.ToTable("problems");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Active).HasColumnName("active");

                entity.Property(e => e.Approved).HasColumnName("approved");

                entity.Property(e => e.Date)
                    .HasColumnName("date")
                    .HasColumnType("datetime");

                entity.Property(e => e.PatientId).HasColumnName("patientId");

                entity.Property(e => e.ProblemName)
                    .IsRequired()
                    .HasColumnName("problemName")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.Problems)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_problems_patient");
            });

            modelBuilder.Entity<Reactions>(entity =>
            {
                entity.ToTable("reactions");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Active).HasColumnName("active");

                entity.Property(e => e.Approved).HasColumnName("approved");

                entity.Property(e => e.Date)
                    .HasColumnName("date")
                    .HasColumnType("date");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasColumnName("name")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PatientId).HasColumnName("patientId");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.Reactions)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_reactions_patient");
            });

            modelBuilder.Entity<RecordAccess>(entity =>
            {
                entity.ToTable("recordAccess");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.AccessedBy)
                    .IsRequired()
                    .HasColumnName("accessedBy")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Consent)
                    .IsRequired()
                    .HasColumnName("consent")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Date)
                    .HasColumnName("date")
                    .HasColumnType("datetime");

                entity.Property(e => e.IsEmergency).HasColumnName("isEmergency");

                entity.Property(e => e.Message)
                    .HasColumnName("message")
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.PatientId).HasColumnName("patientId");

                entity.HasOne(d => d.ConsentNavigation)
                    .WithMany(p => p.RecordAccess)
                    .HasForeignKey(d => d.Consent)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_recordAccess_consent_lookup");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.RecordAccess)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_recordAccess_patient");
            });

            modelBuilder.Entity<Referrals>(entity =>
            {
                entity.ToTable("referrals");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Approved).HasColumnName("approved");

                entity.Property(e => e.DateTime)
                    .HasColumnName("dateTime")
                    .HasColumnType("datetime");

                entity.Property(e => e.Encounter)
                    .IsRequired()
                    .HasColumnName("encounter")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PatientId).HasColumnName("patientId");

                entity.Property(e => e.Reason)
                    .IsRequired()
                    .HasColumnName("reason")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ReferredBy)
                    .IsRequired()
                    .HasColumnName("referredBy")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ReferredTo)
                    .IsRequired()
                    .HasColumnName("referredTo")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.RefferedToLocation)
                    .IsRequired()
                    .HasColumnName("refferedToLocation")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.RefferedToRole)
                    .IsRequired()
                    .HasColumnName("refferedToRole")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });
        }
    }
}
