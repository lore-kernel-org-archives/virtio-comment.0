Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424797483
	for <virtio-comment@lists.linux.dev>; Wed, 22 May 2024 17:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716397285; cv=fail; b=JCaVIv83WCPKxKbcl6/XOIVakmbO9KFcOINCkxWFsRhFbiGgjFGOvP6T8/ql6W1gxZsAIL8xpS5PrBF5VenhU+CYxvPMpkztGhI8q0DVm8o/g8TdzaTlPMFAD7yVvF5sQZg7WF6pU4dvOUdT0nGL9Yd28KLmXYsvxv43atygBlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716397285; c=relaxed/simple;
	bh=Z5nhWTRVSykI5oDTRthRKsVJZ3AMjNBu/LXI6YdOuxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hH9+e7DXV7VdCwyoZPznGpBgeRy7X9hWRs8OtqATLhn0FI7fKOiMQEAmDHbUbcYeulTvRXUiBzIxKCc0OzCELx/RjjR+4WL2Qg1SXwGOO+8vHKxnz7ZVvJMOOy7htOjXFvITaibVj9YrRRTNjpgXIDwa4BYOrekpAfcKcC3vfBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=xs9hLzVx; arc=fail smtp.client-ip=18.185.115.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="xs9hLzVx"
Received: from 104.47.11.169_.trendmicro.com (unknown [172.21.192.213])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 6BB3710000E2B;
	Wed, 22 May 2024 17:01:15 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1716397274.457000
X-TM-MAIL-UUID: ca10a204-443f-4ce5-a695-29edd3c765ba
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.169])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 6FA9A10000E26;
	Wed, 22 May 2024 17:01:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y40MLIW0cCtMxXDqrfohdkI6FPSnOF1e5GePKx77IZxrB+Ir9qCSyjJB/SjdYe9bicQXB4X4YhodzPomXaU9Ws8MudrNMr/ApX7dgvfIyzEJnFfrcd67vnoJSHY7FN5uz5R9t07fd5VZ3NmL2X+HTqmPdd9NKH6mDS9srshhaoqjmVYglA/2nX4LUqNyZRlHkmXlhT739PVbvmPAV3CkH6N7enMgRYD/A5cHnafUfmiuvlANZD+XPWmnvCSq9fittM0KkCnGZ+kerF+MTrWZmr3mWMoVlw/NWYprnv6vjAydYCiCEDE8FLQvc+CcbicxVBozQAZ15eaBPbo91m1u7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCFFXNlDoUw/eUNEizaSLVxZem+laNRNjKyyD39ewYI=;
 b=cCpxoCyHQkGEa49VQLcY2kfb8P7rRCkv6Z1bCmoHTBbPPcBAPewmUE8lS9eDqewu1YZ5QXM+sZ2IwoJSOH288Hax+fChjbMDY2ow7pzMCz1lCANZm8f4Pmqa3NkSVIpwmRzjigAj3WiNBCt6HRNciiL+wSk/jeNVbvOeEgcDxKOp+bImtkluiT6Iv+U6syiCs5m4xt+esrKT/52x6vyBsI+8K50yab8CwJS2wef9axue7wvIc99aUIlRzKqVYV3nIimz3eZ23mkMVndWYvJX1/KprMc8vzPS0AxTTYX+qTkWHrN8xv7gyynkCo2R3KbtbUhPWE0cPbQb6JyoK3w/FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 213.61.166.92) smtp.rcpttodomain=amazon.com smtp.mailfrom=opensynergy.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensynergy.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 213.61.166.92)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensynergy.com;
Received-SPF: Fail (protection.outlook.com: domain of opensynergy.com does not
 designate 213.61.166.92 as permitted sender) receiver=protection.outlook.com;
 client-ip=213.61.166.92; helo=SR-MAIL-03.open-synergy.com;
From: Peter Hilber <peter.hilber@opensynergy.com>
To: virtio-comment@lists.linux.dev
Cc: Peter Hilber <peter.hilber@opensynergy.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>,
	Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>
