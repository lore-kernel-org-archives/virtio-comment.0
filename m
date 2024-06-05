Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CE749639
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 11:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717585320; cv=fail; b=cpIV8heuypT/YBVG3I/5MXCSc35Gro5phtlnPMKlEeInzWT2tqixg8cMDAthl9VYke37zLY917nvORbDgU0Bys6mtY+Q+/wvVsulDMZni04IKxDIKrcxF02OH+4VFolg3HvyySco9s4r9Tu6CiEcDtrywJg0jLvmtlsB8knRiVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717585320; c=relaxed/simple;
	bh=GpRuvYeV333oAVykj8+GhvcIiEy0iixs5O4+xzDVSZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k4nQgOUwEZjnDeDTSvSu8qD0T1YDgGu7kWSiVWsAPfBOBq+fyQawPj4yJomj1P10A7GrC5E13HcgiGRk1Ms7VjKG7u4n+apccL7caj0L7nLJlPlIfnLHjRiP9Wfz8nzp2I+b8tC8RvpCBMnt2zEOuIls6djATHtbu155knvIRd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=CVQb/Sqd; arc=fail smtp.client-ip=18.185.115.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="CVQb/Sqd"
Received: from 104.47.7.175_.trendmicro.com (unknown [172.21.10.233])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id 5B999101371D1
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 11:01:51 +0000 (UTC)
Received: from 104.47.7.175_.trendmicro.com (unknown [172.21.163.121])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 579331000116D;
	Wed,  5 Jun 2024 11:01:44 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1717585303.898000
X-TM-MAIL-UUID: ad49ae03-7db1-4698-8b08-2bfcbc026bd3
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.175])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id DB5A21000040F;
	Wed,  5 Jun 2024 11:01:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiTeqQ09rH3cjti9/iT3ahvvca17ZJN5zQ98sXDbpf7ADWqJBlLU+zRg2pfMZ6VuNpGzPTmImb7SdN3zT0H9glPSY5SS4+HCWMeLUiixP23sjno74UtCL25MUnTiCUzzFAqnpWofd3GA+oJTVZyKeZ5cxkchDH4KnrwqPWLC+37CJeayH0PQ14xga2nZ1WsKH19Bx3vYha9aFoxW0Xy8WUQUsmB1SCwxmWRFb3ieZfdSUhfcVZGePYGUQW8ipf5b+9vB/2FkbgWB2yeCpXfAVg9Efy4zGnyPXQ5CfaxOReMouMkDjRCSz+14NxSpj5iWxvptC4PqdOnM44ClAvYEMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSBK+YVEfUrCVgC+05JT6B8BtQXgjEMObddHutRBgKU=;
 b=FcrM7AzGjpWp3/WGUqtzjtViX0a0ZbZdUc8OTHs21ciKwGs33KtDdg1z8X750yOEfAY6CllBVElxtsOHsGhAwcA6NVTZ8tFUtnB3J+cSut6KSybPcDr9sDKdr2T9t7CXLcFYrnTimW/E5Gt3wgr/lOZg4c6HX8jLyN4qOTfeO+oSdCWR92lIp23S806POoncvlRUWSP7gMeOr5zU1Vwi0Bl5uE1uuss4g18t8s0zzL+4sAHAq0yasT8zbqsd+u+UnoPwSj2IyWL1XVuaWaJAR9h10N1qg4vF/eMn03u1w7PY+km6tM3KBML2Zqw+lHpqW8tqTiN09NvHxa3nvRIzVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 213.61.166.92) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=opensynergy.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensynergy.com; dkim=none (message not signed);
 arc=none (0)
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 213.61.166.92)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensynergy.com;
Received-SPF: Fail (protection.outlook.com: domain of opensynergy.com does not
 designate 213.61.166.92 as permitted sender) receiver=protection.outlook.com;
 client-ip=213.61.166.92; helo=SR-MAIL-03.open-synergy.com;
