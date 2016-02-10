/****** Object:  StoredProcedure [dbo].[CariHareketSil]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CariHareketSil]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CariHareketSil]
GO
/****** Object:  StoredProcedure [dbo].[StokKartiGuncelle]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StokKartiGuncelle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[StokKartiGuncelle]
GO
/****** Object:  StoredProcedure [dbo].[FaturaSil]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FaturaSil]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FaturaSil]
GO
/****** Object:  StoredProcedure [dbo].[StokHareketEkle]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StokHareketEkle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[StokHareketEkle]
GO
/****** Object:  StoredProcedure [dbo].[StokHareketSil]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StokHareketSil]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[StokHareketSil]
GO
/****** Object:  StoredProcedure [dbo].[FaturaStokHareketEkleTemp]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FaturaStokHareketEkleTemp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FaturaStokHareketEkleTemp]
GO
/****** Object:  StoredProcedure [dbo].[FaturaKaydet]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FaturaKaydet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FaturaKaydet]
GO
/****** Object:  StoredProcedure [dbo].[FaturaHareketSilTemp]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FaturaHareketSilTemp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FaturaHareketSilTemp]
GO
/****** Object:  StoredProcedure [dbo].[PersonelKartiGuncelle]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonelKartiGuncelle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PersonelKartiGuncelle]
GO
/****** Object:  StoredProcedure [dbo].[PersonelKartiEkle]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonelKartiEkle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PersonelKartiEkle]
GO
/****** Object:  StoredProcedure [dbo].[KasaHareketSil]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KasaHareketSil]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[KasaHareketSil]
GO
/****** Object:  StoredProcedure [dbo].[KasaHareketEkle]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KasaHareketEkle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[KasaHareketEkle]
GO
/****** Object:  StoredProcedure [dbo].[KasaBilgileriGetir]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KasaBilgileriGetir]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[KasaBilgileriGetir]
GO
/****** Object:  StoredProcedure [dbo].[PosHareketSil]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PosHareketSil]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PosHareketSil]
GO
/****** Object:  StoredProcedure [dbo].[PosHareketEkle]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PosHareketEkle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PosHareketEkle]
GO
/****** Object:  StoredProcedure [dbo].[PersonelHareketEkle]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonelHareketEkle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PersonelHareketEkle]
GO
/****** Object:  StoredProcedure [dbo].[PersonelHareketSil]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonelHareketSil]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PersonelHareketSil]
GO
/****** Object:  StoredProcedure [dbo].[BankaHareketSil]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BankaHareketSil]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[BankaHareketSil]
GO
/****** Object:  StoredProcedure [dbo].[BankaHareketEkle]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BankaHareketEkle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[BankaHareketEkle]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[View_1]'))
DROP VIEW [dbo].[View_1]
GO
/****** Object:  StoredProcedure [dbo].[CariHareketEkle]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CariHareketEkle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CariHareketEkle]
GO
/****** Object:  Table [dbo].[cari_hareket]    Script Date: 02/09/2016 23:32:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cari_hareket]') AND type in (N'U'))
DROP TABLE [dbo].[cari_hareket]
GO
/****** Object:  Table [dbo].[randevu_kayit]    Script Date: 02/09/2016 23:32:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[randevu_kayit]') AND type in (N'U'))
DROP TABLE [dbo].[randevu_kayit]
GO
/****** Object:  Table [dbo].[stok_grubu_tanimlama]    Script Date: 02/09/2016 23:32:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[stok_grubu_tanimlama]') AND type in (N'U'))
DROP TABLE [dbo].[stok_grubu_tanimlama]
GO
/****** Object:  Table [dbo].[cari_gorusmeleri]    Script Date: 02/09/2016 23:32:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cari_gorusmeleri]') AND type in (N'U'))
DROP TABLE [dbo].[cari_gorusmeleri]
GO
/****** Object:  Table [dbo].[stok_islem_tipi_tanimlama]    Script Date: 02/09/2016 23:32:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[stok_islem_tipi_tanimlama]') AND type in (N'U'))
DROP TABLE [dbo].[stok_islem_tipi_tanimlama]
GO
/****** Object:  Table [dbo].[cari_odeme_sekli_tanimlama]    Script Date: 02/09/2016 23:32:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cari_odeme_sekli_tanimlama]') AND type in (N'U'))
DROP TABLE [dbo].[cari_odeme_sekli_tanimlama]
GO
/****** Object:  Table [dbo].[cari_islem_tipi_tanimlama]    Script Date: 02/09/2016 23:32:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cari_islem_tipi_tanimlama]') AND type in (N'U'))
DROP TABLE [dbo].[cari_islem_tipi_tanimlama]
GO
/****** Object:  Table [dbo].[cari_grubu_tanimlama]    Script Date: 02/09/2016 23:32:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cari_grubu_tanimlama]') AND type in (N'U'))
DROP TABLE [dbo].[cari_grubu_tanimlama]
GO
/****** Object:  Table [dbo].[banka_pos_kayit]    Script Date: 02/09/2016 23:32:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[banka_pos_kayit]') AND type in (N'U'))
DROP TABLE [dbo].[banka_pos_kayit]
GO
/****** Object:  Table [dbo].[banka_kayit]    Script Date: 02/09/2016 23:32:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[banka_kayit]') AND type in (N'U'))
DROP TABLE [dbo].[banka_kayit]
GO
/****** Object:  Table [dbo].[kasa_kayit]    Script Date: 02/09/2016 23:32:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kasa_kayit]') AND type in (N'U'))
DROP TABLE [dbo].[kasa_kayit]
GO
/****** Object:  Table [dbo].[fatura_kayit]    Script Date: 02/09/2016 23:32:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fatura_kayit]') AND type in (N'U'))
DROP TABLE [dbo].[fatura_kayit]
GO
/****** Object:  Table [dbo].[stok_kayit]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[stok_kayit]') AND type in (N'U'))
DROP TABLE [dbo].[stok_kayit]
GO
/****** Object:  Table [dbo].[cari_karti]    Script Date: 02/09/2016 23:32:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cari_karti]') AND type in (N'U'))
DROP TABLE [dbo].[cari_karti]
GO
/****** Object:  Table [dbo].[firma_para_birimi_tanimlama]    Script Date: 02/09/2016 23:32:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[firma_para_birimi_tanimlama]') AND type in (N'U'))
DROP TABLE [dbo].[firma_para_birimi_tanimlama]
GO
/****** Object:  Table [dbo].[firma_ulke_tanimlama]    Script Date: 02/09/2016 23:32:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[firma_ulke_tanimlama]') AND type in (N'U'))
DROP TABLE [dbo].[firma_ulke_tanimlama]
GO
/****** Object:  Table [dbo].[stok_hareket]    Script Date: 02/09/2016 23:32:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[stok_hareket]') AND type in (N'U'))
DROP TABLE [dbo].[stok_hareket]
GO
/****** Object:  Table [dbo].[fatura_stok_hareket_temp]    Script Date: 02/09/2016 23:32:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fatura_stok_hareket_temp]') AND type in (N'U'))
DROP TABLE [dbo].[fatura_stok_hareket_temp]
GO
/****** Object:  Table [dbo].[personel_maas_donem]    Script Date: 02/09/2016 23:32:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personel_maas_donem]') AND type in (N'U'))
DROP TABLE [dbo].[personel_maas_donem]
GO
/****** Object:  Table [dbo].[personel_departman_tanimlama]    Script Date: 02/09/2016 23:32:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personel_departman_tanimlama]') AND type in (N'U'))
DROP TABLE [dbo].[personel_departman_tanimlama]
GO
/****** Object:  Table [dbo].[personel_cari_maas_hareket]    Script Date: 02/09/2016 23:32:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personel_cari_maas_hareket]') AND type in (N'U'))
DROP TABLE [dbo].[personel_cari_maas_hareket]
GO
/****** Object:  Table [dbo].[personel_karti]    Script Date: 02/09/2016 23:32:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personel_karti]') AND type in (N'U'))
DROP TABLE [dbo].[personel_karti]
GO
/****** Object:  Table [dbo].[kasa_gelir_gider_tanimlama]    Script Date: 02/09/2016 23:32:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kasa_gelir_gider_tanimlama]') AND type in (N'U'))
DROP TABLE [dbo].[kasa_gelir_gider_tanimlama]
GO
/****** Object:  Table [dbo].[firma_kayit]    Script Date: 02/09/2016 23:32:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[firma_kayit]') AND type in (N'U'))
DROP TABLE [dbo].[firma_kayit]
GO
/****** Object:  Table [dbo].[personel_islem_tipi_tanimlama]    Script Date: 02/09/2016 23:32:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personel_islem_tipi_tanimlama]') AND type in (N'U'))
DROP TABLE [dbo].[personel_islem_tipi_tanimlama]
GO
/****** Object:  Table [dbo].[kasa_hareket]    Script Date: 02/09/2016 23:32:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kasa_hareket]') AND type in (N'U'))
DROP TABLE [dbo].[kasa_hareket]
GO
/****** Object:  Table [dbo].[banka_pos_hareket]    Script Date: 02/09/2016 23:32:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[banka_pos_hareket]') AND type in (N'U'))
DROP TABLE [dbo].[banka_pos_hareket]
GO
/****** Object:  Table [dbo].[banka_hareket]    Script Date: 02/09/2016 23:32:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[banka_hareket]') AND type in (N'U'))
DROP TABLE [dbo].[banka_hareket]
GO
/****** Object:  Default [DF_stok_kayit_giren]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_stok_kayit_giren]') AND parent_object_id = OBJECT_ID(N'[dbo].[stok_kayit]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_stok_kayit_giren]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[stok_kayit] DROP CONSTRAINT [DF_stok_kayit_giren]
END


End
GO
/****** Object:  Default [DF_stok_kayit_cikan]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_stok_kayit_cikan]') AND parent_object_id = OBJECT_ID(N'[dbo].[stok_kayit]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_stok_kayit_cikan]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[stok_kayit] DROP CONSTRAINT [DF_stok_kayit_cikan]
END


End
GO
/****** Object:  Default [DF_stok_kayit_kdv]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_stok_kayit_kdv]') AND parent_object_id = OBJECT_ID(N'[dbo].[stok_kayit]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_stok_kayit_kdv]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[stok_kayit] DROP CONSTRAINT [DF_stok_kayit_kdv]
END


End
GO
/****** Object:  Default [DF_stok_kayit_alis_fiyati]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_stok_kayit_alis_fiyati]') AND parent_object_id = OBJECT_ID(N'[dbo].[stok_kayit]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_stok_kayit_alis_fiyati]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[stok_kayit] DROP CONSTRAINT [DF_stok_kayit_alis_fiyati]
END


End
GO
/****** Object:  Default [DF_stok_kayit_satis_fiyati]    Script Date: 02/09/2016 23:32:14 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_stok_kayit_satis_fiyati]') AND parent_object_id = OBJECT_ID(N'[dbo].[stok_kayit]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_stok_kayit_satis_fiyati]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[stok_kayit] DROP CONSTRAINT [DF_stok_kayit_satis_fiyati]
END


End
GO
/****** Object:  Table [dbo].[banka_hareket]    Script Date: 02/09/2016 23:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[banka_hareket]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[banka_hareket](
	[banka_hareket_id] [int] IDENTITY(1,1) NOT NULL,
	[banka_hesap_id] [int] NULL,
	[banka_hesap_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[giris_or_cikis] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[kayit_tarihi] [datetime] NULL,
	[odeme_tarihi] [datetime] NULL,
	[cari_unvani] [nvarchar](200) COLLATE Turkish_CI_AS NULL,
	[odeme_kategorisi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[tutar] [decimal](18, 2) NULL,
	[personel_adi] [nvarchar](200) COLLATE Turkish_CI_AS NULL,
	[aciklama1] [nvarchar](250) COLLATE Turkish_CI_AS NULL,
	[cari_id] [int] NULL,
	[pos_id] [int] NULL,
	[cari_hareket_id] [int] NULL,
	[personel_cari_maas_hareket_id] [int] NULL,
 CONSTRAINT [PK_banka_hareketleri] PRIMARY KEY CLUSTERED 
(
	[banka_hareket_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[banka_hareket] ON
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (3, 0, NULL, N'cikis', CAST(0x0000A5A100000000 AS DateTime), CAST(0x0000A5AD00000000 AS DateTime), N'', N'maas', CAST(200.00 AS Decimal(18, 2)), NULL, N'', NULL, 2, NULL, 7)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (4, 4, N'AAAAAA', N'giris', CAST(0x0000A5A400000000 AS DateTime), CAST(0x0000A5A400000000 AS DateTime), NULL, N'giris', CAST(12.00 AS Decimal(18, 2)), N'Personel', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (7, 1, NULL, N'cikis', CAST(0x0000A5A400000000 AS DateTime), CAST(0x0000A5A400000000 AS DateTime), N'', N'banka', CAST(50.00 AS Decimal(18, 2)), N'hamza', N'', 11, 0, 10, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (8, 1, NULL, N'giris', CAST(0x0000A5A400000000 AS DateTime), CAST(0x0000A5A400000000 AS DateTime), N'', N'banka', CAST(300.00 AS Decimal(18, 2)), N'hamza', N'', 11, 0, 11, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (9, 1, NULL, N'giris', CAST(0x0000A5A400000000 AS DateTime), CAST(0x0000A5A400000000 AS DateTime), N'', N'banka', CAST(300.00 AS Decimal(18, 2)), N'hamza', N'', 11, 0, 12, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (10, 1, NULL, N'giris', CAST(0x0000A5A400000000 AS DateTime), CAST(0x0000A5A400000000 AS DateTime), N'', N'banka', CAST(100.00 AS Decimal(18, 2)), N'hamza', N'', 11, 0, 13, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (12, 4, N'AAAAAA', N'giris', CAST(0x0000A5A400000000 AS DateTime), CAST(0x0000A5A400000000 AS DateTime), NULL, N'giris', CAST(10.00 AS Decimal(18, 2)), N'Personel', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (13, 4, N'AAAAAA', N'giris', CAST(0x0000A5A400000000 AS DateTime), CAST(0x0000A5A400000000 AS DateTime), NULL, N'giris', CAST(8.00 AS Decimal(18, 2)), N'Personel', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (14, 4, N'AAAAAA', N'cikis', CAST(0x0000A5A400000000 AS DateTime), CAST(0x0000A5A400000000 AS DateTime), NULL, N'cikis', CAST(15.00 AS Decimal(18, 2)), N'Personel', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (16, 4, NULL, N'giris', CAST(0x0000A5A400000000 AS DateTime), CAST(0x0000A5A500000000 AS DateTime), NULL, NULL, CAST(50.00 AS Decimal(18, 2)), N'Personel', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (17, 4, NULL, N'giris', CAST(0x0000A5A400000000 AS DateTime), CAST(0x0000A5A500000000 AS DateTime), NULL, NULL, CAST(10.00 AS Decimal(18, 2)), N'Personel', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (18, 4, NULL, N'giris', CAST(0x0000A5A400000000 AS DateTime), CAST(0x0000A5A500000000 AS DateTime), NULL, NULL, CAST(10.00 AS Decimal(18, 2)), N'Personel', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (19, 3, NULL, N'giris', CAST(0x0000A5A400000000 AS DateTime), CAST(0x0000A5B000000000 AS DateTime), NULL, NULL, CAST(300.00 AS Decimal(18, 2)), N'Personel', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (20, NULL, NULL, N'giris', CAST(0x0000A5A400000000 AS DateTime), CAST(0x0000A5B000000000 AS DateTime), NULL, NULL, CAST(150.00 AS Decimal(18, 2)), NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (21, NULL, NULL, N'giris', CAST(0x0000A5A400000000 AS DateTime), CAST(0x0000A5B000000000 AS DateTime), NULL, NULL, CAST(300.00 AS Decimal(18, 2)), N'Personel', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (22, 4, N'AAAAAA', N'giris', CAST(0x0000A5A400000000 AS DateTime), CAST(0x0000A5A400000000 AS DateTime), NULL, N'giris', CAST(15.00 AS Decimal(18, 2)), N'Personel', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (23, 1, NULL, N'giris', CAST(0x0000A5A500000000 AS DateTime), CAST(0x0000A5A500000000 AS DateTime), N'', N'banka', CAST(50.00 AS Decimal(18, 2)), N'hamza', N'', 14, 0, 19, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (25, 1, N'HALK BANK1', N'cikis', CAST(0x0000A5A500000000 AS DateTime), CAST(0x0000A5A500000000 AS DateTime), NULL, N'cikis', CAST(150.00 AS Decimal(18, 2)), N'Personel', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (28, 1, NULL, N'cikis', CAST(0x0000A5A500000000 AS DateTime), CAST(0x0000A5A500000000 AS DateTime), N'', N'banka', CAST(10.00 AS Decimal(18, 2)), N'hamza', N'', 14, 0, 26, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (29, 1, NULL, N'cikis', CAST(0x0000A5A500000000 AS DateTime), CAST(0x0000A5DB00000000 AS DateTime), N'', N'pos', CAST(11.00 AS Decimal(18, 2)), N'hamza', N'', 14, 3, 27, NULL)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (30, 1, NULL, N'cikis', CAST(0x0000A5A500000000 AS DateTime), CAST(0x0000A5DB00000000 AS DateTime), N'', N'maas', CAST(21.00 AS Decimal(18, 2)), NULL, N'', NULL, 3, NULL, 8)
INSERT [dbo].[banka_hareket] ([banka_hareket_id], [banka_hesap_id], [banka_hesap_adi], [giris_or_cikis], [kayit_tarihi], [odeme_tarihi], [cari_unvani], [odeme_kategorisi], [tutar], [personel_adi], [aciklama1], [cari_id], [pos_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (31, 1, NULL, N'cikis', CAST(0x0000A5A500000000 AS DateTime), CAST(0x0000A5A500000000 AS DateTime), N'', N'maas', CAST(23.00 AS Decimal(18, 2)), NULL, N'', NULL, 0, NULL, 10)
SET IDENTITY_INSERT [dbo].[banka_hareket] OFF
/****** Object:  Table [dbo].[banka_pos_hareket]    Script Date: 02/09/2016 23:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[banka_pos_hareket]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[banka_pos_hareket](
	[pos_hareket_id] [int] IDENTITY(1,1) NOT NULL,
	[pos_id] [int] NULL,
	[kayit_tarihi] [datetime] NULL,
	[giris_or_cikis] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[odeme_tarihi] [datetime] NULL,
	[aciklama1] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[tutar] [decimal](18, 2) NULL,
	[personel_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[banka_hesap_id] [int] NULL,
	[cari_id] [int] NULL,
	[cari_hareket_id] [int] NULL,
	[personel_cari_maas_hareket_id] [int] NULL,
 CONSTRAINT [PK_banka_pos_hareket] PRIMARY KEY CLUSTERED 
(
	[pos_hareket_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[banka_pos_hareket] ON
INSERT [dbo].[banka_pos_hareket] ([pos_hareket_id], [pos_id], [kayit_tarihi], [giris_or_cikis], [odeme_tarihi], [aciklama1], [tutar], [personel_adi], [banka_hesap_id], [cari_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (2, 2, CAST(0x0000A5A100000000 AS DateTime), N'cikis', CAST(0x0000A5AD00000000 AS DateTime), N'', CAST(200.00 AS Decimal(18, 2)), NULL, 0, NULL, NULL, 7)
INSERT [dbo].[banka_pos_hareket] ([pos_hareket_id], [pos_id], [kayit_tarihi], [giris_or_cikis], [odeme_tarihi], [aciklama1], [tutar], [personel_adi], [banka_hesap_id], [cari_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (3, 2, CAST(0x0000A5A400000000 AS DateTime), N'giris', CAST(0x0000A5B000000000 AS DateTime), N'', CAST(300.00 AS Decimal(18, 2)), N'Personel', NULL, NULL, NULL, NULL)
INSERT [dbo].[banka_pos_hareket] ([pos_hareket_id], [pos_id], [kayit_tarihi], [giris_or_cikis], [odeme_tarihi], [aciklama1], [tutar], [personel_adi], [banka_hesap_id], [cari_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (8, 3, CAST(0x0000A5A500000000 AS DateTime), N'cikis', CAST(0x0000A5DB00000000 AS DateTime), N'', CAST(11.00 AS Decimal(18, 2)), N'hamza', 1, 14, 27, NULL)
INSERT [dbo].[banka_pos_hareket] ([pos_hareket_id], [pos_id], [kayit_tarihi], [giris_or_cikis], [odeme_tarihi], [aciklama1], [tutar], [personel_adi], [banka_hesap_id], [cari_id], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (9, 3, CAST(0x0000A5A500000000 AS DateTime), N'cikis', CAST(0x0000A5DB00000000 AS DateTime), N'', CAST(21.00 AS Decimal(18, 2)), NULL, 1, NULL, NULL, 8)
SET IDENTITY_INSERT [dbo].[banka_pos_hareket] OFF
/****** Object:  Table [dbo].[kasa_hareket]    Script Date: 02/09/2016 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kasa_hareket]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[kasa_hareket](
	[kasa_hareket_id] [int] IDENTITY(1,1) NOT NULL,
	[kasa_id] [int] NULL,
	[kayit_tarihi] [datetime] NULL,
	[evrak_no] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[islem_tipi] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[giris_or_cikis] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[aciklama1] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[tutar] [decimal](18, 2) NULL,
	[cari_id] [int] NULL,
	[fis_id] [int] NULL,
	[banka_id] [int] NULL,
	[personel] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[cari_hareket_id] [int] NULL,
	[personel_cari_maas_hareket_id] [int] NULL,
 CONSTRAINT [PK_kasa_hareket] PRIMARY KEY CLUSTERED 
(
	[kasa_hareket_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[kasa_hareket] ON
INSERT [dbo].[kasa_hareket] ([kasa_hareket_id], [kasa_id], [kayit_tarihi], [evrak_no], [islem_tipi], [giris_or_cikis], [aciklama1], [tutar], [cari_id], [fis_id], [banka_id], [personel], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (2, 8, CAST(0x0000A5A100000000 AS DateTime), N'', N'maas', N'cikis', N'', CAST(100.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL, 4)
INSERT [dbo].[kasa_hareket] ([kasa_hareket_id], [kasa_id], [kayit_tarihi], [evrak_no], [islem_tipi], [giris_or_cikis], [aciklama1], [tutar], [cari_id], [fis_id], [banka_id], [personel], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (3, 8, CAST(0x0000A5A200000000 AS DateTime), N'', N'tediye', N'giris', N'', CAST(1528.00 AS Decimal(18, 2)), 11, 0, 0, N'hamza', 7, NULL)
INSERT [dbo].[kasa_hareket] ([kasa_hareket_id], [kasa_id], [kayit_tarihi], [evrak_no], [islem_tipi], [giris_or_cikis], [aciklama1], [tutar], [cari_id], [fis_id], [banka_id], [personel], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (5, 1, CAST(0x0000A5A500000000 AS DateTime), N'', N'tahsilat', N'cikis', N'', CAST(5.00 AS Decimal(18, 2)), 14, 0, 0, N'hamza', 25, NULL)
INSERT [dbo].[kasa_hareket] ([kasa_hareket_id], [kasa_id], [kayit_tarihi], [evrak_no], [islem_tipi], [giris_or_cikis], [aciklama1], [tutar], [cari_id], [fis_id], [banka_id], [personel], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (6, 1, CAST(0x0000A5A500000000 AS DateTime), N'', N'giris', N'giris', N'', CAST(10.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'Personel', NULL, NULL)
INSERT [dbo].[kasa_hareket] ([kasa_hareket_id], [kasa_id], [kayit_tarihi], [evrak_no], [islem_tipi], [giris_or_cikis], [aciklama1], [tutar], [cari_id], [fis_id], [banka_id], [personel], [cari_hareket_id], [personel_cari_maas_hareket_id]) VALUES (7, 1, CAST(0x0000A5A500000000 AS DateTime), N'', N'maas', N'cikis', N'', CAST(22.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL, 9)
SET IDENTITY_INSERT [dbo].[kasa_hareket] OFF
/****** Object:  Table [dbo].[personel_islem_tipi_tanimlama]    Script Date: 02/09/2016 23:32:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personel_islem_tipi_tanimlama]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[personel_islem_tipi_tanimlama](
	[islem_tipi_id] [int] IDENTITY(1,1) NOT NULL,
	[islem_tipi_value] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[islem_tipi_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[islem_tipi_aciklama1] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_personel_islem_tanimlama] PRIMARY KEY CLUSTERED 
(
	[islem_tipi_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[personel_islem_tipi_tanimlama] ON
INSERT [dbo].[personel_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi_value], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (1, N'maas', N'MAAŞ', N'Personele Yapılan Ödemedir')
INSERT [dbo].[personel_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi_value], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (2, N'avans', N'AVANS', N'Personele Yapılan Ödemedir')
INSERT [dbo].[personel_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi_value], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (3, N'prim', N'PRİM', N'Personele Yapılan Ödemedir')
INSERT [dbo].[personel_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi_value], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (4, N'kist', N'KIST', N'Kıst Maaş Personele Yapılan Ödemedir')
INSERT [dbo].[personel_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi_value], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (5, N'kesinti', N'KESİNTİ', N'Personelden KESİLEN ücrettir.Maaştan Düşülür')
INSERT [dbo].[personel_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi_value], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (6, N'onodeme', N'ÖN ÖDEME', N'Personele yapılan ödemedir.Maaştan Düşülür')
SET IDENTITY_INSERT [dbo].[personel_islem_tipi_tanimlama] OFF
/****** Object:  Table [dbo].[firma_kayit]    Script Date: 02/09/2016 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[firma_kayit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[firma_kayit](
	[firma_id] [int] IDENTITY(1,1) NOT NULL,
	[kurulus_tarihi] [datetime] NULL,
	[firma_tipi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[kisa_unvani] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[tam_unvani] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[yetkili] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[vergi_dairesi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[vergi_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[adres1] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[adres2] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[semt] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[ilce] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[il] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[posta_kodu] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[tel1] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[tel2] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[fax] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[gsm1] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[gsm2] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[mail] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[web_adresi] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[aciklama1] [nvarchar](250) COLLATE Turkish_CI_AS NULL,
	[logo] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[aktif_or_pasif] [bit] NULL,
 CONSTRAINT [PK_firma_kayit] PRIMARY KEY CLUSTERED 
(
	[firma_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[firma_kayit] ON
INSERT [dbo].[firma_kayit] ([firma_id], [kurulus_tarihi], [firma_tipi], [kisa_unvani], [tam_unvani], [yetkili], [vergi_dairesi], [vergi_no], [adres1], [adres2], [semt], [ilce], [il], [posta_kodu], [tel1], [tel2], [fax], [gsm1], [gsm2], [mail], [web_adresi], [aciklama1], [logo], [aktif_or_pasif]) VALUES (3, CAST(0x0000A58600000000 AS DateTime), N'', N'ddd', N'ddd', N'hamza aydın', N'dörtyol', N'465132132', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL, 1)
SET IDENTITY_INSERT [dbo].[firma_kayit] OFF
/****** Object:  Table [dbo].[kasa_gelir_gider_tanimlama]    Script Date: 02/09/2016 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kasa_gelir_gider_tanimlama]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[kasa_gelir_gider_tanimlama](
	[gelir_gider_id] [int] IDENTITY(1,1) NOT NULL,
	[gelir_gider_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[gelir_or_gider] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_kasa_gelir_gider_tanimlama] PRIMARY KEY CLUSTERED 
(
	[gelir_gider_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[kasa_gelir_gider_tanimlama] ON
INSERT [dbo].[kasa_gelir_gider_tanimlama] ([gelir_gider_id], [gelir_gider_adi], [gelir_or_gider]) VALUES (1, N'MARKET', N'gider')
INSERT [dbo].[kasa_gelir_gider_tanimlama] ([gelir_gider_id], [gelir_gider_adi], [gelir_or_gider]) VALUES (2, N'TEMİZLİK', N'gider')
INSERT [dbo].[kasa_gelir_gider_tanimlama] ([gelir_gider_id], [gelir_gider_adi], [gelir_or_gider]) VALUES (3, N'KIRTASİYE', N'gider')
INSERT [dbo].[kasa_gelir_gider_tanimlama] ([gelir_gider_id], [gelir_gider_adi], [gelir_or_gider]) VALUES (4, N'PERSONEL ÖDEME', N'gider')
INSERT [dbo].[kasa_gelir_gider_tanimlama] ([gelir_gider_id], [gelir_gider_adi], [gelir_or_gider]) VALUES (5, N'GIDA-YEMEK', N'gider')
INSERT [dbo].[kasa_gelir_gider_tanimlama] ([gelir_gider_id], [gelir_gider_adi], [gelir_or_gider]) VALUES (6, N'FATURALAR', N'gider')
INSERT [dbo].[kasa_gelir_gider_tanimlama] ([gelir_gider_id], [gelir_gider_adi], [gelir_or_gider]) VALUES (7, N'PROMOSYON', N'gider')
INSERT [dbo].[kasa_gelir_gider_tanimlama] ([gelir_gider_id], [gelir_gider_adi], [gelir_or_gider]) VALUES (8, N'KİRA', N'gider')
INSERT [dbo].[kasa_gelir_gider_tanimlama] ([gelir_gider_id], [gelir_gider_adi], [gelir_or_gider]) VALUES (9, N'BİLGİSAYAR BAKIM', N'gider')
INSERT [dbo].[kasa_gelir_gider_tanimlama] ([gelir_gider_id], [gelir_gider_adi], [gelir_or_gider]) VALUES (10, N'MUHASEBE', N'gider')
INSERT [dbo].[kasa_gelir_gider_tanimlama] ([gelir_gider_id], [gelir_gider_adi], [gelir_or_gider]) VALUES (11, N'VERGİLER', N'gider')
INSERT [dbo].[kasa_gelir_gider_tanimlama] ([gelir_gider_id], [gelir_gider_adi], [gelir_or_gider]) VALUES (12, N'FİRMA ÖDEMELERİ', N'gider')
INSERT [dbo].[kasa_gelir_gider_tanimlama] ([gelir_gider_id], [gelir_gider_adi], [gelir_or_gider]) VALUES (13, N'SATIŞ', N'gelir')
INSERT [dbo].[kasa_gelir_gider_tanimlama] ([gelir_gider_id], [gelir_gider_adi], [gelir_or_gider]) VALUES (16, N'aaadeneme335', N'gider')
INSERT [dbo].[kasa_gelir_gider_tanimlama] ([gelir_gider_id], [gelir_gider_adi], [gelir_or_gider]) VALUES (18, N'dddd', N'gelir')
SET IDENTITY_INSERT [dbo].[kasa_gelir_gider_tanimlama] OFF
/****** Object:  Table [dbo].[personel_karti]    Script Date: 02/09/2016 23:32:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personel_karti]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[personel_karti](
	[personel_id] [int] IDENTITY(1,1) NOT NULL,
	[tc] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[adi] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[soyadi] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[kullanici_adi] [nchar](10) COLLATE Turkish_CI_AS NULL,
	[kullanici_sifre] [nchar](10) COLLATE Turkish_CI_AS NULL,
	[sicil_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[basvuru_tarihi] [datetime] NULL,
	[departman_id] [int] NULL,
	[aciklama1] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[tel] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[gsm] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[adres1] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[adres2] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[ilce] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[il] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[baba_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[anne_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[dogum_yeri] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[dogum_tarihi] [datetime] NULL,
	[kimilik_seri_no] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[kan_grubu] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[medeni_durum] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[kimlik_ilce] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[kimlik_il] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[kimlik_koy] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[kimlik_cilt_no] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[kimlik_aile_sira_no] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[kimlik_sira_no] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[giris_tarihi] [datetime] NULL,
	[banka_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[banka_hesap_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[banka_iban_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[odenen_maas] [decimal](18, 2) NULL,
	[yol_parasi] [decimal](18, 2) NULL,
	[agi] [decimal](18, 2) NULL,
	[yemek] [decimal](18, 2) NULL,
	[cinsiyet] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[askerlik] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[tecil_kac_yil] [int] NULL,
	[mail] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[egitimi] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[cikis_tarihi] [datetime] NULL,
	[resim] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[ehliyet_belge_no] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[ehliyet_sinifi] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[ehliyet_tarihi] [datetime] NULL,
	[ehliyet_il] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[ehliyet_ilce] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[ehliyet_seri_no] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[src_var_mi] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[aktif_or_pasif] [bit] NULL,
 CONSTRAINT [PK_personel] PRIMARY KEY CLUSTERED 
(
	[personel_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[personel_karti] ON
INSERT [dbo].[personel_karti] ([personel_id], [tc], [adi], [soyadi], [kullanici_adi], [kullanici_sifre], [sicil_no], [basvuru_tarihi], [departman_id], [aciklama1], [tel], [gsm], [adres1], [adres2], [ilce], [il], [baba_adi], [anne_adi], [dogum_yeri], [dogum_tarihi], [kimilik_seri_no], [kan_grubu], [medeni_durum], [kimlik_ilce], [kimlik_il], [kimlik_koy], [kimlik_cilt_no], [kimlik_aile_sira_no], [kimlik_sira_no], [giris_tarihi], [banka_adi], [banka_hesap_no], [banka_iban_no], [odenen_maas], [yol_parasi], [agi], [yemek], [cinsiyet], [askerlik], [tecil_kac_yil], [mail], [egitimi], [cikis_tarihi], [resim], [ehliyet_belge_no], [ehliyet_sinifi], [ehliyet_tarihi], [ehliyet_il], [ehliyet_ilce], [ehliyet_seri_no], [src_var_mi], [aktif_or_pasif]) VALUES (1, N'', N'Hamza', N'Aydın', N'hamza     ', N'1         ', N'', CAST(0x0000A5A600000000 AS DateTime), 1, N'', N'', N'', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A5B600000000 AS DateTime), N'', N'', N'', CAST(10.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'bay', NULL, NULL, N'', NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[personel_karti] ([personel_id], [tc], [adi], [soyadi], [kullanici_adi], [kullanici_sifre], [sicil_no], [basvuru_tarihi], [departman_id], [aciklama1], [tel], [gsm], [adres1], [adres2], [ilce], [il], [baba_adi], [anne_adi], [dogum_yeri], [dogum_tarihi], [kimilik_seri_no], [kan_grubu], [medeni_durum], [kimlik_ilce], [kimlik_il], [kimlik_koy], [kimlik_cilt_no], [kimlik_aile_sira_no], [kimlik_sira_no], [giris_tarihi], [banka_adi], [banka_hesap_no], [banka_iban_no], [odenen_maas], [yol_parasi], [agi], [yemek], [cinsiyet], [askerlik], [tecil_kac_yil], [mail], [egitimi], [cikis_tarihi], [resim], [ehliyet_belge_no], [ehliyet_sinifi], [ehliyet_tarihi], [ehliyet_il], [ehliyet_ilce], [ehliyet_seri_no], [src_var_mi], [aktif_or_pasif]) VALUES (2, N'', N'Ahmet', N'Şahin', N'ahmet     ', N'1         ', N'', CAST(0x0000A59F00000000 AS DateTime), 6, N'', N'', N'', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A59F00000000 AS DateTime), N'', N'', N'', CAST(900.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'bay', NULL, NULL, N'', NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[personel_karti] ([personel_id], [tc], [adi], [soyadi], [kullanici_adi], [kullanici_sifre], [sicil_no], [basvuru_tarihi], [departman_id], [aciklama1], [tel], [gsm], [adres1], [adres2], [ilce], [il], [baba_adi], [anne_adi], [dogum_yeri], [dogum_tarihi], [kimilik_seri_no], [kan_grubu], [medeni_durum], [kimlik_ilce], [kimlik_il], [kimlik_koy], [kimlik_cilt_no], [kimlik_aile_sira_no], [kimlik_sira_no], [giris_tarihi], [banka_adi], [banka_hesap_no], [banka_iban_no], [odenen_maas], [yol_parasi], [agi], [yemek], [cinsiyet], [askerlik], [tecil_kac_yil], [mail], [egitimi], [cikis_tarihi], [resim], [ehliyet_belge_no], [ehliyet_sinifi], [ehliyet_tarihi], [ehliyet_il], [ehliyet_ilce], [ehliyet_seri_no], [src_var_mi], [aktif_or_pasif]) VALUES (6, N'40233222518', N'eylül nur', N'aydın', N'eylül     ', N'1         ', N'', CAST(0x0000A59F00000000 AS DateTime), 6, N'', N'', N'', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A5A000000000 AS DateTime), N'', N'', N'', CAST(600.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'bayan', NULL, NULL, N'', NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[personel_karti] OFF
/****** Object:  Table [dbo].[personel_cari_maas_hareket]    Script Date: 02/09/2016 23:32:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personel_cari_maas_hareket]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[personel_cari_maas_hareket](
	[maas_hareket_id] [int] IDENTITY(1,1) NOT NULL,
	[personel_id] [int] NULL,
	[kayit_tarihi] [datetime] NULL,
	[borc_or_alacak] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[odeme_sekli] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[islem_tipi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[belge_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[maas_donem_ay] [int] NULL,
	[maas_donem_yil] [int] NULL,
	[aciklama1] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[tutar] [decimal](18, 2) NULL,
	[kasa_id] [int] NULL,
	[pos_id] [int] NULL,
	[banka_hesap_id] [int] NULL,
 CONSTRAINT [PK_personel_maas_hareket] PRIMARY KEY CLUSTERED 
(
	[maas_hareket_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[personel_cari_maas_hareket] ON
INSERT [dbo].[personel_cari_maas_hareket] ([maas_hareket_id], [personel_id], [kayit_tarihi], [borc_or_alacak], [odeme_sekli], [islem_tipi], [belge_no], [maas_donem_ay], [maas_donem_yil], [aciklama1], [tutar], [kasa_id], [pos_id], [banka_hesap_id]) VALUES (2, 6, CAST(0x0000A5A100000000 AS DateTime), N'alacak', N'acikhesap', N'maas', N'', 2, 2016, N'', CAST(100.00 AS Decimal(18, 2)), 0, 0, 0)
INSERT [dbo].[personel_cari_maas_hareket] ([maas_hareket_id], [personel_id], [kayit_tarihi], [borc_or_alacak], [odeme_sekli], [islem_tipi], [belge_no], [maas_donem_ay], [maas_donem_yil], [aciklama1], [tutar], [kasa_id], [pos_id], [banka_hesap_id]) VALUES (4, 6, CAST(0x0000A5A100000000 AS DateTime), N'borc', N'nakit', N'maas', N'', 2, 2016, N'', CAST(100.00 AS Decimal(18, 2)), 8, 0, 0)
INSERT [dbo].[personel_cari_maas_hareket] ([maas_hareket_id], [personel_id], [kayit_tarihi], [borc_or_alacak], [odeme_sekli], [islem_tipi], [belge_no], [maas_donem_ay], [maas_donem_yil], [aciklama1], [tutar], [kasa_id], [pos_id], [banka_hesap_id]) VALUES (5, 6, CAST(0x0000A5A100000000 AS DateTime), N'borc', N'banka', N'maas', N'', 2, 2016, N'', CAST(100.00 AS Decimal(18, 2)), 0, 0, 1)
INSERT [dbo].[personel_cari_maas_hareket] ([maas_hareket_id], [personel_id], [kayit_tarihi], [borc_or_alacak], [odeme_sekli], [islem_tipi], [belge_no], [maas_donem_ay], [maas_donem_yil], [aciklama1], [tutar], [kasa_id], [pos_id], [banka_hesap_id]) VALUES (7, 6, CAST(0x0000A5A100000000 AS DateTime), N'borc', N'pos', N'maas', N'', 2, 2016, N'', CAST(200.00 AS Decimal(18, 2)), 0, 2, 0)
INSERT [dbo].[personel_cari_maas_hareket] ([maas_hareket_id], [personel_id], [kayit_tarihi], [borc_or_alacak], [odeme_sekli], [islem_tipi], [belge_no], [maas_donem_ay], [maas_donem_yil], [aciklama1], [tutar], [kasa_id], [pos_id], [banka_hesap_id]) VALUES (8, 6, CAST(0x0000A5A500000000 AS DateTime), N'borc', N'pos', N'maas', N'', 2, 2016, N'', CAST(21.00 AS Decimal(18, 2)), 0, 3, 0)
INSERT [dbo].[personel_cari_maas_hareket] ([maas_hareket_id], [personel_id], [kayit_tarihi], [borc_or_alacak], [odeme_sekli], [islem_tipi], [belge_no], [maas_donem_ay], [maas_donem_yil], [aciklama1], [tutar], [kasa_id], [pos_id], [banka_hesap_id]) VALUES (9, 6, CAST(0x0000A5A500000000 AS DateTime), N'borc', N'nakit', N'maas', N'', 2, 2016, N'', CAST(22.00 AS Decimal(18, 2)), 1, 0, 0)
INSERT [dbo].[personel_cari_maas_hareket] ([maas_hareket_id], [personel_id], [kayit_tarihi], [borc_or_alacak], [odeme_sekli], [islem_tipi], [belge_no], [maas_donem_ay], [maas_donem_yil], [aciklama1], [tutar], [kasa_id], [pos_id], [banka_hesap_id]) VALUES (10, 6, CAST(0x0000A5A500000000 AS DateTime), N'borc', N'banka', N'maas', N'', 2, 2016, N'', CAST(23.00 AS Decimal(18, 2)), 0, 0, 1)
SET IDENTITY_INSERT [dbo].[personel_cari_maas_hareket] OFF
/****** Object:  Table [dbo].[personel_departman_tanimlama]    Script Date: 02/09/2016 23:32:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personel_departman_tanimlama]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[personel_departman_tanimlama](
	[personel_departman_id] [int] IDENTITY(1,1) NOT NULL,
	[personel_departman_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[personel_departman_aciklama1] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_personel__departman_tanimlama] PRIMARY KEY CLUSTERED 
(
	[personel_departman_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[personel_departman_tanimlama] ON
INSERT [dbo].[personel_departman_tanimlama] ([personel_departman_id], [personel_departman_adi], [personel_departman_aciklama1]) VALUES (1, N'İDARE', NULL)
INSERT [dbo].[personel_departman_tanimlama] ([personel_departman_id], [personel_departman_adi], [personel_departman_aciklama1]) VALUES (2, N'MUHASEBE', NULL)
INSERT [dbo].[personel_departman_tanimlama] ([personel_departman_id], [personel_departman_adi], [personel_departman_aciklama1]) VALUES (3, N'PERSONEL', NULL)
INSERT [dbo].[personel_departman_tanimlama] ([personel_departman_id], [personel_departman_adi], [personel_departman_aciklama1]) VALUES (4, N'PAZARLAMA', NULL)
INSERT [dbo].[personel_departman_tanimlama] ([personel_departman_id], [personel_departman_adi], [personel_departman_aciklama1]) VALUES (6, N'DOKTOR', N'Bu departmanı silmeyiniz.')
SET IDENTITY_INSERT [dbo].[personel_departman_tanimlama] OFF
/****** Object:  Table [dbo].[personel_maas_donem]    Script Date: 02/09/2016 23:32:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personel_maas_donem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[personel_maas_donem](
	[maas_donem_id] [int] IDENTITY(1,1) NOT NULL,
	[maas_donem_ay] [int] NULL,
	[maas_donem_yil] [int] NULL,
	[donem_onaylandi_mi] [bit] NULL,
 CONSTRAINT [PK_personel_maas_donem_tanimlama] PRIMARY KEY CLUSTERED 
(
	[maas_donem_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[fatura_stok_hareket_temp]    Script Date: 02/09/2016 23:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fatura_stok_hareket_temp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[fatura_stok_hareket_temp](
	[fatura_stok_hareket_id] [int] IDENTITY(1,1) NOT NULL,
	[fatura_id] [int] NULL,
	[stok_id] [int] NULL,
	[cari_id] [int] NULL,
	[islem_tipi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[giris_or_cikis] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[miktar] [int] NULL,
	[birim] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[aciklama1] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[iskonto] [float] NULL,
	[birim_fiyat] [decimal](18, 2) NULL,
	[kdvsiz_tutar] [decimal](18, 2) NULL,
	[kdv_oran] [int] NULL,
	[kdv_tutari] [decimal](18, 2) NULL,
	[tutar] [decimal](18, 2) NULL,
	[onay_verildi_mi] [bit] NULL,
 CONSTRAINT [PK_fatura_stok_hareket_temp] PRIMARY KEY CLUSTERED 
(
	[fatura_stok_hareket_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[fatura_stok_hareket_temp] ON
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (1, NULL, 1, 1, N'fatura', N'giris', 3, N'ad', NULL, NULL, CAST(23.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (19, NULL, 3, 11, N'fatura', N'cikis', 1, N'Dz', N'', 0, CAST(200.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 10, CAST(20.00 AS Decimal(18, 2)), CAST(220.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (20, NULL, 4, 11, N'fatura', N'cikis', 2, N'Paket', N'', 0, CAST(400.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), 18, CAST(144.00 AS Decimal(18, 2)), CAST(944.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (21, NULL, 1, 11, N'fatura', N'cikis', 1, N'Adet', N'', 0, CAST(600.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 18, CAST(108.00 AS Decimal(18, 2)), CAST(708.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (23, NULL, 1, 11, N'fatura', N'cikis', 3, N'Adet', N'', 0, CAST(600.00 AS Decimal(18, 2)), CAST(1800.00 AS Decimal(18, 2)), 18, CAST(324.00 AS Decimal(18, 2)), CAST(2124.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (24, NULL, 1, 11, N'fatura', N'giris', 4, N'Adet', N'', 0, CAST(600.00 AS Decimal(18, 2)), CAST(2400.00 AS Decimal(18, 2)), 18, CAST(432.00 AS Decimal(18, 2)), CAST(2832.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (25, NULL, 1, 11, N'fatura', N'cikis', 12, N'Adet', N'', 0, CAST(600.00 AS Decimal(18, 2)), CAST(7200.00 AS Decimal(18, 2)), 18, CAST(1296.00 AS Decimal(18, 2)), CAST(8496.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (26, NULL, 1, 11, N'fatura', N'cikis', 1, N'Adet', N'', 0, CAST(600.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 18, CAST(108.00 AS Decimal(18, 2)), CAST(708.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (27, NULL, 4, 11, N'fatura', N'cikis', 2, N'Paket', N'', 0, CAST(400.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), 18, CAST(144.00 AS Decimal(18, 2)), CAST(944.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (28, NULL, 3, 11, N'fatura', N'cikis', 1, N'Dz', N'', 0, CAST(200.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 8, CAST(16.00 AS Decimal(18, 2)), CAST(216.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (29, NULL, 3, 11, N'fatura', N'cikis', 1, N'Dz', N'', 0, CAST(200.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 8, CAST(16.00 AS Decimal(18, 2)), CAST(216.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (30, NULL, 3, 11, N'fatura', N'cikis', 1, N'Dz', N'', 0, CAST(200.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 8, CAST(16.00 AS Decimal(18, 2)), CAST(216.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (31, NULL, 3, 11, N'fatura', N'cikis', 2, N'Dz', N'', 0, CAST(200.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 8, CAST(32.00 AS Decimal(18, 2)), CAST(432.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (32, NULL, 1, 10, N'fatura', N'cikis', 1, N'Adet', N'', 0, CAST(600.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 18, CAST(108.00 AS Decimal(18, 2)), CAST(708.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (33, NULL, 1, 10, N'fatura', N'cikis', 1, N'Adet', N'', 0, CAST(600.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 18, CAST(108.00 AS Decimal(18, 2)), CAST(708.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (34, NULL, 1, 1, N'fatura', N'cikis', 1, N'Adet', N'', 0, CAST(600.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 18, CAST(108.00 AS Decimal(18, 2)), CAST(708.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (35, NULL, 5, 11, N'fatura', N'cikis', 5, N'Adet', N'', 0, CAST(200.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), 18, CAST(180.00 AS Decimal(18, 2)), CAST(1180.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (36, NULL, 1, 11, N'fatura', N'cikis', 1, N'Adet', N'', 0, CAST(600.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 18, CAST(108.00 AS Decimal(18, 2)), CAST(708.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (37, NULL, 1, 12, N'fatura', N'cikis', 1, N'Adet', N'', 0, CAST(600.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 18, CAST(108.00 AS Decimal(18, 2)), CAST(708.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (38, NULL, 3, 12, N'fatura', N'cikis', 2, N'Dz', N'', 0, CAST(200.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 8, CAST(32.00 AS Decimal(18, 2)), CAST(432.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (39, NULL, 1, 12, N'fatura', N'cikis', 1, N'Adet', N'', 0, CAST(600.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 18, CAST(108.00 AS Decimal(18, 2)), CAST(708.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (40, NULL, 3, 12, N'fatura', N'cikis', 1, N'Dz', N'', 0, CAST(200.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 8, CAST(16.00 AS Decimal(18, 2)), CAST(216.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (41, NULL, 4, 12, N'fatura', N'cikis', 1, N'Paket', N'', 0, CAST(400.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 18, CAST(72.00 AS Decimal(18, 2)), CAST(472.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (42, NULL, 5, 12, N'fatura', N'cikis', 1, N'Adet', N'', 0, CAST(200.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 15, CAST(30.00 AS Decimal(18, 2)), CAST(230.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[fatura_stok_hareket_temp] ([fatura_stok_hareket_id], [fatura_id], [stok_id], [cari_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [onay_verildi_mi]) VALUES (43, NULL, 1, 1, N'fatura', N'cikis', 1, N'Adet', N'', 0, CAST(600.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 18, CAST(108.00 AS Decimal(18, 2)), CAST(708.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[fatura_stok_hareket_temp] OFF
/****** Object:  Table [dbo].[stok_hareket]    Script Date: 02/09/2016 23:32:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[stok_hareket]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[stok_hareket](
	[stok_hareket_id] [int] IDENTITY(1,1) NOT NULL,
	[kayit_tarihi] [datetime] NULL,
	[fatura_id] [int] NULL,
	[stok_id] [int] NULL,
	[cari_id] [int] NULL,
	[fis_id] [int] NULL,
	[islem_tipi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[giris_or_cikis] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[miktar] [int] NULL,
	[birim] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[aciklama1] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[iskonto] [float] NULL,
	[birim_fiyat] [decimal](18, 2) NULL,
	[kdvsiz_tutar] [decimal](18, 2) NULL,
	[kdv_oran] [int] NULL,
	[kdv_tutari] [decimal](18, 2) NULL,
	[tutar] [decimal](18, 2) NULL,
	[evrak_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_stok_hareket] PRIMARY KEY CLUSTERED 
(
	[stok_hareket_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[stok_hareket] ON
INSERT [dbo].[stok_hareket] ([stok_hareket_id], [kayit_tarihi], [fatura_id], [stok_id], [cari_id], [fis_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [evrak_no]) VALUES (8, NULL, 3, 1, 1, NULL, N'fatura', N'cikis', 1, N'Adet', N'', 0, CAST(600.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 18, CAST(108.00 AS Decimal(18, 2)), CAST(708.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[stok_hareket] ([stok_hareket_id], [kayit_tarihi], [fatura_id], [stok_id], [cari_id], [fis_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [evrak_no]) VALUES (9, CAST(0x0000A5A700000000 AS DateTime), NULL, 1, NULL, NULL, N'giris', N'giris', 12, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, N'a')
INSERT [dbo].[stok_hareket] ([stok_hareket_id], [kayit_tarihi], [fatura_id], [stok_id], [cari_id], [fis_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [evrak_no]) VALUES (10, CAST(0x0000A5A700000000 AS DateTime), NULL, 1, NULL, NULL, N'giris', N'giris', 4, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, N'a')
INSERT [dbo].[stok_hareket] ([stok_hareket_id], [kayit_tarihi], [fatura_id], [stok_id], [cari_id], [fis_id], [islem_tipi], [giris_or_cikis], [miktar], [birim], [aciklama1], [iskonto], [birim_fiyat], [kdvsiz_tutar], [kdv_oran], [kdv_tutari], [tutar], [evrak_no]) VALUES (13, CAST(0x0000A5A700000000 AS DateTime), NULL, 1, NULL, NULL, N'giris', N'giris', 3, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, N'')
SET IDENTITY_INSERT [dbo].[stok_hareket] OFF
/****** Object:  Table [dbo].[firma_ulke_tanimlama]    Script Date: 02/09/2016 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[firma_ulke_tanimlama]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[firma_ulke_tanimlama](
	[ulke_id] [int] IDENTITY(1,1) NOT NULL,
	[ulke_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_t_ulke_tanimlama] PRIMARY KEY CLUSTERED 
(
	[ulke_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[firma_ulke_tanimlama] ON
INSERT [dbo].[firma_ulke_tanimlama] ([ulke_id], [ulke_adi]) VALUES (1, N'TÜRKİYE')
SET IDENTITY_INSERT [dbo].[firma_ulke_tanimlama] OFF
/****** Object:  Table [dbo].[firma_para_birimi_tanimlama]    Script Date: 02/09/2016 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[firma_para_birimi_tanimlama]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[firma_para_birimi_tanimlama](
	[para_birimi_id] [int] IDENTITY(1,1) NOT NULL,
	[para_birimi] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[para_birimi_adi] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_t_para_birimi_tanimlama] PRIMARY KEY CLUSTERED 
(
	[para_birimi_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[firma_para_birimi_tanimlama] ON
INSERT [dbo].[firma_para_birimi_tanimlama] ([para_birimi_id], [para_birimi], [para_birimi_adi]) VALUES (1, N'TL', N'Türk Lirası')
INSERT [dbo].[firma_para_birimi_tanimlama] ([para_birimi_id], [para_birimi], [para_birimi_adi]) VALUES (2, N'$', N'Dolar')
INSERT [dbo].[firma_para_birimi_tanimlama] ([para_birimi_id], [para_birimi], [para_birimi_adi]) VALUES (3, N'€', N'Euro')
INSERT [dbo].[firma_para_birimi_tanimlama] ([para_birimi_id], [para_birimi], [para_birimi_adi]) VALUES (4, N'RİYAL', N'SUUDİ')
INSERT [dbo].[firma_para_birimi_tanimlama] ([para_birimi_id], [para_birimi], [para_birimi_adi]) VALUES (6, N'SAR', N'SAADİ')
SET IDENTITY_INSERT [dbo].[firma_para_birimi_tanimlama] OFF
/****** Object:  Table [dbo].[cari_karti]    Script Date: 02/09/2016 23:32:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cari_karti]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cari_karti](
	[cari_id] [int] IDENTITY(1,1) NOT NULL,
	[unvan] [nvarchar](200) COLLATE Turkish_CI_AS NULL,
	[adi] [nvarchar](100) COLLATE Turkish_CI_AS NULL,
	[soyadi] [nvarchar](100) COLLATE Turkish_CI_AS NULL,
	[kayit_tarihi] [datetime] NULL,
	[grup_id] [int] NULL,
	[cari_kod_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[tc_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[meslek] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[ilce] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[sehir] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[posta_kodu] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[ulke] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[vergi_dairesi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[vergi_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[banka_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[banka_hesap_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[banka_iban_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[tel1] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[tel2] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[fax] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[gsm1] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[gsm2] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[mail] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[adres1] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[adres2] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[aciklama1] [nvarchar](250) COLLATE Turkish_CI_AS NULL,
	[resim] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[borc_bakiye] [decimal](18, 2) NULL,
	[alacak_bakiye] [decimal](18, 2) NULL,
	[bakiye] [decimal](18, 2) NULL,
	[hasta_mi] [nvarchar](10) COLLATE Turkish_CI_AS NULL,
	[dogum_yeri] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[dogum_tarihi] [datetime] NULL,
	[uyruk] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[cinsiyet] [nvarchar](10) COLLATE Turkish_CI_AS NULL,
	[kimlik_seri_no] [nvarchar](10) COLLATE Turkish_CI_AS NULL,
	[baba_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[anne_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_cari_karti] PRIMARY KEY CLUSTERED 
(
	[cari_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[cari_karti] ON
INSERT [dbo].[cari_karti] ([cari_id], [unvan], [adi], [soyadi], [kayit_tarihi], [grup_id], [cari_kod_no], [tc_no], [meslek], [ilce], [sehir], [posta_kodu], [ulke], [vergi_dairesi], [vergi_no], [banka_adi], [banka_hesap_no], [banka_iban_no], [tel1], [tel2], [fax], [gsm1], [gsm2], [mail], [adres1], [adres2], [aciklama1], [resim], [borc_bakiye], [alacak_bakiye], [bakiye], [hasta_mi], [dogum_yeri], [dogum_tarihi], [uyruk], [cinsiyet], [kimlik_seri_no], [baba_adi], [anne_adi]) VALUES (1, N'hamza', N'hamza', N'aydın', CAST(0x0000000000000000 AS DateTime), 3, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL, NULL, CAST(708.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(708.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cari_karti] ([cari_id], [unvan], [adi], [soyadi], [kayit_tarihi], [grup_id], [cari_kod_no], [tc_no], [meslek], [ilce], [sehir], [posta_kodu], [ulke], [vergi_dairesi], [vergi_no], [banka_adi], [banka_hesap_no], [banka_iban_no], [tel1], [tel2], [fax], [gsm1], [gsm2], [mail], [adres1], [adres2], [aciklama1], [resim], [borc_bakiye], [alacak_bakiye], [bakiye], [hasta_mi], [dogum_yeri], [dogum_tarihi], [uyruk], [cinsiyet], [kimlik_seri_no], [baba_adi], [anne_adi]) VALUES (4, N'kkk', N'adi', N'soyadi', CAST(0x0000A61800000000 AS DateTime), 1, N'carikod001', N'40234355590', N'mühendis', N'asd', N'hatay', N'sdf', N'türkiye', N'asd', N'aaaaaaaaaaaa', N'halk', N'01007907', N'TR12345678901234567890134', N'3267124354', N'3267124355', N'3267126810', N'5322500648', N'5322500649', N'ruyet7247@gmail.com', N'asd', N'asdasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cari_karti] ([cari_id], [unvan], [adi], [soyadi], [kayit_tarihi], [grup_id], [cari_kod_no], [tc_no], [meslek], [ilce], [sehir], [posta_kodu], [ulke], [vergi_dairesi], [vergi_no], [banka_adi], [banka_hesap_no], [banka_iban_no], [tel1], [tel2], [fax], [gsm1], [gsm2], [mail], [adres1], [adres2], [aciklama1], [resim], [borc_bakiye], [alacak_bakiye], [bakiye], [hasta_mi], [dogum_yeri], [dogum_tarihi], [uyruk], [cinsiyet], [kimlik_seri_no], [baba_adi], [anne_adi]) VALUES (5, N'unvan12', N'adi1', N'soyadi1', CAST(0x0000A62B00000000 AS DateTime), 3, N'carikod00111', N'402343555901', N'mühendis1', N'asd1', N'hatay1', N'sdf1', N'türkiye1', N'asd1', N'aaaaaaaaaaaa1', N'halk1', N'010079071', N'TR11115678901234567890134', N'32671243541', N'32671243551', N'32671268101', N'53225006481', N'53225006491', N'ruyet7247@gmail.com1', N'asd1', N'asdasd1', NULL, NULL, CAST(500.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cari_karti] ([cari_id], [unvan], [adi], [soyadi], [kayit_tarihi], [grup_id], [cari_kod_no], [tc_no], [meslek], [ilce], [sehir], [posta_kodu], [ulke], [vergi_dairesi], [vergi_no], [banka_adi], [banka_hesap_no], [banka_iban_no], [tel1], [tel2], [fax], [gsm1], [gsm2], [mail], [adres1], [adres2], [aciklama1], [resim], [borc_bakiye], [alacak_bakiye], [bakiye], [hasta_mi], [dogum_yeri], [dogum_tarihi], [uyruk], [cinsiyet], [kimlik_seri_no], [baba_adi], [anne_adi]) VALUES (9, N'yusuf', N'yusuf', N'as', CAST(0x0000A59A00000000 AS DateTime), 1, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cari_karti] ([cari_id], [unvan], [adi], [soyadi], [kayit_tarihi], [grup_id], [cari_kod_no], [tc_no], [meslek], [ilce], [sehir], [posta_kodu], [ulke], [vergi_dairesi], [vergi_no], [banka_adi], [banka_hesap_no], [banka_iban_no], [tel1], [tel2], [fax], [gsm1], [gsm2], [mail], [adres1], [adres2], [aciklama1], [resim], [borc_bakiye], [alacak_bakiye], [bakiye], [hasta_mi], [dogum_yeri], [dogum_tarihi], [uyruk], [cinsiyet], [kimlik_seri_no], [baba_adi], [anne_adi]) VALUES (10, N'eylül', N'nur', N'aydına', CAST(0x0000A59900000000 AS DateTime), 2, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'aydın', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cari_karti] ([cari_id], [unvan], [adi], [soyadi], [kayit_tarihi], [grup_id], [cari_kod_no], [tc_no], [meslek], [ilce], [sehir], [posta_kodu], [ulke], [vergi_dairesi], [vergi_no], [banka_adi], [banka_hesap_no], [banka_iban_no], [tel1], [tel2], [fax], [gsm1], [gsm2], [mail], [adres1], [adres2], [aciklama1], [resim], [borc_bakiye], [alacak_bakiye], [bakiye], [hasta_mi], [dogum_yeri], [dogum_tarihi], [uyruk], [cinsiyet], [kimlik_seri_no], [baba_adi], [anne_adi]) VALUES (11, N'MURAT YÜCETEPE', N'MURAT', N'YÜCETEPE', CAST(0x0000A59F00000000 AS DateTime), 2, N'123', N'123124', N'', N'', N'', N'', N'', N'istanbul', N'132465', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'şişli', N'istanbul', NULL, NULL, CAST(17222.00 AS Decimal(18, 2)), CAST(5060.00 AS Decimal(18, 2)), CAST(12162.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cari_karti] ([cari_id], [unvan], [adi], [soyadi], [kayit_tarihi], [grup_id], [cari_kod_no], [tc_no], [meslek], [ilce], [sehir], [posta_kodu], [ulke], [vergi_dairesi], [vergi_no], [banka_adi], [banka_hesap_no], [banka_iban_no], [tel1], [tel2], [fax], [gsm1], [gsm2], [mail], [adres1], [adres2], [aciklama1], [resim], [borc_bakiye], [alacak_bakiye], [bakiye], [hasta_mi], [dogum_yeri], [dogum_tarihi], [uyruk], [cinsiyet], [kimlik_seri_no], [baba_adi], [anne_adi]) VALUES (12, NULL, N'hamza11', N'aydın', CAST(0x0000A5A300000000 AS DateTime), NULL, NULL, N'234234', N'', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'', NULL, N'', N'', N'asda@asd.com', N'', N'', NULL, NULL, NULL, NULL, NULL, N'HASTA', N'', CAST(0x0000A5A300000000 AS DateTime), N'', N'BAY', N'', N'', N'')
INSERT [dbo].[cari_karti] ([cari_id], [unvan], [adi], [soyadi], [kayit_tarihi], [grup_id], [cari_kod_no], [tc_no], [meslek], [ilce], [sehir], [posta_kodu], [ulke], [vergi_dairesi], [vergi_no], [banka_adi], [banka_hesap_no], [banka_iban_no], [tel1], [tel2], [fax], [gsm1], [gsm2], [mail], [adres1], [adres2], [aciklama1], [resim], [borc_bakiye], [alacak_bakiye], [bakiye], [hasta_mi], [dogum_yeri], [dogum_tarihi], [uyruk], [cinsiyet], [kimlik_seri_no], [baba_adi], [anne_adi]) VALUES (14, N'test cari', N'', N'', CAST(0x0000A5A400000000 AS DateTime), 2, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL, NULL, CAST(71.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(21.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cari_karti] ([cari_id], [unvan], [adi], [soyadi], [kayit_tarihi], [grup_id], [cari_kod_no], [tc_no], [meslek], [ilce], [sehir], [posta_kodu], [ulke], [vergi_dairesi], [vergi_no], [banka_adi], [banka_hesap_no], [banka_iban_no], [tel1], [tel2], [fax], [gsm1], [gsm2], [mail], [adres1], [adres2], [aciklama1], [resim], [borc_bakiye], [alacak_bakiye], [bakiye], [hasta_mi], [dogum_yeri], [dogum_tarihi], [uyruk], [cinsiyet], [kimlik_seri_no], [baba_adi], [anne_adi]) VALUES (15, NULL, N'test hasta', N'', CAST(0x0000A5A400000000 AS DateTime), NULL, NULL, N'', N'', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'', NULL, N'', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, N'HASTA', N'', CAST(0x0000A5A400000000 AS DateTime), N'', N'BAY', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[cari_karti] OFF
/****** Object:  Table [dbo].[stok_kayit]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[stok_kayit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[stok_kayit](
	[stok_id] [int] IDENTITY(1,1) NOT NULL,
	[kayit_tarihi] [datetime] NULL,
	[stok_kod_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[stok_barkod_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[stok_uretici_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[stok_adi] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[marka] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[model] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[grubu_id] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[alt_grubu_id] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[birimi] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[alt_birimi] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[aciklama1] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[giren] [int] NULL,
	[cikan] [int] NULL,
	[kdv] [int] NULL,
	[alis_fiyati] [decimal](18, 2) NULL,
	[satis_fiyati] [decimal](18, 2) NULL,
	[para_birimi] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[aktif_or_pasif] [bit] NULL,
	[resim] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_stok_kayit] PRIMARY KEY CLUSTERED 
(
	[stok_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[stok_kayit] ON
INSERT [dbo].[stok_kayit] ([stok_id], [kayit_tarihi], [stok_kod_no], [stok_barkod_no], [stok_uretici_no], [stok_adi], [marka], [model], [grubu_id], [alt_grubu_id], [birimi], [alt_birimi], [aciklama1], [giren], [cikan], [kdv], [alis_fiyati], [satis_fiyati], [para_birimi], [aktif_or_pasif], [resim]) VALUES (1, CAST(0x0000A59800000000 AS DateTime), N'1', N'11', N'111', N'GÖZLÜK', NULL, NULL, N'4', NULL, N'Adet', NULL, NULL, 19, 1, 18, CAST(500.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[stok_kayit] ([stok_id], [kayit_tarihi], [stok_kod_no], [stok_barkod_no], [stok_uretici_no], [stok_adi], [marka], [model], [grubu_id], [alt_grubu_id], [birimi], [alt_birimi], [aciklama1], [giren], [cikan], [kdv], [alis_fiyati], [satis_fiyati], [para_birimi], [aktif_or_pasif], [resim]) VALUES (3, CAST(0x0000A59C00000000 AS DateTime), N'222', N'22222', N'33333333', N'sdfadsf', NULL, NULL, N'1', NULL, N'Dz', NULL, NULL, NULL, NULL, 8, CAST(100.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[stok_kayit] ([stok_id], [kayit_tarihi], [stok_kod_no], [stok_barkod_no], [stok_uretici_no], [stok_adi], [marka], [model], [grubu_id], [alt_grubu_id], [birimi], [alt_birimi], [aciklama1], [giren], [cikan], [kdv], [alis_fiyati], [satis_fiyati], [para_birimi], [aktif_or_pasif], [resim]) VALUES (4, CAST(0x0000A59F00000000 AS DateTime), N'3132132', N'23235', N'235235', N'AAAAAAAAAAAAAA', NULL, NULL, N'3', NULL, N'Paket', NULL, NULL, NULL, NULL, 18, CAST(100.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[stok_kayit] ([stok_id], [kayit_tarihi], [stok_kod_no], [stok_barkod_no], [stok_uretici_no], [stok_adi], [marka], [model], [grubu_id], [alt_grubu_id], [birimi], [alt_birimi], [aciklama1], [giren], [cikan], [kdv], [alis_fiyati], [satis_fiyati], [para_birimi], [aktif_or_pasif], [resim]) VALUES (5, CAST(0x0000A5A500000000 AS DateTime), N'12', N'', N'', N'TELEFON', NULL, NULL, N'1', NULL, N'Adet', NULL, NULL, NULL, NULL, 15, CAST(100.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[stok_kayit] OFF
/****** Object:  Table [dbo].[fatura_kayit]    Script Date: 02/09/2016 23:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fatura_kayit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[fatura_kayit](
	[fatura_id] [int] IDENTITY(1,1) NOT NULL,
	[kayit_tarihi] [datetime] NULL,
	[fatura_tarihi] [datetime] NULL,
	[giris_or_cikis] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[sira_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[fatura_no] [nchar](10) COLLATE Turkish_CI_AS NULL,
	[cari_id] [int] NULL,
	[unvan] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[adres] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[notu] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[vergi_dairesi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[vergi_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[ara_toplam] [decimal](18, 2) NULL,
	[kdv_tutar] [decimal](18, 2) NULL,
	[genel_toplam] [decimal](18, 2) NULL,
	[aciklama] [nvarchar](250) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_fis_kayit] PRIMARY KEY CLUSTERED 
(
	[fatura_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[fatura_kayit] ON
INSERT [dbo].[fatura_kayit] ([fatura_id], [kayit_tarihi], [fatura_tarihi], [giris_or_cikis], [sira_no], [fatura_no], [cari_id], [unvan], [adres], [notu], [vergi_dairesi], [vergi_no], [ara_toplam], [kdv_tutar], [genel_toplam], [aciklama]) VALUES (3, CAST(0x0000A5A700000000 AS DateTime), CAST(0x0000A5A700000000 AS DateTime), N'cikis', N'0', N'0         ', 1, N'hamza', N' ', N'', N'', N'', CAST(600.00 AS Decimal(18, 2)), CAST(108.00 AS Decimal(18, 2)), CAST(708.00 AS Decimal(18, 2)), N'')
SET IDENTITY_INSERT [dbo].[fatura_kayit] OFF
/****** Object:  Table [dbo].[kasa_kayit]    Script Date: 02/09/2016 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kasa_kayit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[kasa_kayit](
	[kasa_id] [int] IDENTITY(1,1) NOT NULL,
	[kasa_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[para_birimi_id] [int] NULL,
	[aciklama1] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_kasa_kayit] PRIMARY KEY CLUSTERED 
(
	[kasa_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[kasa_kayit] ON
INSERT [dbo].[kasa_kayit] ([kasa_id], [kasa_adi], [para_birimi_id], [aciklama1]) VALUES (1, N'MERKEZ', 2, N'Merkez Kasa')
INSERT [dbo].[kasa_kayit] ([kasa_id], [kasa_adi], [para_birimi_id], [aciklama1]) VALUES (2, N'test', 3, N'adada')
INSERT [dbo].[kasa_kayit] ([kasa_id], [kasa_adi], [para_birimi_id], [aciklama1]) VALUES (5, N'kasa444', 1, N'oooo')
INSERT [dbo].[kasa_kayit] ([kasa_id], [kasa_adi], [para_birimi_id], [aciklama1]) VALUES (8, N'hamza kasa1', 1, N'asdasdasdasd')
SET IDENTITY_INSERT [dbo].[kasa_kayit] OFF
/****** Object:  Table [dbo].[banka_kayit]    Script Date: 02/09/2016 23:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[banka_kayit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[banka_kayit](
	[banka_hesap_id] [int] IDENTITY(1,1) NOT NULL,
	[banka_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[hesap_sahibi] [nvarchar](200) COLLATE Turkish_CI_AS NULL,
	[sube_kodu] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[hesap_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[iban] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[sube_id] [int] NULL,
	[aktif_or_pasif] [bit] NULL,
	[para_birimi_id] [int] NULL,
 CONSTRAINT [PK_banka_kayit] PRIMARY KEY CLUSTERED 
(
	[banka_hesap_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[banka_kayit] ON
INSERT [dbo].[banka_kayit] ([banka_hesap_id], [banka_adi], [hesap_sahibi], [sube_kodu], [hesap_no], [iban], [sube_id], [aktif_or_pasif], [para_birimi_id]) VALUES (1, N'HALK BANK1', N'HAMZA AYDIN1', N'2261', N'010079191', N'TR06200922600001010079071', NULL, 0, 1)
INSERT [dbo].[banka_kayit] ([banka_hesap_id], [banka_adi], [hesap_sahibi], [sube_kodu], [hesap_no], [iban], [sube_id], [aktif_or_pasif], [para_birimi_id]) VALUES (3, N'VAKIFBANK', N'hamza', N'00228', N'321463212', N'TR9879846532132', NULL, 1, 2)
INSERT [dbo].[banka_kayit] ([banka_hesap_id], [banka_adi], [hesap_sahibi], [sube_kodu], [hesap_no], [iban], [sube_id], [aktif_or_pasif], [para_birimi_id]) VALUES (4, N'AAAAAA', N'ASD', N'ASD', N'34534543', N'23462436243624363246', NULL, 1, 4)
SET IDENTITY_INSERT [dbo].[banka_kayit] OFF
/****** Object:  Table [dbo].[banka_pos_kayit]    Script Date: 02/09/2016 23:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[banka_pos_kayit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[banka_pos_kayit](
	[pos_id] [int] IDENTITY(1,1) NOT NULL,
	[pos_banka_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[bagli_olan_banka_hesap_id] [int] NULL,
	[tahakkuk_gun_sayisi] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[pos_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[banka_pos_kayit] ON
INSERT [dbo].[banka_pos_kayit] ([pos_id], [pos_banka_adi], [bagli_olan_banka_hesap_id], [tahakkuk_gun_sayisi]) VALUES (2, N'vakıf', 3, 12)
INSERT [dbo].[banka_pos_kayit] ([pos_id], [pos_banka_adi], [bagli_olan_banka_hesap_id], [tahakkuk_gun_sayisi]) VALUES (3, N'hal', 1, 54)
INSERT [dbo].[banka_pos_kayit] ([pos_id], [pos_banka_adi], [bagli_olan_banka_hesap_id], [tahakkuk_gun_sayisi]) VALUES (4, N'POS 1', 4, 1)
SET IDENTITY_INSERT [dbo].[banka_pos_kayit] OFF
/****** Object:  Table [dbo].[cari_grubu_tanimlama]    Script Date: 02/09/2016 23:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cari_grubu_tanimlama]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cari_grubu_tanimlama](
	[cari_grubu_id] [int] IDENTITY(1,1) NOT NULL,
	[cari_grubu] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[cari_grubu_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_cari_grubu_tanimlama] PRIMARY KEY CLUSTERED 
(
	[cari_grubu_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[cari_grubu_tanimlama] ON
INSERT [dbo].[cari_grubu_tanimlama] ([cari_grubu_id], [cari_grubu], [cari_grubu_adi]) VALUES (1, NULL, N'GENEL')
INSERT [dbo].[cari_grubu_tanimlama] ([cari_grubu_id], [cari_grubu], [cari_grubu_adi]) VALUES (2, NULL, N'MÜŞTERİ')
INSERT [dbo].[cari_grubu_tanimlama] ([cari_grubu_id], [cari_grubu], [cari_grubu_adi]) VALUES (3, NULL, N'FİRMA')
INSERT [dbo].[cari_grubu_tanimlama] ([cari_grubu_id], [cari_grubu], [cari_grubu_adi]) VALUES (4, NULL, N'FİRMA-MÜŞTERİ')
SET IDENTITY_INSERT [dbo].[cari_grubu_tanimlama] OFF
/****** Object:  Table [dbo].[cari_islem_tipi_tanimlama]    Script Date: 02/09/2016 23:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cari_islem_tipi_tanimlama]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cari_islem_tipi_tanimlama](
	[islem_tipi_id] [int] IDENTITY(1,1) NOT NULL,
	[islem_tipi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[islem_tipi_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[islem_tipi_aciklama1] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_t_islem_tipi_tanimlama] PRIMARY KEY CLUSTERED 
(
	[islem_tipi_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[cari_islem_tipi_tanimlama] ON
INSERT [dbo].[cari_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (1, N'tahsilat', N'TAHSİLAT', N'Müşterinin nakit olarak yaptığı ödemedir.Alacakdır')
INSERT [dbo].[cari_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (2, N'tediye', N'TEDİYE', N'Müşteriye nakit olarak yapılan ödemedir.Borçlandır')
INSERT [dbo].[cari_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (3, N'borcdekontu', N'BORÇ DEKONTU', N'Müşterinin Firmaya olan borçlanmasıdır.')
INSERT [dbo].[cari_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (4, N'alacakdekontu', N'ALACAK DEKONTU', N'Müşterinin Firmadan alacaklı olmasıdır.')
INSERT [dbo].[cari_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (5, N'fis', N'FİŞ', N'Fiş den gelen harekettir.')
INSERT [dbo].[cari_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (6, N'fatura', N'FATURA', N'Fatura dan gelen harekettir.')
INSERT [dbo].[cari_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (7, N'kasiyersatis', N'KASİYER SATIŞ', N'Kasiyer den yapılan hareketir.')
INSERT [dbo].[cari_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (8, N'banka', N'BANKA', NULL)
INSERT [dbo].[cari_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (9, N'pos', N'POS', NULL)
SET IDENTITY_INSERT [dbo].[cari_islem_tipi_tanimlama] OFF
/****** Object:  Table [dbo].[cari_odeme_sekli_tanimlama]    Script Date: 02/09/2016 23:32:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cari_odeme_sekli_tanimlama]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cari_odeme_sekli_tanimlama](
	[odeme_sekli_id] [int] IDENTITY(1,1) NOT NULL,
	[odeme_sekli] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[odeme_sekli_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[odeme_sekli_aciklama1] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_cari_odeme_sekli_tanimlama] PRIMARY KEY CLUSTERED 
(
	[odeme_sekli_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[cari_odeme_sekli_tanimlama] ON
INSERT [dbo].[cari_odeme_sekli_tanimlama] ([odeme_sekli_id], [odeme_sekli], [odeme_sekli_adi], [odeme_sekli_aciklama1]) VALUES (1, N'nakit', N'NAKİT', NULL)
INSERT [dbo].[cari_odeme_sekli_tanimlama] ([odeme_sekli_id], [odeme_sekli], [odeme_sekli_adi], [odeme_sekli_aciklama1]) VALUES (2, N'acikhesap', N'AÇIK HESAP', NULL)
INSERT [dbo].[cari_odeme_sekli_tanimlama] ([odeme_sekli_id], [odeme_sekli], [odeme_sekli_adi], [odeme_sekli_aciklama1]) VALUES (3, N'banka', N'BANKA HAVALE/EFT', NULL)
INSERT [dbo].[cari_odeme_sekli_tanimlama] ([odeme_sekli_id], [odeme_sekli], [odeme_sekli_adi], [odeme_sekli_aciklama1]) VALUES (4, N'pos', N'KREDİ (POS) KARTI', NULL)
SET IDENTITY_INSERT [dbo].[cari_odeme_sekli_tanimlama] OFF
/****** Object:  Table [dbo].[stok_islem_tipi_tanimlama]    Script Date: 02/09/2016 23:32:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[stok_islem_tipi_tanimlama]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[stok_islem_tipi_tanimlama](
	[islem_tipi_id] [int] IDENTITY(1,1) NOT NULL,
	[islem_tipi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[islem_tipi_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[islem_tipi_aciklama1] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_stok_islem_tipi_tanimlama] PRIMARY KEY CLUSTERED 
(
	[islem_tipi_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[stok_islem_tipi_tanimlama] ON
INSERT [dbo].[stok_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (1, N'fis', N'FİŞ', NULL)
INSERT [dbo].[stok_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (2, N'fatura', N'FATURA', NULL)
INSERT [dbo].[stok_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (3, N'irsaliye', N'İRSALİYE', NULL)
INSERT [dbo].[stok_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (4, N'giris', N'GİRİŞ', NULL)
INSERT [dbo].[stok_islem_tipi_tanimlama] ([islem_tipi_id], [islem_tipi], [islem_tipi_adi], [islem_tipi_aciklama1]) VALUES (5, N'cikis', N'ÇIKIŞ', NULL)
SET IDENTITY_INSERT [dbo].[stok_islem_tipi_tanimlama] OFF
/****** Object:  Table [dbo].[cari_gorusmeleri]    Script Date: 02/09/2016 23:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cari_gorusmeleri]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cari_gorusmeleri](
	[cari_gorusmeleri_id] [int] IDENTITY(1,1) NOT NULL,
	[cari_id] [int] NULL,
	[cari_adi] [nvarchar](100) COLLATE Turkish_CI_AS NULL,
	[personel_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[gorusme_tarihi_saati] [datetime] NULL,
	[icerik] [nvarchar](450) COLLATE Turkish_CI_AS NULL,
	[firma_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_cari_gorusmeleri] PRIMARY KEY CLUSTERED 
(
	[cari_gorusmeleri_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[cari_gorusmeleri] ON
INSERT [dbo].[cari_gorusmeleri] ([cari_gorusmeleri_id], [cari_id], [cari_adi], [personel_adi], [gorusme_tarihi_saati], [icerik], [firma_adi]) VALUES (2, 15, N'asd', N'personel', CAST(0x0000A5A4015C92C4 AS DateTime), N'asdasd', N'')
INSERT [dbo].[cari_gorusmeleri] ([cari_gorusmeleri_id], [cari_id], [cari_adi], [personel_adi], [gorusme_tarihi_saati], [icerik], [firma_adi]) VALUES (4, 15, N'test hasta ', N'personel', CAST(0x0000A5A4015D5EAC AS DateTime), N'asdasdasdasd', N'')
INSERT [dbo].[cari_gorusmeleri] ([cari_gorusmeleri_id], [cari_id], [cari_adi], [personel_adi], [gorusme_tarihi_saati], [icerik], [firma_adi]) VALUES (6, 15, N'test hasta ', N'personel', CAST(0x0000A5A40160EC0C AS DateTime), N'asdasdasdasdasd', N'')
INSERT [dbo].[cari_gorusmeleri] ([cari_gorusmeleri_id], [cari_id], [cari_adi], [personel_adi], [gorusme_tarihi_saati], [icerik], [firma_adi]) VALUES (7, 15, N'test hasta ', N'personel', CAST(0x0000A5A30160EC0C AS DateTime), N'asdasdasdasdasd', N'')
INSERT [dbo].[cari_gorusmeleri] ([cari_gorusmeleri_id], [cari_id], [cari_adi], [personel_adi], [gorusme_tarihi_saati], [icerik], [firma_adi]) VALUES (8, 12, N'hamza11 aydın', N'personel', CAST(0x0000A5A4017C9100 AS DateTime), N'ssssssssssssssssssssssss', N'')
INSERT [dbo].[cari_gorusmeleri] ([cari_gorusmeleri_id], [cari_id], [cari_adi], [personel_adi], [gorusme_tarihi_saati], [icerik], [firma_adi]) VALUES (9, 12, N'hamza11 aydın', N'personel', CAST(0x0000A5A4017C9100 AS DateTime), N'fdfdsfsd', N'')
INSERT [dbo].[cari_gorusmeleri] ([cari_gorusmeleri_id], [cari_id], [cari_adi], [personel_adi], [gorusme_tarihi_saati], [icerik], [firma_adi]) VALUES (10, 12, N'hamza11 aydın', N'personel', CAST(0x0000A5A5013F7B80 AS DateTime), N'afasfadsfadsfadsfas', N'')
INSERT [dbo].[cari_gorusmeleri] ([cari_gorusmeleri_id], [cari_id], [cari_adi], [personel_adi], [gorusme_tarihi_saati], [icerik], [firma_adi]) VALUES (11, 12, N'hamza11 aydın', N'personel', CAST(0x0000A5A5013F7B80 AS DateTime), N'afasfggggggggggggggggggg', N'')
SET IDENTITY_INSERT [dbo].[cari_gorusmeleri] OFF
/****** Object:  Table [dbo].[stok_grubu_tanimlama]    Script Date: 02/09/2016 23:32:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[stok_grubu_tanimlama]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[stok_grubu_tanimlama](
	[stok_grubu_id] [int] IDENTITY(1,1) NOT NULL,
	[stok_grubu_adi] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_stok_grubu_tanimlama] PRIMARY KEY CLUSTERED 
(
	[stok_grubu_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[stok_grubu_tanimlama] ON
INSERT [dbo].[stok_grubu_tanimlama] ([stok_grubu_id], [stok_grubu_adi]) VALUES (1, N'GIDA')
INSERT [dbo].[stok_grubu_tanimlama] ([stok_grubu_id], [stok_grubu_adi]) VALUES (3, N'KIRTASİYE')
INSERT [dbo].[stok_grubu_tanimlama] ([stok_grubu_id], [stok_grubu_adi]) VALUES (4, N'ERKEK REYON')
SET IDENTITY_INSERT [dbo].[stok_grubu_tanimlama] OFF
/****** Object:  Table [dbo].[randevu_kayit]    Script Date: 02/09/2016 23:32:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[randevu_kayit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[randevu_kayit](
	[randevu_id] [int] IDENTITY(1,1) NOT NULL,
	[kayit_tarihi] [datetime] NULL,
	[randevu_tarihi] [datetime] NULL,
	[randevu_saati] [int] NULL,
	[randevu_dakika] [int] NULL,
	[adi_soyadi] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
	[gsm] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[tel] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[randevu_notu] [nvarchar](450) COLLATE Turkish_CI_AS NULL,
	[geldi_mi] [bit] NULL,
	[doktor_adi_soyadi] [nvarchar](150) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_randevu_kayit] PRIMARY KEY CLUSTERED 
(
	[randevu_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[randevu_kayit] ON
INSERT [dbo].[randevu_kayit] ([randevu_id], [kayit_tarihi], [randevu_tarihi], [randevu_saati], [randevu_dakika], [adi_soyadi], [gsm], [tel], [randevu_notu], [geldi_mi], [doktor_adi_soyadi]) VALUES (2, CAST(0x0000A5A501031EF6 AS DateTime), CAST(0x0000A63700000000 AS DateTime), 8, 0, N'fffff', N'25235235', N'65745754', N'sdfasfaf', 0, NULL)
INSERT [dbo].[randevu_kayit] ([randevu_id], [kayit_tarihi], [randevu_tarihi], [randevu_saati], [randevu_dakika], [adi_soyadi], [gsm], [tel], [randevu_notu], [geldi_mi], [doktor_adi_soyadi]) VALUES (3, CAST(0x0000A5A501076795 AS DateTime), CAST(0x0000A5B600000000 AS DateTime), 8, 0, N'', N'', N'', N'', 1, NULL)
INSERT [dbo].[randevu_kayit] ([randevu_id], [kayit_tarihi], [randevu_tarihi], [randevu_saati], [randevu_dakika], [adi_soyadi], [gsm], [tel], [randevu_notu], [geldi_mi], [doktor_adi_soyadi]) VALUES (4, CAST(0x0000A5A501090EEE AS DateTime), CAST(0x0000A5B800000000 AS DateTime), 8, 0, N'hamza aydın', N'5322500648', N'646546', N'sdöbjadks bas lasdv lasd ', 1, NULL)
INSERT [dbo].[randevu_kayit] ([randevu_id], [kayit_tarihi], [randevu_tarihi], [randevu_saati], [randevu_dakika], [adi_soyadi], [gsm], [tel], [randevu_notu], [geldi_mi], [doktor_adi_soyadi]) VALUES (5, CAST(0x0000A5A5010B94C9 AS DateTime), CAST(0x0000A5B800000000 AS DateTime), 11, 0, N'hamza aydın', N'5322500648', N'646546', N'sdöbjadks bas lasdv lasd ', 1, NULL)
INSERT [dbo].[randevu_kayit] ([randevu_id], [kayit_tarihi], [randevu_tarihi], [randevu_saati], [randevu_dakika], [adi_soyadi], [gsm], [tel], [randevu_notu], [geldi_mi], [doktor_adi_soyadi]) VALUES (6, CAST(0x0000A5A5010BB196 AS DateTime), CAST(0x0000A5B800000000 AS DateTime), 11, 15, N'hamza aydın', N'5322500648', N'646546', N'sdöbjadks bas lasdv lasd ', 1, NULL)
INSERT [dbo].[randevu_kayit] ([randevu_id], [kayit_tarihi], [randevu_tarihi], [randevu_saati], [randevu_dakika], [adi_soyadi], [gsm], [tel], [randevu_notu], [geldi_mi], [doktor_adi_soyadi]) VALUES (8, CAST(0x0000A5A5010BD2C6 AS DateTime), CAST(0x0000A5B800000000 AS DateTime), 10, 15, N'hamza aydın', N'5322500648', N'646546', N'sdöbjadks bas lasdv lasd ', 1, NULL)
INSERT [dbo].[randevu_kayit] ([randevu_id], [kayit_tarihi], [randevu_tarihi], [randevu_saati], [randevu_dakika], [adi_soyadi], [gsm], [tel], [randevu_notu], [geldi_mi], [doktor_adi_soyadi]) VALUES (9, CAST(0x0000A5A5010BDC7F AS DateTime), CAST(0x0000A5B800000000 AS DateTime), 10, 30, N'hamza aydın', N'5322500648', N'646546', N'sdöbjadks bas lasdv lasd sadvdsv
sdvsdavasdvasdvasdv', 1, NULL)
INSERT [dbo].[randevu_kayit] ([randevu_id], [kayit_tarihi], [randevu_tarihi], [randevu_saati], [randevu_dakika], [adi_soyadi], [gsm], [tel], [randevu_notu], [geldi_mi], [doktor_adi_soyadi]) VALUES (11, CAST(0x0000A5A5014132B7 AS DateTime), CAST(0x0000A5A800000000 AS DateTime), 8, 15, N'MURAT', N'345345342', N'35325325', N'DAFADSFADSFA', 1, NULL)
INSERT [dbo].[randevu_kayit] ([randevu_id], [kayit_tarihi], [randevu_tarihi], [randevu_saati], [randevu_dakika], [adi_soyadi], [gsm], [tel], [randevu_notu], [geldi_mi], [doktor_adi_soyadi]) VALUES (12, CAST(0x0000A5A5016A23D9 AS DateTime), CAST(0x0000A5A600000000 AS DateTime), 8, 15, N'asdasdasd', N'asd', N'asdasd', N'asd', 1, N'eylül nur aydın')
INSERT [dbo].[randevu_kayit] ([randevu_id], [kayit_tarihi], [randevu_tarihi], [randevu_saati], [randevu_dakika], [adi_soyadi], [gsm], [tel], [randevu_notu], [geldi_mi], [doktor_adi_soyadi]) VALUES (14, CAST(0x0000A5A5017476D0 AS DateTime), CAST(0x0000A5A600000000 AS DateTime), 8, 45, N'dsgsdgds', N'235235', N'dfgdfg', N'sdg', 0, N'eylül nur aydın')
INSERT [dbo].[randevu_kayit] ([randevu_id], [kayit_tarihi], [randevu_tarihi], [randevu_saati], [randevu_dakika], [adi_soyadi], [gsm], [tel], [randevu_notu], [geldi_mi], [doktor_adi_soyadi]) VALUES (15, CAST(0x0000A5A5017F4068 AS DateTime), CAST(0x0000A5A600000000 AS DateTime), 10, 30, N'sdadsvds', N'4523525', N'23525235', N'vsadv', 1, N'eylül nur aydın')
INSERT [dbo].[randevu_kayit] ([randevu_id], [kayit_tarihi], [randevu_tarihi], [randevu_saati], [randevu_dakika], [adi_soyadi], [gsm], [tel], [randevu_notu], [geldi_mi], [doktor_adi_soyadi]) VALUES (17, CAST(0x0000A5A5017F7050 AS DateTime), CAST(0x0000A5A600000000 AS DateTime), 10, 45, N'sdadsvds', N'4523525', N'23525235', N'vsadv', 1, N'eylül nur aydın')
INSERT [dbo].[randevu_kayit] ([randevu_id], [kayit_tarihi], [randevu_tarihi], [randevu_saati], [randevu_dakika], [adi_soyadi], [gsm], [tel], [randevu_notu], [geldi_mi], [doktor_adi_soyadi]) VALUES (18, CAST(0x0000A5A6000A6D3D AS DateTime), CAST(0x0000A5A600000000 AS DateTime), 8, 30, N'gggggggggggggg', N'23525', N'235235252', N'adsvdasvdsvs', 1, N'Ahmet Şahin')
SET IDENTITY_INSERT [dbo].[randevu_kayit] OFF
/****** Object:  Table [dbo].[cari_hareket]    Script Date: 02/09/2016 23:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cari_hareket]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cari_hareket](
	[cari_hareket_id] [int] IDENTITY(1,1) NOT NULL,
	[cari_id] [int] NULL,
	[kayit_tarihi] [datetime] NULL,
	[borc_or_alacak] [nvarchar](10) COLLATE Turkish_CI_AS NULL,
	[islem_tipi] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[odeme_sekli] [nvarchar](20) COLLATE Turkish_CI_AS NULL,
	[vade_tarihi] [datetime] NULL,
	[belge_no] [nvarchar](50) COLLATE Turkish_CI_AS NULL,
	[aciklama1] [nvarchar](250) COLLATE Turkish_CI_AS NULL,
	[personel] [nvarchar](200) COLLATE Turkish_CI_AS NULL,
	[borc] [decimal](18, 2) NULL,
	[alacak] [decimal](18, 2) NULL,
	[fis_id] [int] NULL,
	[kasa_id] [int] NULL,
	[pos_id] [int] NULL,
	[banka_hesap_id] [int] NULL,
	[fatura_id] [int] NULL,
 CONSTRAINT [PK_cari_hareket] PRIMARY KEY CLUSTERED 
(
	[cari_hareket_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[cari_hareket] ON
INSERT [dbo].[cari_hareket] ([cari_hareket_id], [cari_id], [kayit_tarihi], [borc_or_alacak], [islem_tipi], [odeme_sekli], [vade_tarihi], [belge_no], [aciklama1], [personel], [borc], [alacak], [fis_id], [kasa_id], [pos_id], [banka_hesap_id], [fatura_id]) VALUES (3, 1, CAST(0x0000A5A700000000 AS DateTime), N'borc', N'fatura', N'', NULL, N'0', N'', N'personel', CAST(708.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 3)
SET IDENTITY_INSERT [dbo].[cari_hareket] OFF
/****** Object:  StoredProcedure [dbo].[CariHareketEkle]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CariHareketEkle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CariHareketEkle] 
		
	@kayit_tarihi datetime,
	@cari_id int,
	@borc_or_alacak nvarchar (50),
	@islem_tipi nvarchar (50),
	@odeme_sekli nvarchar (50),
	@belge_no nvarchar (50),
	@aciklama1 nvarchar (50),
	@personel nvarchar (50),
	@borc decimal(18,2),
	@alacak decimal(18,2),
	@fis_id int,
	@kasa_id int,
	@pos_id int,
	@banka_hesap_id  int

AS
BEGIN
	--CARİ HAREKET EKLE XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	INSERT INTO [dbo].cari_hareket    (kayit_tarihi,cari_id, borc_or_alacak, islem_tipi, odeme_sekli, belge_no, aciklama1, personel,borc,alacak, fis_id, kasa_id, pos_id, banka_hesap_id)
	VALUES (@kayit_tarihi,@cari_id,@borc_or_alacak,@islem_tipi,@odeme_sekli,@belge_no,@aciklama1,@personel,@borc,@alacak,@fis_id,@kasa_id,@pos_id,@banka_hesap_id)
	
	--ÖN TANIMLAMALAR
	DECLARE @new_identity int;
	SELECT @new_identity = SCOPE_IDENTITY()
	DECLARE @TUTAR decimal(18,2) -- burda borc ve alacak hangisi dolu ise TUTAR içine atılıyor.
	IF( @borc >0 )
	BEGIN SET @TUTAR=@borc END ELSE BEGIN SET @TUTAR=@alacak END 
	
	-- EĞER NAKİT İSE XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	IF @odeme_sekli=''nakit'' 
	BEGIN
		IF (@borc_or_alacak=''borc'') --tediye
		BEGIN
			INSERT INTO [dbo].kasa_hareket    (kasa_id,kayit_tarihi, evrak_no, islem_tipi, giris_or_cikis, aciklama1, tutar, cari_id,fis_id,banka_id, personel,cari_hareket_id)
			VALUES (@kasa_id,@kayit_tarihi,@belge_no,@islem_tipi,''cikis'',@aciklama1,@tutar,@cari_id,@fis_id,@banka_hesap_id,@personel,@new_identity)
		END
		IF (@borc_or_alacak=''alacak'') --tahsilat
		BEGIN
			INSERT INTO [dbo].kasa_hareket    (kasa_id,kayit_tarihi, evrak_no, islem_tipi, giris_or_cikis, aciklama1, tutar, cari_id,fis_id,banka_id, personel,cari_hareket_id)
			VALUES (@kasa_id,@kayit_tarihi,@belge_no,@islem_tipi,''giris'',@aciklama1,@tutar,@cari_id,@fis_id,@banka_hesap_id,@personel,@new_identity)
		END
	END

	-- EĞER BANKA İSE XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	IF @odeme_sekli=''banka'' 
	BEGIN
		IF (@borc_or_alacak=''borc'') --
		BEGIN
			INSERT INTO [dbo].banka_hareket    (banka_hesap_id,giris_or_cikis,kayit_tarihi,odeme_tarihi,cari_unvani,odeme_kategorisi,tutar,personel_adi,aciklama1,cari_id,pos_id,cari_hareket_id)
			VALUES (@banka_hesap_id,''cikis'',@kayit_tarihi,@kayit_tarihi,'''',@odeme_sekli,@tutar,@personel,@aciklama1,@cari_id,@pos_id,@new_identity)
		END
		
		IF (@borc_or_alacak=''alacak'') --
		BEGIN
			INSERT INTO [dbo].banka_hareket    (banka_hesap_id,giris_or_cikis,kayit_tarihi,odeme_tarihi,cari_unvani,odeme_kategorisi,tutar,personel_adi,aciklama1,cari_id,pos_id,cari_hareket_id)
			VALUES (@banka_hesap_id,''giris'',@kayit_tarihi,@kayit_tarihi,'''',@odeme_sekli,@tutar,@personel,@aciklama1,@cari_id,@pos_id,@new_identity)
		END
	END
	
	-- EĞER POS İSE XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	IF @odeme_sekli=''pos'' 
	BEGIN
		DECLARE @odeme_tarihi  datetime -- burda POS hesabından odeme tarihi hesaplanıyor.
		DECLARE @gun_sayisi int
		SELECT @gun_sayisi=tahakkuk_gun_sayisi  FROM banka_pos_kayit WHERE  pos_id=@pos_id
		SELECT @odeme_tarihi=DATEADD(day,@gun_sayisi,@kayit_tarihi)
		
		--banka hesap id de bulunsun
		SELECT @banka_hesap_id=bagli_olan_banka_hesap_id FROM banka_pos_kayit WHERE  pos_id=@pos_id
		 
		IF (@borc_or_alacak=''borc'') --
		BEGIN
			INSERT INTO [dbo].banka_pos_hareket    (pos_id,kayit_tarihi,giris_or_cikis,odeme_tarihi,aciklama1,tutar,personel_adi,banka_hesap_id,cari_id,cari_hareket_id)
			VALUES (@pos_id,@kayit_tarihi,''cikis'',@odeme_tarihi,@aciklama1,@tutar,@personel,@banka_hesap_id,@cari_id,@new_identity)
			-- bankayada eklensin
			INSERT INTO [dbo].banka_hareket    (banka_hesap_id,giris_or_cikis,kayit_tarihi,odeme_tarihi,cari_unvani,odeme_kategorisi,tutar,personel_adi,aciklama1,cari_id,pos_id,cari_hareket_id)
			VALUES (@banka_hesap_id,''cikis'',@kayit_tarihi,@odeme_tarihi,'''',@odeme_sekli,@tutar,@personel,@aciklama1,@cari_id,@pos_id,@new_identity)
		
		END	
		IF (@borc_or_alacak=''alacak'') --
		BEGIN
			INSERT INTO [dbo].banka_pos_hareket    (pos_id,kayit_tarihi,giris_or_cikis,odeme_tarihi,aciklama1,tutar,personel_adi,banka_hesap_id,cari_id,cari_hareket_id)
			VALUES (@pos_id,@kayit_tarihi,''giris'',@odeme_tarihi,@aciklama1,@tutar,@personel,@banka_hesap_id,@cari_id,@new_identity)
			--bankayada eklensin 
			INSERT INTO [dbo].banka_hareket    (banka_hesap_id,giris_or_cikis,kayit_tarihi,odeme_tarihi,cari_unvani,odeme_kategorisi,tutar,personel_adi,aciklama1,cari_id,pos_id,cari_hareket_id)
			VALUES (@banka_hesap_id,''giris'',@kayit_tarihi,@odeme_tarihi,'''',@odeme_sekli,@tutar,@personel,@aciklama1,@cari_id,@pos_id,@new_identity)
		
		END
	END
	
	--CARİ KARTIN BORÇ ALACAK DURUMUNU GÜNCELLE
	DECLARE  @borcu decimal(18,2)
	DECLARE  @alacagi decimal(18,2)
	DECLARE  @bakiyesi decimal(18,2)
	SELECT @borcu=sum(borc),@alacagi=sum(alacak),@bakiyesi=sum(borc)-sum(alacak) FROM cari_hareket WHERE cari_id=@cari_id
	UPDATE cari_karti SET borc_bakiye=@borcu,alacak_bakiye=@alacagi,bakiye=@bakiyesi WHERE cari_id=@cari_id


END



' 
END
GO
/****** Object:  View [dbo].[View_1]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[View_1]
AS
SELECT     dbo.cari_hareket.*
FROM         dbo.cari_hareket INNER JOIN
                      dbo.banka_kayit ON dbo.cari_hareket.banka_hesap_id = dbo.banka_kayit.banka_hesap_id INNER JOIN
                      dbo.banka_pos_kayit ON dbo.cari_hareket.pos_id = dbo.banka_pos_kayit.pos_id INNER JOIN
                      dbo.kasa_kayit ON dbo.cari_hareket.kasa_id = dbo.kasa_kayit.kasa_id INNER JOIN
                      dbo.kasa_hareket ON dbo.kasa_kayit.kasa_id = dbo.kasa_hareket.kasa_id INNER JOIN
                      dbo.banka_hareket ON dbo.banka_kayit.banka_hesap_id = dbo.banka_hareket.banka_hareket_id INNER JOIN
                      dbo.banka_pos_hareket ON dbo.banka_pos_kayit.pos_id = dbo.banka_pos_hareket.pos_id CROSS JOIN
                      dbo.cari_odeme_sekli_tanimlama CROSS JOIN
                      dbo.cari_islem_tipi_tanimlama
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'View_1', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[90] 4[3] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "cari_hareket"
            Begin Extent = 
               Top = 15
               Left = 305
               Bottom = 356
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "banka_kayit"
            Begin Extent = 
               Top = 463
               Left = 564
               Bottom = 679
               Right = 731
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "banka_pos_kayit"
            Begin Extent = 
               Top = 260
               Left = 563
               Bottom = 392
               Right = 724
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "kasa_kayit"
            Begin Extent = 
               Top = 16
               Left = 561
               Bottom = 148
               Right = 721
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "kasa_hareket"
            Begin Extent = 
               Top = 0
               Left = 819
               Bottom = 253
               Right = 985
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "banka_hareket"
            Begin Extent = 
               Top = 463
               Left = 819
               Bottom = 732
               Right = 994
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "banka_pos_hareket"
            Begin Extent = 
               Top = 244
               Left = 819
               Bottom = 470
               Right = 986
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'View_1', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cari_odeme_sekli_tanimlama"
            Begin Extent = 
               Top = 353
               Left = 41
               Bottom = 689
               Right = 281
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cari_islem_tipi_tanimlama"
            Begin Extent = 
               Top = 14
               Left = 44
               Bottom = 348
               Right = 286
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'View_1', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
/****** Object:  StoredProcedure [dbo].[BankaHareketEkle]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BankaHareketEkle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[BankaHareketEkle] 
		
	@banka_hesap_id int =null,
	@banka_hesap_adi nvarchar(50)=null,
	@giris_or_cikis	nvarchar(20)=null,
	@kayit_tarihi datetime =null,
	@odeme_tarihi datetime =null,
	@odeme_kategorisi nvarchar(50)=null,
	@aciklama1 nvarchar(150)=null,
	@tutar decimal(18,2)=null,
	@personel_adi nvarchar(50)=null
	
           
AS
BEGIN

	INSERT INTO [dbo].[banka_hareket]   (
				banka_hesap_id,
				banka_hesap_adi,
				giris_or_cikis,
				kayit_tarihi,
				odeme_tarihi,
				odeme_kategorisi,
				aciklama1,
				tutar,
				personel_adi) VALUES (
				@banka_hesap_id,
				@banka_hesap_adi,
				@giris_or_cikis,
				@kayit_tarihi,
				@odeme_tarihi,
				@odeme_kategorisi,
				@aciklama1,
				@tutar,
				@personel_adi)
				
				
				
				
	

END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[BankaHareketSil]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BankaHareketSil]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/****
	Silme işlemi yaparken eğer var ise  ilgili cari_hareket veya personel_cari_hareketdende silme işlemi yapmak gerekir.
	Eğer;
		 cari_hareket_id dolu ise cari_hareket tablosundan da  , silme sonrası borç alacak hesabıda var
		 personel_cari_maas_hareket_id dolu ise personel_cari_maas_hareket tablosundan da
		 ikiside boş ise manuel işlem olup sadece kendi banka_hareket tablosundan silinir.
		 
****/
-- =============================================
CREATE PROCEDURE [dbo].[BankaHareketSil] 
	@banka_hareket_id int
	