Subject: [RFC PATCH v4 5/5] virtio-rtc: Indicate leap seconds and clock performance
Date: Wed, 22 May 2024 19:00:03 +0200
Message-ID: <20240522170003.52565-6-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522170003.52565-1-peter.hilber@opensynergy.com>
References: <20240522170003.52565-1-peter.hilber@opensynergy.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A8:EE_|BEVP281MB3598:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c99c9edf-cd9f-4b38-543b-08dc7a80c8a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pyl/+wB0Io5ewMihbduFyuQcOofOBQXXelsBxC9qq3EhU96YVwVtT6QmlumR?=
 =?us-ascii?Q?o+/nUIJqIeCBy+m466DVElu7/mKGdRfZ95DDdRt7Q8Ey0Pq1UkHPk6LZPuVc?=
 =?us-ascii?Q?z7WtVYfw6+Ruq8irt1TLOb5z066+8q4edHn/wNn91pOvtv3A/1OQKpRcBQKh?=
 =?us-ascii?Q?fq3Y2VL7ELje8DfgacLzqlzMxpjfCtzBRXSwpi0tRbi9DswgmR94dpeXAdDu?=
 =?us-ascii?Q?3Wpv0mH7CqmI8b0/2bDuV2sNE2Pv0PwJGK9djjWISlFMCeHkLbzlAL8YUO0r?=
 =?us-ascii?Q?x2PAGMHBt1W2cAOEY8vO+X48N1eBHoDvZK11H/xi8CThQyg224uzThUhoguF?=
 =?us-ascii?Q?mOIDUJtWpiD0vMaEYpGFtEDWMZWsf3I4M+QIQ43DGx+tmkRZSE+Ho/MA7Mfv?=
 =?us-ascii?Q?O/oU/hNV7YFBh/4SE/Pcktq5rRU+uXcsoKMGvLMqEW9DvqJnUK1NF0jt49RW?=
 =?us-ascii?Q?WrBBeHr4p/vyqU77rTKkMNAW7pqJSraSawnI6ap8MUGBwGDC99+MZjYHnc7k?=
 =?us-ascii?Q?USTHceHjTW5NZwgG+ghcKetBBBa6mHWQq7PAYfzFk2abjDiWX5BnDE93K9+K?=
 =?us-ascii?Q?KtieUJyeOOD6PCYHyav6ikEZa9MUdPKN4HTpsO9SbschjTjvP51co7I/5/zE?=
 =?us-ascii?Q?YZ2pWSg2eo+vjwd4aCmvz6KNsY4GfrvDWkImQH5WXAfDQ/aLpoTp2dImniwy?=
 =?us-ascii?Q?6toTNCkXthl0rB5csB4TDp0GYhv3rqpBV0syyhvB21B+LbhduR0YqJ+Ob3Oq?=
 =?us-ascii?Q?UfaAyu2/mRybaY7EBMF3fWSBQxyYqLEZAjs7HAoy0V5Vl6dJBi+ANQ4NBTus?=
 =?us-ascii?Q?ZRhuMxWFdSkxaEubPVZwtmijb5P50DnMrR03EpluF0IF8zD069TymWnIdekc?=
 =?us-ascii?Q?7LsG5iT0amGPUah3Pm7BOF1rW1qp+rHlP6fxMJ+3oUwB/yaLUx8jXZO5LAH5?=
 =?us-ascii?Q?9IzyMrcVba9hejWUei8IfnHTsnsUoXQAJN8p9mWWCeCPyyIsKx6f72ZvTFP7?=
 =?us-ascii?Q?tSUq7UXlaeAjy9HVgYiJggtL+vxwwkST7tA5x12NWFDfzHpI5aVVIeUpM1Hi?=
 =?us-ascii?Q?jrTOt6syG8l9PW12Z6/Mibdk7Mu2vt4v9+wV5lPmxYbe+dsDRlZ6LNXqAqtD?=
 =?us-ascii?Q?/CITyAnCLP7YPmKeiPmMNoek8/W7QGdpPQ3hEFfEcyFu5Y/w5cu1uFRhesRc?=
 =?us-ascii?Q?02a2BafpdZoj0Fq6cDSj1xWI2VkujDtWQ8SFKLQpnRW2rqc5y7Oue89dniI9?=
 =?us-ascii?Q?BFRNeaitQ9QYSkK0ThGNnOpYJ6qPX8pZzoQy+3xRgUajIefOa9DDWoFtjrTs?=
 =?us-ascii?Q?o4C/bzRwzvYemylDTrWgc4zu?=
