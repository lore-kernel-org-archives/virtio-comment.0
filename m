Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2110.outbound.protection.outlook.com [40.107.215.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503FC79C0
	for <virtio-comment@lists.linux.dev>; Mon,  1 Jul 2024 03:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719805502; cv=fail; b=hlM6GQg9CYPzaS08Ehv6OLDTIZ83lgTX84/G9nt39qjCPh5WG7G9M2i9uGmz+lMG3fdH0JI5jYNYwCzHoikSsnnGCgxCTaILV7CjhavXQ1mZHlWmWoUp+U/NAt7ErW9UZtab7FD96KGEPgox6uSKi2a7HBZ0sMplPLkP7aYxyTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719805502; c=relaxed/simple;
	bh=rpbu7EtKy9nLVWYHxtUvNHPkJup//4TQ5WIXgIlnDCM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KdB5JIQ7LtJ0V87wFQSUdRjMqJLd+TjukJrEko/ACH4t7nOnEhXGtiRYjJErkDwml9KJRskcOLvwi7gcAJLKx7hpVFrjb4AHo2wv2xv7sRm9i7LSbvzvOkVDLcTJfmeBE4RGjwfvapkW9YUtmFGeimWV4WJIMZR1fjVM+fNp6pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=Q1PmJohf; arc=fail smtp.client-ip=40.107.215.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="Q1PmJohf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVmSIWnvrLHN03NPLZQxUII+7srnpoZoLSHn98ej/QsvU1PvmJMHdJJIw7y7zU4EHB/7hR3RI65FWu/RTluRq2iq0CShvn0TbElOlwOBDXWvTwgxiXKTwcy4cANAKm8w2DN3xlbDdL/KkQR4K7y4a7GseYWQaIN3eE0LuwJDdA06J1ZPFbmh1VoYWA0MJFs1//DIYkhhSzJNxOkcsPLtZF6ur72oLNkCa77L/dMgy8qIeLR/4HcHE9iw/NeLXtzBxjAx1FqVu2InnYZDApc5OYQOEUir8ZKOPB87IKt89/SjWwtCLyCFn95Uc7APXRc12ERi3mDm35fSgry6IAfZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grdzJe9uKArKlKFtn3e2Na19zQWS2ccV7w3V0mnFe+Q=;
 b=WFfBoeAp1aQPWCFDHFWhZ2dNfG0BLLHD25drmaB6KJ//jQtkAxdjwqZe3Qjki+pjjs2hhN4E81XsYHmNZ6naizuS2xy2lzOok20EpmdvSqH4hwscOTa5+o8KPZ0gU9bbuku5AlJEi8qBQGaYInc30pkvwXNbzAXfTz3QdsnOdCzherJKGCgf0fDbarIV9wWPPnLeVpciaFeoiLm/9dKxRZtJ05GGm2rLtr+OtKpEPJB3p/cc039o4bewnjjTXkoKP6zDmUEhi37NrR55Q0VumyZhcN9i73yLD+8wAY8Hj/2UoxLl9D/nHvpVK2puO2LexRYzoLcBhvcGeMU1IjGffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grdzJe9uKArKlKFtn3e2Na19zQWS2ccV7w3V0mnFe+Q=;
 b=Q1PmJohfqN8qt1d03XR/SLi8GKlnGVgPq8is3yR7MLx0k85bGP2s6pbhL1gKTAGIeqSDIS0MW0G7oMmvowiOrogSP3LNiX6NfuvKmXHAAvB9LP/wN4RAhlbceKgfJEHkXClED6bZqJuUe8UOVJXxPU4teNoAlYLN6/fD0sI/C2Xrk8zBhR1n93vNVBL/Qb8kI3qZFUulsL4e9vgzFwRsfGZ6LlK5U/WB+Yuv7s++sGFlXKtEB1lA5IwZYSOPtP1uTuaHR/zful8rBlanjT/iBoCMspxo+NguI4jaqgWvUjWpcx3Z9dl/YtCi7N+LY71r4lv1u9BDeotehEaInZipMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com (2603:1096:4:1ec::12)
 by SEZPR06MB6160.apcprd06.prod.outlook.com (2603:1096:101:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Mon, 1 Jul
 2024 03:44:48 +0000
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd]) by SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd%6]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 03:44:48 +0000
From: Xiaoguang Wang <lege.wang@jaguarmicro.com>
To: virtio-comment@lists.linux.dev
Cc: vattunuru@marvell.com,
	ndabilpuram@marvell.com,
	parav@nvidia.com,
	mst@redhat.com,
	leo.liu@jaguarmicro.com,
	angus.chen@jaguarmicro.com,
	Xiaoguang Wang <lege.wang@jaguarmicro.com>
