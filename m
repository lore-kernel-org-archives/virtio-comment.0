Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947692B9C3
	for <virtio-comment@lists.linux.dev>; Wed, 22 May 2024 17:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716398590; cv=fail; b=VM6EZJIdm8ClOB4UR+HsAEN0pjGOZQMnBWJs1Pcs15XrAB8l/dG7pfOPdta5SPQa1U5RHOWByYMAXabCnnipMLE4Lay1SQATTxok9o2OTBFPHA1CMCwkefBGuEtE23vvsLMNW0H6B7oCXiYO6HJ83j0hyCnpPF+SYXmUx5qqQyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716398590; c=relaxed/simple;
	bh=TtZRFG9r7t/KfQZip3qH2x15sreWovPeXQKxFP9YAhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=baelCJbiDwS4Qdv5TOC7yQPRHdVwVVDsljmxupCpb17Ci4gsBpxLQqmOV2lqWK9RjZMXY2y7sUdzY3u+Y14B/mg2zFebT0cTqxDYRF+R0jsFjznC3VYKy061OuYsFHpVJcikC9S8Y0tPk+AUlYovyLXR7iQg3GlCUB/P6BDD7O8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=Q9qmYOa0; arc=fail smtp.client-ip=18.185.115.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="Q9qmYOa0"
Received: from 104.47.7.168_.trendmicro.com (unknown [172.21.10.202])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id 4F27C100547F7
	for <virtio-comment@lists.linux.dev>; Wed, 22 May 2024 17:01:21 +0000 (UTC)
Received: from 104.47.7.168_.trendmicro.com (unknown [172.21.199.142])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id C07D71000045C;
	Wed, 22 May 2024 17:01:13 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1716397272.907000