X-Forefront-Antispam-Report:
	CIP:213.61.166.92;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:exchangeconnector.opensynergy.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:01:11.9536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c99c9edf-cd9f-4b38-543b-08dc7a80c8a3
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[213.61.166.92];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEVP281MB3598
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28404.001
X-TMASE-Result: 10--21.941300-4.000000
X-TMASE-MatchedRID: MkiWYsDskLbeh+8ysVj6+nQK0rQOCABeJ/4tLvLYXKRNbINBwEGUTdmf
	OvGYKiTYVk9DqnTjHCo2U+LJPyEBMPn9b+9cQLCkQn2yf4mJaLj0UV/ZiG4vL4kWhfwArNwD2TY
	wIQ1PBzvaJrCAW8AFlHuQPe95jstz8TtGogaP+hRGDXkz8A7dj9ztvqTn5fr3MCyfT2VAUIWbtZ
	hmdNq7fsTIlMaEuOS48sle9rUnxemogyEnO5gz+sxxAYHyfn4eoJ9fUBwJTszS/h9BB4Z80z/m+
	VkiqiersoJqYeYCXpWRTRwpjWZ4ayd0YtbvE2Wa1yM2vzRKo5Ueshpj+MTh86loHyDFpaEsn78+
	rslXsyftsC3qXuzsthtvw3tIuzZ3x76wsNdk8j6eKdOylUhP2RdZNq3uNiINx38lKQe4nRcq1rs
	Ou4oISZCIT7u48D3vGyo5Wk6spRujkdSO9oiZzNIvcEdJ714mHCvksspRd47loshKYmxDJbDtns
	W5p0yX9M5dGmDxlmzMEGZPh92YKOOJ7xlnyEhz1E/oD1SCaPfUwn9kJ2LfxeMwuXDh5T3xf2UTL
	gTj3e3EfF85JpQVy/Vwv9obTX/T64acMYuwi89CPQBD3xA/3aryV/2jRq/XEgg3cwDHl/384pQl
	Upw+SMNfdRV2r13Sj7lXNgfN/EY58Sarp97J8yUIayx+Skid