Subject: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer notification suppression mechanism
Date: Mon,  1 Jul 2024 11:44:35 +0800
Message-ID: <20240701034435.675-1-lege.wang@jaguarmicro.com>
X-Mailer: git-send-email 2.43.0.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:404:a6::21) To SI2PR06MB5385.apcprd06.prod.outlook.com
 (2603:1096:4:1ec::12)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5385:EE_|SEZPR06MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: eedf2563-8baf-4e36-f156-08dc998027a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PQP41upA+l5wIBt/EvZC2Sm9WPXZIVpegbDhhVat6voWa3UhN17TCPgOBQo2?=
 =?us-ascii?Q?zuPZQPOfU6tABhwrXAGtfFZye16BNpKFwlW+1Zo8QRpuetXqPPE54ZK7onzQ?=
 =?us-ascii?Q?cA9PGeTPLLYxuqAwUayUQG1NBpEXaqK8zICg/W9YhOp7gFzXfmKc8d1SzItr?=
 =?us-ascii?Q?Au0fpWnYsOZcJ8ykzqEiAc+pSdx++XPtBjXMwDf7UXPPo1dR2q3aGTKeJ0XR?=
 =?us-ascii?Q?URXOUVwhjb/4Zm7QxrQDn5k/38iE40pFWxSDonvlrPqhBo47VXHoNjXROUcj?=
 =?us-ascii?Q?6dTa7wve0smTqSwDsR9lLijBiBwRfd9l6dkAAJ7AoxPUKglAcGJ+hS0bOH5y?=
 =?us-ascii?Q?NOqp8kj0GhHBsKAmvnKnnvOzVL7GBHtW0jwleATl8IdtIbGp3XaazAcyh+9H?=
 =?us-ascii?Q?MfSP80xChzRGRpJ3M1Yp7HbcHqiRAAwhDoYqsabHPFwYkpbiIxeKTA+8vvjy?=
 =?us-ascii?Q?Txf6N9VG+uj3UTQFcYh6uPborleFwQTqlzfeWtolh5BWrHMRKdCWbE+FrFHD?=
 =?us-ascii?Q?Q0t0b3x1nOHWiKgPjiqROtMIq1S24UMxvdi8qgN1Kg7dfbStDxwcny8uXlO3?=
 =?us-ascii?Q?pRhTPhYJJyrNSg3wGnxOCEZknZO9tqaVmZok7FF9wf+CWbD25e6/A11N8/Tx?=
 =?us-ascii?Q?/YSzjx8rWT/fwD6jjkPmXOtxUfvZnZDLnBi9IqdgXX6E0k1mTfqP+PX9zibs?=
 =?us-ascii?Q?f6X2C2PV+K8I8686c5ty8BWx5P6S/g4uh7y1okJqITAKoWXCtmu3xGyYvyJ7?=
 =?us-ascii?Q?RQ6rfF16ETD5ghDENuWV/8fGTej4PdSOx9cZm1T7cuBe2kms6ysn8cdixYwv?=
 =?us-ascii?Q?Nvhbj3kJ2J7q3EGDfc0uRa4xkeE2IHi9uhtPnsxIW+Hi6mIZAkzSpS9YzPNa?=
 =?us-ascii?Q?S0G5a0brzFPUV567Lhb7gIeH0PMdCWa0EeAgy/DnFhJIhBchE51Rg3ypP9qB?=
 =?us-ascii?Q?XwAy/m5QxYr6mpyvfLjhJsbnxSaGUv6lfxScJYr5k2KfMAlNOgkPcNdtPYp9?=
 =?us-ascii?Q?c8ombbTCjBrt3CTYlr6Bn8VI7lDktuidZmt3tr9OihvefFS+SyigRbr/LjwP?=
 =?us-ascii?Q?35bsqlt9iKzlu/XcnxLfEQkDh7FS7suShuoig6VFyQwX87ZvSNrSZVBfeF2I?=
 =?us-ascii?Q?caCX43awbncKCWIg4GbZ1Z2Fd/JSJ7FSW+hL5BsLgg8jbFxrx5X8kShjnbqZ?=
 =?us-ascii?Q?xl17QvnzXq2au6UWx9kMrdnZeQH6L37bEB8o4Q8DbxlKOez7eIwOBcE3RT5k?=
 =?us-ascii?Q?pjbyHfCVkE1rkPdWb+GfvmGvn0xghcwi1m0eAnw1zzlAIHEX8E8abJhCWXFr?=
 =?us-ascii?Q?8hn4qhiSU98nCCMsyvg2MyF4zIbup82AjvrF/lI8Z3sqzuZm8v03Gr87DV/Y?=
 =?us-ascii?Q?DNhTAFzQzoigEKLHKfxKKLXCxAo9yAfa3/VE62wNuUBijTOKXw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Lylf79V1GbpdtXNIWG9IVkZZKoqYBmBl/SGBnwAVqmw5njlgTTC7Ss7Y5xu?=
 =?us-ascii?Q?q7xVGE89e45arZ9SzktjqUmhJyLZZl98LvVJd9Au4ZDkxG3UaOR+pImRWRXI?=
 =?us-ascii?Q?KIZr41jjkPclf0uCZWp2AhqAEuN6apA79FiySzDNIPnh/RlbCcV+XeEC5na0?=
 =?us-ascii?Q?TPfdddtmhHTFSiQvlNqM+g1fuKVCNH/FfysVTciCk3FQs67P6wM3NAhT8Nl7?=
 =?us-ascii?Q?w6+gvL6il6fpuXyajrdu1NiZ0WQvO6NCBt0egSlmttYIIIMozIW0Vt+Ussx3?=
 =?us-ascii?Q?qBZMIYCkhdrqOBhKi+oqVvJvj7Q9sF7VmyL4DFgPF80bZFwpY6qy4qazmqPc?=
 =?us-ascii?Q?lmA/db1iyGwGSWIO/SOarzOX08T3Gm8IVoFRj8EQxI21lIaIvLPCYVjtlmlk?=
 =?us-ascii?Q?3YS/uO8m8nsz5toOkLmpRcjUpzlLQMAQeReAsl1XGiT3DGkBAyh+TgC1GhFO?=
 =?us-ascii?Q?tPjGwSiXiNQaujwv/k4ERHEh62TOb3XjMSHXEtcT1XjZPFpsQ5NhjKbMSz+e?=
 =?us-ascii?Q?tend0lXV47HSpsVfAGMqt8vZC8PJi9/F6l1THO6OiluP1J6XMAe9otswd8B2?=
 =?us-ascii?Q?CKc/9fhe1oOXWRgZKnOhtpQkiAPSxMEIyvHP1NN7VscONld8WT4k9G5NeUiU?=
 =?us-ascii?Q?SNaM8eFGmRTWfzYX7UFKc5T81uuphj1icZos47jwyxo+5lLyyczGs+I7upWj?=
 =?us-ascii?Q?+DsVk+9c43TkBplLdiAUB5OM/EE6J8MZvXE1Zsqa5wcSgXv85sFbmDDIP2aw?=
 =?us-ascii?Q?gA5UN5MU5ALIeEnFKhYKNHuk+pfrl5haaiCRbmAKmdnTZ1vOl5s5dONp3xAc?=
 =?us-ascii?Q?I4KeHQ4o5GZ+srtVjXFGfUDTci2tfszmdFp0tr/yDeP6S77xh/6pXrvvzRwy?=
 =?us-ascii?Q?OI7C78EDAcsYZqQnw3xzWowR0JE8V0B1jwoEOOkGmutYnsKJ6YzCAKY7whLL?=
 =?us-ascii?Q?Rj0+q4VX0AVlFKxSfu1so/TfhLWll6ApDSePLzpoEv8NrRIKXcUgDBznfOYI?=
 =?us-ascii?Q?vPQCDEVGL85oWitn2CcYwBKfCc+4dHMZ1tLOw9V/q0B9oNtXVcpZ9GpCotmY?=
 =?us-ascii?Q?yMN51c67pLDXeJhiLGd5f/bgO/BlCTDR2cvyvMkZuJcPlxo3TPS2L06wQ8KM?=
 =?us-ascii?Q?zVCTcscKaulbcNcatSqOEtnKXP7XHSGEDgGFgjukYpem6mepzwh1r+WkmXib?=
 =?us-ascii?Q?O3wCorpjTtkYZWih4MiMEf0Up8b/iTBfyT5lIJnk/t4mmdmm560AdFA+KXQs?=
 =?us-ascii?Q?y5h7cdr1P5l9s6/TvhTRsRs7ZEAhIZMMn5ZZlLuiqCUNpS7/lgZP3BnUOCe8?=
 =?us-ascii?Q?RCX1EHC0LZ0kphTt/HAOc+ce6EOQiA/MNNwFsTlhB9QSytecdPYnObbQc1Yp?=
 =?us-ascii?Q?HTLELoEKeJT8tlh0TopM7T/XJwtTNBJa+9ltsOvWBi7vTTWBZ+z5bRVHm8cD?=
 =?us-ascii?Q?5USuYZYDLT3CyJdshdDNkkSQpYoG+W6AI8duA5b3DezCYpMHeowBUGwEwM/Z?=
 =?us-ascii?Q?vzNmjZONIOVX1v8njZCjuxtT+fKfj92tJaMCBcXEipbpPwdN9p6coRLdQBb/?=
 =?us-ascii?Q?p3eARg+qEEoewvlOhVFyHgTtvBQ7W7rJFXNLmpck2+afgLlMZwSLnR2TG/vc?=
 =?us-ascii?Q?2Q=3D=3D?=
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eedf2563-8baf-4e36-f156-08dc998027a8
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5385.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 03:44:48.3091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JiOXsUtqsVV6IA/HHBYY8gRdW6VdCXoQojezbw8FtdHF50dGixtdq6DOAmeBF4SNGPYsiJ/TqCe7aNXZ1Yl/ASr8s8TMajjmXgIlvCFnTKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6160