X-TM-MAIL-UUID: 0c6f486a-56af-4c45-879d-1e12118fabc7
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.168])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id DDB6610002BA1;
	Wed, 22 May 2024 17:01:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HC3gijnQtbfaH50+ZrEbTnj+nuZ7gbiy0AjJVi2+bNaAEH/UK5wh2De5xO+9fr5/DdEDLsBGn0TLRssNhNfQoVK5wZJitgTikBegyL2EctBafGdkJN76yQfdSeGfn+nhOHw5//zfZGmm2mnAq5meL8NFDW7WKykCWYY9Uso0VwFE1p4SyWF2XO5wm+Asz+FVBlZmKW8WLZYy5Y+dQDgGy4eB92+6KCeZHyejopp3sq6yjRtZtkTkJDCaEqVZARXB1TsrEZ5wwFYnbuiRsIqhd+Wt+FLM3Ct7/rS4Hfnq5grZdamA7QT/xsyV3BxMsTTZhgAJpi2wQZNqRxI3+HPTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzE+j/WpYWpemUuugy1iJIFb7jC3aC7jHI0yEca3f3k=;
 b=nxZw6MoPDKD5eFdW9lfwYDxqCcEMNTj5yFkd+nzcE3G2OLPsozoaxJl+j9MGqr8KOEI+WhIa/Vb3ENix/mllLjqurg0RtDqh9zgz/9fNJ+t1lAMkG+W+1vok1y4GDOcPdkFntjxubjz1IDwuOlOgfiy9HOv5phUxJGDE0fAxOfblJG+PSli+kMf6D8k1w/oz+aJpsvVzJET8YlY9HcpSO/OX8Da7wOkC8crtEUrxG3OTIckY0De+8IjF7HnVe+aD9GIAZ0Atqp2ZWbsrHMg78iZnt7JtMALw0liUjnr2hEtsqD6cv4XZ9zKdA4LDw+sla26d54ykj9YIBltH8lgH+A==
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
Subject: [RFC PATCH v4 3/5] virtio-rtc: Add alarm feature
Date: Wed, 22 May 2024 19:00:01 +0200
Message-ID: <20240522170003.52565-4-peter.hilber@opensynergy.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A63:EE_|FR2P281MB3322:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e603729f-5d03-43d3-33ac-08dc7a80c828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0EAi11gbS6JP89XGApq/fz4N+nhE8htL/OYPLOeeQHcTVo8715yCb1m8jIYu?=
 =?us-ascii?Q?Y3TwYzNLwR7mEsoeqau2wSDw9+YmwAlrg5IpUpghBX26dWpKrBxWkF6N4M0i?=
 =?us-ascii?Q?vgP7psMgnDP5pLtseTUk9EjQHUNTbmCy1KBxSR6yOXCIucj1A1nggnQIC8xd?=
 =?us-ascii?Q?kkvEaonc39qcRmWY2CrB5scTJI6I10YE6GMU05JFW9Ls1lszPxKmXR/L9mx+?=
 =?us-ascii?Q?1Pb2mK53mtR5hC7kRHK1C81xxE8RX/vUNa0Rru+4FwRjjz8BGj6H4OdAFH8J?=
 =?us-ascii?Q?X9XmMIISeZvoPNoo4Snt2N7wJidpSHgs+bGczDFnp6Rl6eggESDJLDahutLe?=
 =?us-ascii?Q?/5Mpss4tOIRhumpaL7tu3qh/qNUX/ujmsNeHy30fkH1h8NAniApQPXZeWeTT?=
 =?us-ascii?Q?CKWklrNSYy0sDEDtLhIbvUm1s4W4+BXpfbff2ewmIAE2GwFbMOtHlaipbkDX?=
 =?us-ascii?Q?1WTwoG6qpLk5UPryuHSJlNRpbvw/KLxiubTQy8eX/lyDIErfN/olPqBOS3Tx?=
 =?us-ascii?Q?flF7ySf9gmtQNoL6JylvE6e3+xakZDGijaS9O0IYmQGhLB20EuZY8WoE4dVJ?=
 =?us-ascii?Q?n7CE2Z3fG9RORYh/3b9Jwc8KahJYWOhgrABnEgv0KATPSYAPPyYtDqWcJf3i?=
 =?us-ascii?Q?gp4BFMaleM7RKo0QvHxvKJmW/OWwNe4qW/Y1n4PLsnOM1O4ua+1sBLxuo+Xk?=
 =?us-ascii?Q?LegDSFSCDUZhOdO7h1f/4X7Nh7PDkJa+qNoUCh/LEHInRN9H2qh/pmBtcTAv?=
 =?us-ascii?Q?8qSMKRNOe15JB8gnZsGJv7SQafHJuuw4v60X+pyzhJj9ZlmwOPFWTpf6IPNG?=
 =?us-ascii?Q?L2eplJsfgBACoPgE9dCcLTyDylC80JXfShxn5E5r6uEXD4GSR7MgbtaBElQI?=
 =?us-ascii?Q?sbIiSD/9HFTCC1qeYrTJ9o7zCNFXbMvy/bhmi02/PCK0IqqcAOmktihW+FRY?=
 =?us-ascii?Q?FV8K8Jw3TtUA0UvQed9tN8xXg8rQTLt85lZAr0ICC1BuHcxza9vuXB2/yEO0?=
 =?us-ascii?Q?hpfBtHd2KUVaNVwzg05iiOyWui4RZiy4HtdURMYkGGRfcBSq3MeOzvzUKOpe?=
 =?us-ascii?Q?UM00N5D+h5IhK9OdS8BHGvyeoyRiNHZpg/2jBMQo2ZuruafBMxeGgjriKdMP?=
 =?us-ascii?Q?QBjKXJebuTQ2V8QbRmtPY84txhI09WlqboFvQEO01SG7bgL9GDuz9GbUP4HE?=
 =?us-ascii?Q?TjR6nyzPkPow9sIaNZe5K+bprKET+EOSApfTr3crqfA5Pnc33LTBUdk23i/e?=
 =?us-ascii?Q?OTlxAd1/sldNmqnUX2oKyX10KQrBqZ63mcKAb9dnZiIBNJ3OukDCibP0oqPD?=
 =?us-ascii?Q?xWHGGEFK15DBTK0HgMIwCLI2?=