AS
BEGIN
	DECLARE @cari_hareket_id int
	DECLARE @personel_cari_maas_hareket_id int
	SELECT @cari_hareket_id=cari_hareket_id,@personel_cari_maas_hareket_id=personel_cari_maas_hareket_id  FROM banka_hareket WHERE banka_hareket_id = @banka_hareket_id
		
	IF (@cari_hareket_id!='''')
	BEGIN
	DELETE FROM cari_hareket WHERE cari_hareket_id = @cari_hareket_id
	END
	
	IF (@personel_cari_maas_hareket_id!='''')
	BEGIN
	DELETE FROM personel_cari_maas_hareket WHERE maas_hareket_id = @personel_cari_maas_hareket_id
	END
	
	-- banka_hareket SİL XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	DELETE FROM banka_hareket WHERE banka_hareket_id = @banka_hareket_id
	

	
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[PersonelHareketSil]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonelHareketSil]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PersonelHareketSil] 
	@maas_hareket_id int
	
AS
BEGIN
	DECLARE @personel_cari_maas_hareket_id int
	DECLARE @odeme_sekli nvarchar(20)
	SELECT @personel_cari_maas_hareket_id=maas_hareket_id,@odeme_sekli=odeme_sekli FROM personel_cari_maas_hareket WHERE maas_hareket_id = @maas_hareket_id
	
	-- Personel HAreket SİL XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	DELETE FROM personel_cari_maas_hareket WHERE maas_hareket_id = @maas_hareket_id
	
	IF (@odeme_sekli=''nakit'')	--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	BEGIN
		DELETE FROM kasa_hareket WHERE personel_cari_maas_hareket_id = @personel_cari_maas_hareket_id
	END
	
	IF (@odeme_sekli=''banka'')	--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	BEGIN
		DELETE FROM banka_hareket WHERE personel_cari_maas_hareket_id = @personel_cari_maas_hareket_id
	END
	
	IF (@odeme_sekli=''pos'')		--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	BEGIN
		DELETE FROM banka_pos_hareket WHERE personel_cari_maas_hareket_id = @personel_cari_maas_hareket_id
		--banka hareket de silinsin
		DELETE FROM banka_hareket WHERE personel_cari_maas_hareket_id = @personel_cari_maas_hareket_id
	END
	
	
	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[PersonelHareketEkle]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonelHareketEkle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PersonelHareketEkle] 
		
	@personel_id int,
	@kayit_tarihi datetime,
	@borc_or_alacak nvarchar (50),
	@islem_tipi nvarchar (50),
	@odeme_sekli nvarchar (20),
	@maas_donem_ay int,
	@maas_donem_yil int,
	@belge_no nvarchar (50),
	@aciklama1 nvarchar (50),
	@tutar decimal(18,2),
	@kasa_id int,
	@pos_id int,
	@banka_hesap_id  int,
	@personel  nvarchar (50)=null
	