Currently for the PCI transport, used buffer notification suppression
informations are located in guest memory, for example, pvirtq_event_suppress
for packed ring and virtq_avail for split ring, then PCI devices simulated
by hypervisors, such as QEMU, can vist these suppression informations
directly before issuing used event, the only overheads may be just proper
memory barriers, but for some hardware PCI devices offered by
DPU(Data Processing Unit), DPU would need to submit DMAs to copy guest
suppression informations to DPU internal memory, then check whether
used event should be notified by examing this internal memory, which
is obvious expensive, and this DMA operation is needed every time
DPU attempts to issue used event, DPU may also choose to add a hardware
component to polling suppression informations by submit DMAs continuously
to get newest used event suppression infos, but it's also expensive.

To help improve this sitiuations, add a new feature:
VIRTIO_F_USED_EVENT_AUTO_DISABLE. When this feature bit is negotiated,
devices will place new notification area for used buffer suppression
notification in PCI bar specfied by virtio_pci_notify_cap, also for better
used buffer notification coalescing, the device will disable later used
buffer notifications automatically after sending one used buffer notification
to driver, and after the driver finishes handling current used buffer event,
it needs to notify the device to enable used buffer notification again by
writing above new notification area in PCI bar. Device will receive
this notification reliably, and device knows that it can issue used event
now, but it may choose appropriate timing to send used events according to
its notification coalescing policy , now it also does not need to DMA guest
memory to obtain notification suppression.