X-Forefront-Antispam-Report:
	CIP:213.61.166.92;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:exchangeconnector.opensynergy.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:01:11.1466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e603729f-5d03-43d3-33ac-08dc7a80c828
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[213.61.166.92];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB3322
X-TM-AS-ERS: 104.47.7.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28404.001
X-TMASE-Result: 10--22.095900-4.000000
X-TMASE-MatchedRID: LY6HjhYj/TPJ+P2VFrJmrBbadjTjVCQ24DiXvcLDKwuIZUCmJEsCuUDN
	lSh+G0vIiCuBf98exq7esJx0oFjO4NqrIn92h9L3eJchdZcr1K3vzXgPRwNu0B7CPn3+tzaEPxR
	iBB02P1cYXZOLopHn4GejsuWuS2nw87Im02sian669rtClqkCjZ7EkV3V/yv7csOkoQh1Pwx3UJ
	KTMcVBiOzUC9+2W8CHRWN2IR/iv8+t12LbDh9v0EWDYc7mWY0QF1k2re42Ig1ZAxLqWp9+D7HqN
	6eNokKxn1IfI2NnneKNUuh1vLJYxRH4pydzeozMQjrfrUI7pWmf5QQnTNDZEYVipFVugr/K0MUf
	darQd6LctDgGdwoFOI+tQ9u5woUYGiJ4I7J4zqjcMvZsE7nbYkme994bpEkstvxIJM7kv16Lm/r
	QN55onelxZHZVAiMggx2a4JE3RLu4awZCWKsFg3CsYPZqiMp3niPX6uESJu+sgvpEIQtg4iBrX+
	XsDus6bnsgetWvbfOclhGh7cZ3bhw/umn41b2EVkHd5sq6oNmJXeoHaUjxA5rRt2Cq27mEt1APv
	eIASG1x0F5IBIAk7AxZ/dca3At7Q9+IanyVC55CPQBD3xA/3aryV/2jRq/XEgg3cwDHl/384pQl
	Upw+SHCG1mped4RbJpK4F9wnIiaQZS2ujCtcuA==
X-TMASE-XGENCLOUD: 18a4f063-7914-4c75-b232-2ee861a96ede-0-0-200-0
X-TM-Deliver-Signature: 0145A170FAFDFB413A7A3198C3806DDE
X-TM-Addin-Auth: QpwEAv0nIK8akFnSFe3B9m7bJy2RTJnN/0/7ey3vu5DvM0/dFYBU7z52G+U
	GFJVO/goe7zpOT6/0djK2TGSaNf2+8MNn402tKwSZJ9zooUB/tgHBJpSEDeYvYmXuIBnW54J8ES
	dnsXmaOg4R/pM7y19FP2dAVbnjrnufAuFgtVTMu23BwoWDfHbR39rz9z8JaIZkMbKVptIvdCJBq
	KEOeyFyQEWhSjySccTRoSD53+NOWqpeilA7VJbEpz40x4/QndQoNYD4RhBrn15oJp9dL/Sj2Dmr
	DkOoJ6Wn6zj80kM=.GIIjYs15m8eyXZVI61wrbE7DbH4a7ncjnAejLHKevHirISw6+eKdRvrOvE
	zqcU+KWcs+w5RJhcb7xkYZWRcqAIJb7a1v5MlJD4j0CFZZs1HBsbPCidk06rohtylauPuPENUnW
	2BKegDh9hch1/4HBVs7/TYCjI58NKxcMYbMDAQb2b8bPlCm7oizCpMiO0Bit0j5y35P1D7h7xgn
	E5HBslYyGn6+ZVCwTtFXJ4g3lhwyXmejiVvaTtY4YrBTutDvIN9yrf6qaAR84Wrtz9iceVBbXya
	TgpIiKPi0iuf0Vg8BgA0W4AhmVvGPmJaP6Sy8PZRgxWyS5YrapgZcYeumOQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1716397273;
	bh=TtZRFG9r7t/KfQZip3qH2x15sreWovPeXQKxFP9YAhg=; l=12578;
	h=From:To:Date;
	b=Q9qmYOa0Psj23lT3VmOy8an2YG+gVuQdYbgmERUz8lurSUrALPZeld+xmznebjiAQ
	 /0aWAiDWuJDuo8F/U1J5MzNbdxVfU6dytNN6MRKEAu3icSXFxyQzaRFYDTla4pSLid
	 vxMri7RKrEe5uu1tYBCMSxkbTWajbZiwX5KfiAULTzfkUl5Ojy5k77wbtAdas+sw/W
	 XKX6ACTbUMIO7E70ndFzdOoQJtAekYDz61yCqX6mBvfr2ZoIwqx7DNYPNv0v+lEV38
	 E4+AsLp7wc5jUmik6UUxPQXnwJf19R238SMJiJmEjSOO5+RLUrPc/uKpkm995Q09P/
	 lkM7Rco79kRbA==

