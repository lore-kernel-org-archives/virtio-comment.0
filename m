Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F035E7483
	for <virtio-comment@lists.linux.dev>; Wed, 22 May 2024 17:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716397290; cv=fail; b=CihfGDq253T/5EptLodLb+vUoCWMDD+sgZbbTDchIP2u3bL1zmklyKCyvhIysvICr/k8gXnyKErwxBJOlVdaGQganrrCZyQMK51r13DCH/DpkWyG2DyuOEO8lOelwuC4FADhXxGbtn5ccUQgQaX4tv0agGxPU8ZCECgk8f5F064=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716397290; c=relaxed/simple;
	bh=w55xaOMsh7CcIYlldUXywOmXSRKYNCRvwdkRmyRN72Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=shwreNP6mF2FFusAb3SgAeHHkBIrzrKC7b5iiZ0jxFKTIEMpiTbx6XsgC9JjwwIyLwnjJrb0hk2AAW+SSY7OnyHCPxNPf8xUJ6lX/6V+jmgeBiKcvPcTuCepGqRbxpE3WUM+ZbpaR/QdmixpxrKcX4aDrYCCv60YZAagimxPJZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=ZzhiKPHj; arc=fail smtp.client-ip=18.185.115.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="ZzhiKPHj"
Received: from 104.47.11.169_.trendmicro.com (unknown [172.21.10.213])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 765C510046990
	for <virtio-comment@lists.linux.dev>; Wed, 22 May 2024 17:01:20 +0000 (UTC)
Received: from 104.47.11.169_.trendmicro.com (unknown [172.21.172.8])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 621231000178B;
	Wed, 22 May 2024 17:01:13 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1716397272.999000