X-TMASE-XGENCLOUD: 5cb30dd0-4e23-4b47-bc25-0159df079d04-0-0-200-0
X-TM-Deliver-Signature: A44569BF7190EB19D29A17F45D299E5F
X-TM-Addin-Auth: RRHrHkZ/mv1en9f1Itoa6IPQEy2Ssqh2QGHxKc6J89wEkuXXAnDi0sU/u7c
	IX9RTm4GfMXHHRi4/DdyRlioz84XMje7w6hCumuD+goU7qCkzOhvGVLRgJDcArH3jdT8eib1tH0
	jrOoOTVW8QATP6Jxt4cbqAP3FyMLiMs7VTTcCnPt8tDfHq+1G7eotyWBGX6F1qn44zAEdqMv3pH
	1MKI1CsVJ65crxyMAIUSF/fBy6X3zOOJ7U4D92ZuksJPG3/jvrvmjY69PEilvg4/fhkQRMxBiuT
	lhUnSbBYcU06PZY=.B+cRhbpDCfngDto1osj5Qn4tqUxNRMDXVYbvmhhVgNrwi/kc53fADb45N/
	Jq2csVMCUbW/xnx13CTsI2TFs8EFt3F1YXZ/CgtBks5Josp5ryyFtyprb8/Z/tPi0gCd9lzSMu7
	vCUk+8dVeQl1KW1taE0Hi4Id9qrKRUOWGeoCRmfZWz51QDzxtkCrrk9m5EuaP6ibd9YDRlxRKuC
	FE705V6wsxiKi/12doY/eBjhNC3y7nNWpGMSaLs/wCJ5HD/JbRfQDRxWudceqRrz7jbuDZAMl82
	zWYsGcqbfHqHjQcUL5/4fKuOhJdmbaAKhJGAamnZDAOgjhkRwBbVZsWzpcA==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1716397275;
	bh=Z5nhWTRVSykI5oDTRthRKsVJZ3AMjNBu/LXI6YdOuxQ=; l=17802;
	h=From:To:Date;
	b=xs9hLzVxDwxOrWob/y1GyjLMtubyPoRg2d5rVhB+yIDwaHJ4VLSt/Q/LJ5MG1FZK0
	 82tbyha17ybOjN+DYbc5jouisdoTj2cRHAYN4WySNv+ga81JRj8Lttmmtqg9jDlEG/
	 r/IoVem9VTxpRy+ROnkoGkc8nqehh/9tp45KCOqD7+NjE9kD2jn5bVDi3a778eB9hQ
	 oiGy2i8rxXef8P2dgbldGuHnVE+x9rcIWSkxEtJmgakecgY87Hx5lrvBPZ7VW+HZ1O
	 12skVCeZAXSMKtL6PVAo/EIapn9fprDMiDkCWMTgXpFWDFEYt+8VUDYgN+yb6oumt5
	 Dc/oMFP+BYpEg==

This adds the following capabilities:

1) Distinguish UTC clocks from UTC-like clocks with leap smearing.

2) UTC leap second and TAI offset indication for cross-timestamps.

3) Clock performance information for cross-timestamps.

This is a backwards incompatible change and as such only presented in a
separate patch for now to ease reviewing.

These additions are an outcome of a Linux kernel mailing list discussion
[1], which took place while the virtio-comment mailing list was
unavailable.

As per [2], UTC leap seconds may be abolished in the medium-term future.
The spec does not address this explicitly and drivers which care about it
are assumed to know after which date no more leap seconds can be expected.

Normative requirements for 2) and 3) still need to be added.

[1] https://lore.kernel.org/lkml/61364452-bdf5-4bd8-adb1-a9e6236c9d26@opensynergy.com/
[2] https://www.bipm.org/en/cgpm-2022/resolution-4

Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---

Notes:
    v4:
    
    - Distinguish UTC clocks with and without leap smearing (David Woodhouse) [3].
    
    - Add UTC leap second and TAI offset indication (David Woodhouse) [3].
    
    - Add clock performance information (David Woodhouse) [3].
    
    [3] https://lore.kernel.org/lkml/61364452-bdf5-4bd8-adb1-a9e6236c9d26@opensynergy.com/

 device-types/rtc/description.tex | 301 +++++++++++++++++++++++++++++--
 1 file changed, 286 insertions(+), 15 deletions(-)

diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
index 8fbeef33fac9..6fb19f9db022 100644
--- a/device-types/rtc/description.tex
+++ b/device-types/rtc/description.tex
@@ -263,8 +263,9 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
 struct virtio_rtc_resp_clock_cap {
 	struct virtio_rtc_resp_head head;
 	le16 type;
+	le16 subtype;
 	u8 flags;
-	u8 reserved[5];
+	u8 reserved[3];
 };
 \end{lstlisting}
 
@@ -279,8 +280,10 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
 \end{lstlisting}
 
 VIRTIO_RTC_CLOCK_UTC uses the UTC (Coordinated Universal Time) time