AS
BEGIN
	--PERSONEL HAREKET EKLE XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	INSERT INTO [dbo].personel_cari_maas_hareket    (personel_id,kayit_tarihi, borc_or_alacak,odeme_sekli, islem_tipi, belge_no, maas_donem_ay,maas_donem_yil, aciklama1, tutar,kasa_id, pos_id, banka_hesap_id)
	VALUES (@personel_id,@kayit_tarihi,@borc_or_alacak,@odeme_sekli,@islem_tipi,@belge_no,@maas_donem_ay,@maas_donem_yil,@aciklama1,@tutar,@kasa_id,@pos_id,@banka_hesap_id)
	
	--ÖN TANIMLAMALAR
	DECLARE @new_identity int
	SELECT @new_identity = SCOPE_IDENTITY()
	
	DECLARE @giris_or_cikis nvarchar(20)
	IF (@borc_or_alacak=''borc'')	
	BEGIN SET @giris_or_cikis=''giris''  END ELSE BEGIN SET @giris_or_cikis=''cikis'' END

	-- EĞER NAKİT İSE XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	IF @odeme_sekli=''nakit'' 
	BEGIN
		IF (@borc_or_alacak=''borc'') --tediye kasadan para çıkışı
		BEGIN
			INSERT INTO [dbo].kasa_hareket    (kasa_id,kayit_tarihi, evrak_no, islem_tipi, giris_or_cikis, aciklama1, tutar, banka_id, personel,personel_cari_maas_hareket_id)
			VALUES (@kasa_id,@kayit_tarihi,@belge_no,@islem_tipi,''cikis'',@aciklama1,@tutar,@banka_hesap_id,@personel,@new_identity)
		END
		IF (@borc_or_alacak=''alacak'') --tahsilat kasaya para girişi
		BEGIN
			INSERT INTO [dbo].kasa_hareket    (kasa_id,kayit_tarihi, evrak_no, islem_tipi, giris_or_cikis, aciklama1, tutar, banka_id, personel,personel_cari_maas_hareket_id)
			VALUES (@kasa_id,@kayit_tarihi,@belge_no,@islem_tipi,''giris'',@aciklama1,@tutar,@banka_hesap_id,@personel,@new_identity)
		END
	END