From: Peter Hilber <peter.hilber@opensynergy.com>
To: virtio-comment@lists.linux.dev
Cc: Parav Pandit <parav@nvidia.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Peter Hilber <peter.hilber@opensynergy.com>
Subject: [PATCH v3 2/2] admin: Fix driver requirement subject
Date: Wed,  5 Jun 2024 13:01:33 +0200
Message-ID: <20240605110133.31568-3-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605110133.31568-1-peter.hilber@opensynergy.com>
References: <20240605110133.31568-1-peter.hilber@opensynergy.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78E:EE_|FR4P281MB4337:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c46130c8-55fa-4e5d-f7b0-08dc854ee215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X015E0ZW6+uKLClwnGClHOra4rZOZYpw8Z0d0XyPFxOSLORCDBkCZQUfM8gp?=
 =?us-ascii?Q?wCzGiGnB19WqX0PALwzvPSJ6O9HJg0HF57amreWArEZ9DccG4RMG3Dmfa/ih?=
 =?us-ascii?Q?XyLW/FBwVv5WjLukMi43qDN0u1ET8HtTi/pFzUsdkANp0zu8go93lYDn/yvt?=
 =?us-ascii?Q?nVCmUTBtY0B1aBFibakVzLsbFI867N/CHl/Y1R35IpgUT11MHruMNeUURaHL?=
 =?us-ascii?Q?LOOyIQACDEdvkJpDEBJVPEgDMLF57fry7uxiqxezJv3Ox+w3nuQOFRAkw3o3?=
 =?us-ascii?Q?2P1UnAV4px3Wpn6pWlQ22mitUqNPUWLdjEdcl1HaEtiiUphbCKMJYvNkGWW6?=
 =?us-ascii?Q?kKQtrB/pmGVDIjvLefAJCjRLDqyyMvbWK+vhSWvLVlrvtIez6dl4ZI2boe3I?=
 =?us-ascii?Q?Aq/s2ULJ/YpWlXSK2KrK1IdnoP42gbeAJl+kCjpo0mNAjdXeya3uOtlqi1OF?=
 =?us-ascii?Q?paOQN9kQ7uw7zaHv67YdNfkfPysoJ6MuTaaow9+R0r7k0q70lb6XlYRx8CIL?=
 =?us-ascii?Q?fRVDz5G7vpRwl7Gisxo7BUd5zppRGUjHMFsxvLYQ8UTT6Xt2DKNpzRibR1Xm?=
 =?us-ascii?Q?z8oXsfhYtHd7uHjCj2f73pijm9HvL0+UeaPFeSqQi4OPdbJgqSxPFrtHJz6H?=
 =?us-ascii?Q?6phghX3G64+QXXM28CDqR6Y2xX7IfWtFQp++gLsD5CkLL617EaTCXHG6md9y?=
 =?us-ascii?Q?x9q3c8AWbpAat2jDWm8t5xBapAcsVU/Ke6fmvX5F23I7fQYywiitNgSzqYNE?=
 =?us-ascii?Q?hOQY0kr7+eV81D7aSpfxTFsDBlF77DEmaAkQ60L0Q+67VpKHZ1ZcHbg0nGLJ?=
 =?us-ascii?Q?DfVbxJR2f/dAl5FUdX3KNQYONlkGFRKVcxDrSfG7YxiaHloLZbvLc+5K8QN9?=
 =?us-ascii?Q?MU6h1pq+Lb5aoc3JqjqK+07jj1rZYZ/P7QZwHfnNWvn1k5bP+RZ7uy3Iu5Jv?=
 =?us-ascii?Q?xyE0i6X+xa9MJrCXbQiaeNRgGPWP+zdIlMmmYFS7agIt+yqI8eOihd3YCF02?=
 =?us-ascii?Q?dz5WgacPm+K7wZO8ZVK6X61GZSxaics7FYLGoyhsFVFj5ckaegpC3nONhcWG?=
 =?us-ascii?Q?di4bqdUrNEcFwyV1sJpZWC3ExEmy2rbrIulRv0b0n+rmrwK8D8ija2TFvtc1?=
 =?us-ascii?Q?mggY4xdyIxBN1xvvAMthwMP0DZlVs1SNEJBJ4fV/xkm9oyA4X+yby5s8fsBH?=
 =?us-ascii?Q?LdwKBgeTQEV/1BQO6aiG9NqfJhznxBGnVUGL0so4Q+Xh6TtPFJJw2VeYw5A4?=
 =?us-ascii?Q?qWgohrVP/nIwVHHXIRcYR8GZAvB8+mH7Tau+pWWsyk5VDNxyp4igAZI2UKCm?=
 =?us-ascii?Q?1kuVzvaaf7vwLQad9vjbLUSjMpjbhPio/jfHTI9rYAXnIwXBOpgF8D7rLbNs?=
 =?us-ascii?Q?OrdkAAHknhnSb2uoOKo5/awLCdBBJwCOWBmfNHcItQ4dmt82Qw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:213.61.166.92;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:exchangeconnector.opensynergy.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 11:01:42.6020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c46130c8-55fa-4e5d-f7b0-08dc854ee215
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[213.61.166.92];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR4P281MB4337
X-TM-AS-ERS: 104.47.7.175-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28432.007
X-TMASE-Result: 10-2.814700-4.000000
X-TMASE-MatchedRID: XAa2d/45j8Smk9Ke6CN7uZgVeq7CYXzT59KGlOljPvuOspAJM82OXQk4
	3PZ4fPrqlplw1dcdxwbvoLs4q3Jyra3XYtsOH2/QRYNhzuZZjRDZ/IoKYBoUVqloHyDFpaEst5O
	JHXe84WQAer1XvHjjzrRchDoUW0Yq8GjCF7GkJjBCPQBD3xA/3aryV/2jRq/XEgg3cwDHl/384p
	QlUpw+SAqMtasBG2xzl3eanjCn1nMnef17+TmbziJUNkNrt5r93+6k97GsyDgNjscWWWNaG5l+e
	3IAzQVFChDrNYHcaZaPlr8d2mwSd8oINVvFLjrg