-standard. The device uses the time epoch of January 1, 1970, 00:00
-UTC. This is the same epoch as \emph{Unix time}.
+standard. The device uses the time epoch of January 1, 1970, 00:00 UTC.
+This is the same epoch as \emph{Unix time}. For VIRTIO_RTC_CLOCK_UTC,
+the clock \emph{subtype} specifies whether the clock fully adheres to
+the UTC standard w.r.t.\ leap seconds.
 
 VIRTIO_RTC_CLOCK_TAI uses the TAI (International Atomic Time) time
 standard. The device uses the time epoch of January 1, 1970, 00:00
@@ -290,9 +293,62 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
 subdivisions) since some unspecified epoch. The VIRTIO_RTC_CLOCK_MONO
 epoch is before or during device reset.
 
-Additional clock types may be standardized in the future.
-Implementation-specific clock type definitions are not recommended and
-use a clock type id greater than or equal to 0xF000.
+The \field{subtype} field identifies the clock subtype. The clock
+subtype provides additional information about the clock behavior. The
+following clock subtypes are defined:
+
+\begin{lstlisting}
+#define VIRTIO_RTC_SUBTYPE_STRICT 0
+#define VIRTIO_RTC_SUBTYPE_SMEAR 1
+#define VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR 2
+#define VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED 3
+\end{lstlisting}
+
+VIRTIO_RTC_SUBTYPE_STRICT means that the clock fully adheres to the
+clock type's time standard (or to the clock type's time scale, if the
+clock type does not refer to a time standard). This is the only subtype
+for clocks which are not of type VIRTIO_RTC_CLOCK_UTC.
+
+For clocks of type VIRTIO_RTC_CLOCK_UTC, VIRTIO_RTC_SUBTYPE_STRICT
+means:
+
+\begin{itemize}
+\item The clock fully adheres to the UTC standard.
+
+\item The clock will observe positive and negative leap seconds as
+	announced by standard bodies.
+
+\item At the start of leap seconds, the clock steps accordingly.
+\end{itemize}
+
+For clocks of type VIRTIO_RTC_CLOCK_UTC, the following additional
+subtypes are also defined:
+
+\begin{itemize}
+\item VIRTIO_RTC_SUBTYPE_SMEAR deviates from the UTC standard by
+	smearing time in the vicinity of the leap second, in a not
+	precisely defined manner. This avoids clock steps due to UTC
+	leap seconds.
+
+\item VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR is similar to
+	VIRTIO_RTC_SUBTYPE_SMEAR, except that the smear is precisely
+	defined as a linear smear from noon prior to the leap second
+	until noon after the leap second.
+
+\item VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED may deviate from the UTC
+	standard w.r.t.\ leap second introduction in an unspecified way
+	(leap seconds may, or may not, be smeared).
+\end{itemize}
+
+In the following, \emph{leap smearing clock} designates any clock of
+subtype VIRTIO_RTC_SUBTYPE_SMEAR, or
+VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR.
+
+Additional clock types, and clock subtypes, may be standardized in the
+future.
+
+Implementation-specific definitions of clock type, and clock subtype,
+are not recommended and use ids greater than or equal to 0xF000.
 
 The \field{flags} field provides the following information:
 
@@ -343,11 +399,52 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
 \devicenormative{\paragraph}{Control Requests}{Device Types / RTC Device / Device Operation / Control Requests}
 
 For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST use the UTC
-time standard (Coordinated Universal Time).
+time standard (Coordinated Universal Time), except as per the following
+requirements.
 
 For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST use the time
 epoch of January 1, 1970, 00:00 UTC.
 