-- EĞER BANKA İSE XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	IF @odeme_sekli=''banka'' 
	BEGIN
		IF (@borc_or_alacak=''borc'') --
		BEGIN
			INSERT INTO [dbo].banka_hareket    (banka_hesap_id,giris_or_cikis,kayit_tarihi,odeme_tarihi,cari_unvani,odeme_kategorisi,tutar,personel_adi,aciklama1,pos_id,personel_cari_maas_hareket_id)
			VALUES (@banka_hesap_id,''cikis'',@kayit_tarihi,@kayit_tarihi,'''',@islem_tipi,@tutar,@personel,@aciklama1,@pos_id,@new_identity)
		END
		
		IF (@borc_or_alacak=''alacak'') --
		BEGIN
			INSERT INTO [dbo].banka_hareket    (banka_hesap_id,giris_or_cikis,kayit_tarihi,odeme_tarihi,cari_unvani,odeme_kategorisi,tutar,personel_adi,aciklama1,pos_id,personel_cari_maas_hareket_id)
			VALUES (@banka_hesap_id,''giris'',@kayit_tarihi,@kayit_tarihi,'''',@islem_tipi,@tutar,@personel,@aciklama1,@pos_id,@new_identity)
		END
	END
	
	-- EĞER POS İSE XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	IF @odeme_sekli=''pos'' 
	BEGIN
		DECLARE @odeme_tarihi  datetime -- burda POS hesabından odeme tarihi hesaplanıyor.
		DECLARE @gun_sayisi int
		SELECT @gun_sayisi=tahakkuk_gun_sayisi  FROM banka_pos_kayit WHERE  pos_id=@pos_id
		SELECT @odeme_tarihi=DATEADD(day,@gun_sayisi,@kayit_tarihi)
		
		--banka hesap id de bulunsun
		SELECT @banka_hesap_id=bagli_olan_banka_hesap_id FROM banka_pos_kayit WHERE  pos_id=@pos_id
		 		 
		IF (@borc_or_alacak=''borc'') --
		BEGIN
			INSERT INTO [dbo].banka_pos_hareket    (pos_id,kayit_tarihi,giris_or_cikis,odeme_tarihi,aciklama1,tutar,personel_adi,banka_hesap_id,personel_cari_maas_hareket_id)
			VALUES (@pos_id,@kayit_tarihi,''cikis'',@odeme_tarihi,@aciklama1,@tutar,@personel,@banka_hesap_id,@new_identity)
			-- bankayada eklensin
			INSERT INTO [dbo].banka_hareket    (banka_hesap_id,giris_or_cikis,kayit_tarihi,odeme_tarihi,cari_unvani,odeme_kategorisi,tutar,personel_adi,aciklama1,pos_id,personel_cari_maas_hareket_id)
			VALUES (@banka_hesap_id,''cikis'',@kayit_tarihi,@odeme_tarihi,'''',@islem_tipi,@tutar,@personel,@aciklama1,@pos_id,@new_identity)
		END	
		IF (@borc_or_alacak=''alacak'') --
		BEGIN
			INSERT INTO [dbo].banka_pos_hareket    (pos_id,kayit_tarihi,giris_or_cikis,odeme_tarihi,aciklama1,tutar,personel_adi,banka_hesap_id,personel_cari_maas_hareket_id)
			VALUES (@pos_id,@kayit_tarihi,''giris'',@odeme_tarihi,@aciklama1,@tutar,@personel,@banka_hesap_id,@new_identity)
			--bankayada eklensin 
			INSERT INTO [dbo].banka_hareket    (banka_hesap_id,giris_or_cikis,kayit_tarihi,odeme_tarihi,cari_unvani,odeme_kategorisi,tutar,personel_adi,aciklama1,pos_id,personel_cari_maas_hareket_id)
			VALUES (@banka_hesap_id,''giris'',@kayit_tarihi,@odeme_tarihi,'''',@islem_tipi,@tutar,@personel,@aciklama1,@pos_id,@new_identity)
		END
	END
	
	

END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[PosHareketEkle]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PosHareketEkle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PosHareketEkle] 
		
	@pos_id int =null,
	@kayit_tarihi datetime =null,
	@giris_or_cikis	nvarchar(20)=null,
	@aciklama1 nvarchar(150)=null,
	@tutar decimal(18,2)=null,
	@personel_adi nvarchar(50)=null
	
           
AS
BEGIN

		DECLARE @odeme_tarihi  datetime -- burda POS hesabından odeme tarihi hesaplanıyor.
		DECLARE @gun_sayisi int
		SELECT @gun_sayisi=tahakkuk_gun_sayisi  FROM banka_pos_kayit WHERE  pos_id=@pos_id
		SELECT @odeme_tarihi=DATEADD(day,@gun_sayisi,@kayit_tarihi)

	INSERT INTO [dbo].[banka_pos_hareket]   (
				pos_id,
				kayit_tarihi,
				giris_or_cikis,
				odeme_tarihi,
				aciklama1,
				tutar,
				personel_adi) VALUES (
				@pos_id,
				@kayit_tarihi,
				@giris_or_cikis,
				@odeme_tarihi,
				@aciklama1,
				@tutar,
				@personel_adi)
				


END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[PosHareketSil]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PosHareketSil]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/****
	Silme işlemi yaparken eğer var ise  ilgili cari_hareket veya personel_cari_hareketdende silme işlemi yapmak gerekir.
	Eğer;
		 cari_hareket_id dolu ise cari_hareket tablosundan da , silme sonrası borç alacak hesabıda var
		 personel_cari_maas_hareket_id dolu ise personel_cari_maas_hareket tablosundan da
		 ikiside boş ise manuel işlem olup sadece kendi banka_pos_hareket tablosundan silinir.
		 
****/
-- =============================================
CREATE PROCEDURE [dbo].[PosHareketSil] 
	@pos_hareket_id int
	
