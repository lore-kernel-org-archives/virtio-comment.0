Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024EA146017
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 11:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717585311; cv=fail; b=O0LDpNJPM+ggzJJaG3OI8Vex1SuTEwMGycI90OSqDgj4u3UvJaBG3/eDm47BzNXnk9VR59bMUZu8I5UfVPqNgOA5DDjOTRhE0L/7pZip+C8AyO1CI5URMWhA6baW6d/cBjmMMJhWVCRBpADtMsrr2H/mcsKsJTUTrnUNGNRbqAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717585311; c=relaxed/simple;
	bh=NAIKf3EKu/KfVlQvkdGF23jw6IKGD8jN6opRo31reP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E8ZQeV4zloUOnGcibfmlxQQU7vyhEa41sv3G2tdERzTKt9+y5ps68Gz3w5onqn1ALOqI/8WPcg/Y+w7fs/GBfzmtY540yMEA/Ct3BpZyszd75hiZAcYhlYEPYeqNjrk4kqObAL9ieCYWPqxsx13JGkLwuby29yRhOs4KsT0EdEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=ZredL5TR; arc=fail smtp.client-ip=18.185.115.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="ZredL5TR"
Received: from 104.47.7.172_.trendmicro.com (unknown [172.21.181.109])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 5F066100017D2;
	Wed,  5 Jun 2024 11:01:47 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1717585304.057000