+For any clock of type VIRTIO_RTC_CLOCK_UTC and subtype
+VIRTIO_RTC_SUBTYPE_STRICT, the device MUST apply a positive leap second
+according to the UTC time standard by instantaneously stepping the clock
+backwards by 1 s at the start of the leap second.
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC and subtype
+VIRTIO_RTC_SUBTYPE_STRICT, the device MUST apply a negative leap second
+according to the UTC time standard by instantaneously stepping the clock
+forward by 1 s at the start of the leap second.
+
+For any leap smearing clock, the device MUST NOT step the clock due to a
+leap second.
+
+For any leap smearing clock, on a positive leap second, the device MUST
+slow down the clock during part of the day containing the leap second
+and/or part of the day after the leap second.
+
+For any leap smearing clock, on a negative leap second, the device MUST
+speed up the clock during part of the day containing the leap second
+and/or part of the day after the leap second.
+
+For any clock of type VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR, on a leap
+second, the device MUST change the frequency of the clock exactly from
+noon prior to the leap second until noon after the leap second.
+
+For any clock of type VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR, while
+changing the frequency of the clock due to a positive leap second, the
+device MUST decrease the frequency of the clock by $1/86400$.
+
+For any clock of type VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR, while
+changing the frequency of the clock due to a negative leap second, the
+device MUST increase the frequency of the clock by $1/86400$.
+
+For any leap smearing clock, the clock MUST correspond to UTC again at
+the latest at the end of the day after the leap second.
+
+For any clock of type VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED, the device
+MAY deviate from the UTC standard with respect to leap second
+introduction.
+
 For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the TAI
 time standard (International Atomic Time).
 
@@ -364,12 +461,172 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
 one of the clock types defined in this specification, or to a value
 greater than or equal to 0xF000.
 
+For VIRTIO_RTC_REQ_CLOCK_CAP, the device MUST set \field{subtype} to one
+of the clock subtypes defined in this specification, or to a value
+greater than or equal to 0xF000.
+
+For VIRTIO_RTC_REQ_CLOCK_CAP, and clock types other than
+VIRTIO_RTC_CLOCK_UTC, the device MUST set \field{subtype} to
+VIRTIO_RTC_SUBTYPE_STRICT.
+
 For a VIRTIO_RTC_REQ_CROSS_CAP message M, the device MUST set the
 VIRTIO_RTC_FLAG_CROSS_CAP flag in the \field{flags} field if the device
 would respond to a VIRTIO_RTC_REQ_READ_CROSS message with the same
 \field{hw_counter} and \field{clock_id} values as in M with status
 VIRTIO_RTC_S_OK, and clear the flag otherwise.
 