X-TMASE-XGENCLOUD: 95f4e084-0e30-4bd1-af1b-0eb2a131f06b-0-0-200-0
X-TM-Deliver-Signature: 7E722133023D8DBE273E8499D61FD75E
X-TM-Addin-Auth: Gn9vmCoLKkAz8ibpNhEirCZvu0o37LLVnS4cAJy0umr1CjxjtWKrCOWqJ/D
	H4DX138U9nmJ5lGQc9ouN1IBxyFG4ARulkjr1mt9fb2C3hN2k4U+XSCX5U2si7MYRYPv1HDht3E
	r1J6lXlGx5rGpkowiNmcOslf90+fFd0G1K3a76LSBOlEfthqPYEauLA3eaT6ZBiKI96JP6rew7n
	Iq5Xyt0epjFXMSfIjll2iUX4fkYjgq6B8R+2PQfpApjQT/qVOYNUAtbEKTUSgFkUUIDYFJtucZG
	LmQkDRgQMNbvvWo=.iNBSkFxYfayXEikKFRy0fhjYmCfDqUb7/z5mZp1kcbFLi5hfbqo0hcn00j
	yfsjk+bwV2+yrgZxIG/6LQm4xPmhk8Nms0Z1W5J96KA3JErPGbEA8OST5EOdUOYoZQOTMBAIcdW
	As69WRIevzTnjntaGigKsezSiScMIU99iYCCtvRvfoARZ3G6BHwVuPc71ykz3c7EYiw0gV28zae
	akg/IWOWx5nucq8uXQ3RI7VtzQsIr2vzsizpgfOcRPTUL23AvvHcFq8MusMBpqdt/1oSTU35Z2q
	ogv1VORREuZcfqPTFubjyaNBAkSUTJIhHw8TjjSda1VFQqumh7eSNvZ3zJw==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1717585304;
	bh=GpRuvYeV333oAVykj8+GhvcIiEy0iixs5O4+xzDVSZs=; l=1156;
	h=From:To:Date;
	b=CVQb/SqdI9oOnGCPDvFRmMRXxzQXx0jINK3tZuYK4ifWkWQGnABITIJKzWNLdkpjC
	 J7+B6wYMhX24D2aghVPnvymlSVoxjkhVvt433VNhCh/mWv3LQ3ymDmrhPY820KO1Cf
	 aFdohM/kAVDjZIsF1AXcu1/9Cm8rPKiB97CtLtH16x9l09z7gQSZwqF26KtOLFs1j5
	 foyTnHD59hYDcj69V42+CmYCLUOoYXsn0DFSMrKBq3AiNEi7dBzwzdka9gWtuYe23A
	 CDaAPbPfK1ybMX9rNg7XdrGQUlDI5A0k66qOf/bmvG/73gXk9efTzKuxoyimIr7bN2
	 sSLF2qC/1Ly/g==

The driver-normative section for Group administration commands contains
a requirement on the *device*. This requirement only makes sense as a
requirement on the driver.

Fix this by making the driver the requirement subject.

Fixes: bf1d6b0d24ae8 ("admin: conformance clauses")
Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
---
 admin.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/admin.tex b/admin.tex
index 751918443d0f..0b0db153f5b8 100644
--- a/admin.tex
+++ b/admin.tex
@@ -583,7 +583,7 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
 of \field{struct virtio_admin_cmd} that are a multiple of 64 bit
 in length.
 
-The device MUST supply both device-readable or device-writeable parts
+The driver MUST supply both device-readable or device-writeable parts
 of \field{struct virtio_admin_cmd} that are larger than zero in
 length. However, \field{command_specific_data} and
 \field{command_specific_result} MAY be zero in length, unless
-- 
2.43.0