X-TM-MAIL-UUID: 5ba150c8-74d2-426b-995f-ca13f0848c38
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.172])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 0E3CC10048580;
	Wed,  5 Jun 2024 11:01:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/LdvW1Ua9b1EXoiSK5lFd5KHau1wkb+DgeZ1AHF8C2Yk4DPv0Onh3QYiULvANlF15LL8wvv2y+O9jPNewzWOLiczcLKJv3AhL9H+g55SGVz+L/oy1gGPWeLgUi7f6gCfg1j5n7JglaF8UNkQ4ErfLdYviLUEiBpmfOFKZ6MiVp1P6LE9xA3PzNxkJDdF96qL5PC0blPhhDsSGCc12hGfTJuPVXEpeJ5sXjuaoSgjl7z+tICGwYhCdEoxyy4BimcUXPG7OcT/5gZ1PuLOq0IqZlfYJOP/wXbRxt9WqojCjuisKvTtXnN7VgDU86QVLxsMbjHg6xvlxSTrryj7RMKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxLxPERU2W9uybDz3UqTBRruq/qxJFxv9x2uxCPFGEk=;
 b=aei9SgrhbQ8xox/VMMszo9uDTZqZEiiENIUJJu9Vv01hCsLVUdZaCnR1P3GdGab2X/Ofo1cs8owsPTRJfPNxeXPE1YuuP+5WXtsJBotrEdSZE34gmCZgpf8QesdgPKW112febvsHm/U4zO2SqgvZVl6keaiNyZcfhreYgEfnPXsxci524RcoQO3WEC7qfett9E3Hq3zuGnbKnaaEvUXA7Bqv/AV3Y2N2TWXflO6jU/GjFMaQv8Sr8pMKJW/ikZU1sT/6FCGEb5zBDbCdHkvAaYI6SzPcBIex4lNU51vfgKg/gyLQh2xR093H88R3aWyO6jtsdNSy2i3PFApSNRRj0Q==
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
Subject: [PATCH v3 1/2] admin: Refer to "no order constraints" only for different queues
Date: Wed,  5 Jun 2024 13:01:32 +0200
Message-ID: <20240605110133.31568-2-peter.hilber@opensynergy.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5F:EE_|FR4P281MB4334:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0b8393eb-56b1-4872-bfc6-08dc854ee211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AZ6VvK2HKZ/w7IIe/eRTfcEGU2TKOOtTRHvjR89XM63WELW6fOyzj1CBgMGa?=
 =?us-ascii?Q?C19eHJjJ+z2nUZkVetSHbUcdi6fS/CL7hUzaAAISOl9Ob/78qagutFu5vekj?=
 =?us-ascii?Q?7MmIAAug6yTzAtaZF+lGRWp2QPmYy50RGV0RmrMlbf0MAdKSvKHMXNv/AKwO?=
 =?us-ascii?Q?ofz+iCNI3aV1cwrZXniog1GahmPI5JBYXPX5V8ieLspd6RWynMnqLKBrcQEr?=
 =?us-ascii?Q?WddoeHzZoiyive+bWubrwtzONcQF03IHWh1HZ2n5CTSnTpAS1xBgvWj+Ur7m?=
 =?us-ascii?Q?CyDWHHW51GSuBfQ3Pa4lpuGD4huUASRNsRBq2o9VNXlZ8zgRc7gB+JjB/DM/?=
 =?us-ascii?Q?xEAJLGwoVGSPqfEp7zQBxPipIPL4PzUO2qrrEvVqKJlMae6ZesvqZ9mMhUzT?=
 =?us-ascii?Q?tKHRC8kvLHOQiAG+g1Y6xkcCZiKtag9EuOuk0kHvvwHln0LEh0jGIoxQfEpE?=
 =?us-ascii?Q?RkKtKwTzSlgqmxXXRXZft5Jgs1BNEfEdD+u7Nu30r1wJZhrKPq0Khl/nYERu?=
 =?us-ascii?Q?aFfMCEOa71egHZaCPt9aXD4qUa99y55X7I7pbYxGx+7g6jVchIp85zFjskte?=
 =?us-ascii?Q?U/tl8LGAb9L0TrL9H4Te0HoqZoP+T37frnCeXY1qM3g0BCxOhluqixcnw/LR?=
 =?us-ascii?Q?jmoTykpd5kA7lEBdOM/ezI/zHkFWYTeVfbN6z7geAhmsnjtcdEVj9/StGac0?=
 =?us-ascii?Q?LeU5UTHyhs+imJNi5Ldq1z1/Gs9/zCgNfHtsflS870TXDB5B1OQ4sSra9yF/?=
 =?us-ascii?Q?7L/r7wyi1A8E4FTdlTxpVb2G6kB69YaAJmrQWfy2uYa3VdNKLSngm0lhC9L0?=
 =?us-ascii?Q?LbS6a1JG7so+Nm8vZSPIBNeMSSvkkuqU8Et+VlrM2kKeHUMWeiKTmTydHn8S?=
 =?us-ascii?Q?xd2sGgOK33qSdy5DCWqMSdnAM+pmRVibZNoYbwm9L4DyyuxmyqxCToGXXQdK?=
 =?us-ascii?Q?2ebjN9YYAcpR0UiQgiUSr2v3MBieQ486tLg4rGUYYJfe8oUPrybE9tjDKO5a?=
 =?us-ascii?Q?4IsOkSFtjhnE5zPvMRiZQkWVTl8cSDJ7AB+fDEOPHBuNQCtoBKlUolwFlv4z?=
 =?us-ascii?Q?bJyaBFFBAs2ZmldKibxtmAfvyqdTQ2sUxtHwRMmon2ISMHAT98xUEpipJN0E?=
 =?us-ascii?Q?amzq6ydugwf0YZw0K4tPepCw5RjMNQRWOJ5N5vn2ga0bsbU2BLme7elBT+Eg?=
 =?us-ascii?Q?zx5vDqHmsu7vPU4Zd3ziMQYAw/OBbKzrm89jOEUqbPXTgCsafSAuFgC9ills?=
 =?us-ascii?Q?1gjnFE1276XiUfdRjW70hZGKYYiHxPHartZgwsc2wc1ONYbr3FccmnfhgaVA?=
 =?us-ascii?Q?9WR2RJrMdpN5cDOfKpiINe8XK4WLjRpuY/LUenBIY1jOdhPglEw2dvOJj9iG?=
 =?us-ascii?Q?6s6DcHgCbS3YMQGmOfmVXJRoDSXkYGkE6wwnn+Jsyic+ptaJUQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:213.61.166.92;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:exchangeconnector.opensynergy.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 11:01:42.5743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8393eb-56b1-4872-bfc6-08dc854ee211
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[213.61.166.92];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR4P281MB4334
X-TM-AS-ERS: 104.47.7.172-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28432.007
X-TMASE-Result: 10--1.574100-4.000000
X-TMASE-MatchedRID: VK5cIMsVziZHh0q2DwAXLuz7sT3z+1wghi9GR48RQB7AYsa7JwqXV4ba
	F6RQTZz9QWrwTQcQ3Z3/aUWAnMYE96o4G0VKdf1fC+mr+2Lx3Hx+rvFZ7FWrXAsPNAkPeS3QMnz
	YHHThMiBVwq3aldsC4plGnAC3gM+P/Y5aTtdrip0ZD7bjq+6lMGzY00haS8Qo2ubnxCjreJ+y3k
	dtFI7dBeMZ+gHJICghjJ4g9QEm1pDSXOJlAKRpIlo/1P3BDpl/jh4sOI1Ut5uVYAcCowrUTWp/K
	U7Gr1ZI5JrN9/h+EXVI7lIrHBEYQVw6eqmDL5urrDYOk/5tXVajg0lrtKMWyk62RU5NNq4manC2
	9ejYRQelQdSjBe50pC9h6tejU7UDBJetwkYd1rZxg7svMtapLgFjc8ftwTqqq7fOEzqthHBGTmw
	jP6n+RHX8mzbTzzmwx6GRnb6Kqb8=
