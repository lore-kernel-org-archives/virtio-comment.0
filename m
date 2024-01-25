Return-Path: <virtio-comment-return-9013-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E52EC46CD2
	for <virtio-comment@archiver.kernel.org>; Thu, 25 Jan 2024 02:30:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A3F7D2AEE0
	for <virtio-comment@archiver.kernel.org>; Thu, 25 Jan 2024 02:30:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7E70B9867EF
	for <virtio-comment@archiver.kernel.org>; Thu, 25 Jan 2024 02:30:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5C5D1986360; Thu, 25 Jan 2024 02:30:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 489549867E2
	for <virtio-comment@lists.oasis-open.org>; Thu, 25 Jan 2024 02:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmhjnEidH8EDRfZCjpt+VuXzsGeNnPNDejxttjYQZUWNqqpGxhYj/aInLoPnQlMx8/POssb0Y8y+ZgBE4FuZDNK3MTDdimYr0DpPi7YqHSPu/i23W9fT4ksF7ZdanFBSNL8U9FcNg5/xlLcU9FJcqcb+zG56VgTR2UXT6Zr3yYk07yfNshjPOvx7EpFx2gfK4vkgrUKLt1jcbvIRi03mGfvLWiteDcsdADckdhKl1ACqbB6FTZSWRrhPZiImoQfBU51/9Tti3wzbZHpCNK/okQkXS2ECNB4N8v7T1iOEdnsJ9+NXRoHKtpKKMAlhvcCSyRDDwL66qsC53qzHWQch9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icaH93oZSD/cvnBcQKnMZBIvDceXS85BxloEZ93BHBk=;
 b=Dt5TFQdfr07qD3P2taEtleZTfTq+MEdlHyi1NU6mbINk0rlawZC3nroEh8AcKd9K5Gwz/FB6gSH6e9d7LEPRLiZNBnBnu6mEaLzwLhC1XuCBL4nTRNQ+kZRPuUpF+hUc/Mi5bs3YzuKJXFxowLwhR2jOziqLpgNDbhM4IvU0aagJA7yLH51SGODJBKG4vbzKFwfy4zz4Vl9Jcc42dH3nDdBCLHVpg85kO1Mp34DF8bdVfiYHA3LsubylwnwxLJVw+uNNCoWyvVL/LgDuJL4EqjScwOiOHtkIP77ICWNKjvXQ0XbXgrYqWlxCjcFvbMqWVLT06mfkhbFK4dArUAM3nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
