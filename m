Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2052.outbound.protection.outlook.com [40.107.96.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDE042076
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294243; cv=fail; b=gT+8Ae89uR8BCzIj3YPu4KDCBKuNC1Z8BKEsUqnKyHvht6WoHKJulBcMhDCgM8mHtlNzDlIM93YDDZwnJ+gZmDu2gaoQynSYekQhdTHe+mLq9MVFZmPzZ/nppaEso8m31MDS5r4LOmNsV7YeTqYbeGIdy5tO6UzMFxC/2AHdQns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294243; c=relaxed/simple;
	bh=tkzenexwX9jikLt7dcnBr4mjvuwwkBRv78oLVMHwSp0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fIa3l2ku8WQGJf+PPGvOMZLIL7Rm2F+aZxT7A/l6bDdVZKQsAyM+aB33MZ0SH0haf2YuOVtWZ5yCQb7GSzemBEOjjB8piX2Nq1+y0IoaMpMtqFpKLcb68LVU/KaVS6gcks3Efjalw4JFhU1I9/duA59GXUJJPwxWm5AU3VnH/fM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qcE7poyc; arc=fail smtp.client-ip=40.107.96.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qcE7poyc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQ9ZBAA2eJ4CJowc0nJ5MR/WiFnLBLSqcT5vSOjRkoGF88JlrxdfmI1bAx9RXIf6jxycDe3nujNQfQLDP+kTdNcJlJoUmd5lofMO+rIxfDHRDesYTZhKdsyUNB8B+XD7U/tnsxIByFrdQ2/XuK02j6S0SiWjbh7Z5v85NG3xb3Ww5o1625/EMUX+yHNSaDOrHbWCWZvdjyrxSCJu6UoAfqPJ2SVDLyPi2wW7V82stHAWugVRWp2imaZLF5CppnJc3wqKlV1fL1GE2LkSvjdv4b9da4QfHQJdzM27scmeyV7Um2jb27ArZ96hWdu4gNOgA8/ebf+/9hjguEkbNPIslQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESOAuKT3DW6pZY2GEKP97fxZFKeu8/RiOd6LbD1ReNc=;
 b=avemI5Hj0HuMrG5aVBazATdUS9hTN0lfFyfe+xCQUtJFFVdn7XZ0LLMEQddOzQYEN4/b7la6eaGkDSuPn8Z+jrDp7qfNIA2DjzmQ7JvqlT86snKg45jrK/cjQoKzUHziABFIFJ1EkmKc4DeWaD1pBUu7n/oFs5ynOH7XduGEn+6fdvYZQd48iPugAe5pLrW117nvr3t1i6bpkWoPN7VI7hSfd9yEgCQwp5jDYxX1mn2eYOxufbbmn8HSnR8w/HOtoR53CuVNI7ab5Z0Il3LuDc6p9/NUk1qY9AJvfbWjC89UERswDQrs0G24CFw072/RWwopL7Q2F1tA9wFYTA7ScA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESOAuKT3DW6pZY2GEKP97fxZFKeu8/RiOd6LbD1ReNc=;
 b=qcE7poycoUcZs2Bg7fdiGZdHhzyk16T96ry+vK5zn6kiMmWydnYz/sf6Z9AQC0SR8y4JXD9QyuVA0VJ+xx+JK7o1pUfVe+GdAudj2kNbRKcUBe+Ze9jN/1QJ0e7a+N7DzPNrSvnal7Ypxkq3gydJb0S1kpSbZi7tS+FIatNLe3rK4XwR9ZM67vAShWxcvYvz88kblyZRm1ToDCDsYE3ghw/ZiyAGuGN+oyibzMlItzxiu3snvjOGEKk4OBY8LD1YKdJBDgtlhkALyBqoDHKBoEEWovWnw4blmhsqpfRfSIyA754xaO71ojI3CFzLUM8mpsfH2o9joKcrlsWp5Q61cw==
Received: from BYAPR07CA0015.namprd07.prod.outlook.com (2603:10b6:a02:bc::28)
 by PH7PR12MB6633.namprd12.prod.outlook.com (2603:10b6:510:1ff::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 12:23:55 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a02:bc:cafe::98) by BYAPR07CA0015.outlook.office365.com
 (2603:10b6:a02:bc::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Tue, 21 May 2024 12:23:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:23:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:23:39 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:23:36 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, <xuanzhuo@linux.alibaba.com>,
	<yuri.benditovich@daynix.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v5 2/3] virtio-net: Clarify the size of the struct virtio_net_hdr for tx
Date: Tue, 21 May 2024 15:23:02 +0300
Message-ID: <20240521122303.2004122-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521122303.2004122-1-parav@nvidia.com>
References: <20240521122303.2004122-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|PH7PR12MB6633:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad3f42d-bb84-45c1-b8e0-08dc7990e20a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d/PaBFCjLo1Nq97A7mm2kJcZRXZOwxooYwctruy945XHWIAUQfqOYzAKz91N?=
 =?us-ascii?Q?vUVKYDIdpATbs861qN67TZjts+uYuAFV3mWgbfOEvnncoRBLR3H3tUITr9/R?=
 =?us-ascii?Q?t7vLLPfGTjLwK4gs9HF2XsWDrub4bV24vj2hWezPywN3mR2Xa+tkSii9WXwz?=
 =?us-ascii?Q?ncWEDPzIn8HUhF0aS0thyJ+dc0GtZ7G6SsjFWoTH2vEcZngJ68T4c5aiBbOA?=
 =?us-ascii?Q?OxvvMaFu2UVpCZZjGKjdGg24V5ajlQE5YmIbxYHIp9vzeK2/fRWnAls0cbxR?=
 =?us-ascii?Q?8I5qqvwwGoSIndumtRzwkMsL8eq82fGTMLSeqv+iZAA7C9Qum3cPRi5yr6xr?=
 =?us-ascii?Q?W9X8ZuIQObZgsO565AITcbDPr8bWZSMQ+xKOF4Lv7CQAtuBkBbwKQ4hc45dy?=
 =?us-ascii?Q?+Knuhztf6dUIY61g27N2goJSjW2DpxBW4ACuckDo4VmFSqf4ioxZWjoS/kDA?=
 =?us-ascii?Q?EtNVvyRCWTC5qPlGtvnQmXdKvTiXedEZrAGuIC7hyDkANEtAakObbdGbuGbY?=
 =?us-ascii?Q?j+S71+cYhNsYCRN0X1YxUyBYwfXjYoWuGDvvcBJnXulKJEYDw/o0CveHZcy7?=
 =?us-ascii?Q?fLZPhsoGbAi+rlpaZq9Ki/q0tUIO0vELACLEKgYcHXZpx43V8sBPkN62J6UD?=
 =?us-ascii?Q?Vm27AMw4R8LJmWGT/TaVYh6IYBj/YZv5SGFMvo9jBJH0xtPS6RiW+ptH7OuG?=
 =?us-ascii?Q?Xkm+/r5rzz6zJsu4811zCienPBA0u86to9BLUapXRe6bNx4F1s04xEYPA8Mm?=
 =?us-ascii?Q?kU7JigWOqQtmzeo1NmKas5AMQl1MWJWZVISgEzWaCJ43C/ysz5yHyaapMu4r?=
 =?us-ascii?Q?uLU0lanEu4BtW7WR6hhTl5CMCQJ67ntXtGxye4QxSuEss1ebUi9Z1rCvOagY?=
 =?us-ascii?Q?y6W4l8Ha07uMfmBY2NmElGRJizQs8jNPWPfU1GpOhv7RBajU2g6OpoDeqhkg?=
 =?us-ascii?Q?8kuoMcjFHOI1K+An0sMltDhdFk6wu46oU1dyMHQ3uNllXiMBRj0Num4EQfyo?=
 =?us-ascii?Q?WgIt288LFD1SEDrRX4GlScxEVXjZXQpCEiAn8gzD5+mNEgz3g/Ii/K2OJoiW?=
 =?us-ascii?Q?oo9GCUTjGPTGXfvGORAU7G3mZNB6WwlLIu/a83nuz5s97135CBPcZHmqN0gz?=
 =?us-ascii?Q?/a1kFGTmAba0bFzQx5AE98l2sdBMU2xQ/lNno1lC41mcKfVMAZP64TCTuXTK?=
 =?us-ascii?Q?cwLWcJLTrOw6MEWCtcd8Setr1IBnUmS65mmZChBAIDxspbZIigO1CdTsBM8Z?=
 =?us-ascii?Q?b1n/DKUB/TtUaI7C7Dc4suMiz8RW1UXMD6hk0eRS34+LSnXAyXJ4c9PqVkf7?=
 =?us-ascii?Q?HeLzGi+57SKJ2tXKy5+ZpqXoI0otMrXr2WRXJtiZ7wI4UkHVl/TuRzabKfUZ?=
 =?us-ascii?Q?jref5Yw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:23:55.3435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad3f42d-bb84-45c1-b8e0-08dc7990e20a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6633

The feature VIRTIO_NET_F_HASH_REPORT only applies to the receive side.
However, when VIRTIO_NET_F_HASH_REPORT feature was introduced, it was
not clarified that the size of the struct virtio_net_hdr on the packet
transmission also uses higher size when VIRTIO_NET_F_HASH_REPORT is
negotiated.

Explicitly clarify this.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v2->v3:
- rephrase tx to refer to the rx side virtio_net_hdr consideration
- addressed comments from Xuan
- replaced 'field' with 'structure'
v0->v1:
- addressed comments from Xuan to rewrite tx normative
---
 device-types/net/description.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 0753ba8..38992b0 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -531,6 +531,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
 \drivernormative{\paragraph}{Packet Transmission}{Device Types / Network Device / Device Operation / Packet Transmission}
 
+For the transmit packet buffer, the driver MUST use the size of the
+structure \field{struct virtio_net_hdr} same as the receive packet buffer.
+
 The driver MUST set \field{num_buffers} to zero.
 
 If VIRTIO_NET_F_CSUM is not negotiated, the driver MUST set
-- 
2.34.1