Add the VIRTIO_RTC_F_ALARM feature (without normative statements).

The intended use case is: A driver needs to react when an alarm time has
been reached, but the driver may be in a sleep state or powered off at
alarm time. The alarm feature can resume and notify the driver in this
case. Alarms may be retained across device resets (including reset on
boot).

Peculiarities
-------------

Unlike usual alarm clocks, a virtio-rtc alarm-capable clock may step
autonomously at any time: An alarm may change back from "expired" to
"not expired" before the driver has started processing an alarm
notification.

To address the above, and the device resets, define "alarm expiration"
in such a way that the driver always has a chance to react to an alarm,
and make the device always responsible for notifying the driver about an
alarm expiration.

The VIRTIO_RTC_REQ_SET_ALARM_ENABLED request is there so that the Linux
ioctls RTC_AIE_ON and RTC_AIE_OFF only need to emit one request.

Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---

Notes:
    v4:
    
    - Change requirements so that driver can reset alarm to clean slate, and
      document how driver can achieve this (Cornelia Hell, Jason Wang) [1].
    
    - Require device to support all expressible alarm times.
    
    - Formatting and wording improvements.
    
    [1] https://lore.kernel.org/all/2ae67401-a8f5-4686-9321-cb3105df594d@opensynergy.com/

 device-types/rtc/description.tex | 270 ++++++++++++++++++++++++++++++-
 1 file changed, 268 insertions(+), 2 deletions(-)

diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
index 28c1517f3543..8a51a70d615b 100644
--- a/device-types/rtc/description.tex
+++ b/device-types/rtc/description.tex
@@ -4,6 +4,7 @@ \section{RTC Device}\label{sec:Device Types / RTC Device}
 time. The device can provide different clocks, e.g.\ for the UTC or TAI
 time standards, or for physical time elapsed since some past epoch. The
 driver can read the clocks with simple or more accurate methods.
+Optionally, the driver can set an alarm.
 
 \subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
 
@@ -13,13 +14,23 @@ \subsection{Virtqueues}\label{sec:Device Types / RTC Device / Virtqueues}
 
 \begin{description}
 \item[0] requestq
+\item[1] alarmq
 \end{description}
 
 The driver enqueues requests to the requestq.
 
+Through the alarmq, the device notifies the driver about alarm
+expirations. The alarmq exists only if VIRTIO_RTC_F_ALARM was
+negotiated.
+
 \subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
 
-No device-specific feature bits are defined yet.
+\begin{description}
+\item[VIRTIO_RTC_F_ALARM (0)] Device supports alarm.
+\end{description}
+
+VIRTIO_RTC_F_ALARM determines whether the device supports setting an
+alarm for some of the clocks.
 
 \subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
 
@@ -247,7 +258,8 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
 struct virtio_rtc_resp_clock_cap {
 	struct virtio_rtc_resp_head head;
 	le16 type;
-	u8 reserved[6];
+	u8 flags;
+	u8 reserved[5];
 };
 \end{lstlisting}
 
@@ -277,6 +289,15 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
 Implementation-specific clock type definitions are not recommended and
 use a clock type id greater than or equal to 0xF000.
 
+The \field{flags} field provides the following information:
+
+\begin{lstlisting}
+#define VIRTIO_RTC_FLAG_ALARM_CAP (1 << 0)
+\end{lstlisting}
+
+If VIRTIO_RTC_F_ALARM was negotiated, flag VIRTIO_RTC_FLAG_ALARM_CAP
+indicates that the clock supports an alarm.
+
 \item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
 cross-timestamping for a particular pair of clock and hardware counter.
 
@@ -540,3 +561,248 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
 For VIRTIO_RTC_REQ_READ_CROSS and for any clock type listed in
 this specification, the device MUST use the nanosecond as unit for
 field \field{clock_reading}.
