USE [master]
GO
/****** Object:  Database [ObrazovniInformator]    Script Date: 2/25/2020 3:28:12 PM ******/
CREATE DATABASE [ObrazovniInformator]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ObrazovniInformator', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\ObrazovniInformator.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ObrazovniInformator_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\ObrazovniInformator_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ObrazovniInformator] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ObrazovniInformator].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ObrazovniInformator] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET ARITHABORT OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ObrazovniInformator] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ObrazovniInformator] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ObrazovniInformator] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ObrazovniInformator] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET RECOVERY FULL 
GO
ALTER DATABASE [ObrazovniInformator] SET  MULTI_USER 
GO
ALTER DATABASE [ObrazovniInformator] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ObrazovniInformator] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ObrazovniInformator] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ObrazovniInformator] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ObrazovniInformator] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ObrazovniInformator', N'ON'
GO
ALTER DATABASE [ObrazovniInformator] SET QUERY_STORE = OFF
GO
USE [ObrazovniInformator]
GO
/****** Object:  Table [dbo].[Casopis]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casopis](
	[IDCasopis] [int] IDENTITY(1,1) NOT NULL,
	[Naslov] [nvarchar](50) NULL,
	[Tekst] [nvarchar](max) NULL,
	[Sadrzaj] [nvarchar](max) NULL,
	[Datum] [nvarchar](50) NULL,
	[BrojIzdanja] [int] NULL,
	[IDKorisnika] [int] NULL,
 CONSTRAINT [PK_Casopis] PRIMARY KEY CLUSTERED 
(
	[IDCasopis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clanci]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clanci](
	[IDClanak] [int] IDENTITY(1,1) NOT NULL,
	[Tip] [nvarchar](50) NULL,
	[Datum] [nvarchar](50) NULL,
	[IDSBK] [int] NULL,
	[IDKorisnik] [int] NULL,
 CONSTRAINT [PK_Clanci] PRIMARY KEY CLUSTERED 
(
	[IDClanak] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClanciTxt]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClanciTxt](
	[IDtxt] [int] IDENTITY(1,1) NOT NULL,
	[Naslov] [nvarchar](50) NULL,
	[Tekst] [nvarchar](max) NULL,
	[IDClanak] [int] NULL,
 CONSTRAINT [PK_ClanciTxt] PRIMARY KEY CLUSTERED 
(
	[IDtxt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KontaktOsobe]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KontaktOsobe](
	[IDKontaktOsobe] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](50) NULL,
	[Prezime] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
	[Faks] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[IDNarucilac] [int] NULL,
 CONSTRAINT [PK_KontaktOsobe] PRIMARY KEY CLUSTERED 
(
	[IDKontaktOsobe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Korisnik]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnik](
	[IDKorisnik] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](50) NULL,
	[Prezime] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
	[KorisnickoIme] [nvarchar](50) NULL,
	[Lozinka] [nvarchar](50) NULL,
 CONSTRAINT [PK_Korisnik] PRIMARY KEY CLUSTERED 
(
	[IDKorisnik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Narucilac]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Narucilac](
	[IDNarucioca] [int] IDENTITY(1,1) NOT NULL,
	[PreprlatnickiBroj] [nvarchar](50) NULL,
	[NaziPravnogLica] [nvarchar](50) NULL,
	[BrojTekucegRacuna] [nvarchar](50) NULL,
	[PIB] [nvarchar](50) NULL,
	[Mesto] [nvarchar](50) NULL,
	[PostanskiBroj] [int] NULL,
	[UlicaIBroj] [nvarchar](50) NULL,
 CONSTRAINT [PK_Narucilac] PRIMARY KEY CLUSTERED 
(
	[IDNarucioca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Narudzbenica]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Narudzbenica](
	[IDNarudzbenice] [int] IDENTITY(1,1) NOT NULL,
	[IDNarucilac] [int] NULL,
	[IDOstalihIzdanja] [int] NULL,
	[Kolicina] [int] NULL,
	[DatumPorucivanja] [nvarchar](50) NULL,
 CONSTRAINT [PK_Narudzbenica] PRIMARY KEY CLUSTERED 
(
	[IDNarudzbenice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OstalaIzdanja]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OstalaIzdanja](
	[IDOstalihIzdanja] [int] IDENTITY(1,1) NOT NULL,
	[Naslov] [nvarchar](50) NOT NULL,
	[Sadrzaj] [nvarchar](max) NOT NULL,
	[Opis] [nvarchar](max) NULL,
	[Cena] [float] NULL,
	[IDKorisnik] [int] NULL,
 CONSTRAINT [PK_OstalaIzdanja] PRIMARY KEY CLUSTERED 
(
	[IDOstalihIzdanja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PravnoLice]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PravnoLice](
	[IDPravnoLice] [int] IDENTITY(1,1) NOT NULL,
	[PreplatnickiBroj] [nvarchar](50) NULL,
	[NazivPravnogLica] [nvarchar](50) NULL,
	[BrojTekucegRacuna] [nvarchar](50) NULL,
	[PIB] [nvarchar](50) NULL,
	[Mesto] [nvarchar](50) NULL,
	[PostanskiBroj] [nvarchar](50) NULL,
	[UlicaIBroj] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_PravnoLice] PRIMARY KEY CLUSTERED 
(
	[IDPravnoLice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pretplata]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pretplata](
	[IDPretplate] [int] IDENTITY(1,1) NOT NULL,
	[DatumPocetka] [nvarchar](50) NULL,
	[DatumKraja] [nvarchar](50) NULL,
	[Trajanje] [nvarchar](50) NULL,
	[NacinPlacanja] [nvarchar](50) NULL,
	[BrojPrimeraka] [int] NULL,
	[IDNarucioc] [int] NULL,
	[IDCasopis] [int] NULL,
 CONSTRAINT [PK_Pretplata] PRIMARY KEY CLUSTERED 
(
	[IDPretplate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prijava]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prijava](
	[IDPrijave] [int] IDENTITY(1,1) NOT NULL,
	[DatumPrijave] [nvarchar](50) NULL,
	[NacinPlacanja] [nvarchar](50) NULL,
	[IDUsavrsavanja] [int] NULL,
	[IDPravnoLice] [int] NULL,
 CONSTRAINT [PK_Prijava] PRIMARY KEY CLUSTERED 
(
	[IDPrijave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propis]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propis](
	[IDPropisa] [int] IDENTITY(1,1) NOT NULL,
	[Broj] [int] NULL,
	[Naslov] [nvarchar](50) NULL,
	[Datum] [nvarchar](50) NULL,
	[IDVrste] [int] NULL,
	[IDSBK] [int] NULL,
	[IDKorisnik] [int] NULL,
 CONSTRAINT [PK_Propis] PRIMARY KEY CLUSTERED 
(
	[IDPropisa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropisTxt]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropisTxt](
	[IDPropisTxt] [int] IDENTITY(1,1) NOT NULL,
	[Tekst] [nvarchar](50) NULL,
	[IDPropisa] [int] NULL,
 CONSTRAINT [PK_PropisTxt] PRIMARY KEY CLUSTERED 
(
	[IDPropisTxt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecificnostiBudzetskihKorisnika]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecificnostiBudzetskihKorisnika](
	[IDSBK] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NULL,
 CONSTRAINT [PK_SpecificnostiBudzetskihKorisnika] PRIMARY KEY CLUSTERED 
(
	[IDSBK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatistickiPodaci]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatistickiPodaci](
	[IDStatistickihPodataka] [int] IDENTITY(1,1) NOT NULL,
	[Naslov] [nvarchar](50) NULL,
	[PDF] [nvarchar](255) NULL,
	[IDKorisnik] [int] NULL,
 CONSTRAINT [PK_StatistickiPodaci] PRIMARY KEY CLUSTERED 
(
	[IDStatistickihPodataka] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StrucnoUsavrsavanje]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StrucnoUsavrsavanje](
	[IDUsavrsavanja] [int] IDENTITY(1,1) NOT NULL,
	[Naslov] [nvarchar](50) NULL,
	[DatumOdrzavanja] [nvarchar](50) NULL,
	[AdresaOdrzavanja] [nvarchar](50) NULL,
	[Program] [nvarchar](max) NULL,
	[IDVrsteStrucnogUsavrsavanja] [int] NULL,
	[IDKorisnik] [int] NULL,
 CONSTRAINT [PK_StrucnoUsavrsavanje] PRIMARY KEY CLUSTERED 
(
	[IDUsavrsavanja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ucesnici]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ucesnici](
	[IDUcesnika] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](50) NULL,
	[Prezime] [nvarchar](50) NULL,
	[RadnoMesto] [nvarchar](50) NULL,
	[StrucnaSprema] [nvarchar](50) NULL,
	[JMBG] [nvarchar](50) NULL,
	[BrojLicneKarte] [nvarchar](50) NULL,
	[KontaktTelefon] [nvarchar](50) NULL,
	[UplatuIzvrsava] [nvarchar](50) NULL,
	[IDPravnoLice] [int] NULL,
 CONSTRAINT [PK_Ucesnici] PRIMARY KEY CLUSTERED 
(
	[IDUcesnika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VrstaSluzbenihGlasila]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VrstaSluzbenihGlasila](
	[IDVrstePropisa] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NULL,
 CONSTRAINT [PK_VrstaSluzbenihGlasila] PRIMARY KEY CLUSTERED 
(
	[IDVrstePropisa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VrsteStrucnogUsavrsavanja]    Script Date: 2/25/2020 3:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VrsteStrucnogUsavrsavanja](
	[IDVrsteStrucnogUsavrsavanja] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nchar](10) NULL,
 CONSTRAINT [PK_VrsteStrucnogUsavrsavanja] PRIMARY KEY CLUSTERED 
(
	[IDVrsteStrucnogUsavrsavanja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Casopis]  WITH CHECK ADD  CONSTRAINT [FK_Casopis_Korisnik] FOREIGN KEY([IDKorisnika])
REFERENCES [dbo].[Korisnik] ([IDKorisnik])
GO
ALTER TABLE [dbo].[Casopis] CHECK CONSTRAINT [FK_Casopis_Korisnik]
GO
ALTER TABLE [dbo].[Clanci]  WITH CHECK ADD  CONSTRAINT [FK_Clanci_Korisnik] FOREIGN KEY([IDKorisnik])
REFERENCES [dbo].[Korisnik] ([IDKorisnik])
GO
ALTER TABLE [dbo].[Clanci] CHECK CONSTRAINT [FK_Clanci_Korisnik]
GO
ALTER TABLE [dbo].[Clanci]  WITH CHECK ADD  CONSTRAINT [FK_Clanci_SpecificnostiBudzetskihKorisnika] FOREIGN KEY([IDSBK])
REFERENCES [dbo].[SpecificnostiBudzetskihKorisnika] ([IDSBK])
GO
ALTER TABLE [dbo].[Clanci] CHECK CONSTRAINT [FK_Clanci_SpecificnostiBudzetskihKorisnika]
GO
ALTER TABLE [dbo].[ClanciTxt]  WITH CHECK ADD  CONSTRAINT [FK_ClanciTxt_Clanci] FOREIGN KEY([IDClanak])
REFERENCES [dbo].[Clanci] ([IDClanak])
GO
ALTER TABLE [dbo].[ClanciTxt] CHECK CONSTRAINT [FK_ClanciTxt_Clanci]
GO
ALTER TABLE [dbo].[KontaktOsobe]  WITH CHECK ADD  CONSTRAINT [FK_KontaktOsobe_Narucilac] FOREIGN KEY([IDNarucilac])
REFERENCES [dbo].[Narucilac] ([IDNarucioca])
GO
ALTER TABLE [dbo].[KontaktOsobe] CHECK CONSTRAINT [FK_KontaktOsobe_Narucilac]
GO
ALTER TABLE [dbo].[Narudzbenica]  WITH CHECK ADD  CONSTRAINT [FK_Narudzbenica_Narucilac] FOREIGN KEY([IDNarucilac])
REFERENCES [dbo].[Narucilac] ([IDNarucioca])
GO
ALTER TABLE [dbo].[Narudzbenica] CHECK CONSTRAINT [FK_Narudzbenica_Narucilac]
GO
ALTER TABLE [dbo].[Narudzbenica]  WITH CHECK ADD  CONSTRAINT [FK_Narudzbenica_OstalaIzdanja] FOREIGN KEY([IDOstalihIzdanja])
REFERENCES [dbo].[OstalaIzdanja] ([IDOstalihIzdanja])
GO
ALTER TABLE [dbo].[Narudzbenica] CHECK CONSTRAINT [FK_Narudzbenica_OstalaIzdanja]
GO
ALTER TABLE [dbo].[OstalaIzdanja]  WITH CHECK ADD  CONSTRAINT [FK_OstalaIzdanja_Korisnik] FOREIGN KEY([IDKorisnik])
REFERENCES [dbo].[Korisnik] ([IDKorisnik])
GO
ALTER TABLE [dbo].[OstalaIzdanja] CHECK CONSTRAINT [FK_OstalaIzdanja_Korisnik]
GO
ALTER TABLE [dbo].[Pretplata]  WITH CHECK ADD  CONSTRAINT [FK_Pretplata_Casopis] FOREIGN KEY([IDCasopis])
REFERENCES [dbo].[Casopis] ([IDCasopis])
GO
ALTER TABLE [dbo].[Pretplata] CHECK CONSTRAINT [FK_Pretplata_Casopis]
GO
ALTER TABLE [dbo].[Pretplata]  WITH CHECK ADD  CONSTRAINT [FK_Pretplata_Narucilac] FOREIGN KEY([IDNarucioc])
REFERENCES [dbo].[Narucilac] ([IDNarucioca])
GO
ALTER TABLE [dbo].[Pretplata] CHECK CONSTRAINT [FK_Pretplata_Narucilac]
GO
ALTER TABLE [dbo].[Prijava]  WITH CHECK ADD  CONSTRAINT [FK_Prijava_PravnoLice] FOREIGN KEY([IDPravnoLice])
REFERENCES [dbo].[PravnoLice] ([IDPravnoLice])
GO
ALTER TABLE [dbo].[Prijava] CHECK CONSTRAINT [FK_Prijava_PravnoLice]
GO
ALTER TABLE [dbo].[Prijava]  WITH CHECK ADD  CONSTRAINT [FK_Prijava_StrucnoUsavrsavanje] FOREIGN KEY([IDUsavrsavanja])
REFERENCES [dbo].[StrucnoUsavrsavanje] ([IDUsavrsavanja])
GO
ALTER TABLE [dbo].[Prijava] CHECK CONSTRAINT [FK_Prijava_StrucnoUsavrsavanje]
GO
ALTER TABLE [dbo].[Propis]  WITH CHECK ADD  CONSTRAINT [FK_Propis_Korisnik] FOREIGN KEY([IDKorisnik])
REFERENCES [dbo].[Korisnik] ([IDKorisnik])
GO
ALTER TABLE [dbo].[Propis] CHECK CONSTRAINT [FK_Propis_Korisnik]
GO
ALTER TABLE [dbo].[Propis]  WITH CHECK ADD  CONSTRAINT [FK_Propis_SpecificnostiBudzetskihKorisnika] FOREIGN KEY([IDSBK])
REFERENCES [dbo].[SpecificnostiBudzetskihKorisnika] ([IDSBK])
GO
ALTER TABLE [dbo].[Propis] CHECK CONSTRAINT [FK_Propis_SpecificnostiBudzetskihKorisnika]
GO
ALTER TABLE [dbo].[Propis]  WITH CHECK ADD  CONSTRAINT [FK_Propis_VrstaSluzbenihGlasila] FOREIGN KEY([IDVrste])
REFERENCES [dbo].[VrstaSluzbenihGlasila] ([IDVrstePropisa])
GO
ALTER TABLE [dbo].[Propis] CHECK CONSTRAINT [FK_Propis_VrstaSluzbenihGlasila]
GO
ALTER TABLE [dbo].[PropisTxt]  WITH CHECK ADD  CONSTRAINT [FK_PropisTxt_Propis] FOREIGN KEY([IDPropisa])
REFERENCES [dbo].[Propis] ([IDPropisa])
GO
ALTER TABLE [dbo].[PropisTxt] CHECK CONSTRAINT [FK_PropisTxt_Propis]
GO
ALTER TABLE [dbo].[StatistickiPodaci]  WITH CHECK ADD  CONSTRAINT [FK_StatistickiPodaci_Korisnik] FOREIGN KEY([IDKorisnik])
REFERENCES [dbo].[Korisnik] ([IDKorisnik])
GO
ALTER TABLE [dbo].[StatistickiPodaci] CHECK CONSTRAINT [FK_StatistickiPodaci_Korisnik]
GO
ALTER TABLE [dbo].[StrucnoUsavrsavanje]  WITH CHECK ADD  CONSTRAINT [FK_StrucnoUsavrsavanje_Korisnik] FOREIGN KEY([IDKorisnik])
REFERENCES [dbo].[Korisnik] ([IDKorisnik])
GO
ALTER TABLE [dbo].[StrucnoUsavrsavanje] CHECK CONSTRAINT [FK_StrucnoUsavrsavanje_Korisnik]
GO
ALTER TABLE [dbo].[StrucnoUsavrsavanje]  WITH CHECK ADD  CONSTRAINT [FK_StrucnoUsavrsavanje_VrsteStrucnogUsavrsavanja] FOREIGN KEY([IDVrsteStrucnogUsavrsavanja])
REFERENCES [dbo].[VrsteStrucnogUsavrsavanja] ([IDVrsteStrucnogUsavrsavanja])
GO
ALTER TABLE [dbo].[StrucnoUsavrsavanje] CHECK CONSTRAINT [FK_StrucnoUsavrsavanje_VrsteStrucnogUsavrsavanja]
GO
ALTER TABLE [dbo].[Ucesnici]  WITH CHECK ADD  CONSTRAINT [FK_Ucesnici_PravnoLice] FOREIGN KEY([IDPravnoLice])
REFERENCES [dbo].[PravnoLice] ([IDPravnoLice])
GO
ALTER TABLE [dbo].[Ucesnici] CHECK CONSTRAINT [FK_Ucesnici_PravnoLice]
GO
USE [master]
GO
ALTER DATABASE [ObrazovniInformator] SET  READ_WRITE 
GO