X-TM-MAIL-UUID: 9d0a9df6-b01b-4879-a43a-90a8f9f60575
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.169])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id F3FC3100724BA;
	Wed, 22 May 2024 17:01:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIMxue5+IjDdvImWAuGIrHGyIcS+A5oeIJ4LwPKGyxsl0brAKwYs31ti+yvZG4cp9GbNv5GNDreTlUQTFhgNKUY1pOiFxXVAaVmYhTf3RFEIQmLCW+AfxZnvwAJiHWgq+LTZLgQl6rriAKeDgtufbpdqsOgh9fY1wk8/ao5BkARqWcoAcFMgI9w4fXayGPDl984RhaOPa2108O86ti5cJyZqUQR6MkzuGLubHTN31ILuDqFB3qwbZbKhhEDooehyL7dFN4sZJlHsj8ECYAA9TVl8N1oZ8pTKVRyAygughlYaeYlOAiszxv0yWQxs184ALxlAafdeMSfdCIKcyQgaWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZTaynP7vQytDhDZs5wW2mittH+xCjJ9FW+jpHeI5tU=;
 b=kNNN70KAwiT3MdhNuHWATPYUBmsQg/KBsbW97/Mo8uqskQ9+0ZLLMs7gb2Rx2/5SFSVjU6DrE8tK8RD2x4QW9yLHxWt1zdSnBy/jqArjR0YZiWmXlfBwk7NrBtAiHWuV9wQsNl1ZEiZCwWoQ+5Cd11f8CQ9N/tjnob+uTBrzy+xEYN23+BlksABV27a18UF+QyThbkikWwmQYBrwSMvW42sXDUjyEQeu/8KepbxLPk2sbGkZYNYwh0IqK6YtxKX7j31ho7CYnRDpTU5AmaTyLk0GtbT+wE0x5d53ZefRYg1DgtbthnYVip76mgA9TMDT23fZhj2M82G6NVaTOD930w==
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
Subject: [RFC PATCH v4 4/5] virtio-rtc: Add normative statements for alarm feature
Date: Wed, 22 May 2024 19:00:02 +0200
Message-ID: <20240522170003.52565-5-peter.hilber@opensynergy.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AC:EE_|FR0P281MB2985:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c58ff54b-63ad-48bc-2ee2-08dc7a80c828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8ltJxH8IMyMsaLXyZsxi+RlJILD4zsxqczMFISA0AngFu1LeDTrniRMTNn6r?=
 =?us-ascii?Q?QE4ZyyokKk34Kdd+O5ACz22Tkmz47qdLB6KPf0WsoHMdRoaNtE8iDMukDlPh?=
 =?us-ascii?Q?aJfKWZHaMxCNEnKNCYUU7m81N0f6wnxds2E+XE4EBx+jAigTF4PSvj2vdJV2?=
 =?us-ascii?Q?UVFn0Br3N70wq5aNwPIx0UKhly5rZ6WP8dmc3kI34xMKA4gf/jam6N0/PkZ2?=
 =?us-ascii?Q?afPcOoPOuXm4M/FvO3d7qKVLPB8aB6igvpe0zVzcYuFOI3i1Zp3Bg+OLQE1P?=
 =?us-ascii?Q?cM/o3M6yC/mdXlACTHuJBaUXfhnwdXsbNscqcz88izmzA6vD6j9GI3hvtHa4?=
 =?us-ascii?Q?4+5peWziw92o9gXaMbACNyoK5z1dNJly95Uexq9lCSNdxoac06s9aVjp7JKJ?=
 =?us-ascii?Q?ai2Q6VWY6tfW0Q+o82xbBSjnirL+gGJTYwGahpnBkZ/VWiCPR13vKibrJVPx?=
 =?us-ascii?Q?CNLQyqGx1i77x6MXA6qHznOkbgbG0rzqo4STxrLyVL8l0VvHLrixvdP5z226?=
 =?us-ascii?Q?2HszSRuaCzKOHszmEx/SU34aowsrTA6Om9bGfcaBIMaXOMwV6WU4gRhkfB+8?=
 =?us-ascii?Q?w+VNa9/Bgt87qrao2O0BJItUZrMKX62U3gN01R5135y1BwAfFPwa55fRyiC7?=
 =?us-ascii?Q?uJBSFic42A5sMkggn+q9BS6V90cIgYd9B6tkdGiY9VcAfCSvRDHrRqtMKmA3?=
 =?us-ascii?Q?QGfLOiWEIOiQtA5NgeYi4HQqg8YzjtxAwaiZXXhCU0mVbFyez/nUDS4PXaGn?=
 =?us-ascii?Q?g2n4E27QXLHTlgm/YPJGm55x2PMBXpinwtLndNRAuUW4qr82seV+oma1BTpf?=
 =?us-ascii?Q?bQ01O0Yi+djPxq947cdUlq02qw6cIs5cTBxHv1qPn3j68EY3iWiVO9b7+5jb?=
 =?us-ascii?Q?jrzcaSAA87duaKuvNgqS5mnCROCecSNft7CiIOIC7r0GdRbdxxOQ/Mq8mbqB?=
 =?us-ascii?Q?SkH1dPtdYzDPgRyNI10lcEnlGJwN0y6XjDYQ1Ct4ip++AfP4ZsVLUZ32QtUB?=
 =?us-ascii?Q?Gw+xrkt3dhk9jmgVdYzvnKwcxMRTAdJ7uuz08C3sRtTMplpabyWhgiwTQgZt?=
 =?us-ascii?Q?9A/K89o4L62GMOOHeIUowiKQ3zn7lEGpWY4TYIbZum3KzzuN2JsOEQ+PALLL?=
 =?us-ascii?Q?grtRkYgwbAsdlOIJmvWzBm64V+PdQtMQVjpaHM85JdRWFP790nJUF+7KijVk?=
 =?us-ascii?Q?t1+zkKVtkJB47xtT4VB8WP4n/sCQPMyzupOHNMLujbhpE4Q/uAAuk4MjYaxO?=
 =?us-ascii?Q?6Z8Jt0F+AutS5jRCdzEyc/HqMNg2ryP/L+hLO1QqOggn3XKm58FXKYfuqmSK?=
 =?us-ascii?Q?onT6egJmBVSkPsHRQw9OQA/yGsfT94dVw3N6Q16j7HxqlEVxOX2Zwy6kwffh?=
 =?us-ascii?Q?knYYhH95x+QDIqPCbdOiC+oNgtqN?=
X-Forefront-Antispam-Report:
	CIP:213.61.166.92;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:exchangeconnector.opensynergy.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:01:11.1465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c58ff54b-63ad-48bc-2ee2-08dc7a80c828
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[213.61.166.92];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB2985
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28404.001
X-TMASE-Result: 10--8.573800-4.000000
X-TMASE-MatchedRID: j6YoQqc1khHJ+P2VFrJmrBbadjTjVCQ24DiXvcLDKwtf1evRo91IncYL
	JlEwoYGI1VVt0hSRWsaLO9h/kZ7mQnkHMxUIdlxLGQ+246vupTBs2NNIWkvEKNrm58Qo63iffdA
	yaXqQ6IAq4Wt0or7ue4CMO1rA8xAV3kKjesh9UXU70BtMXRaQwpFx8VBGp0H2lja+I+hTvQI9/c
	ISaPHCAVK7runmlPSu2XmimB/R1RO8LquwtGVUugGYjCus6WrVw6vYc1H7LGMugFBQy+58BchgY
	B6FwvDxSsdwRUJiqKwRLatNkiqKZgXVDeskCzLgFnf3P1XcpeDOe9pZzJLe1fsFqaKfjkncaPtg
	HcfYAJVdzWgwXwRzC+SK55hwcIi7AMr8TtkOkVghPK2mn+OsTNo+48giqZwn+ng65LLRQXGvngk
	jHjojpKKGxShspZwB+cTHJKophgC/2tJ3foSBQiPzRlrdFGDwRyf16rAzp94tpiTbmgQIetO2UO
	iwNHiGbyQlI1XQHHF6JJdnsnqNAg==