From: Xiaoguang Wang <lege.wang@jaguarmicro.com>
To: virtio-comment@lists.oasis-open.org
Cc: Xiaoguang Wang <lege.wang@jaguarmicro.com>
Date: Thu, 25 Jan 2024 10:30:01 +0800
Message-ID: <20240125023001.1467-1-lege.wang@jaguarmicro.com>
X-Mailer: git-send-email 2.43.0.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PS2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:300:41::34) To SI2PR06MB5385.apcprd06.prod.outlook.com
 (2603:1096:4:1ec::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5385:EE_|SEYPR06MB7043:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d19acfd-7d1f-4ea1-08e7-08dc1d4d89a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D8G8LrcYcPPNCGlVz+ED5wcsjxUGwsgSjkJF8xByJHTJFa6nsIQfhOcyzZcN2XdKG6KsusAhVqJYsaGF5MUGgDt1Ct3AeAnu5HcKK1fVW7VGIuY1t0MBDbaNrLndnTHCFFoQWq37uarGAYp/m/NzAzmCYJJb+SasHjhCCy7yJOkSFbzJnynY6ikPLWOootn/RKj2BFHXrYFym8MaMMDBiGrNtJNuMzfyWQsOqnchWugBbbE0+jgMDmQmwlIA1h5gc4paUwCJl557pAhspZo6TH3hYSiy8CwWZfNz9z7GYXsx73Q8cm8lifxSZoC5TJL+UYXp8rLruiJ1tyZ4ej1zZKrHlKtn3zI92Sb9UhU6seLdSClQXhTgO+UQJhdTbWf3hCOLEhuxlQJ+JWvuG+iLZgJVUvDEX1joGvsxeeIKU2jbGe03tcZrFQXOUde6jZXyGvkGQY1FIHLAlo6LetZgE8SaJ9bLP0Y6U91T3bJ88Hy2qCKdkr/tAX0a+e2stNfKtyZdFaBRyIhfRHkGj18cMea05enUEe6GlHak1FKdqCNcKhlFzKdzNQwunSL0zdbLp+0eKC5dQonmC3tOks0KQsMVkzmwAgMspvump3YmqakPP4nPZQUaZiv9mPIELzim
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39830400003)(396003)(346002)(366004)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(66899024)(2616005)(107886003)(52116002)(26005)(1076003)(6506007)(6512007)(83380400001)(8676002)(4326008)(8936002)(66946007)(6486002)(478600001)(6666004)(316002)(66476007)(66556008)(86362001)(6916009)(38100700002)(38350700005)(5660300002)(41300700001)(15650500001)(2906002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WvNggvRLzeZ6s6p6uWu9u8dB/Q0RB3LgdsZNnoEjVUmJ22jRZ/JTIZgbMEc/?=
 =?us-ascii?Q?oymV6MVArXbudEGMNfxH+HFHFi8r/3vKaM5pWAJNsWc+NB064/NAo71PCCw2?=
 =?us-ascii?Q?oxbqd5+lTgw3FKOEKfD/2mawjgA7Ib3dX6qOYeBUNFDp34GdJxPGrHb6dxQ7?=
 =?us-ascii?Q?U/MNta6d9+1jGwHmZuuzcCyzC1rPaJwQuSKEoS3kfvRYT13ZHvxADlUhz8kQ?=
 =?us-ascii?Q?ZnBHiwHyBluESNgrJakSXX2qASYNOpdnKuxjKE/fJsmSwAKh8yCgN+xqfCnf?=
 =?us-ascii?Q?55O4/7MekevTL1R6mnWH+M3fqvs7B0Mj6cS6DzitqKfKVxLxvzBPHERs6nPp?=
 =?us-ascii?Q?upFzUYS6+c4tNmLWJPgoYoF4jMpJlbdA8BxT4jme/zf/bqJdFXkVMAhuWEZE?=
 =?us-ascii?Q?pk9IXBuq1CIhqsAgP0jlU0l8+cjDphSP+vuAzAe5jvYFXkZejl/YdM8WaUne?=
 =?us-ascii?Q?c8iBjVXwRgc1Ed+Sk3cWimwS7omD1v9AxlG/FuBInX9g9d5KFxRhD0iE3tJV?=
 =?us-ascii?Q?tmBUeneVTIjPoLC47Wa3NGSfKkRr9fa31HU43aZuZkUJox+6/GSS7imC+bRo?=
 =?us-ascii?Q?TS4nklLSgSFtlZaxr+6Mt7GEgNAKzK4By9XUsDm5k7FnlgXOxrNo8cqkFSI4?=
 =?us-ascii?Q?MX0ltenqCvmDoRACCYXnzwitsGHTdnrnw/I/sXTzbTi6mheZfFzTwgqmNW33?=
 =?us-ascii?Q?RwjmSDjz9Feit9m+yg9BQ9Ogm05LwvKniTFvrc+5uk9C1N02rv9lotAYsPxo?=
 =?us-ascii?Q?I1Se0vkT28xo2mRAH6Cw+XT9RAVI3EAtpUkCrIXCRAu6v+LTFT0EO/AVAl5K?=
 =?us-ascii?Q?TOecvgve4K1UzEXA3clS4ZgG9qP8NoAWZ5G4qNbOIMfV5yMTijkpxkTixRQl?=
 =?us-ascii?Q?6lzyrTmzSefX8W/Ntaf3ndYIXDHHV51ZJEmA1+l1j/F5hgN+T4BQ1ibp2Yt1?=
 =?us-ascii?Q?rf038J+B3pJHDF8UJAzrz0AtQu5+eUqcoLzHeUC/ab1onWPQ4DIM0tXFo6OX?=
 =?us-ascii?Q?pJxIo2xCkXlI8iWxXevCtoqh50MSb7Q9L2AmTyuu/I06peJAgkRlHjvAUxGO?=
 =?us-ascii?Q?6IptS52lFbD9bjLKQ2+jvZLnBZ0zHe8y7s2n6mILFupaGx0KFzhbrcQwKbr1?=
 =?us-ascii?Q?nLk3RWeMhF0o24GTTp+riH6TZCdG4s4pKzdePWy6dvcchTFWvZV2uuIoYbAU?=
 =?us-ascii?Q?Y4uk8qWnQ0+RRMfz//2vVvfPyECvXjXQ0YcxpjEYRZjhULj+F5rDjvnN9SxV?=
 =?us-ascii?Q?xkpqdF2ofcnhsL03jEBi+f6kNNfO1ky/PEwgRgqYVXLWDqNRvvalTpFcPya1?=
 =?us-ascii?Q?lHQa0QKTey3Ovvfgp3Shg89GG1/+AAMYUQQEfBJlIqYFm9BZFQXn3cp9WQHt?=
 =?us-ascii?Q?SOHHJG59M+84FywUoTc32I+S9cWiT8+4gM0Eu2ENx4SUBwUMirCfJjfnDI1L?=
 =?us-ascii?Q?KpFuv0Vl4pPSjKpQZOXwXIghe11c2zGvZQHf37Z9nCmyYnjd9z2rglC1vcHI?=
 =?us-ascii?Q?arD4o+SlqFtSH0v1XxDj+EKgIgQHBwsyIL5VXJNggDmuF1mR+61NFAnRqXrH?=
 =?us-ascii?Q?/txpWxfGR8tTS2QirgMkQQEB4MIwqDtxCrPeSomR4Tzkcf0+wJqcL4YFxYra?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d19acfd-7d1f-4ea1-08e7-08dc1d4d89a6
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5385.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 02:30:04.2062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REjIMNQOpgOGdmEP4w2+sWVCUQD5cA1l2Q7EmRthoORgzj0l6nQLpm0Zy++kukEfKosOmadUxAe4dBgRkZJIjlC6RfoplBYR+dRobMx27Ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7043
Subject: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer notification suppression mechanism

Currently for the PCI transport, used buffer notification suppression
informations are located in guest memory, for example, pvirtq_event_suppress
for packed ring and virtq_avail for split ring, then PCI devices simulated
by hypervisors, such as QEMU, can vist these suppression informations
directly before issuing used event, the only overheads may be just proper
memory barriers, but for some hardware PCI devices offered by
DPU(Data Processing Unit), DPU would need to submit DMAs to copy guest
suppression informations to DPU internal cache or memory, then check
whether used event should be notified after examing this internal cache
or memory, which is obvious expensive and time-consuming. Worsely, if
device has written some used descriptors, and the above DMA operation has
not been completed yet, device can not determine whether to issue used
event, until it gets newest used buffer notification suppression information.

To help improve this sitiuations, add a new feature:
VIRTIO_F_USED_EVENT_AUTO_DISABLE. When this feature bit is negotiated,
devices will place new notification area for used buffer event enable
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
 content.tex       | 34 +++++++++++++++++++++++++++++++++
 transport-pci.tex | 48 +++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 0a62dce..5374510 100644
--- a/content.tex
+++ b/content.tex
@@ -448,6 +448,7 @@ \section{Driver Notifications} \label{sec:Basic Facilities of a Virtio Device /
 The driver is sometimes required to send an available buffer
 notification to the device.
 
+\subsection{Available Buffer Notifications} \label{sec:Basic Facilities of a Virtio Device / Driver notifications / Available Buffer Notifications}
 When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
 this notification contains either a virtqueue index if
 VIRTIO_F_NOTIF_CONFIG_DATA is not negotiated or device supplied virtqueue
@@ -488,6 +489,34 @@ \section{Driver Notifications} \label{sec:Basic Facilities of a Virtio Device /
 has been negotiated, these notifications would then have
 identical \field{next_off} and \field{next_wrap} values.
 
+\subsection{Used Buffer Event Enable Notifications} \label{sec:Basic Facilities of a Virtio Device / Driver notifications / Used Buffer Event Enable Notifications}
+This kind of notification is only necessary when VIRTIO_F_USED_EVENT_AUTO_DISABLE is negotiated.
+When this feature bit is negotiated, the device will disable later used buffer notification
+automatically after sending one used buffer notification to the driver, and after the driver
+finishes handling current used buffer event, it needs to notify the device to enable used
+buffer notification again.
+
+The notification method and supplying any such virtqueue notification config data
+is transport specific, currently driver notifications to the device include
+the following information:
+
+\begin{description}
+\item [vq_index or vq_notif_config_data] Either virtqueue index or device
+      supplied queue notification config data corresponding to a virtqueue.
+\item [next_off] Offset
+      within the ring where the next used ring entry will be written.
+      When VIRTIO_F_RING_PACKED has not been negotiated this refers to the
+      15 least significant bits of the used index.
+      When VIRTIO_F_RING_PACKED has been negotiated this refers to the offset
+      (in units of descriptor entries)
+      within the descriptor ring where the next used descriptor will be written.
+\item [next_wrap] Wrap Counter.
+      With VIRTIO_F_RING_PACKED this is the wrap counter
+      referring to the next used descriptor.
+      Without VIRTIO_F_RING_PACKED this is the most significant bit
+      (bit 15) of the used index.
+\end{description}
+
 \input{shared-mem.tex}
 
 \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Exporting Objects}
@@ -872,6 +901,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
 	handling features reserved for future use.
 
+  \item[VIRTIO_F_USED_EVENT_AUTO_DISABLE(42)] This feature indicates that the device
+  will disable later used buffer notification automatically after sending one used buffer
+  notification to the driver. 
+  See \ref{sec:Basic Facilities of a Virtio Device / Driver notifications / Used Buffer Event Enable Notifications}
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
diff --git a/transport-pci.tex b/transport-pci.tex
index a5c6719..21b80dc 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -325,6 +325,8 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
         /* About the administration virtqueue. */
         le16 admin_queue_index;         /* read-only for driver */
         le16 admin_queue_num;         /* read-only for driver */
+
+        le16 queue_intr_notify_off;     /* read-only for driver */
 };
 \end{lstlisting}
 
@@ -428,6 +430,14 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 	The value 0 indicates no supported administration virtqueues.
 	This field is valid only if VIRTIO_F_ADMIN_VQ has been
 	negotiated.
+
+\item[\field{queue_intr_notify_off}]
+        The driver reads this to calculate the offset from start of Used Buffer Event Enable Notification structure at
+        which this virtqueue is located.
+        \begin{note} this is \em{not} an offset in bytes.
+        See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability} below.
+        \end{note}
+
 \end{description}
 
 \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