Signed-off-by: Xiaoguang Wang <lege.wang@jaguarmicro.com>
---
 content.tex       | 38 ++++++++++++++++++++++++++++++++++++++
 transport-pci.tex | 26 +++++++++++++++++++++++++-
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index 0a62dce..84505da 100644
--- a/content.tex
+++ b/content.tex
@@ -448,6 +448,7 @@ \section{Driver Notifications} \label{sec:Basic Facilities of a Virtio Device /
 The driver is sometimes required to send an available buffer
 notification to the device.
 
+\subsection{Available Buffer Notifications} \label{sec:Basic Facilities of a Virtio Device / Driver notifications / Available Buffer Notifications}
 When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
 this notification contains either a virtqueue index if
 VIRTIO_F_NOTIF_CONFIG_DATA is not negotiated or device supplied virtqueue
@@ -488,6 +489,35 @@ \section{Driver Notifications} \label{sec:Basic Facilities of a Virtio Device /
 has been negotiated, these notifications would then have
 identical \field{next_off} and \field{next_wrap} values.
 
+\subsection{Used Buffer Event Enable Notifications} \label{sec:Basic Facilities of a Virtio Device / Driver notifications / Used Buffer Event Enable Notifications}
+This kind of notification is only necessary when VIRTIO_F_USED_EVENT_AUTO_DISABLE has been negotiated.
+When this feature bit is negotiated, the device will disable used buffer notification
+automatically after sending one used buffer notification to the driver, and after the driver
+finishes handling current used buffer event, it needs to notify the device to enable used
+buffer notification again.
+
+\begin{description}
+\item [vq_index or vq_notif_config_data] Either virtqueue index or device
+      supplied queue notification config data corresponding to a virtqueue.
+\item [used_off] Offset
+      within the ring where the latest used ring entry the driver has processed.
+      Without VIRTIO_F_RING_PACKED this refers to the 14 least significant bits of the
+      offset (in units of descriptor entries) within the descriptor ring where the latest used
+      ring entry the driver has processed. With VIRTIO_F_RING_PACKED this refers to the offset
+      (in units of descriptor entries) within the descriptor ring where the latest used ring
+      entry the driver has processed.
+\item [used_wrap] Wrap Counter.
+      With VIRTIO_F_RING_PACKED this is the wrap counter
+      referring to the latest used descriptor where the driver has processed.
+      Without VIRTIO_F_RING_PACKED this refers to the most significant bit(bit 14) of the
+      offset (in units of descriptor entries) within the descriptor ring where the latest used ring
+      entry the driver has processed..
+\item [enable_notify] Whether to enable used buffer notification.
+      The driver may benefit from just informing device the latest used ring entry
+      it has processed, but not enabling used buffer notification. This field only
+      occupies one bit, if set to 1, it will enable used buffer notification, otherwise not.
+\end{description}
+
 \input{shared-mem.tex}
 
 \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Exporting Objects}
@@ -872,6 +902,14 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
 	handling features reserved for future use.
 
+  \item[VIRTIO_F_USED_EVENT_AUTO_DISABLE(42)] This feature indicates that the device
+  will disable used buffer notification automatically after sending one used buffer notification.
+  Note: when VIRTIO_F_RING_PACKED has not been negotiated, the maximum queue
+  size MUST NOT be greater than 16384, when VIRTIO_F_RING_PACKED has been negotiated,
+  the maximum queue size MUST NOT be greater than 16383.
+
+  See \ref{sec:Basic Facilities of a Virtio Device / Driver notifications / Used Buffer Event Enable Notifications}
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
diff --git a/transport-pci.tex b/transport-pci.tex
index a5c6719..62ba9dc 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -551,6 +551,13 @@ \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options
         cap.offset + queue_notify_off * notify_off_multiplier
 \end{lstlisting}
 
+If the VIRTIO_F_USED_EVENT_AUTO_DISABLE feature has been negotiated, \field{notify_off_multiplier} is also
+combined with the \field{queue_notify_off} to derive the Queue Notify address for enabling
+used buffer notifications within a BAR for a virtqueue, but add a 4 bytes offset:
+\begin{lstlisting}
+        cap.offset + queue_notify_off * notify_off_multiplier + 4
+\end{lstlisting}
+
 The \field{cap.offset} and \field{notify_off_multiplier} are taken from the
 notification capability structure above, and the \field{queue_notify_off} is
 taken from the common configuration structure.
@@ -563,7 +570,7 @@ \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options
 \devicenormative{\paragraph}{Notification capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
 The device MUST present at least one notification capability.
 
-For devices not offering VIRTIO_F_NOTIFICATION_DATA:
+For devices not offering VIRTIO_F_NOTIFICATION_DATA or VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 
 The \field{cap.offset} MUST be 2-byte aligned.
 
@@ -596,6 +603,23 @@ \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options
 cap.length >= queue_notify_off * notify_off_multiplier + 4
 \end{lstlisting}
 
+For devices offering VIRTIO_F_USED_EVENT_AUTO_DISABLE:
+
+The device MUST either present \field{notify_off_multiplier} as a
+number that is a power of 2 that is also a multiple 4,
+or present \field{notify_off_multiplier} as 0.
+
+The \field{cap.offset} MUST be 4-byte aligned.
+
+The value \field{cap.length} presented by the device MUST be at least 8
+and MUST be large enough to support queue notification offsets
+for all supported queues in all possible configurations.
+
+For all queues, the value \field{cap.length} presented by the device MUST satisfy:
+\begin{lstlisting}
+cap.length >= queue_notify_off * notify_off_multiplier + 8
+\end{lstlisting}
+
 \subsubsection{ISR status capability}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
 
 The VIRTIO_PCI_CAP_ISR_CFG capability
-- 
2.34.1