X-TMASE-XGENCLOUD: daa71fc1-d2c7-4c7b-a824-e7817830e638-0-0-200-0
X-TM-Deliver-Signature: 0A3F5DA66C487776E1A580AA7ABE6E76
X-TM-Addin-Auth: S211MJLUC7aAPPszP2IyD8Z92xURSBbs3awi2wexO5dlCB4vZA97v31BGPe
	vVMVlcPYkqTFC8TBGueJ4uaeS+sDH2ouyank4jdHhFszP4p331dRhMobNKLHqq19T+QIr7pY3vD
	7/gTcdh/bir6ZS1CDbaj31m83oRdKnAvSi8PUYkmSZC8RCesoENrrwSFlSLt6xDlKRvqonwgozq
	tB0yrlAvp8QJjhNIQm3XKqchOsSizevq6PwW+zKcm72O8yAB94W6nk4CnInoY10RZxM4KJGBb9E
	0KXG8UHrhHq8J5o=.dPIC9wsQgyQ+j8i46aUdrJZRjlqsQKpaQHbCdF3cCNzK4NLUjzcXYPDYtB
	ZxbY5mbm/KyjoCfbVugL4B1KmEjpo9sbeZx7z9BRFl5fiR4IRwG5ema7SyL+EkgA2cSCL2ZUBnD
	5ELD+y8DoIlosMSsG66bLuWnPqUsbSbz28OLEWiVi7RD0pWG4H4ScY86PehXekSOfz5bZaImG5r
	G77WPnIazamDMSIZrC7auZnXigFFLFP15afvguhyJ3HFWKkKa0UXqy7iEOyxk016ayo6UGdvpVT
	vzT9RUvjQCiNU8EN13FtdCeRUVuV1sqks1QD+IxdGlhBdvBWfwXkWpv7mgw==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1716397273;
	bh=w55xaOMsh7CcIYlldUXywOmXSRKYNCRvwdkRmyRN72Q=; l=11235;
	h=From:To:Date;
	b=ZzhiKPHjQLU9RSLKJNNoGYWt0Gx6KoYHSwHTBjGjG5TZBu7JhXWKzCd+t//vGBXIY
	 hsjgtMFVLEyl4mb6/WgNd+IA5ncvkT6+xVJCCrGromPDNDV9Mz/Npjno/KjNqDPnBB
	 8FpGFUQ1DHUabx2PtUUDcFYyR44JjJmeE8TCyGJae+m4xsN5p6UjkddSmradh8ZhF1
	 165Rg0LYGQ1n3WhxLX/O2scaNJUNt+sh6slDolJMcB7l2CokhqKxJVXdyzt5Rnfm4+
	 h7MxB9bxpXkvle24cQom/ciAJBDzFjUPGlWnmwwPhu0tK/gl3AxmnywL4dhnTzIfcd
	 ER5XTaRmIEodQ==

Add the normative statements for the alarm feature added previously.

Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---

Notes:
    v4:
    
    - Update normative statements to match v4 changes to non-normative
      statements (patch 3).
    
    - Driver should read clock to confirm that alarm has expired.
    
    - Formatting and wording improvements.

 device-types/rtc/description.tex        | 157 ++++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |   4 +
 device-types/rtc/driver-conformance.tex |   2 +
 3 files changed, 163 insertions(+)

diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
index 8a51a70d615b..8fbeef33fac9 100644
--- a/device-types/rtc/description.tex
+++ b/device-types/rtc/description.tex
@@ -32,6 +32,11 @@ \subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
 VIRTIO_RTC_F_ALARM determines whether the device supports setting an
 alarm for some of the clocks.
 
+\devicenormative{\subsubsection}{Feature bits}{Device Types / RTC Device / Feature bits}
+
+The device SHOULD offer VIRTIO_RTC_F_ALARM if the device can support
+setting an alarm for any of its clocks.
+
 \subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
 
 There is no configuration data for the device.