+\subsubsection{Data Structures}
+
+This section describes reusable data structures.
+
+\paragraph{UTC Specific Data}\label{sec:Device Types / RTC Device / Device Operation / Data Structures / UTC Specific Data}
+
+For clocks of type VIRTIO_RTC_CLOCK_UTC, the device reports information
+about impending and ongoing UTC leap seconds, and about the current UTC
+offset from TAI, through \field{struct virtio_rtc_data_utc}. This
+information applies to the clock reading to which the struct is
+associated to.
+
+\begin{lstlisting}
+struct virtio_rtc_data_utc {
+	le64 tai_offset;
+#define VIRTIO_RTC_LEAP_NONE 0
+#define VIRTIO_RTC_LEAP_PRE_POS 1
+#define VIRTIO_RTC_LEAP_PRE_NEG 2
+#define VIRTIO_RTC_LEAP_POS 3
+#define VIRTIO_RTC_LEAP_NEG 4
+	u8 leap;
+#define VIRTIO_RTC_FLAG_SMEAR (1 << 0)
+#define VIRTIO_RTC_FLAG_TAI_OFFSET (1 << 1)
+	u8 flags;
+	u8 reserved[6];
+};
+\end{lstlisting}
+
+\subparagraph{Leap Second Indication}
+
+For subtype VIRTIO_RTC_SUBTYPE_STRICT, the \field{struct
+virtio_rtc_data_utc.leap} field indicates whether a positive or negative
+leap second will be introduced at the end of the month resp.\ whether a
+leap second is currently in progress.
+
+For a leap smearing clock, the \field{leap} field indicates whether a
+leap smear will start around the next turn of the month resp.\ whether
+the leap second is currently being smeared into the clock.
+
+VIRTIO_RTC_LEAP_NONE indicates that the clock is currently not
+performing leap second related processing, and also not pre-announcing
+an impending leap second.
+
+VIRTIO_RTC_LEAP_PRE_POS resp.\ VIRTIO_RTC_LEAP_PRE_NEG pre-announce a
+positive resp.\ negative leap second. Pre-announcing starts at the
+earliest at the 17th day of the month including the leap second.
+
+For VIRTIO_RTC_SUBTYPE_STRICT, VIRTIO_RTC_LEAP_POS indicates that a
+positive leap second is in progress.
+
+For a leap smearing clock, VIRTIO_RTC_LEAP_PRE_POS resp.\
+VIRTIO_RTC_LEAP_PRE_NEG indicate that the clock is currently slowed down
+resp.\ sped up in order to smear the leap second into the clock.
+
+In field \field{flags}, VIRTIO_RTC_FLAG_SMEAR indicates whether a leap
+second would be, or is being, smeared into the clock, rather than being
+inserted according to the UTC standard.
+
+A clock of subtype VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED can set
+\field{leap} to VIRTIO_RTC_LEAP_NONE regardless of the clock's actual
+leap second state. For clocks of subtype
+VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED, the VIRTIO_RTC_FLAG_SMEAR flag is
+only guaranteed to be correct while \field{leap} is not
+VIRTIO_RTC_LEAP_NONE.
+
+\subparagraph{TAI Offset}
+
+The \field{struct virtio_rtc_data_utc.tai_offset} field indicates the
+offset of the clock from the TAI standard, in the form
+$\mbox{tai_offset} = \mbox{TAI} - \mbox{UTC}$. The offset unit is ns.
+The offset is an integer multiple of a billion ns, i.e.\ corresponds to
+whole seconds, except while the clock is being smeared.
+
+If flag VIRTIO_RTC_FLAG_SMEAR is set, and field \field{leap} equals
+VIRTIO_RTC_LEAP_POS, or VIRTIO_RTC_LEAP_NEG, the offset from TAI does
+not correspond to whole seconds.\footnote{This keeps the impact of the
+	leap second insertion on the UTC offset from TAI unambiguous for
+	every sample of \field{struct virtio_rtc_data_utc}.}
+
+The \field{tai_offset} field is interpreted as a signed integer in
+little-endian, two's complement, representation.
+
+In field \field{flags}, VIRTIO_RTC_FLAG_TAI_OFFSET indicates that the
+TAI offset is valid. The device may only clear this flag for clocks of
+subtype VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED.
+
+\paragraph{Clock Performance Information}\label{sec:Device Types / RTC Device / Device Operation / Data Structures / Clock Performance Information}
+
+The \emph{clock performance} describes the difference between clock
+readings obtained by the driver from the device, and clock readings
+obtained from an ideal clock. Through \field{struct virtio_rtc_perf},
+the device reports the clock performance. \field{struct virtio_rtc_perf}
+describes the performance of a particular clock reading obtained by the
+driver.
+
+\begin{lstlisting}
+struct virtio_rtc_perf {
+	le64 freq_max_error;
+	le64 freq_est_error;
+	le64 phase_max_error;
+	le64 phase_est_error;
+#define VIRTIO_RTC_FLAG_SYNCHRONIZED (1 << 0)
+#define VIRTIO_RTC_FLAG_FREQ_MAX_VALID (1 << 1)
+#define VIRTIO_RTC_FLAG_FREQ_EST_VALID (1 << 2)
+#define VIRTIO_RTC_FLAG_PHASE_MAX_VALID (1 << 3)
+#define VIRTIO_RTC_FLAG_PHASE_EST_VALID (1 << 4)
+	u8 flags;
+	u8 reserved[7];
+};
+\end{lstlisting}
+
+Flag VIRTIO_RTC_FLAG_SYNCHRONIZED in field \field{flags} indicates that
+the device considers the clock synchronized as per the clock type and
+clock subtype requirements. In case of VIRTIO_RTC_CLOCK_UTC, flag
+VIRTIO_RTC_FLAG_SYNCHRONIZED also indicates that the clock is
+synchronized w.r.t.\ the information in \field{struct
+virtio_rtc_data_utc}, as per the clock subtype requirements.
+
+Other fields indicate the accuracy of the clock. Flags indicate whether
+this information is valid.
+
+The clock \emph{frequency error} is the (absolute) drift rate of the
+clock w.r.t.\ the clock type and subtype definition.
+
+Field \field{freq_max_error} is an upper bound to the frequency error of
+the clock. Field \field{freq_est_error} is the device's point estimate
+of the frequency error.
+
+The unit of the \field{freq_max_error} and \field{freq_est_error} fields
+is ppm (parts per million) with a 44-bit fractional part (a field value
+of 1 corresponds to $2^{-44}$ ppm).
+
+The device sets the flag VIRTIO_RTC_FLAG_FREQ_MAX_VALID resp.\
+VIRTIO_RTC_FLAG_FREQ_EST_VALID to indicate that the value of the
+\field{freq_max_error} resp.\ \field{freq_est_error} field is valid.
+
+The clock \emph{phase error} is the absolute value of the offset of the
+clock to an ideal clock according to the clock type and subtype
+definition.
+
+Field \field{phase_max_error} is an upper bound to the absolute offset
+of the clock from the clock type and subtype definition. Field
+\field{phase_est_error} is the device's point estimate of that absolute
+offset.
+
+The unit of the \field{phase_max_error} and \field{phase_est_error}
+fields is 1 nanosecond.
+
+The device sets the flag VIRTIO_RTC_FLAG_PHASE_MAX_VALID resp.\
+VIRTIO_RTC_FLAG_PHASE_EST_VALID to indicate that the value of the
+\field{phase_max_error} resp.\ \field{phase_est_error} field is valid.
+
 \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Operation / Read Requests}
 
 Through \emph{read requests}, the driver requests clock readings from