@@ -498,7 +508,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 \drivernormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
 
 The driver MUST NOT write to \field{device_feature}, \field{num_queues},
-\field{config_generation}, \field{queue_notify_off} or
+\field{config_generation}, \field{queue_notify_off}, \field{queue_intr_notify_off} or
 \field{queue_notif_config_data}.
 
 If VIRTIO_F_RING_PACKED has been negotiated,
@@ -541,6 +551,7 @@ \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options
 struct virtio_pci_notify_cap {
         struct virtio_pci_cap cap;
         le32 notify_off_multiplier; /* Multiplier for queue_notify_off. */
+        le32 intr_notify_off_multiplier; /* Multiplier for queue_intr_notify_off. Only if VIRTIO_F_USED_EVENT_AUTO_DISABLE is negotiated. */
 };
 \end{lstlisting}
 
@@ -560,10 +571,26 @@ \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options
 the same Queue Notify address for all queues.
 \end{note}
 
+\field{intr_notify_off_multiplier} is combined with the \field{queue_intr_notify_off} to
+derive the Queue Used Buffer Event Enable Notify address within a BAR for a virtqueue:
+
+\begin{lstlisting}
+        cap.offset + queue_intr_notify_off * intr_notify_off_multiplier
+\end{lstlisting}
+
+The \field{cap.offset} and \field{intr_notify_off_multiplier} are taken from the
+notification capability structure above, and the \field{queue_intr_notify_off} is
+taken from the common configuration structure.
+
+\begin{note}
+For example, if \field{intr_notifier_off_multiplier} is 0, the device uses
+the same Queue Used Buffer Event Enable Notify address for all queues.
+\end{note}
+
 \devicenormative{\paragraph}{Notification capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
 The device MUST present at least one notification capability.
 
-For devices not offering VIRTIO_F_NOTIFICATION_DATA:
+For devices not offering VIRTIO_F_NOTIFICATION_DATA or VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 
 The \field{cap.offset} MUST be 2-byte aligned.
 
@@ -596,6 +623,23 @@ \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options
 cap.length >= queue_notify_off * notify_off_multiplier + 4
 \end{lstlisting}
 
+For devices offering VIRTIO_F_USED_EVENT_AUTO_DISABLE::
+
+The device MUST either present \field{intr_notify_off_multiplier} as a
+number that is a power of 2 that is also a multiple 4,
+or present \field{intr_notify_off_multiplier} as 0.
+
+The \field{cap.offset} MUST be 4-byte aligned.
+
+The value \field{cap.length} presented by the device MUST be at least 8
+and MUST be large enough to support queue notification offsets
+for all supported queues in all possible configurations.
+
+For all queues, the value \field{cap.length} presented by the device MUST satisfy:
+\begin{lstlisting}
+cap.length >= queue_intr_notify_off * intr_notify_off_multiplier + 4
+\end{lstlisting}
+
 \subsubsection{ISR status capability}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
 
 The VIRTIO_PCI_CAP_ISR_CFG capability
-- 
2.43.0


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