@@ -562,6 +567,12 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
 this specification, the device MUST use the nanosecond as unit for
 field \field{clock_reading}.
 
+If VIRTIO_RTC_F_ALARM was negotiated, and the device sent an alarm
+notification N for clock C with alarm time A, the device MUST, for all
+read requests of C which the driver marks as available after the device
+marked N as used, return a \field{clock_reading} which does not precede
+A, unless C stepped backwards to before A.
+
 \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Operation / Alarm Operation}
 
 Through the optional alarm feature, the driver can set an alarm time. On
@@ -675,6 +686,79 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
 To prevent the above issues, the driver also marks buffers in the alarmq
 as available only after completing the above steps for all clocks.
 
+\devicenormative{\paragraph}{Alarm Operation}{Device Types / RTC Device / Device Operation / Alarm Operation}
+
+The device MAY retain both \field{driver_alarm_time} and
+\field{alarm_enabled} of a clock across a device reset.
+
+If the device did not retain \field{driver_alarm_time} and
+\field{alarm_enabled} of a clock across a device reset, the device MUST
+initialize \field{driver_alarm_time} to 0.
+
+If the device did not retain \field{driver_alarm_time} and
+\field{alarm_enabled} of a clock across a device reset, the device MUST
+initialize \field{alarm_enabled} to false.
+
+While \field{alarm_enabled} for a clock is true, the device MUST set the
+alarm time to \field{driver_alarm_time}.
+
+While \field{alarm_enabled} for a clock is false, the device MUST act as
+if the alarm time was in the future.
+
+If VIRTIO_RTC_F_ALARM was negotiated, the device MUST support the alarm
+messages, VIRTIO_RTC_REQ_READ_ALARM, VIRTIO_RTC_REQ_SET_ALARM,
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, and VIRTIO_RTC_NOTIF_ALARM, for one or
+more clocks.
+
+If VIRTIO_RTC_F_ALARM was not negotiated, the device MUST NOT support the
+alarm messages.
+
+The device MUST set flag VIRTIO_RTC_FLAG_ALARM_CAP in \field{struct
+virtio_rtc_resp_clock_cap.flags} if the respective clock supports alarm
+messages, and clear the flag otherwise.
+
+The device MUST consider it an alarm expiration event when the
+associated clock progresses (also: steps) from a time prior to the alarm
+time to the alarm time, or to a time after the alarm time.
+
+The device MUST consider it an alarm expiration event when the
+driver sets an alarm time which the associated clock has already reached
+or passed.
+
+If the device retained \field{driver_alarm_time} and
+\field{alarm_enabled} of a clock across a device reset, and the clock
+has already reached or passed the alarm time, the device MUST consider
+this device reset an alarm expiration event.
+
+If an alarm expiration event E happens, the device MUST start serving
+the alarm expiration event E.
+
+If the driver successfully requests VIRTIO_RTC_REQ_SET_ALARM, or
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, for clock C, the device MUST stop
+serving any previous alarm expiration event for C before the device
+marks the message as used.
+
+If a clock C steps to a time previous to C's alarm time, the device MUST
+stop serving any previous alarm expiration event for C, within a grace
+period.
+
+If an alarm expiration event happens for clock C, the device MUST stop
+serving any previous alarm expiration event for C, within a grace
+period.
+
+If the device is currently serving an alarm expiration event E, the
+device MUST send a single VIRTIO_RTC_NOTIF_ALARM notification for E, as
+soon as an alarmq buffer is available for this purpose.
+
+While the device is serving an alarm expiration event, the device MAY
+execute implementation-specific alarm actions.
+
+The device MAY ignore the device status when executing
+implementation-specific alarm actions.
+
+The device MAY ignore whether VIRTIO_RTC_F_ALARM was negotiated when
+executing implementation-specific alarm actions.
+
 \paragraph{Alarm Control Requests}
 
 If VIRTIO_RTC_F_ALARM is negotiated,
@@ -771,6 +855,62 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
 \field{driver_alarm_time}.
 \end{description}
 