+
+\subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Operation / Alarm Operation}
+
+Through the optional alarm feature, the driver can set an alarm time. On
+alarm expiration, the device notifies the driver. On alarm expiration,
+the device may also wake up the driver, while the driver is in a sleep
+state, or while the driver is powered off. How this is done is beyond
+the scope of the specification. The driver can set one alarm time per
+clock, if the clock supports this.
+
+The device may retain alarm times across device resets.\footnote{Drivers
+	may reset the device on boot or on resume from sleep state. It
+	can make sense for the device to retain the alarm time then,
+	similar to other alarm clocks.}
+
+The alarm feature, and the associated alarmq for notifications from the
+device, are available if VIRTIO_RTC_F_ALARM was negotiated. In addition,
+if the driver previously set an alarm time, even if the device no longer
+both
+
+\begin{itemize}
+\item is live and
+\item has negotiated VIRTIO_RTC_F_ALARM,
+\end{itemize}
+
+the device may still execute implementation-specific actions on alarm
+expiration.
+
+An alarm expires
+
+\begin{itemize}
+\item when the associated clock progresses (also: steps) from a time
+	prior to the alarm time to the alarm time, or to a time after
+	the alarm time, or
+
+\item when the driver sets an alarm time which is not in the future, or
+
+\item when the device is reset, if the alarm time is retained and not in
+	the future.\footnote{The device is always responsible for
+	detecting alarm expiration events. This avoids that the driver
+        needs to reason about when it shall poll for alarm expiration.}
+\end{itemize}
+
+When an alarm expires, the driver can disable it. Otherwise, the alarm
+expires each time when one of the above expiration events occurs, even
+if it occurred before.\footnote{This avoids that the driver may
+	miss an alarm when the clock steps backwards after alarm
+	expiration, but before the driver has resumed operation. This
+	also facilitates distinct drivers using the same device,
+	e.g.\ a	driver in the bootloader, and a driver in the OS.}
+
+On alarm expiration, the device executes the alarm actions. The alarm
+actions are:
+
+\begin{itemize}
+\item The device notifies the driver through the alarmq. If the device
+	is not live, or no buffers are available in the alarmq, the
+	device will notify once the device is live and buffers are
+	available.
+
+\item Optionally, the device executes other, implementation-specific,
+	actions. The device may execute those immediately, regardless of
+	the device state.
+\end{itemize}
+
+An alarm expiration becomes obsolete
+
+\begin{itemize}
+\item once the clock jumps backwards, before the alarm time, or
+
+\item once the driver sets an alarm time, or
+
+\item once another alarm expiration event happens.
+\end{itemize}
+
+If an alarm expiration becomes obsolete, it is unspecified which alarm
+actions the device executes for this alarm expiration, and the device
+stops executing these alarm actions after a grace period.
+
+The driver-visible settings of an alarm consist of two elements:
+
+\begin{itemize}
+\item \field{driver_alarm_time}, a valid time for the corresponding
+	clock, and
+
+\item \field{alarm_enabled}, a boolean. While \field{alarm_enabled} is
+	true, \field{driver_alarm_time} is the actual alarm time.
+	While \field{alarm_enabled} is false, the device will act as if
+	the alarm time was in the future, so that the alarm will not
+	expire.
+\end{itemize}
+
+The device supports all \field{driver_alarm_time} values which the
+driver can request through alarm control requests.
+
+Initially, \field{driver_alarm_time} is the epoch of the clock ($0$),
+and \field{alarm_enabled} is false.
+
+Alarms set prior to reset may cause unwanted alarm expiration
+notifications, and information leakage, after the reset. To prevent both
+issues, the driver can do the following after the reset, for each clock
+which supports alarm:
+
+\begin{enumerate}
+\item Send a VIRTIO_RTC_REQ_SET_ALARM message, with \field{alarm_time}
+	set to 0, and \field{flags} set to 0.
+
+\item Wait until the device marks the VIRTIO_RTC_REQ_SET_ALARM message
+	as used, with status VIRTIO_RTC_S_OK.
+\end{enumerate}
+
+To prevent the above issues, the driver also marks buffers in the alarmq
+as available only after completing the above steps for all clocks.
+
+\paragraph{Alarm Control Requests}
+
+If VIRTIO_RTC_F_ALARM is negotiated,
+
+\begin{itemize}
+\item the driver can determine if a clock supports an alarm through the
+	VIRTIO_RTC_FLAG_ALARM_CAP flag in the VIRTIO_RTC_REQ_CLOCK_CAP
+	response,
+
+\item the driver can enqueue the alarm control requests into the
+	requestq: VIRTIO_RTC_REQ_READ_ALARM, VIRTIO_RTC_REQ_SET_ALARM,
+	and VIRTIO_RTC_REQ_SET_ALARM_ENABLED.
+\end{itemize}
+
+The unit of all \field{alarm_time} fields is 1 nanosecond.
+
+\begin{description}
+\item[VIRTIO_RTC_REQ_READ_ALARM] reads the current alarm.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_READ_ALARM 0x1003 /* message type */
+
+struct virtio_rtc_req_read_alarm {
+	struct virtio_rtc_req_head head;
+	le16 clock_id;
+	u8 reserved[6];
+};
+
+struct virtio_rtc_resp_read_alarm {
+	struct virtio_rtc_resp_head head;
+	le64 alarm_time;
+#define VIRTIO_RTC_FLAG_ALARM_ENABLED (1 << 0)
+	u8 flags;
+	u8 reserved[7];
+};
+\end{lstlisting}
+
+\field{clock_id} identifies the alarm through its associated clock.
+Field \field{alarm_time} returns \field{driver_alarm_time}. In field
+\field{flags}, flag VIRTIO_RTC_FLAG_ALARM_ENABLED indicates whether
+\field{alarm_enabled} is true.
+
+\item[VIRTIO_RTC_REQ_SET_ALARM] sets the alarm.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_SET_ALARM 0x1004 /* message type */
+
+struct virtio_rtc_req_set_alarm {
+	struct virtio_rtc_req_head head;
+	le64 alarm_time;
+	le16 clock_id;
+	/* flag: VIRTIO_RTC_FLAG_ALARM_ENABLED */
+	u8 flags;
+	u8 reserved[5];
+};
+
+struct virtio_rtc_resp_set_alarm {
+	struct virtio_rtc_resp_head head;
+	/* no response params */
+};
+\end{lstlisting}
+
+\field{clock_id} identifies the alarm through its associated clock.
+Field \field{alarm_time} sets \field{driver_alarm_time}. If flag
+VIRTIO_RTC_FLAG_ALARM_ENABLED is set in field \field{flags}, the device
+sets \field{alarm_enabled} to true; otherwise, the device sets
+\field{alarm_enabled} to false.
+
+\item[VIRTIO_RTC_REQ_SET_ALARM_ENABLED] sets \field{alarm_enabled}.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_SET_ALARM_ENABLED 0x1005 /* message type */
+
+struct virtio_rtc_req_set_alarm_enabled {
+	struct virtio_rtc_req_head head;
+	le16 clock_id;
+	/* flag: VIRTIO_RTC_FLAG_ALARM_ENABLED */
+	u8 flags;
+	u8 reserved[5];
+};
+
+struct virtio_rtc_resp_set_alarm_enabled {
+	struct virtio_rtc_resp_head head;
+	/* no response params */
+};
+\end{lstlisting}
+
+\field{clock_id} identifies the alarm through its associated clock. If
+flag VIRTIO_RTC_FLAG_ALARM_ENABLED is set in field \field{flags}, the
+device sets \field{alarm_enabled} to true; otherwise, the device sets
+\field{alarm_enabled} to false.
+
+When processing this request, the device retains
+\field{driver_alarm_time}.
+\end{description}
+
+\paragraph{Alarm Notifications}
+
+If the alarmq is present, the driver should make buffers available in
+the alarmq, which the device uses for alarm notification messages. All
+alarmq fields are device-writable. The alarmq uses a common notification
+header.
+
+\begin{lstlisting}
+/* common notification header */
+struct virtio_rtc_notif_head {
+	le16 msg_type;
+	u8 reserved[6];
+};
+\end{lstlisting}
+
+The \field{msg_type} field identifies the message type.
+
+\begin{description}
+\item[VIRTIO_RTC_NOTIF_ALARM] notifies the driver about an alarm
+	expiration.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_NOTIF_ALARM 0x2000 /* message type */
+
+struct virtio_rtc_notif_alarm {
+	struct virtio_rtc_notif_head head;
+	le16 clock_id;
+	u8 reserved[6];
+};
+\end{lstlisting}
+
+\end{description}
+
+\field{clock_id} identifies the expired alarm through its associated
+clock.
-- 
2.43.0