AS
BEGIN
	DECLARE @cari_hareket_id int
	DECLARE @personel_cari_maas_hareket_id int
	SELECT @cari_hareket_id=cari_hareket_id,@personel_cari_maas_hareket_id=personel_cari_maas_hareket_id  FROM banka_pos_hareket WHERE pos_hareket_id = @pos_hareket_id
		
	IF (@cari_hareket_id!='''')
	BEGIN
	DELETE FROM cari_hareket WHERE cari_hareket_id = @cari_hareket_id
	END
	
	IF (@personel_cari_maas_hareket_id!='''')
	BEGIN
	DELETE FROM personel_cari_maas_hareket WHERE maas_hareket_id = @personel_cari_maas_hareket_id
	END
	-- banka_pos_hareket SİL XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	DELETE FROM banka_pos_hareket WHERE pos_hareket_id = @pos_hareket_id
	

	
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[KasaBilgileriGetir]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KasaBilgileriGetir]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
CREATE PROCEDURE [dbo].[KasaBilgileriGetir] 
	@kasa_id int,
	@kasa_adi nvarchar(50) OUTPUT,
	@para_birimi_id int OUTPUT,
	@giren_miktar decimal(18,2) OUTPUT,
	@cikan_miktar decimal(18,2) OUTPUT,
	@kasa_bakiye decimal(18,2) OUTPUT