@@ -392,8 +649,6 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
 	best frequency estimate.
 \end{itemize}
 
-E.g., a clock of type VIRTIO_RTC_CLOCK_UTC can insert UTC leap seconds.
-
 As long as a clock does not jump backwards, the driver clock readings
 increase monotonically:
 
@@ -458,6 +713,11 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
 	struct virtio_rtc_resp_head head;
 	le64 clock_reading;
 	le64 counter_cycles;
+	union {
+		u8 reserved[16];
+		struct virtio_rtc_data_utc utc;
+	} type_data;
+	struct virtio_rtc_perf perf;
 };
 \end{lstlisting}
 
@@ -492,6 +752,23 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
 VIRTIO_RTC_REQ_READ_CROSS for a specific clock and \field{hw_counter}
 through VIRTIO_RTC_REQ_CROSS_CAP.
 
+The field \field{type_data} is a union of clock type-specific extra
+information:
+
+\begin{enumerate}
+
+\item For clock type VIRTIO_RTC_CLOCK_UTC, field \field{type_data.utc}
+	provides information as per
+	\ref{sec:Device Types / RTC Device / Device Operation / Data Structures / UTC Specific Data}.
+
+\item For other clock types, all elements of field
+	\field{type_data.reserved} are 0.
+
+\end{enumerate}
+
+The field \field{perf} provides clock performance information as per
+	\ref{sec:Device Types / RTC Device / Device Operation / Data Structures / Clock Performance Information}.
+
 \end{description}
 
 \drivernormative{\paragraph}{Read Requests}{Device Types / RTC Device / Device Operation / Read Requests}
@@ -505,12 +782,6 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
 The device SHOULD continuously support reading of all clocks once
 DRIVER_OK has been set.
 
-For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MAY insert UTC
-leap seconds.
-
-For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MAY smear UTC
-leap seconds through clock slewing.
-
 For any clock C and read requests \emph{A} and \emph{B} which read C,
 \emph{A} being the message which the driver marks as available before
 \emph{B}, the device MUST obtain the \field{clock_reading} value for the
-- 
2.43.0