X-TMASE-XGENCLOUD: c27806ec-1f80-4145-8fd1-d231dbbdadd9-0-0-200-0
X-TM-Deliver-Signature: A266B00F5ADADEE8F125952F9DB6E98F
X-TM-Addin-Auth: MgM0g7kULZ0kyFPWCGLk0EQVaOe4o68OTanSD6J13HmndJboAAx15IuJmfN
	xceWRjNXWy1MxWJXOAGTB11jQEWMAo29ryvEXQ+kRlKOP1i0lYB7m2IDVZrWt72g8IxEKrPbrGG
	B7RG+j/XFepQYNCLTOfD5gMmBdWgO7FsDcYXZqpoVNqOQb1tQAWzvLFxVpZ0hUETI57OyXlDqeL
	cIxLT9YbNyFtk3eXPQbAachvX4s1aPXJTtEhad9PqjsdCtokiMhtUpZkOerqYJ49X8yPE9xFO1s
	THLrwkVF2me/j74=.MHsPaY3vpOn27RqOGuIFYpyHya32XN8TIENBV5Q0qqte7bUlEssjVGechi
	+t0fpDmXptYPL0AjyDFj8wgGnj/IXwH2225uMxLLJOpv5sYR+i+O7X7yKa4ogB2Y2bp4UdKAB1L
	Wm+a2OvRe5TsgYm8RkYeMLXoSRm4R0IGJ1+037zwH9Ggu8tB2ScMurrCzSIeYSCTSvFq14q6QUN
	j9U82P6oDok8KKLCVLcDiiplf03tZIta8DmeC9fEfic54sxnNO7QrhHT7tonGwnJZBUZIZXFowg
	MtdhEQ/z069wORSRl+lO5AuQxMzOA/5znUyE+wJMRWtkzv1nRuEPecaOl0w==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1717585307;
	bh=NAIKf3EKu/KfVlQvkdGF23jw6IKGD8jN6opRo31reP8=; l=2214;
	h=From:To:Date;
	b=ZredL5TRI0QePfuADVU6EH21Xy5huDctQ4Zz3bMO7wex1X8469nqS08T/ejYGiG6w
	 k6nY4s/UpcXCAjgVqN5AQfQ5JTbH+Jr4q7XucZ25EJRsxGufAgpJZl21qjqhMgEVC5
	 nrqCL5AWqjesPTmnBS9xbATZ/HoBajbM7O0retn/sjfFdfFR9n7mYw8kMFBxuqnAID
	 bO+q/XA+G87QWZkTcchMe1clGmXCW74xx1mrJd8PGbb2H/6kniAuYI7YGeYadfjOAz
	 gm+vxfIYWSpSM6TOZdGhnFlwGqY9Cob3gO6uS0b/3C3Kox/9Hy0DOgP6zVf+VlnYNb
	 LvDV93q31Uofg==

The non-normative section says that administration virtqueue commands
"will be consumed with no order constraints". But actually, the
requirements stipulate a total order for all commands in the same
virtqueue:

	The device MUST process commands on a given administration virtqueue
	in the order in which they are queued.

	If multiple administration virtqueues have been configured,
	device MAY process commands on distinct virtqueues with
	no order constraints.

Fix this by narrowing down the scope of the sentence to "commands placed
on different virtqueues". Also, narrow down the following example to
one with different virtqueues, and reword the example to better fit the
narrowed sense.

Fixes: bf1d6b0d24ae8 ("admin: conformance clauses")
Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---

Notes:
    v3:
    
    - Refer to "virtqueue" as such (Stefano Garzarella).
    
    - Narrow down example to have different virtqueues (Stefano Garzarella).
    
    v2:
    
    Be specific about case without order constraints (Parav Pandit).

 admin.tex | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/admin.tex b/admin.tex
index 0803c269e5c4..751918443d0f 100644
--- a/admin.tex
+++ b/admin.tex
@@ -457,11 +457,12 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
 The driver enqueues requests to an arbitrary administration
 virtqueue, and they are used by the device on that same
 virtqueue. It is the responsibility of the driver to ensure
-strict request ordering for commands, because they will be
-consumed with no order constraints.  For example, if consistency
-is required then the driver can wait for the processing of a
+strict request ordering for commands placed on different
+virtqueues, because they will be
+consumed with no order constraints.  For example,
+the driver must wait for the processing of a
 first command by the device to be completed before submitting
-another command depending on the first one.
+another command depending on the first one to a different virtqueue.
 
 Administration virtqueues are used as follows:
 \begin{itemize}
-- 
2.43.0