AS
BEGIN

	-- STOK ADET Güncelle
	
	SELECT @kasa_adi=kasa_adi,@para_birimi_id=para_birimi_id FROM kasa_kayit WHERE kasa_id=@kasa_id
	SELECT @giren_miktar=sum(tutar) FROM kasa_hareket WHERE kasa_id=@kasa_id AND giris_or_cikis=''giris''
	SELECT @cikan_miktar=sum(tutar) FROM kasa_hareket WHERE kasa_id=@kasa_id AND giris_or_cikis=''cikis''
	SET @kasa_bakiye=(@giren_miktar)-(@cikan_miktar)
	
	RETURN
	
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[KasaHareketEkle]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KasaHareketEkle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[KasaHareketEkle] 
		
	@kasa_id int =null,
	@kayit_tarihi datetime =null,
	@evrak_no nvarchar(20)=null,
	@islem_tipi nvarchar(20)=null,
	@giris_or_cikis	nvarchar(20)=null,
	@aciklama1 nvarchar(150)=null,
	@tutar decimal(18,2)=null,
	@personel nvarchar(50)=null


           
AS
BEGIN

	INSERT INTO [dbo].[kasa_hareket]   (
			[kasa_id]
           ,[kayit_tarihi]
           ,[evrak_no]
           ,[islem_tipi]
           ,[giris_or_cikis]
           ,[aciklama1]
           ,[tutar]
           ,[personel]) VALUES (
				@kasa_id,
				@kayit_tarihi,
				@evrak_no,
				@islem_tipi,
				@giris_or_cikis,
				@aciklama1,
				@tutar,
				@personel)
				
				
	