+\drivernormative{\subparagraph}{Alarm Control Requests}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
+
+For VIRTIO_RTC_REQ_SET_ALARM and for any clock type listed in this
+specification, the driver MUST use the nanosecond as unit for the
+\field{alarm_time} field.
+
+\devicenormative{\subparagraph}{Alarm Control Requests}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
+
+If VIRTIO_RTC_F_ALARM was not negotiated, the device MUST set status
+VIRTIO_RTC_S_ENODEV for VIRTIO_RTC_REQ_READ_ALARM,
+VIRTIO_RTC_REQ_SET_ALARM, and VIRTIO_RTC_REQ_SET_ALARM_ENABLED.
+
+If the clock does not support alarm messages, the device MUST set status
+VIRTIO_RTC_S_ENODEV for VIRTIO_RTC_REQ_READ_ALARM,
+VIRTIO_RTC_REQ_SET_ALARM, and VIRTIO_RTC_REQ_SET_ALARM_ENABLED.
+
+For VIRTIO_RTC_REQ_READ_ALARM, the device MUST set field
+\field{alarm_time} to \field{driver_alarm_time}.
+
+For VIRTIO_RTC_REQ_READ_ALARM, the device MUST set flag
+VIRTIO_RTC_FLAG_ALARM_ENABLED in field \field{flags} if
+\field{alarm_enabled} is true, and clear the flag otherwise.
+
+For VIRTIO_RTC_REQ_READ_ALARM and for any clock type listed in this
+specification, the device MUST use the nanosecond as unit for the
+\field{alarm_time} field.
+
+For VIRTIO_RTC_REQ_SET_ALARM, the device MUST accept any
+\field{alarm_time} value.
+
+If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
+the device MUST set \field{driver_alarm_time} to the time
+represented by field \field{alarm_time}.
+
+If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
+the device MUST set \field{alarm_enabled} to true if flag
+VIRTIO_RTC_FLAG_ALARM_ENABLED is set in field \field{flags}.
+
+If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
+the device MUST set \field{alarm_enabled} to false if flag
+VIRTIO_RTC_FLAG_ALARM_ENABLED is cleared in field \field{flags}.
+
+If the device sets status VIRTIO_RTC_S_OK for
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST set
+\field{alarm_enabled} to true if flag VIRTIO_RTC_FLAG_ALARM_ENABLED is
+set in field \field{flags}.
+
+If the device sets status VIRTIO_RTC_S_OK for
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST set
+\field{alarm_enabled} to false if flag VIRTIO_RTC_FLAG_ALARM_ENABLED is
+cleared in field \field{flags}.
+
+If the device sets status VIRTIO_RTC_S_OK for
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST retain
+\field{driver_alarm_time}.
+
 \paragraph{Alarm Notifications}
 
 If the alarmq is present, the driver should make buffers available in
@@ -806,3 +946,20 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
 
 \field{clock_id} identifies the expired alarm through its associated
 clock.
+
+\drivernormative{\subparagraph}{Alarm Notifications}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
+
+If VIRTIO_RTC_F_ALARM was negotiated, the driver SHOULD populate the
+alarmq with buffers.
+
+The driver MUST allocate enough space for any alarmq message in the
+device-writable part of an alarmq buffer.
+
+If the driver receives a VIRTIO_RTC_NOTIF_ALARM notification, the driver
+SHOULD read the associated clock instead of assuming that the alarm time
+which the driver set last has been reached.
+
+\devicenormative{\subparagraph}{Alarm Notifications}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
+
+The device MUST NOT send a VIRTIO_RTC_NOTIF_ALARM notification for a
+clock which does not support alarm messages.
diff --git a/device-types/rtc/device-conformance.tex b/device-types/rtc/device-conformance.tex
index 4303cd450542..705691a7319f 100644
--- a/device-types/rtc/device-conformance.tex
+++ b/device-types/rtc/device-conformance.tex
@@ -3,7 +3,11 @@
 An RTC device MUST conform to the following normative statements:
 
 \begin{itemize}
+\item \ref{devicenormative:Device Types / RTC Device / Feature bits}
 \item \ref{devicenormative:Device Types / RTC Device / Device Operation}
 \item \ref{devicenormative:Device Types / RTC Device / Device Operation / Control Requests}
 \item \ref{devicenormative:Device Types / RTC Device / Device Operation / Read Requests}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Alarm Operation}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
 \end{itemize}
diff --git a/device-types/rtc/driver-conformance.tex b/device-types/rtc/driver-conformance.tex
index 689c18d158d0..a87c4cde99c2 100644
--- a/device-types/rtc/driver-conformance.tex
+++ b/device-types/rtc/driver-conformance.tex
@@ -6,4 +6,6 @@
 \item \ref{drivernormative:Device Types / RTC Device / Device Operation}
 \item \ref{drivernormative:Device Types / RTC Device / Device Operation / Control Requests}
 \item \ref{drivernormative:Device Types / RTC Device / Device Operation / Read Requests}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
 \end{itemize}
-- 
2.43.0