END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[KasaHareketSil]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KasaHareketSil]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/****
	Silme işlemi yaparken eğer var ise  ilgili cari_hareket veya personel_cari_hareketdende silme işlemi yapmak gerekir.
	Eğer;
		 cari_hareket_id dolu ise cari_hareket tablosundan da , silme sonrası borç alacak hesabıda var
		 personel_cari_maas_hareket_id dolu ise personel_cari_maas_hareket tablosundan da
		 ikiside boş ise manuel işlem olup sadece kendi kasa_hareket tablosundan silinir.
		 
****/
-- =============================================
CREATE PROCEDURE [dbo].[KasaHareketSil] 
	@kasa_hareket_id int
	
AS
BEGIN

	DECLARE @cari_hareket_id int
	DECLARE @personel_cari_maas_hareket_id int
	SELECT @cari_hareket_id=cari_hareket_id,@personel_cari_maas_hareket_id=personel_cari_maas_hareket_id  FROM kasa_hareket WHERE kasa_hareket_id = @kasa_hareket_id
		
	IF (@cari_hareket_id!='''')
	BEGIN
	DELETE FROM cari_hareket WHERE cari_hareket_id = @cari_hareket_id
	END
	
	IF (@personel_cari_maas_hareket_id!='''')
	BEGIN
	DELETE FROM personel_cari_maas_hareket WHERE maas_hareket_id = @personel_cari_maas_hareket_id
	END
	
	-- Kasa Hareketini SİL XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	DELETE FROM kasa_hareket WHERE kasa_hareket_id = @kasa_hareket_id
	

	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[PersonelKartiEkle]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonelKartiEkle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PersonelKartiEkle] 
		@tc nvarchar(50)=null,
        @adi nvarchar(150)=null,
        @soyadi nvarchar(150)=null,
        @kullanici_adi nchar(10)=null,
        @kullanici_sifre nchar(10)=null,
        @sicil_no nvarchar(50)=null,
        @basvuru_tarihi datetime=null,
        @departman_id int=null,
        @aciklama1 nvarchar(150)=null,
        @tel nvarchar(20)=null,
        @gsm nvarchar(20)=null,
        @adres1 nvarchar(150)=null,
        @adres2 nvarchar(150)=null,
        @ilce nvarchar(50)=null,
        @il nvarchar(50)=null,
        @giris_tarihi datetime=null,
        @banka_adi nvarchar(50)=null,
        @banka_hesap_no nvarchar(50)=null,
        @banka_iban_no nvarchar(50)=null,
        @odenen_maas decimal(18,2)=null, 
        @cinsiyet nvarchar(50)=null,
        @mail nvarchar(20)=null,  
        @ehliyet_sinifi nvarchar(20)=null,
        @aktif_or_pasif bit =null
      
AS
BEGIN
INSERT INTO [WebMart0001].[dbo].[personel_karti]
           ([tc]
           ,[adi]
           ,[soyadi]
           ,[kullanici_adi]
           ,[kullanici_sifre]
           ,[sicil_no]
           ,[basvuru_tarihi]
           ,[departman_id]
           ,[aciklama1]
           ,[tel]
           ,[gsm]
           ,[adres1]
           ,[adres2]
           ,[ilce]
           ,[il]
           ,[giris_tarihi]
           ,[banka_adi]
           ,[banka_hesap_no]
           ,[banka_iban_no]
           ,[odenen_maas]     
           ,[cinsiyet]      
           ,[mail]
           ,[ehliyet_sinifi]     
           ,[aktif_or_pasif])
     VALUES 
     (		
		@tc,
        @adi ,
        @soyadi ,
        @kullanici_adi ,
        @kullanici_sifre,
        @sicil_no ,
        @basvuru_tarihi ,
        @departman_id ,
        @aciklama1 ,
        @tel ,
        @gsm ,
        @adres1,
        @adres2 ,
        @ilce ,
        @il ,
        @giris_tarihi ,
        @banka_adi ,
        @banka_hesap_no ,
        @banka_iban_no ,
        @odenen_maas ,
        @cinsiyet ,
        @mail ,
        @ehliyet_sinifi ,
        @aktif_or_pasif)
				
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[PersonelKartiGuncelle]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonelKartiGuncelle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PersonelKartiGuncelle] 
		
		@personel_id int,
		@tc nvarchar(50),
        @adi nvarchar(150),
        @soyadi nvarchar(150),
        @kullanici_adi nchar(10),
        @kullanici_sifre nchar(10),
        @sicil_no nvarchar(50),
        @basvuru_tarihi datetime,
        @departman_id int,
        @aciklama1 nvarchar(150),
        @tel nvarchar(20),
        @gsm nvarchar(20),
        @adres1 nvarchar(150),
        @adres2 nvarchar(150),
        @ilce nvarchar(50),
        @il nvarchar(50),
        @giris_tarihi datetime,
        @banka_adi nvarchar(50),
        @banka_hesap_no nvarchar(50),
        @banka_iban_no nvarchar(50),
        @odenen_maas decimal(18,2), 
        @cinsiyet nvarchar(50),
        @mail nvarchar(20),  
        @ehliyet_sinifi nvarchar(20),
        @aktif_or_pasif nvarchar(20)
	

AS
BEGIN
	UPDATE personel_karti SET 
		tc=@tc,
		adi=@adi,
		soyadi=@soyadi,
		kullanici_adi=@kullanici_adi,
		kullanici_sifre=@kullanici_sifre,
		sicil_no=@sicil_no,
		basvuru_tarihi=@basvuru_tarihi,
		departman_id=@departman_id,
		aciklama1=@aciklama1,
		tel=@tel,
		gsm=@gsm,
		adres1=@adres1,
		adres2=@adres2,
		ilce=@ilce,
		il=@il,
		giris_tarihi=@giris_tarihi,
		banka_adi=@banka_adi,
		banka_hesap_no=@banka_hesap_no,
		banka_iban_no=@banka_iban_no,
		odenen_maas=@odenen_maas,
		cinsiyet=@cinsiyet,
		mail=@mail,
		ehliyet_sinifi=@ehliyet_sinifi,
		aktif_or_pasif=@aktif_or_pasif

	WHERE personel_id=@personel_id;


END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[FaturaHareketSilTemp]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FaturaHareketSilTemp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
CREATE PROCEDURE [dbo].[FaturaHareketSilTemp] 
	@fatura_stok_hareket_id int
	
AS
BEGIN

	-- Fatura Stok HAreket SİL XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	DELETE FROM fatura_stok_hareket_temp WHERE fatura_stok_hareket_id = @fatura_stok_hareket_id
	


	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[FaturaKaydet]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FaturaKaydet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[FaturaKaydet]
		
	@kayit_tarihi datetime=null,
	@fatura_tarihi datetime=null,
	@sira_no int=null,
	@fatura_no int=null,
	@unvan nvarchar(150)=null,
	@adres nvarchar(150)=null,
	@notu nvarchar(150)=null,
	@vergi_dairesi nvarchar(50)=null,
	@vergi_no nvarchar(50)=null,
	@ara_toplam decimal(18,2)=null,
	@kdv_tutar decimal(18,2)=null,
	@genel_toplam decimal(18,2)=null,
	@aciklama nvarchar(150)=null,
	
	@odeme_sekli nvarchar(20)=null,
	@personel nvarchar(50)=null,

	@stok_id int =null,
	@cari_id int=null,
	@islem_tipi nvarchar(50)=null,
	@giris_or_cikis	nvarchar(50)=null,   
	
	@onay_verildi_mi bit=null

           
AS
BEGIN
	DECLARE @borc_or_alacak nvarchar(20)
	DECLARE @borc decimal(18,2)
	DECLARE @alacak decimal(18,2)

	IF (@giris_or_cikis=''giris'')	
		BEGIN	
			SET @borc_or_alacak=''alacak'' 
			SET @borc =''0''
			SET @alacak=@genel_toplam
		END
	IF (@giris_or_cikis=''cikis'') 
		BEGIN 
			SET @borc_or_alacak=''borc'' 
			SET @borc =@genel_toplam
			SET @alacak=''0''
		END
	
	/* FATURA KAYIT İŞLEMİ				1			XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
	INSERT INTO [dbo].[fatura_kayit] (kayit_tarihi,fatura_tarihi,giris_or_cikis,sira_no,fatura_no,cari_id,unvan,adres,notu,vergi_dairesi,vergi_no,ara_toplam,kdv_tutar,genel_toplam,aciklama) 
			VALUES (@kayit_tarihi,@fatura_tarihi,@giris_or_cikis,@sira_no,@fatura_no,@cari_id,@unvan,@adres,@notu,@vergi_dairesi,@vergi_no,@ara_toplam,@kdv_tutar,@genel_toplam,@aciklama)
	
	DECLARE @new_identity int;
	SELECT @new_identity = SCOPE_IDENTITY()
	
	
	/* CARİ/HASTA HAREKETİNE KAYIT İŞLEMİ	2		XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
	INSERT INTO [dbo].cari_hareket    (kayit_tarihi,cari_id, borc_or_alacak, islem_tipi, odeme_sekli, belge_no, aciklama1, personel,borc,alacak,fatura_id)
	VALUES (@kayit_tarihi,@cari_id,@borc_or_alacak,@islem_tipi,@odeme_sekli,@fatura_no,@aciklama,@personel,@borc,@alacak,@new_identity)
		/*CARİ KARTIN BORÇ ALACAK DURUMUNU GÜNCELLE*/
		DECLARE  @borcu decimal(18,2)
		DECLARE  @alacagi decimal(18,2)
		DECLARE  @bakiyesi decimal(18,2)
		SELECT @borcu=sum(borc),@alacagi=sum(alacak),@bakiyesi=sum(borc)-sum(alacak) FROM cari_hareket WHERE cari_id=@cari_id
		UPDATE cari_karti SET borc_bakiye=@borcu,alacak_bakiye=@alacagi,bakiye=@bakiyesi WHERE cari_id=@cari_id
	
	
	/* STOK HAREKETİNE KAYIT İŞLEMİ			3		XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/

	DECLARE @cr_stok_id int 
	DECLARE @cr_cari_id int
	DECLARE @cr_fis_id int
	DECLARE @cr_islem_tipi nvarchar(50)
	DECLARE @cr_giris_or_cikis	nvarchar(50)
	DECLARE @cr_miktar int
	DECLARE @cr_birim nvarchar(20)
	DECLARE @cr_aciklama1 nvarchar(150)
	DECLARE @cr_iskonto float
	DECLARE @cr_birim_fiyat decimal(18,2)
	DECLARE @cr_kdvsiz_tutar decimal(18,2)
	DECLARE @cr_kdv_oran int
	DECLARE @cr_kdv_tutari decimal(18,2)
	DECLARE @cr_tutar decimal(18,2)


	DECLARE crFaturaHareket CURSOR FOR  /* cursor adı */
	SELECT stok_id,cari_id,islem_tipi,giris_or_cikis,miktar,birim,aciklama1,iskonto,birim_fiyat,kdvsiz_tutar,kdv_oran,kdv_tutari,tutar FROM fatura_stok_hareket_temp WHERE cari_id=@cari_id and onay_verildi_mi=''False''  /* cursor gezeceği sorgumuz */
	OPEN crFaturaHareket
	FETCH NEXT FROM crFaturaHareket INTO @cr_stok_id,@cr_cari_id,@cr_islem_tipi,@cr_giris_or_cikis,@cr_miktar,@cr_birim,@cr_aciklama1,@cr_iskonto,@cr_birim_fiyat,@cr_kdvsiz_tutar,@cr_kdv_oran,@cr_kdv_tutari,@cr_tutar
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		INSERT INTO [dbo].[stok_hareket]   (fatura_id,stok_id,cari_id,islem_tipi,giris_or_cikis,miktar,birim,aciklama1,iskonto,birim_fiyat,kdvsiz_tutar,kdv_oran,kdv_tutari,tutar) 
		VALUES (@new_identity,@cr_stok_id,@cr_cari_id,@cr_islem_tipi,@cr_giris_or_cikis,@cr_miktar,@cr_birim,@cr_aciklama1,@cr_iskonto,@cr_birim_fiyat,@cr_kdvsiz_tutar,@cr_kdv_oran,@cr_kdv_tutari,@cr_tutar)
	
		
		-- STOK ADET Güncelle
		DECLARE  @giren_miktar int
		DECLARE  @cikan_miktar int
		SELECT @giren_miktar=sum(miktar) FROM stok_hareket WHERE stok_id=@cr_stok_id AND giris_or_cikis=''giris''
		SELECT @cikan_miktar=sum(miktar) FROM stok_hareket WHERE stok_id=@cr_stok_id AND giris_or_cikis=''cikis''
		UPDATE stok_kayit SET giren=@giren_miktar,cikan=@cikan_miktar WHERE stok_id=@cr_stok_id
		
	FETCH NEXT FROM crFaturaHareket INTO @cr_stok_id,@cr_cari_id,@cr_islem_tipi,@cr_giris_or_cikis,@cr_miktar,@cr_birim,@cr_aciklama1,@cr_iskonto,@cr_birim_fiyat,@cr_kdvsiz_tutar,@cr_kdv_oran,@cr_kdv_tutari,@cr_tutar /* cursor sonraki satır */
	END
	CLOSE crFaturaHareket
	DEALLOCATE crFaturaHareket	

	/* STOK TEMP HAREKETİ ONAYLA			4		XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
	UPDATE fatura_stok_hareket_temp SET onay_verildi_mi=''True'' WHERE cari_id=@cari_id and onay_verildi_mi=''False''
	

END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[FaturaStokHareketEkleTemp]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FaturaStokHareketEkleTemp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[FaturaStokHareketEkleTemp] 
		
	@stok_id int =null,
	@cari_id int=null,
	@islem_tipi nvarchar(50)=null,
	@giris_or_cikis	nvarchar(50)=null,
	@miktar int=null,
	@birim nvarchar(20)=null,
	@aciklama1 nvarchar(150)=null,
	@iskonto float=null,
	@birim_fiyat decimal(18,2)=null,
	@kdvsiz_tutar decimal(18,2)=null,
	@kdv_oran int=null,
	@kdv_tutari decimal(18,2)=null,
	@tutar decimal(18,2)=null,
	@onay_verildi_mi bit=null

           
AS
BEGIN

	INSERT INTO [dbo].[fatura_stok_hareket_temp]   (
			stok_id,
			cari_id,
			islem_tipi,
			giris_or_cikis,
			miktar,
			birim,
			aciklama1,
			iskonto,
			birim_fiyat,
			kdvsiz_tutar,
			kdv_oran,
			kdv_tutari,
			tutar,
			onay_verildi_mi) VALUES (
				@stok_id,
				@cari_id,
				@islem_tipi,
				@giris_or_cikis,
				@miktar,
				@birim,
				@aciklama1,
				@iskonto,
				@birim_fiyat,
				@kdvsiz_tutar,
				@kdv_oran,
				@kdv_tutari,
				@tutar,
				@onay_verildi_mi)
				
	/* ONAY VERİLDİKTEN SONRA HESAPLAMA YAPILMASI LAZIM			
	-- STOK ADET Güncelle
	DECLARE  @giren_miktar int
	DECLARE  @cikan_miktar int

	SELECT @giren_miktar=sum(miktar) FROM stok_hareket WHERE stok_id=@stok_id AND giris_or_cikis=''giris''
	SELECT @cikan_miktar=sum(miktar) FROM stok_hareket WHERE stok_id=@stok_id AND giris_or_cikis=''cikis''

	UPDATE stok_kayit SET giren=@giren_miktar,cikan=@cikan_miktar WHERE stok_id=@stok_id
	*/


END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[StokHareketSil]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StokHareketSil]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
CREATE PROCEDURE [dbo].[StokHareketSil] 
	@stok_hareket_id int
	
AS
BEGIN
	DECLARE @stok_id_si int
	DECLARE @islem_tipi nvarchar(50)
	SELECT @stok_id_si=stok_id,@islem_tipi=islem_tipi FROM stok_hareket WHERE stok_hareket_id = @stok_hareket_id
	
	-- stokHAreket SİL XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	DELETE FROM stok_hareket WHERE stok_hareket_id = @stok_hareket_id
	
	IF (@islem_tipi=''giris'' or @islem_tipi=''cikis'')	--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	BEGIN
		DELETE FROM stok_hareket WHERE stok_hareket_id = @stok_hareket_id
	END
	
	/*
	IF (@odeme_sekli=''banka'')	--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	BEGIN
		DELETE FROM banka_hareket WHERE stok_hareket_id = @stok_hareket_id
	END
	
	IF (@odeme_sekli=''pos'')		--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	BEGIN
		DELETE FROM banka_pos_hareket WHERE stok_hareket_id = @stok_hareket_id
	END
	*/
	--stok KARTIN BORÇ ALACAK DURUMUNU GÜNCELLE
	DECLARE  @giris_miktar int
	DECLARE  @cikis_miktar int
	DECLARE  @stok_miktar int
	
	SELECT @giris_miktar=SUM(miktar) FROM stok_hareket WHERE stok_id=@stok_id_si and giris_or_cikis=''giris''
	SELECT @cikis_miktar=SUM(miktar) FROM stok_hareket WHERE stok_id=@stok_id_si and giris_or_cikis=''cikis''

	UPDATE stok_kayit SET giren=@giris_miktar,cikan=@cikis_miktar WHERE stok_id=@stok_id_si

	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[StokHareketEkle]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StokHareketEkle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[StokHareketEkle] 
	@kayit_tarihi datetime =null,
	@fatura_id int=null,
	@stok_id int =null,
	@cari_id int=null,
	@fis_id int=null,
	@islem_tipi nvarchar(50)=null,
	@giris_or_cikis	nvarchar(50)=null,
	@miktar int=null,
	@birim nvarchar(20)=null,
	@aciklama1 nvarchar(150)=null,
	@iskonto float=null,
	@birim_fiyat decimal(18,2)=null,
	@kdvsiz_tutar decimal(18,2)=null,
	@kdv_oran int=null,
	@kdv_tutari decimal(18,2)=null,
	@tutar decimal(18,2)=null,
	@evrak_no nvarchar(50)=null


           
AS
BEGIN

	INSERT INTO [dbo].[stok_hareket]   (
			kayit_tarihi,
			fatura_id,
			stok_id,
			cari_id,
			fis_id,
			islem_tipi,
			giris_or_cikis,
			miktar,
			birim,
			aciklama1,
			iskonto,
			birim_fiyat,
			kdvsiz_tutar,
			kdv_oran,
			kdv_tutari,
			tutar,
			evrak_no) VALUES (
				@kayit_tarihi,
				@fatura_id,
				@stok_id,
				@cari_id,
				@fis_id,
				@islem_tipi,
				@giris_or_cikis,
				@miktar,
				@birim,
				@aciklama1,
				@iskonto,
				@birim_fiyat,
				@kdvsiz_tutar,
				@kdv_oran,
				@kdv_tutari,
				@tutar,
				@evrak_no)
				
				
	-- STOK ADET Güncelle
	DECLARE  @giren_miktar int
	DECLARE  @cikan_miktar int

	SELECT @giren_miktar=sum(miktar) FROM stok_hareket WHERE stok_id=@stok_id AND giris_or_cikis=''giris''
	SELECT @cikan_miktar=sum(miktar) FROM stok_hareket WHERE stok_id=@stok_id AND giris_or_cikis=''cikis''

	UPDATE stok_kayit SET giren=@giren_miktar,cikan=@cikan_miktar WHERE stok_id=@stok_id



END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[FaturaSil]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FaturaSil]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[FaturaSil]

	@fatura_id int,
	@cari_id int 
         
AS
BEGIN

	/* CARİ/HASTA HAREKET SİLME 	2		XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
	DELETE FROM [dbo].cari_hareket WHERE fatura_id=@fatura_id
	
		/*CARİ KARTIN BORÇ ALACAK DURUMUNU GÜNCELLE tüm hareketinden hesaplanır*/
		DECLARE  @borcu decimal(18,2)
		DECLARE  @alacagi decimal(18,2)
		DECLARE  @bakiyesi decimal(18,2)
		SELECT @borcu=sum(borc),@alacagi=sum(alacak),@bakiyesi=sum(borc)-sum(alacak) FROM cari_hareket WHERE cari_id=@cari_id
		UPDATE cari_karti SET borc_bakiye=@borcu,alacak_bakiye=@alacagi,bakiye=@bakiyesi WHERE cari_id=@cari_id
	
	
	/* STOK HAREKETİNE KAYIT İŞLEMİ			3		XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
	DECLARE @stok_hareket_id int
	DECLARE @cr_stok_id int

	DECLARE crStokHareket CURSOR FOR  /* cursor adı */
	SELECT stok_hareket_id,stok_id FROM stok_hareket WHERE fatura_id=@fatura_id   /* cursor gezeceği sorgumuz */
	OPEN crStokHareket
	FETCH NEXT FROM crStokHareket INTO @stok_hareket_id,@cr_stok_id
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
	
		DELETE FROM stok_hareket WHERE stok_hareket_id=@stok_hareket_id  
		
		-- STOK ADET Güncelle
		DECLARE  @giren_miktar int
		DECLARE  @cikan_miktar int
		SELECT @giren_miktar=sum(miktar) FROM stok_hareket WHERE stok_id=@cr_stok_id AND giris_or_cikis=''giris''
		SELECT @cikan_miktar=sum(miktar) FROM stok_hareket WHERE stok_id=@cr_stok_id AND giris_or_cikis=''cikis''
		UPDATE stok_kayit SET giren=@giren_miktar,cikan=@cikan_miktar WHERE stok_id=@cr_stok_id
		
	FETCH NEXT FROM crStokHareket INTO @stok_hareket_id,@cr_stok_id
	END
	CLOSE crStokHareket
	DEALLOCATE crStokHareket	

	/* FATURA KAYDINI SİLME				1			XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
	DELETE FROM fatura_kayit WHERE fatura_id=@fatura_id  
	
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[StokKartiGuncelle]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StokKartiGuncelle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[StokKartiGuncelle] 
		
	@stok_id int,
	@kayit_tarihi datetime,
	@stok_kod_no int,
	@stok_barkod_no nvarchar (50),
	@stok_uretici_no nvarchar (50),
	@stok_adi nvarchar (150),
	@birimi nvarchar (20),
	@grubu_id nvarchar (50),
	@kdv int,
	@alis_fiyati decimal(18,2),
	@satis_fiyati decimal(18,2)
	

AS
BEGIN
	UPDATE stok_kayit SET 
	kayit_tarihi=@kayit_tarihi,
	stok_kod_no=@stok_kod_no,
	stok_barkod_no=@stok_barkod_no,
	stok_uretici_no=@stok_uretici_no,
	stok_adi=@stok_adi,birimi=@birimi,
	grubu_id=@grubu_id,
	kdv=@kdv,
	alis_fiyati=@alis_fiyati,
	satis_fiyati=@satis_fiyati 
	WHERE stok_id=@stok_id;


END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[CariHareketSil]    Script Date: 02/09/2016 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CariHareketSil]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CariHareketSil] 
	@cari_hareket_id int
	
AS
BEGIN
	DECLARE @cari_id_si int
	DECLARE @fatura_id_si int
	SELECT @cari_id_si=cari_id,@fatura_id_si=fatura_id FROM cari_hareket WHERE cari_hareket_id = @cari_hareket_id
	
	DECLARE @odeme_sekli nvarchar(20)
	DECLARE @islem_tipi nvarchar(20)
	SELECT @odeme_sekli=odeme_sekli,@islem_tipi=islem_tipi FROM cari_hareket WHERE cari_hareket_id=@cari_hareket_id
	
	-- CariHAreket SİL XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	DELETE FROM cari_hareket WHERE cari_hareket_id = @cari_hareket_id
	
	IF (@odeme_sekli=''nakit'')	--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	BEGIN
		DELETE FROM kasa_hareket WHERE cari_hareket_id = @cari_hareket_id
	END
	
	IF (@odeme_sekli=''banka'')	--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	BEGIN
		DELETE FROM banka_hareket WHERE cari_hareket_id = @cari_hareket_id
	END
	
	IF (@odeme_sekli=''pos'')		--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	BEGIN
		DELETE FROM banka_pos_hareket WHERE cari_hareket_id = @cari_hareket_id
		--banka hareket de silinsin
		DELETE FROM banka_hareket WHERE cari_hareket_id = @cari_hareket_id
	END
	
	IF (@islem_tipi=''fatura'')		--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	BEGIN
		EXEC FaturaSil @fatura_id_si,@cari_id_si
	END
	
	
	
	
	--CARİ KARTIN BORÇ ALACAK DURUMUNU GÜNCELLE
	DECLARE  @borcu decimal(18,2)
	DECLARE  @alacagi decimal(18,2)
	DECLARE  @bakiyesi decimal(18,2)
	
	SELECT @borcu=sum(borc),@alacagi=sum(alacak),@bakiyesi=sum(borc)-sum(alacak) FROM cari_hareket WHERE cari_id=@cari_id_si
	UPDATE cari_karti SET borc_bakiye=@borcu,alacak_bakiye=@alacagi,bakiye=@bakiyesi WHERE cari_id=@cari_id_si

	
END
' 
END
GO
/****** Object:  Default [DF_stok_kayit_giren]    Script Date: 02/09/2016 23:32:14 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_stok_kayit_giren]') AND parent_object_id = OBJECT_ID(N'[dbo].[stok_kayit]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_stok_kayit_giren]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[stok_kayit] ADD  CONSTRAINT [DF_stok_kayit_giren]  DEFAULT ((0)) FOR [giren]
END


End
GO
/****** Object:  Default [DF_stok_kayit_cikan]    Script Date: 02/09/2016 23:32:14 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_stok_kayit_cikan]') AND parent_object_id = OBJECT_ID(N'[dbo].[stok_kayit]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_stok_kayit_cikan]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[stok_kayit] ADD  CONSTRAINT [DF_stok_kayit_cikan]  DEFAULT ((0)) FOR [cikan]
END


End
GO
/****** Object:  Default [DF_stok_kayit_kdv]    Script Date: 02/09/2016 23:32:14 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_stok_kayit_kdv]') AND parent_object_id = OBJECT_ID(N'[dbo].[stok_kayit]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_stok_kayit_kdv]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[stok_kayit] ADD  CONSTRAINT [DF_stok_kayit_kdv]  DEFAULT ((0)) FOR [kdv]
END


End
GO
/****** Object:  Default [DF_stok_kayit_alis_fiyati]    Script Date: 02/09/2016 23:32:14 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_stok_kayit_alis_fiyati]') AND parent_object_id = OBJECT_ID(N'[dbo].[stok_kayit]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_stok_kayit_alis_fiyati]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[stok_kayit] ADD  CONSTRAINT [DF_stok_kayit_alis_fiyati]  DEFAULT ((0)) FOR [alis_fiyati]
END


End
GO
/****** Object:  Default [DF_stok_kayit_satis_fiyati]    Script Date: 02/09/2016 23:32:14 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_stok_kayit_satis_fiyati]') AND parent_object_id = OBJECT_ID(N'[dbo].[stok_kayit]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_stok_kayit_satis_fiyati]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[stok_kayit] ADD  CONSTRAINT [DF_stok_kayit_satis_fiyati]  DEFAULT ((0)) FOR [satis_fiyati]
END


End
GO
